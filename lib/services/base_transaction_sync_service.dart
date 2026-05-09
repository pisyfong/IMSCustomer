import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../config/app_config.dart';
import '../main.dart';
import '../models/invoice.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/sync_checkpoint.dart';

/// Drains the two transactional invoice base tables into Isar:
///   - mp_invoice       → Invoice      (headers, delta via LastWriteTimeStamp)
///   - mp_invoice_item  → InvoiceItem  (lines, delta via Added_Date proxy)
///
/// Replaces the old per-customer getInvoices loops + the
/// getInvoiceItemsBatch / getNewInvoiceItems / getAllInvoiceItems variants.
/// Network calls go through the existing HTTP bridge at POST /synchub/:method
/// so SignalR reconnect storms don't block these calls.
///
/// Single-flight guard prevents concurrent syncs for the same company.
class BaseTransactionSyncService {
  static final BaseTransactionSyncService _instance =
      BaseTransactionSyncService._internal();
  factory BaseTransactionSyncService() => _instance;
  BaseTransactionSyncService._internal();

  final Map<int, Future<void>> _inFlight = <int, Future<void>>{};

  Future<void> syncAll({required int companyCode}) {
    final existing = _inFlight[companyCode];
    if (existing != null) return existing;

    final fut = _runSyncAll(companyCode).whenComplete(() {
      _inFlight.remove(companyCode);
    });
    _inFlight[companyCode] = fut;
    return fut;
  }

  Future<void> _runSyncAll(int companyCode) async {
    print('🔁 BaseTxnSync: starting syncAll for company $companyCode');
    final stopwatch = Stopwatch()..start();

    await _drainMpInvoice(companyCode);
    await _drainMpInvoiceItem(companyCode);
    await _drainMpQuote(companyCode);
    await _drainMpQuoteItem(companyCode);

    stopwatch.stop();
    print('✅ BaseTxnSync: syncAll done for company $companyCode in ${stopwatch.elapsedMilliseconds}ms');
  }

  // ────────────────────────────── mp_invoice ────────────────────────────
  Future<void> _drainMpInvoice(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'mp_invoice');
    final lastSync = checkpoint.lastWriteTimeStamp;
    int totalRows = 0;
    int offset = 0;
    DateTime? maxSeen = lastSync;
    const pageSize = 1000;

