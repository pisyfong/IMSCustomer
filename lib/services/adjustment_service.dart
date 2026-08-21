import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

import '../config/app_config.dart';
import '../main.dart';
import '../models/adjustment.dart';
import '../models/adjustment_item.dart';
import '../models/adjustment_lookup.dart';
import 'qty.dart';

/// One selectable adjustment code, as `AD_Code_Location` defines it.
class AdjustmentCode {
  final String code;
  final String description;
  final int type;

  /// 1 = stock in, -1 = stock out, 0 = value only. Derived from [type] by the
  /// server; carried here so the device can show the effect offline.
  final int sign;

  /// 'C' customer, 'V' vendor, 'A' either.
  final String vendorCustomer;
  final String defaultRemark;

  const AdjustmentCode({
    required this.code,
    required this.description,
    required this.type,
    required this.sign,
    this.vendorCustomer = 'A',
    this.defaultRemark = '',
  });

  factory AdjustmentCode.fromJson(Map<String, dynamic> m) => AdjustmentCode(
        code: (m['code'] ?? '').toString().trim(),
        description: (m['description'] ?? '').toString().trim(),
        type: int.tryParse('${m['type']}') ?? 0,
        sign: int.tryParse('${m['sign']}') ?? 0,
        vendorCustomer: (m['vendorCustomer'] ?? 'A').toString().trim(),
        defaultRemark: (m['defaultRemark'] ?? '').toString().trim(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'description': description,
        'type': type,
        'sign': sign,
        'vendorCustomer': vendorCustomer,
        'defaultRemark': defaultRemark,
      };

  /// Whether this code belongs on a customer-facing document.
  bool get forCustomer => vendorCustomer == 'C' || vendorCustomer == 'A';

  String get label => description.isEmpty ? code : '$code · $description';
}

/// An open accounting period.
class AdjustmentBatch {
  final int batchNo;
  final String batchName;

  const AdjustmentBatch({required this.batchNo, required this.batchName});

  factory AdjustmentBatch.fromJson(Map<String, dynamic> m) => AdjustmentBatch(
        batchNo: int.tryParse('${m['batchNo']}') ?? 0,
        batchName: (m['batchName'] ?? '').toString().trim(),
      );

  Map<String, dynamic> toJson() =>
      {'batchNo': batchNo, 'batchName': batchName};

  String get label => batchName.isEmpty ? 'Batch $batchNo' : batchName;
}

/// Composes adjustments offline and sends them when there is a connection.
class AdjustmentService {
  /// Provisional document numbers.
  ///
  /// The real number is allocated by the server at upload, out of
  /// `AD_Code_Location.Running_No`, exactly as the legacy desktop app does —
  /// so the app's documents land in the same sequence rather than beside it.
  /// Until then the operator needs something to point at, and it has to be
  /// impossible to mistake for a real document number.
  ///
  /// Shape: `FST/CN/~3F2A1B` — the real prefix, then [Adjustment.provisionalMarker]
  /// and a local id. The marker is what the UI keys on to show it as pending.
  static String provisionalPreLabel({
    required String prefix,
    required int localSeq,
  }) {
    final p = prefix.trim().isEmpty ? 'AD/' : prefix.trim();
    return '$p${Adjustment.provisionalMarker.substring(1)}'
        '${localSeq.toString().padLeft(5, '0')}';
  }

  // ── Lookups ──────────────────────────────────────────────────────────────

  Future<List<AdjustmentCode>> fetchCodes({
    required int companyCode,
    required String locationCode,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/adjustment-codes'
        '?companyCode=$companyCode&locationCode=$locationCode');
    final res = await http
        .get(uri, headers: AppConfig.apiHeaders)
        .timeout(const Duration(seconds: 10));
    if (res.statusCode != 200) {
      throw 'Adjustment codes unavailable (HTTP ${res.statusCode})';
    }
    final decoded = jsonDecode(res.body);
    if (decoded is! List) return const [];
    return [
      for (final e in decoded)
        if (e is Map<String, dynamic>) AdjustmentCode.fromJson(e)
    ];
  }

  Future<List<AdjustmentBatch>> fetchBatches({
    required int companyCode,
    required String locationCode,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/adjustment-batches'
        '?companyCode=$companyCode&locationCode=$locationCode');
    final res = await http
        .get(uri, headers: AppConfig.apiHeaders)
        .timeout(const Duration(seconds: 10));
    if (res.statusCode != 200) {
      throw 'Batches unavailable (HTTP ${res.statusCode})';
    }
    final decoded = jsonDecode(res.body);
    if (decoded is! List) return const [];
    return [
      for (final e in decoded)
        if (e is Map<String, dynamic>) AdjustmentBatch.fromJson(e)
    ];
  }

