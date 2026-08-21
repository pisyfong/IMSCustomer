import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../config/app_config.dart';
import '../main.dart';
import '../models/invoice.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/sync_checkpoint.dart';
import 'sync_history_window.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';

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
  final Map<int, Future<void>> _invoicesInFlight = <int, Future<void>>{};

  /// [historyDays] bounds how far back invoice/quote history is pulled;
  /// null means everything. Omit it and the stored preference is used, so
  /// background callers inherit whatever the operator chose without each of
  /// them having to know about it.
  ///
  /// Pick/pack feeds are deliberately NOT bounded — open work is open however
  /// old it is, and the volumes are trivial next to the ledger.
  Future<void> syncAll({required int companyCode, int? historyDays, bool useStoredWindow = true}) {
    final existing = _inFlight[companyCode];
    if (existing != null) return existing;

    final fut = _runSyncAll(companyCode, historyDays, useStoredWindow)
        .whenComplete(() {
      _inFlight.remove(companyCode);
    });
    _inFlight[companyCode] = fut;
    return fut;
  }

  /// Delta-sync ONLY the two invoice tables.
  ///
  /// An invoice is created outside this device — in the back office, or by
  /// another device's pick conversion — so a screen that lists invoices has no
  /// local event to react to and would otherwise show yesterday's picture
  /// until someone pulled the whole hub down. [syncAll] would do it, but it
  /// drains quotes, picks, packs and history as well; when the question is
  /// only "what invoices exist now", that is a lot of work to make someone
  /// wait through.
  Future<void> syncInvoices({
    required int companyCode,
    int? historyDays,
    bool useStoredWindow = true,
  }) {
    // Separate in-flight map from syncAll's: sharing it would hand a caller
    // that asked for invoices a future that only completes when a full drain
    // does, and vice versa.
    final existing = _invoicesInFlight[companyCode];
    if (existing != null) return existing;

    final fut = () async {
      final days = useStoredWindow && historyDays == null
          ? await SyncHistoryWindow.days
          : historyDays;
      final since = SyncHistoryWindow.sinceDateFor(days);
      await _drainMpInvoice(companyCode, since);
      await _drainMpInvoiceItem(companyCode, since);
    }()
        .whenComplete(() => _invoicesInFlight.remove(companyCode));
    _invoicesInFlight[companyCode] = fut;
    return fut;
  }

  Future<void> _runSyncAll(
      int companyCode, int? historyDays, bool useStoredWindow) async {
    final days = useStoredWindow && historyDays == null
        ? await SyncHistoryWindow.days
        : historyDays;
    final since = SyncHistoryWindow.sinceDateFor(days);

    print('🔁 BaseTxnSync: starting syncAll for company $companyCode '
        '(history=${SyncHistoryWindow.label(days)}'
        '${since == null ? '' : ', since ${since.toIso8601String().substring(0, 10)}'})');
    final stopwatch = Stopwatch()..start();

    await _drainMpInvoice(companyCode, since);
    await _drainMpInvoiceItem(companyCode, since);
    await _drainMpQuote(companyCode, since);
    await _drainMpQuoteItem(companyCode, since);
    await _drainMpPickList(companyCode);
    await _drainMpPickListItem(companyCode);
    await _drainPickTxnHistory(companyCode);
    await _drainMpPackList(companyCode);
    await _drainMpPackListItem(companyCode);
    await _drainPackTxnHistory(companyCode);

    stopwatch.stop();
    print('✅ BaseTxnSync: syncAll done for company $companyCode in ${stopwatch.elapsedMilliseconds}ms');
  }

  // ────────────────────────────── mp_invoice ────────────────────────────
  Future<void> _drainMpInvoice(int companyCode, DateTime? sinceDate) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'mp_invoice');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    int offset = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 1000;

    try {
      while (true) {
        final rows = await _callPage(
          method: 'getMpInvoicePage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          offset: offset,
          sinceDate: sinceDate,
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

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
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
  Future<void> _drainMpInvoiceItem(int companyCode, DateTime? sinceDate) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'mp_invoice_item');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
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
          sinceDate: sinceDate,
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

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
      print('✅ BaseTxnSync.mp_invoice_item: $totalRows rows for company $companyCode (newWatermark=$maxSeen)');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.mp_invoice_item failed: $e');
      rethrow;
    }
  }

  // ────────────────────────────── MP_Quote ──────────────────────────────
  // Keyset pagination on Quote_PreLabel. Mirrors the mp_invoice drain.
  Future<void> _drainMpQuote(int companyCode, DateTime? sinceDate) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Quote');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 1000;

    String? afterPrelabel;

    try {
      while (true) {
        final rows = await _callQuoteHeaderKeysetPage(
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
          sinceDate: sinceDate,
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

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
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
  Future<void> _drainMpQuoteItem(int companyCode, DateTime? sinceDate) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Quote_Item');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
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
          sinceDate: sinceDate,
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

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
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
    DateTime? sinceDate,
  }) async {
    const method = 'getMpQuotePage';
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      afterPrelabel,
      sinceDate?.toIso8601String(),
    ]);

    final response = await _withRetry(
        'BaseTxnSync $method',
        () => http
            .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
            .timeout(const Duration(seconds: 120)));

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
    DateTime? sinceDate,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      afterPrelabel,
      afterSequenceNo,
      sinceDate?.toIso8601String(),
    ]);

    final response = await _withRetry(
        'BaseTxnSync $method',
        () => http
            .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
            .timeout(const Duration(seconds: 120)));

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
  /// Runs a page fetch, retrying transient network failures.
  ///
  /// A full sync moves hundreds of pages over a WAN to a handheld. At that
  /// scale a dropped connection is not an exception, it is a certainty — and
  /// without this, one drop on page 190 of 253 throws away the entire sync
  /// and every page it had already written.
  ///
  /// Only transport failures are retried. An HTTP error or bad payload is a
  /// real answer from the server and retrying it just delays the report.
  static Future<T> _withRetry<T>(String what, Future<T> Function() run) async {
    const attempts = 4;
    for (var i = 1;; i++) {
      try {
        return await run();
      } catch (e) {
        final transient = e is SocketException ||
            e is TimeoutException ||
            e is http.ClientException;
        if (!transient || i >= attempts) rethrow;
        // 1s, 2s, 4s — long enough for a flaky link to settle, short enough
        // that a real outage still fails in seconds rather than minutes.
        final wait = Duration(seconds: 1 << (i - 1));
        print('⚠️ $what: ${e.runtimeType} on attempt $i — retrying in '
            '${wait.inSeconds}s');
        await Future.delayed(wait);
      }
    }
  }

  Future<List<dynamic>> _callPage({
    required String method,
    required int companyCode,
    required DateTime? lastSync,
    required int limit,
    required int offset,
    DateTime? sinceDate,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    // sinceDate is appended LAST so a server that predates the history window
    // just ignores it — the endpoints stay backwards compatible.
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      offset,
      sinceDate?.toIso8601String(),
    ]);

    final response = await _withRetry(
        'BaseTxnSync $method',
        () => http
            .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
            .timeout(const Duration(seconds: 120)));

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

  // ───────────────────────────── MP_Pick_List ───────────────────────────
  Future<void> _drainMpPickList(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Pick_List');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 1000;
    String? afterPrelabel;

    // Protect picks with pending LOCAL edits (isSynced == false) from being
    // clobbered by the download. Their upload is the source of truth until it
    // succeeds and flips them synced.
    final protectedLabels = await _pendingPickLabels(companyCode);

    try {
      while (true) {
        final rows = await _callPrelabelKeysetPage(
          method: 'getMpPickListPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => PickList.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final p in parsed) {
          final ts = p.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        // Watermark must still advance over protected rows (so we don't
        // re-fetch them forever), but we don't write them locally.
        final toWrite = parsed
            .where((p) => !protectedLabels.contains(p.pickPreLabel))
            .toList();
        for (final p in toWrite) {
          p.id = _composePickListId(p.companyCode ?? companyCode, p.pickPreLabel ?? '');
          p.isSynced = true;
        }
        if (toWrite.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.pickLists.putAll(toWrite);
          });
        }

        totalRows += toWrite.length;
        afterPrelabel = parsed.last.pickPreLabel;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Pick_List: $totalRows rows for company $companyCode');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Pick_List failed: $e');
      rethrow;
    }
  }

  // ─────────────────────────── MP_Pick_List_Item ───────────────────────
  Future<void> _drainMpPickListItem(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Pick_List_Item');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 5000;
    String? afterPrelabel;
    int? afterSequenceNo;

    // Same protection as the header drain: don't overwrite items belonging to
    // a pick with pending local edits.
    final protectedLabels = await _pendingPickLabels(companyCode);

    try {
      while (true) {
        final rows = await _callItemKeysetPage(
          method: 'getMpPickListItemPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
          afterSequenceNo: afterSequenceNo,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => PickListItem.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final it in parsed) {
          final ts = it.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        final toWrite = parsed
            .where((it) => !protectedLabels.contains(it.pickPreLabel))
            .toList();
        for (final it in toWrite) {
          it.id = _composePickListItemId(
            it.companyCode ?? companyCode,
            it.pickPreLabel ?? '',
            it.skuNo ?? 0,
            it.uom ?? '',
            it.parentPreLabel ?? '',
          );
          it.isSynced = true;
          // Downloaded value is the new baseline for delta-based upload.
          it.baselinePickQty = it.pickQty ?? 0;
        }
        if (toWrite.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.pickListItems.putAll(toWrite);
          });
        }

        totalRows += toWrite.length;
        final last = parsed.last;
        afterPrelabel = last.pickPreLabel;
        afterSequenceNo = last.sequenceNo;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Pick_List_Item: $totalRows rows for company $companyCode');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Pick_List_Item failed: $e');
      rethrow;
    }
  }

  // ───────────────────── MP_Txn_History (PICK removals) ─────────────────
  // Hard-deleted pick lines are invisible to the item delta feed, so we learn
  // of removals from the append-only history log. Apply each REMOVE by deleting
  // the matching local line, and advance the Transaction_Id cursor. Non-fatal:
  // a failure just leaves the cursor so it retries next sync.
  Future<void> _drainPickTxnHistory(int companyCode) async {
    final checkpoint =
        await _getOrCreateCheckpoint(companyCode, 'MP_Txn_History:PICK');
    int cursor = checkpoint.lastCursorId ?? 0;
    int applied = 0;

    // Don't yank a line out from under a pick with pending local edits — the
    // server's delete-wins guard keeps the DB correct meanwhile. The removal
    // must still be applied LATER, which is what [holdBefore] below preserves.
    final protectedLabels = await _pendingPickLabels(companyCode);

    // Lowest Transaction_Id we deliberately skipped. The cursor is clamped
    // behind it so the next sync re-reads those rows once the pick is clean.
    // Advancing past a skipped removal dropped it forever — the log is only
    // ever read forward.
    int? holdBefore;

    try {
      while (true) {
        final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/txn-history'
            '?companyCode=$companyCode&module=PICK&sinceId=$cursor&limit=500');
        final resp = await http
            .get(uri, headers: AppConfig.apiHeaders)
            .timeout(const Duration(seconds: 20));
        if (resp.statusCode != 200) throw 'HTTP ${resp.statusCode}';
        final body = jsonDecode(resp.body) as Map<String, dynamic>;
        final rows = (body['rows'] as List?) ?? const [];
        if (rows.isEmpty) break;

        // Collect this page's removals first, then resolve them with ONE query
        // instead of one per row (a page holds up to 500).
        final wanted = <Map<String, dynamic>>[];
        final docs = <String>{};
        for (final raw in rows) {
          final r = raw as Map<String, dynamic>;
          if (r['Action']?.toString() != 'REMOVE') continue;
          final doc = r['Doc_PreLabel']?.toString();
          if (doc == null) continue;
          if (protectedLabels.contains(doc)) {
            final id = (r['Transaction_Id'] as num?)?.toInt();
            if (id != null && (holdBefore == null || id < holdBefore)) {
              holdBefore = id;
            }
            continue;
          }
          if (r['Sku_No'] == null || r['Uom'] == null) continue;
          wanted.add(r);
          docs.add(doc);
        }

        final victims = <int>[];
        if (wanted.isNotEmpty) {
          final candidates = await isar.pickListItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .and()
              .anyOf(docs.toList(), (q, d) => q.pickPreLabelEqualTo(d))
              .findAll();
          // Key on the full line identity, exactly as the server does.
          String keyOf(String doc, String? parent, int sku, String uom) =>
              '$doc|${parent ?? ''}|$sku|$uom';
          final byKey = <String, List<int>>{};
          for (final v in candidates) {
            final k = keyOf(v.pickPreLabel ?? '', v.parentPreLabel,
                v.skuNo ?? 0, v.uom ?? '');
            (byKey[k] ??= <int>[]).add(v.id);
          }
          for (final r in wanted) {
            final k = keyOf(
              r['Doc_PreLabel'].toString(),
              r['Parent_PreLabel']?.toString(),
              (r['Sku_No'] as num).toInt(),
              r['Uom'].toString(),
            );
            final hit = byKey[k];
            if (hit != null) victims.addAll(hit);
          }
        }
        if (victims.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.pickListItems.deleteAll(victims);
          });
          applied += victims.length;
        }

        cursor = (body['nextCursor'] as num?)?.toInt() ?? cursor;
        if (body['hasMore'] != true) break;
      }

      // Never advance past a removal we chose not to apply.
      if (holdBefore != null && holdBefore - 1 < cursor) cursor = holdBefore - 1;

      checkpoint
        ..lastCursorId = cursor
        ..lastSyncedAt = DateTime.now()
        ..lastError = null
        ..lastErrorAt = null;
      await isar.writeTxn(() async {
        await isar.syncCheckpoints.put(checkpoint);
      });
      print('✅ BaseTxnSync.MP_Txn_History(PICK): $applied removals, cursor=$cursor');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Txn_History(PICK) failed: $e');
    }
  }

  // ───────────────────── MP_Txn_History (PACK removals) ─────────────────
  // Same as the PICK feed, for hard-deleted pack lines.
  Future<void> _drainPackTxnHistory(int companyCode) async {
    final checkpoint =
        await _getOrCreateCheckpoint(companyCode, 'MP_Txn_History:PACK');
    int cursor = checkpoint.lastCursorId ?? 0;
    int applied = 0;
    final protectedLabels = await _pendingPackLabels(companyCode);

    // See the PICK drain: the cursor must never move past a removal we chose
    // to skip, or it is lost — the log is only ever read forward.
    int? holdBefore;

    try {
      while (true) {
        final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/txn-history'
            '?companyCode=$companyCode&module=PACK&sinceId=$cursor&limit=500');
        final resp = await http
            .get(uri, headers: AppConfig.apiHeaders)
            .timeout(const Duration(seconds: 20));
        if (resp.statusCode != 200) throw 'HTTP ${resp.statusCode}';
        final body = jsonDecode(resp.body) as Map<String, dynamic>;
        final rows = (body['rows'] as List?) ?? const [];
        if (rows.isEmpty) break;

        final wanted = <Map<String, dynamic>>[];
        final docs = <String>{};
        for (final raw in rows) {
          final r = raw as Map<String, dynamic>;
          if (r['Action']?.toString() != 'REMOVE') continue;
          final doc = r['Doc_PreLabel']?.toString();
          if (doc == null) continue;
          if (protectedLabels.contains(doc)) {
            final id = (r['Transaction_Id'] as num?)?.toInt();
            if (id != null && (holdBefore == null || id < holdBefore)) {
              holdBefore = id;
            }
            continue;
          }
          if (r['Sku_No'] == null || r['Uom'] == null) continue;
          wanted.add(r);
          docs.add(doc);
        }

        final victims = <int>[];
        if (wanted.isNotEmpty) {
          final candidates = await isar.packListItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .and()
              .anyOf(docs.toList(), (q, d) => q.packPreLabelEqualTo(d))
              .findAll();
          // A pack line's identity includes its Source_SQ and its Source_SI.
          String keyOf(String doc, String? parent, String? srcSq, String? srcSi,
                  int sku, String uom) =>
              '$doc|${parent ?? ''}|${srcSq ?? ''}|${srcSi ?? ''}|$sku|$uom';
          final byKey = <String, List<int>>{};
          for (final v in candidates) {
            final k = keyOf(v.packPreLabel ?? '', v.parentPreLabel, v.sourceSq,
                v.sourceSi, v.skuNo ?? 0, v.uom ?? '');
            (byKey[k] ??= <int>[]).add(v.id);
          }
          for (final r in wanted) {
            final k = keyOf(
              r['Doc_PreLabel'].toString(),
              r['Parent_PreLabel']?.toString(),
              r['Source_SQ']?.toString(),
              r['Source_SI']?.toString(),
              (r['Sku_No'] as num).toInt(),
              r['Uom'].toString(),
            );
            final hit = byKey[k];
            if (hit != null) victims.addAll(hit);
          }
        }
        if (victims.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.packListItems.deleteAll(victims);
          });
          applied += victims.length;
        }

        cursor = (body['nextCursor'] as num?)?.toInt() ?? cursor;
        if (body['hasMore'] != true) break;
      }

      if (holdBefore != null && holdBefore - 1 < cursor) cursor = holdBefore - 1;

      checkpoint
        ..lastCursorId = cursor
        ..lastSyncedAt = DateTime.now()
        ..lastError = null
        ..lastErrorAt = null;
      await isar.writeTxn(() async {
        await isar.syncCheckpoints.put(checkpoint);
      });
      print('✅ BaseTxnSync.MP_Txn_History(PACK): $applied removals, cursor=$cursor');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Txn_History(PACK) failed: $e');
    }
  }

  // ───────────────────────────── MP_Pack_List ───────────────────────────
  Future<void> _drainMpPackList(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Pack_List');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 1000;
    String? afterPrelabel;

    // Don't clobber packs with pending local edits (isSynced == false).
    final protectedLabels = await _pendingPackLabels(companyCode);

    try {
      while (true) {
        final rows = await _callPrelabelKeysetPage(
          method: 'getMpPackListPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => PackList.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final p in parsed) {
          final ts = p.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        final toWrite = parsed
            .where((p) => !protectedLabels.contains(p.packPreLabel))
            .toList();
        for (final p in toWrite) {
          p.id = _composePackListId(p.companyCode ?? companyCode, p.packPreLabel ?? '');
          p.isSynced = true;
        }
        if (toWrite.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.packLists.putAll(toWrite);
          });
        }

        totalRows += toWrite.length;
        afterPrelabel = parsed.last.packPreLabel;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Pack_List: $totalRows rows for company $companyCode');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Pack_List failed: $e');
      rethrow;
    }
  }

  // ─────────────────────────── MP_Pack_List_Item ───────────────────────
  Future<void> _drainMpPackListItem(int companyCode) async {
    final checkpoint = await _getOrCreateCheckpoint(companyCode, 'MP_Pack_List_Item');
    // The watermark advances from what we've SEEN, but we ASK from slightly
    // behind it. Keeping the two separate matters: seeding the new watermark
    // from the overlapped value would walk it backwards by the overlap on
    // every zero-row sync, until the "delta" was re-pulling all of history.
    final watermark = checkpoint.lastWriteTimeStamp;
    final lastSync = _deltaFrom(watermark);
    int totalRows = 0;
    DateTime? maxSeen = watermark;
    const pageSize = 5000;
    String? afterPrelabel;
    int? afterSequenceNo;

    final protectedLabels = await _pendingPackLabels(companyCode);

    try {
      while (true) {
        final rows = await _callItemKeysetPage(
          method: 'getMpPackListItemPage',
          companyCode: companyCode,
          lastSync: lastSync,
          limit: pageSize,
          afterPrelabel: afterPrelabel,
          afterSequenceNo: afterSequenceNo,
        );
        if (rows.isEmpty) break;

        final parsed = rows
            .map((j) => PackListItem.fromJson(j as Map<String, dynamic>))
            .toList();

        for (final it in parsed) {
          final ts = it.lastWriteTimeStamp;
          if (ts == null) continue;
          final current = maxSeen;
          if (current == null || ts.isAfter(current)) maxSeen = ts;
        }

        final toWrite = parsed
            .where((it) => !protectedLabels.contains(it.packPreLabel))
            .toList();
        for (final it in toWrite) {
          it.id = _composePackListItemId(
            it.companyCode ?? companyCode,
            it.packPreLabel ?? '',
            it.skuNo ?? 0,
            it.uom ?? '',
            it.parentPreLabel ?? '',
            it.sourceSq ?? '',
            it.sourceSi ?? '',
          );
          it.isSynced = true;
          it.baselinePackQty = it.packQty ?? 0;
        }
        if (toWrite.isNotEmpty) {
          await isar.writeTxn(() async {
            await isar.packListItems.putAll(toWrite);
          });
        }

        totalRows += toWrite.length;
        final last = parsed.last;
        afterPrelabel = last.packPreLabel;
        afterSequenceNo = last.sequenceNo;
      }

      await _markSuccess(checkpoint, lastWriteTimeStamp: maxSeen ?? watermark, rowCount: totalRows);
      print('✅ BaseTxnSync.MP_Pack_List_Item: $totalRows rows for company $companyCode');
    } catch (e) {
      await _markError(checkpoint, e.toString());
      print('❌ BaseTxnSync.MP_Pack_List_Item failed: $e');
      rethrow;
    }
  }

  /// Generic keyset-paginated POST for header endpoints taking
  /// (companyCode, lastSync, limit, afterPrelabel).
  Future<List<dynamic>> _callPrelabelKeysetPage({
    required String method,
    required int companyCode,
    required DateTime? lastSync,
    required int limit,
    required String? afterPrelabel,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/synchub/$method');
    final body = jsonEncode([
      companyCode,
      lastSync?.toIso8601String(),
      limit,
      afterPrelabel,
    ]);

    final response = await _withRetry(
        'BaseTxnSync $method',
        () => http
            .post(uri, headers: {'Content-Type': 'application/json'}, body: body)
            .timeout(const Duration(seconds: 120)));

    if (response.statusCode != 200) {
      throw Exception('BaseTxnSync $method: HTTP ${response.statusCode}: ${response.body}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map || decoded['result'] is! List) {
      throw Exception('BaseTxnSync $method: unexpected body: ${response.body}');
    }
    return decoded['result'] as List<dynamic>;
  }

  /// Pick_PreLabels with pending local edits (isSynced == false) for the
  /// company. Download drains skip these so they aren't clobbered before the
  /// upload flips them synced.
  Future<Set<String>> _pendingPickLabels(int companyCode) async {
    final rows = await isar.pickLists
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .isSyncedEqualTo(false)
        .findAll();
    return rows
        .map((p) => p.pickPreLabel)
        .whereType<String>()
        .toSet();
  }

  Future<Set<String>> _pendingPackLabels(int companyCode) async {
    final rows = await isar.packLists
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .isSyncedEqualTo(false)
        .findAll();
    return rows
        .map((p) => p.packPreLabel)
        .whereType<String>()
        .toSet();
  }

  static int _composePickListId(int companyCode, String prelabel) {
    return _wideHash('pk|$companyCode|$prelabel', 'pk|$prelabel|$companyCode');
  }

  // Keyed on the line's STABLE business identity (parent SQ + sku + uom) — the
  // same key the server uses to match lines. NOT sequenceNo, which the server
  // reassigns on insert (that mismatch was creating duplicate local rows).
  static int _composePickListItemId(
    int companyCode,
    String prelabel,
    int skuNo,
    String uom,
    String parent,
  ) {
    return _wideHash(
      'pki|$companyCode|$prelabel|$parent|$skuNo|$uom',
      'pki|$uom|$skuNo|$parent|$prelabel|$companyCode',
    );
  }

  /// Public deterministic-ID helpers so locally-created picks use the SAME
  /// Isar ids the download sync assigns — otherwise the server copy lands as
  /// a second row (duplicate) instead of upserting over the local one.
  static int pickListId(int companyCode, String prelabel) =>
      _composePickListId(companyCode, prelabel);

  static int pickListItemId(
          int companyCode, String prelabel, int skuNo, String uom, String parent) =>
      _composePickListItemId(companyCode, prelabel, skuNo, uom, parent);

  /// Self-healing cleanup: collapse duplicate pick-list items left behind by
  /// the old sequenceNo-based id scheme, and re-id every survivor onto the
  /// stable (parent+sku+uom) key so future downloads upsert instead of
  /// duplicating. Idempotent — a no-op once ids are already canonical.
  static Future<void> dedupePickItems() async {
    try {
      final all = await isar.pickListItems.where().findAll();
      if (all.isEmpty) return;

      PickListItem prefer(PickListItem a, PickListItem b) {
        // An unsynced local edit outranks a synced copy (it holds pending work).
        if (a.isSynced != b.isSynced) return a.isSynced ? b : a;
        return (a.pickQty ?? 0) >= (b.pickQty ?? 0) ? a : b;
      }

      final chosen = <int, PickListItem>{}; // canonical id → survivor
      final toDelete = <int>[];
      for (final it in all) {
        final newId = _composePickListItemId(
          it.companyCode ?? 0,
          it.pickPreLabel ?? '',
          it.skuNo ?? 0,
          it.uom ?? '',
          it.parentPreLabel ?? '',
        );
        final prev = chosen[newId];
        if (prev == null) {
          chosen[newId] = it;
        } else {
          final keep = prefer(prev, it);
          chosen[newId] = keep;
          toDelete.add(identical(keep, prev) ? it.id : prev.id);
        }
      }

      final toPut = <PickListItem>[];
      chosen.forEach((newId, it) {
        if (it.id != newId) {
          toDelete.add(it.id); // drop the old-id row
          it.id = newId;       // re-key survivor onto the canonical id
          toPut.add(it);
        }
      });

      if (toDelete.isEmpty && toPut.isEmpty) return;
      await isar.writeTxn(() async {
        if (toDelete.isNotEmpty) await isar.pickListItems.deleteAll(toDelete);
        if (toPut.isNotEmpty) await isar.pickListItems.putAll(toPut);
      });
      print('🔧 Pick item dedup: removed ${toDelete.length}, re-keyed ${toPut.length}');
    } catch (e) {
      print('❌ Pick item dedup failed: $e');
    }
  }

  static int _composePackListId(int companyCode, String prelabel) {
    return _wideHash('pl|$companyCode|$prelabel', 'pl|$prelabel|$companyCode');
  }

  // Keyed on the stable business identity (parent pick + source SQ + source SI
  // + sku + uom), NOT the server-reassigned sequenceNo. The source documents
  // are included so the same SKU stays as distinct pack lines when picked from
  // two SQs, or packed for two different invoices.
  //
  // [sourceSi] is appended ONLY when set, which keeps the id of every existing
  // pick- and SQ-sourced line byte-identical to what earlier builds computed.
  // Folding an always-present empty field into the hash would have changed
  // every id on the device, and the next sync would have inserted the whole
  // pack table again alongside the rows it could no longer match.
  static int _composePackListItemId(
    int companyCode,
    String prelabel,
    int skuNo,
    String uom,
    String parent,
    String sourceSq, [
    String sourceSi = '',
  ]) {
    final si = sourceSi.isEmpty ? '' : '|$sourceSi';
    return _wideHash(
      'pli|$companyCode|$prelabel|$parent|$sourceSq|$skuNo|$uom$si',
      'pli$si|$uom|$skuNo|$sourceSq|$parent|$prelabel|$companyCode',
    );
  }

  /// Public deterministic-ID helpers so locally-created packs use the SAME Isar
  /// ids the download sync assigns (upsert, not duplicate).
  static int packListId(int companyCode, String prelabel) =>
      _composePackListId(companyCode, prelabel);

  static int packListItemId(int companyCode, String prelabel, int skuNo,
          String uom, String parent, String sourceSq,
          [String sourceSi = '']) =>
      _composePackListItemId(
          companyCode, prelabel, skuNo, uom, parent, sourceSq, sourceSi);

  /// Self-healing pack-item dedup + re-key (mirror of dedupePickItems).
  static Future<void> dedupePackItems() async {
    try {
      final all = await isar.packListItems.where().findAll();
      if (all.isEmpty) return;

      PackListItem prefer(PackListItem a, PackListItem b) {
        if (a.isSynced != b.isSynced) return a.isSynced ? b : a;
        return (a.packQty ?? 0) >= (b.packQty ?? 0) ? a : b;
      }

      final chosen = <int, PackListItem>{};
      final toDelete = <int>[];
      for (final it in all) {
        final newId = _composePackListItemId(
          it.companyCode ?? 0,
          it.packPreLabel ?? '',
          it.skuNo ?? 0,
          it.uom ?? '',
          it.parentPreLabel ?? '',
          it.sourceSq ?? '',
          it.sourceSi ?? '',
        );
        final prev = chosen[newId];
        if (prev == null) {
          chosen[newId] = it;
        } else {
          final keep = prefer(prev, it);
          chosen[newId] = keep;
          toDelete.add(identical(keep, prev) ? it.id : prev.id);
        }
      }

      final toPut = <PackListItem>[];
      chosen.forEach((newId, it) {
        if (it.id != newId) {
          toDelete.add(it.id);
          it.id = newId;
          toPut.add(it);
        }
      });

      if (toDelete.isEmpty && toPut.isEmpty) return;
      await isar.writeTxn(() async {
        if (toDelete.isNotEmpty) await isar.packListItems.deleteAll(toDelete);
        if (toPut.isNotEmpty) await isar.packListItems.putAll(toPut);
      });
      print('🔧 Pack item dedup: removed ${toDelete.length}, re-keyed ${toPut.length}');
    } catch (e) {
      print('❌ Pack item dedup failed: $e');
    }
  }

  // ───────────────────────────── Checkpoints ────────────────────────────
  /// The four ledger feeds, in the order they drain.
  static const List<String> ledgerTables = [
    'mp_invoice',
    'mp_invoice_item',
    'MP_Quote',
    'MP_Quote_Item',
  ];

  /// Clears the delta watermark on the ledger feeds so the next sync re-reads
  /// from the beginning of the (now wider) window.
  ///
  /// Required whenever the history window grows. The watermark only records
  /// how far FORWARD we have read, so without this the newly-included older
  /// documents are never requested and the extra history silently never
  /// arrives — indistinguishable, to the user, from the setting not working.
  Future<void> resetLedgerCheckpoints(int companyCode) async {
    await isar.writeTxn(() async {
      for (final table in ledgerTables) {
        final cp = await isar.syncCheckpoints
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .tableNameEqualTo(table)
            .findFirst();
        if (cp == null) continue;
        cp
          ..lastWriteTimeStamp = null
          ..lastCursorId = null;
        await isar.syncCheckpoints.put(cp);
      }
    });
    print('♻️ BaseTxnSync: ledger checkpoints reset for company $companyCode');
  }

  /// How far back of already-seen ground each delta sync re-covers.
  ///
  /// A delta asks the server for `LastWriteTimeStamp >= watermark`, where the
  /// watermark is a timestamp the SERVER produced, stored on the DEVICE, and
  /// compared against server rows again later. Any disagreement between the
  /// two clocks — or in how a timestamp was serialised on the way here —
  /// pushes the watermark forward and the sync then skips rows silently and
  /// permanently: nothing ever revisits that window, and the newer the row,
  /// the more certainly it is lost.
  ///
  /// That is not hypothetical. A serialisation change moved stored watermarks
  /// ~8 hours into the future, and invoices created after it stopped arriving
  /// while every log line still read "0 rows" as though all was well.
  ///
  /// Re-covering half a day costs a few hundred rows that upsert onto
  /// themselves — every row is keyed by a deterministic id — which is a small
  /// price for a feed that cannot quietly lose data.
  static const Duration _deltaOverlap = Duration(hours: 12);

  /// The watermark to ask the server from, with the overlap applied.
  static DateTime? _deltaFrom(DateTime? watermark) =>
      watermark?.subtract(_deltaOverlap);

  Future<SyncCheckpoint> _getOrCreateCheckpoint(int companyCode, String tableName) async {
    final existing = await isar.syncCheckpoints
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .tableNameEqualTo(tableName)
        .findFirst();
    if (existing != null) {
      // A watermark in the future is always wrong, and it is the failure that
      // never recovers on its own: nothing on the server can ever satisfy
      // `>= watermark`, so the table reports "0 rows" forever while looking
      // perfectly healthy.
      //
      // Only reset when the skew is bigger than [_deltaOverlap] can absorb.
      // Inside that, the overlap already re-covers the ground and a reset
      // would trade a silent, self-healing correction for a full re-pull of
      // the history window.
      final wm = existing.lastWriteTimeStamp;
      if (wm != null && wm.isAfter(DateTime.now().add(_deltaOverlap))) {
        print('⚠️ BaseTxnSync: $tableName watermark $wm is in the FUTURE — '
            'resetting and re-pulling the history window');
        existing.lastWriteTimeStamp = null;
        await isar.writeTxn(() async {
          await isar.syncCheckpoints.put(existing);
        });
      }
      return existing;
    }

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