    try {
      while (true) {
        final rows = await _callPage(
          method: 'getMpInvoicePage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          offset: offset,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => Invoice.fromJson(j as Map<String, dynamic>))
            .toList();

        // Track watermark
        for (final inv in parsed) {
          final ts = inv.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        // Deterministic id from natural key (company, prelabel) so putAll
        // upserts cleanly without N findFirst lookups. 100K-row pages would
        // otherwise spend most of their time on per-row Isar queries.
        for (final inv in parsed) {
          inv.id = _composeInvoiceId(inv.companyCode, inv.invoicePreLabel);
        }
        await isar.writeTxn(() async {
          await isar.invoices.putAll(parsed);
        });

        totalRows += parsed.length;
        if (rows.length < pageSize) break;
        offset += pageSize;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? lastSync, rowCount: totalRows);
      print('✅ BaseTxnSync.mp_invoice: $totalRows rows for company $companyCode (newWatermark=$maxSeen)');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.mp_invoice failed: $e');
      rethrow;
    }
  }

  // ──────────────────────────── mp_invoice_item ─────────────────────────
  // Server uses KEYSET pagination on (Invoice_PreLabel, Sequence_No) — passes
  // the last (prelabel, sequenceNo) seen instead of an OFFSET. This is stable
  // and fast even on tables with hundreds of thousands of rows, where OFFSET
  // would otherwise short-return mid-stream.
  //
  // Server filters by Added_Date (no LastWriteTimeStamp on this table).
  // Items are append-only in this domain; if your business edits items in
  // place, switch to header-driven delta.
  Future<void> _drainMpInvoiceItem(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'mp_invoice_item');
    final lastSync = checkpoint.lastWriteTimeStamp;
    int totalRows = 0;
    DateTime? maxSeen = lastSync;
    const pageSize = 5000;

    String? afterPrelabel;
    int? afterSequenceNo;

    try {
      while (true) {
        final rows = await _callItemKeysetPage(
          method: 'getMpInvoiceItemPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
          afterSequenceNo: afterSequenceNo,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => InvoiceItem.fromJson(j as Map<String, dynamic>))
            .toList();

        // Use addedDate as watermark since LastWriteTimeStamp doesn't exist
        // on this table.
        for (final item in parsed) {
          final ts = item.addedDate;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        // Deterministic id from natural key (company, prelabel, sequence).
        for (final item in parsed) {
          item.id = _composeInvoiceItemId(
            item.companyCode,
            item.invoicePreLabel,
            item.sequenceNo,
          );
        }
        await isar.writeTxn(() async {
          await isar.invoiceItems.putAll(parsed);
        });

        totalRows += parsed.length;

        // Advance cursor to the last row of this page. Server returns rows
        // sorted by (Invoice_PreLabel, Sequence_No), so the last row is the
        // greatest natural key seen so far. The next call will start strictly
        // greater than this cursor.
        final last = parsed.last;
        afterPrelabel = last.invoicePreLabel;
        afterSequenceNo = last.sequenceNo;

        // Don't break on short pages — keyset is exact, so we only stop on a
        // truly empty page (caught at the top of the next iteration). This
        // is safer than the OFFSET version which short-returned silently
        // and skipped rows.
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? lastSync, rowCount: totalRows);
      print('✅ BaseTxnSync.mp_invoice_item: $totalRows rows for company $companyCode (newWatermark=$maxSeen)');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.mp_invoice_item failed: $e');
      rethrow;
    }
  }

  // ────────────────────────────── MP_Quote ──────────────────────────────
  // Keyset pagination on Quote_PreLabel. Mirrors the mp_invoice drain.
  Future<void> _drainMpQuote(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Quote');
    final lastSync = checkpoint.lastWriteTimeStamp;
    int totalRows = 0;
    DateTime? maxSeen = lastSync;
    const pageSize = 1000;

    String? afterPrelabel;

    try {
      while (true) {
        final rows = await _callQuoteHeaderKeysetPage(
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => Quote.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final q in parsed) {
          final ts = q.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        for (final q in parsed) {
          q.id = _composeQuoteId(q.companyCode ?? companyCode, q.quotePreLabel ?? '');
        }
        await isar.writeTxn(() async {
          await isar.quotes.putAll(parsed);
        });

        totalRows += parsed.length;
        afterPrelabel = parsed.last.quotePreLabel;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? lastSync, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Quote: $totalRows rows for company $companyCode (newWatermark=$maxSeen)');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Quote failed: $e');
      rethrow;
    }
  }

  // ─────────────────────────── MP_Quote_Item ────────────────────────────
  // Keyset pagination on (Quote_PreLabel, Sequence_No). Server filters by
  // Added_Date (no LastWriteTimeStamp on the items table).
  Future<void> _drainMpQuoteItem(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Quote_Item');
    final lastSync = checkpoint.lastWriteTimeStamp;
    int totalRows = 0;
    DateTime? maxSeen = lastSync;
    const pageSize = 5000;

    String? afterPrelabel;
    int? afterSequenceNo;

    try {
      while (true) {
        final rows = await _callItemKeysetPage(
          method: 'getMpQuoteItemPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
          afterSequenceNo: afterSequenceNo,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => QuoteItem.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final item in parsed) {
          final ts = item.addedDate;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        for (final item in parsed) {
          item.id = _composeQuoteItemId(
            item.companyCode,
            item.quotePreLabel,
            item.sequenceNo,
          );
        }
        await isar.writeTxn(() async {
          await isar.quoteItems.putAll(parsed);
        });

        totalRows += parsed.length;
        final last = parsed.last;
        afterPrelabel = last.quotePreLabel;
        afterSequenceNo = last.sequenceNo;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? lastSync, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Quote_Item: $totalRows rows for company $companyCode (newWatermark=$maxSeen)');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Quote_Item failed: $e');
      rethrow;
    }
  }

  /// Keyset-paginated POST for the quote header endpoint
  /// (companyCode, lastSync, limit, afterPrelabel).
  Future<List<dynamic>> _callQuoteHeaderKeysetPage({
    required int companyCode,
    required DateTime? lastSync,
    required int limit,
    required String? afterPrelabel,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/getMpQuotePage');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      afterPrelabel,
    ]);

    final response = await http
        .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception(
        'BaseTxnSync getMpQuotePage: HTTP ${response.statusCode}: ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map || decoded['result'] is! List) {
      throw Exception('BaseTxnSync getMpQuotePage: unexpected body: ${response.body}');
    }
    return decoded['result'] as List<dynamic>;
  }

  /// Keyset-paginated POST to a /synchub/<method> endpoint that takes the
  /// args (companyCode, lastSync, limit, afterPrelabel, afterSequenceNo).
  /// Used by both mp_invoice_item and MP_Quote_Item drains.
  Future<List<dynamic>> _callItemKeysetPage({
    required String method,
    required int companyCode,
    required DateTime? lastSync,
    required int limit,
    required String? afterPrelabel,
    required int? afterSequenceNo,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      afterPrelabel,
      afterSequenceNo,
    ]);

    final response = await http
        .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
        .timeout(const Duration(seconds: 15));

    if (response.statusCode != 200) {
      throw Exception(
        'BaseTxnSync $method: HTTP ${response.statusCode}: ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map || decoded['result'] is! List) {
      throw Exception('BaseTxnSync $method: unexpected body: ${response.body}');
    }
    return decoded['result'] as List<dynamic>;
  }

  // ─────────────────────────── HTTP bridge call ─────────────────────────
  Future<List<dynamic>> _callPage({
    required String method,
    required int companyCode,
    required DateTime? lastSync,
    required int limit,
    required int offset,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      offset,
    ]);

    final response = await http
        .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception(
        'BaseTxnSync $method: HTTP ${response.statusCode}: ${response.body}',
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map || decoded['result'] is! List) {
      throw Exception('BaseTxnSync $method: unexpected body: ${response.body}');
    }
    return decoded['result'] as List<dynamic>;
  }

  // ─────────────────────────── Deterministic IDs ───────────────────────
  // Stable id derived from the natural key. Lets putAll upsert cleanly
  // without per-row findFirst lookups. Combines two 31-bit String hashCodes
  // (with a salt swap) into a 62-bit value to keep collision odds negligible
  // even at hundreds of thousands of rows. Dart's plain String.hashCode is
  // 31 bits, so a single hash collides ~2-3 times per 100k items.
  static int _wideHash(String a, String b) {
    final h1 = a.hashCode & 0x7FFFFFFF;
    final h2 = b.hashCode & 0x7FFFFFFF;
    return (h1 << 31) | h2;
  }

  static int _composeInvoiceId(int companyCode, String prelabel) {
    return _wideHash(
      '$companyCode|$prelabel',
      '$prelabel|$companyCode',
    );
  }

  static int _composeInvoiceItemId(int companyCode, String prelabel, int sequenceNo) {
    return _wideHash(
      '$companyCode|$prelabel|$sequenceNo',
      '$sequenceNo|$prelabel|$companyCode',
    );
  }

  static int _composeQuoteId(int companyCode, String prelabel) {
    return _wideHash(
      'q|$companyCode|$prelabel',
      'q|$prelabel|$companyCode',
    );
  }

  static int _composeQuoteItemId(int companyCode, String prelabel, int sequenceNo) {
    return _wideHash(
      'qi|$companyCode|$prelabel|$sequenceNo',
      'qi|$sequenceNo|$prelabel|$companyCode',
    );
  }

  // ───────────────────────────── Checkpoints ────────────────────────────
  Future<SyncCheckpoint> _getOrCreateCheckpoint(int companyCode, String tableName) async {
    final existing = await isar.syncCheckpoints
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .tableNameEqualTo(tableName)
        .findFirst();
    if (existing != null) return existing;

    final fresh = SyncCheckpoint()
      ..companyCode = companyCode
      ..tableName = tableName;
    await isar.writeTxn(() async {
      await isar.syncCheckpoints.put(fresh);
    });
    return fresh;
  }

  Future<void> _markSuccess(
    SyncCheckpoint checkpoint, {
    required DateTime? lastWriteTimeStamp,
    required int rowCount,
  }) async {
    checkpoint
      ..lastWriteTimeStamp = lastWriteTimeStamp ?? checkpoint.lastWriteTimeStamp
      ..lastSyncedAt = DateTime.now()
      ..lastRowCount = rowCount
      ..lastError = null
      ..lastErrorAt = null;
    await isar.writeTxn(() async {
      await isar.syncCheckpoints.put(checkpoint);
    });
  }

  Future<void> _markError(SyncCheckpoint checkpoint, String error) async {
    checkpoint
      ..lastError = error.length > 1000 ? error.substring(0, 1000) : error
      ..lastErrorAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.syncCheckpoints.put(checkpoint);
    });
  }
}