  // ── Offline cache ────────────────────────────────────────────────────────
  //
  // Codes and batches are pulled during a full sync and read from Isar
  // afterwards. A credit note has to be raisable in a chiller or a customer's
  // yard, which is exactly where these two lookups would otherwise fail.

  /// Fetches both lookups and replaces the local copy for that location.
  ///
  /// Replace rather than merge: a code that has been deactivated, or a batch
  /// that has been closed, must disappear. Leaving a closed batch selectable
  /// produces a 409 at upload after the operator has filled the whole form in.
  Future<void> syncLookups({
    required int companyCode,
    required String locationCode,
  }) async {
    final codes = await fetchCodes(
        companyCode: companyCode, locationCode: locationCode);
    final batches = await fetchBatches(
        companyCode: companyCode, locationCode: locationCode);

    await isar.writeTxn(() async {
      final oldCodes = await isar.adjustmentCodeRows
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .locationCodeEqualTo(locationCode)
          .findAll();
      await isar.adjustmentCodeRows
          .deleteAll([for (final r in oldCodes) r.id]);
      await isar.adjustmentCodeRows.putAll([
        for (final c in codes)
          AdjustmentCodeRow()
            ..companyCode = companyCode
            ..locationCode = locationCode
            ..code = c.code
            ..description = c.description
            ..type = c.type
            ..sign = c.sign
            ..vendorCustomer = c.vendorCustomer
            ..defaultRemark = c.defaultRemark
      ]);

      final oldBatches = await isar.adjustmentBatchRows
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .locationCodeEqualTo(locationCode)
          .findAll();
      await isar.adjustmentBatchRows
          .deleteAll([for (final r in oldBatches) r.id]);
      await isar.adjustmentBatchRows.putAll([
        for (final b in batches)
          AdjustmentBatchRow()
            ..companyCode = companyCode
            ..locationCode = locationCode
            ..batchNo = b.batchNo
            ..batchName = b.batchName
      ]);
    });
    print('🧾 CN LOOKUPS: cached ${codes.length} code(s) and '
        '${batches.length} batch(es) for $companyCode/$locationCode');
  }

  Future<List<AdjustmentCode>> localCodes({
    required int companyCode,
    required String locationCode,
  }) async {
    final rows = await isar.adjustmentCodeRows
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .locationCodeEqualTo(locationCode)
        .findAll();
    rows.sort((a, b) => a.code.compareTo(b.code));
    return [
      for (final r in rows)
        AdjustmentCode(
          code: r.code,
          description: r.description ?? '',
          type: r.type,
          sign: r.sign,
          vendorCustomer: r.vendorCustomer,
          defaultRemark: r.defaultRemark ?? '',
        )
    ];
  }

  Future<List<AdjustmentBatch>> localBatches({
    required int companyCode,
    required String locationCode,
  }) async {
    final rows = await isar.adjustmentBatchRows
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .locationCodeEqualTo(locationCode)
        .findAll();
    // Newest period first, matching what the server returns.
    rows.sort((a, b) => b.batchNo.compareTo(a.batchNo));
    return [
      for (final r in rows)
        AdjustmentBatch(batchNo: r.batchNo, batchName: r.batchName ?? '')
    ];
  }

  // ── Local storage ────────────────────────────────────────────────────────

  Future<List<Adjustment>> unsynced({int? companyCode}) async {
    final rows = await isar.adjustments.filter().isSyncedEqualTo(false).findAll();
    final out = companyCode == null
        ? rows
        : rows.where((e) => e.companyCode == companyCode).toList();
    out.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return out;
  }

  Future<List<AdjustmentItem>> itemsOf(String preLabel) async {
    final rows =
        await isar.adjustmentItems.filter().preLabelEqualTo(preLabel).findAll();
    rows.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
    return rows;
  }

  /// Saves a draft locally. Returns the provisional pre-label.
  Future<String> saveLocal(
      Adjustment header, List<AdjustmentItem> items) async {
    await isar.writeTxn(() async {
      await isar.adjustments.put(header);
      // Numbered here rather than trusting the caller: the sequence is what
      // the server replays into Sequence_No, and a gap or repeat would be
      // rejected by the composite key on AD_Adjustment_Item.
      var seq = 0;
      for (final it in items) {
        seq++;
        it.sequenceNo = seq;
        it.preLabel = header.preLabel;
        it.companyCode = header.companyCode;
        await isar.adjustmentItems.put(it);
      }
    });
    return header.preLabel;
  }

  Future<void> deleteLocal(String preLabel) async {
    await isar.writeTxn(() async {
      final items = await isar.adjustmentItems
          .filter()
          .preLabelEqualTo(preLabel)
          .findAll();
      await isar.adjustmentItems.deleteAll([for (final i in items) i.id]);
      final headers =
          await isar.adjustments.filter().preLabelEqualTo(preLabel).findAll();
      await isar.adjustments.deleteAll([for (final h in headers) h.id]);
    });
  }

  // ── Upload ───────────────────────────────────────────────────────────────

  /// Sends [rows], returning the documents the server numbered.
  ///
  /// Stops at the first failure. Each upload consumes a number out of the
  /// legacy running sequence, so a partial run has to leave the successful
  /// ones numbered and the rest untouched rather than half-applied.
  Future<AdjustmentUploadResult> uploadAll(List<Adjustment> rows) async {
    final done = <Adjustment>[];
    for (final row in rows) {
      try {
        await upload(row);
        done.add(row);
      } catch (e) {
        return AdjustmentUploadResult(uploaded: done, error: '$e');
      }
    }
    return AdjustmentUploadResult(uploaded: done);
  }

  /// Sends one adjustment and adopts the server's document number.
  ///
  /// The provisional pre-label is replaced on BOTH the header and its lines in
  /// a single transaction. Leaving the lines pointing at the old number would
  /// orphan them from a document that no longer carries it.
  Future<String> upload(Adjustment header) async {
    final items = await itemsOf(header.preLabel);
    if (items.isEmpty) throw 'Nothing to send — the document has no lines';

    final body = {
      'companyCode': header.companyCode,
      'locationCode': header.locationCode,
      'adjustment': header.adjustment,
      'code': header.partyCode ?? '',
      'isCustomer': header.isCustomer,
      'batchNo': header.batchNo,
      'representativeId': header.representativeId,
      'reference': header.reference ?? '',
      'remark': header.remark ?? '',
      'term': header.term ?? '',
      'termDays': header.termDays ?? 0,
      'addedBy': header.addedBy,
      'items': [
        for (final it in items)
          {
            'skuNo': it.skuNo,
            'uom': it.uom,
            'factor': it.factor,
            'quantity': Qty.round(it.quantity),
            'focQuantity': Qty.round(it.focQuantity),
            'unitCost': it.unitCost,
            'sellingPrice': it.sellingPrice,
            'averageCost': it.averageCost,
            'standardCost': it.standardCost,
            'lastCost': it.lastCost,
            'pluNo': it.pluNo ?? '',
            'remark': it.remark ?? '',
          }
      ],
    };

    final res = await http
        .post(Uri.parse('${AppConfig.apiBaseUrl}/api/adjustments'),
            headers: AppConfig.apiHeaders, body: jsonEncode(body))
        .timeout(const Duration(seconds: 30));

    Map<String, dynamic>? decoded;
    try {
      final d = jsonDecode(res.body);
      if (d is Map<String, dynamic>) decoded = d;
    } catch (_) {}

    if (res.statusCode != 200 || decoded?['success'] != true) {
      // 409 is the closed-batch case, and it is the one the operator can
      // actually fix — so it is surfaced as itself rather than as "failed".
      final message = (decoded?['error'] ?? 'HTTP ${res.statusCode}').toString();
      await _recordError(header, message);
      throw message;
    }

    final real = (decoded?['prelabel'] ?? '').toString().trim();
    if (real.isEmpty) throw 'Server accepted the document but returned no number';

    final old = header.preLabel;
    await isar.writeTxn(() async {
      final lines =
          await isar.adjustmentItems.filter().preLabelEqualTo(old).findAll();
      for (final l in lines) {
        l.preLabel = real;
      }
      await isar.adjustmentItems.putAll(lines);

      header.preLabel = real;
      header.isSynced = true;
      header.syncedAt = DateTime.now();
      header.syncError = null;
      await isar.adjustments.put(header);
    });
    return real;
  }

  Future<void> _recordError(Adjustment header, String message) async {
    try {
      await isar.writeTxn(() async {
        header.syncError = message;
        await isar.adjustments.put(header);
      });
    } catch (_) {
      // The throw that follows is what matters; failing to note it is not.
    }
  }
}

/// The outcome of an upload run: what got numbered, and why it stopped.
class AdjustmentUploadResult {
  final List<Adjustment> uploaded;
  final String? error;

  const AdjustmentUploadResult({required this.uploaded, this.error});

  bool get allSent => error == null;
  bool get anySent => uploaded.isNotEmpty;
}
