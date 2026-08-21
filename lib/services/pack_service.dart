import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../config/app_config.dart';
import '../main.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';

/// Uploads locally-created / edited pack lists to the server (mirror of
/// PickService). Header → `POST /api/packs`; items → `POST /api/pack-items`
/// (additive Pack_Qty deltas, removals, idempotency token). Offline-safe.
class PackService {
  static const _headerTimeout = Duration(seconds: 15);

  final Map<String, String> lastErrors = {};

  /// Informational messages from a SUCCESSFUL sync, keyed by pre-label — e.g.
  /// lines the server refused because they were deleted on another device.
  /// Separate from [lastErrors] because callers only read that on failure.
  final Map<String, String> lastNotices = {};

  Future<Map<String, int>> syncUnsyncedPacks({int? companyCode}) async {
    var q = isar.packLists.filter().isSyncedEqualTo(false);
    final packs = companyCode == null
        ? await q.findAll()
        : await q.and().companyCodeEqualTo(companyCode).findAll();
    return _syncList(packs);
  }

  Future<Map<String, int>> syncPacksByPreLabels(List<String> preLabels) async {
    if (preLabels.isEmpty) return {'total': 0, 'synced': 0, 'failed': 0};
    final all = await isar.packLists.filter().isSyncedEqualTo(false).findAll();
    final wanted = preLabels.toSet();
    final packs = all.where((p) => wanted.contains(p.packPreLabel)).toList();
    return _syncList(packs);
  }

  Future<Map<String, int>> _syncList(List<PackList> packs) async {
    lastErrors.clear();
    lastNotices.clear();
    final result = {'total': packs.length, 'synced': 0, 'failed': 0};
    for (final pack in packs) {
      final err = await _syncOne(pack);
      if (err == null) {
        result['synced'] = result['synced']! + 1;
      } else {
        result['failed'] = result['failed']! + 1;
        lastErrors[pack.packPreLabel ?? '?'] = err;
      }
    }
    return result;
  }

  String _serverError(int status, String body) {
    try {
      final j = jsonDecode(body);
      if (j is Map && (j['details'] != null || j['error'] != null)) {
        return (j['details'] ?? j['error']).toString();
      }
    } catch (_) {}
    return 'HTTP $status';
  }

  Future<String?> _syncOne(PackList pack, {bool afterDuplicate = false}) async {
    final cc = pack.companyCode;
    final label = pack.packPreLabel;
    if (cc == null || label == null || label.isEmpty) {
      return 'Missing company/label';
    }

    try {
      // 1) Header upsert.
      final headerResp = await http
          .post(
            Uri.parse('${AppConfig.apiBaseUrl}/api/packs'),
            headers: AppConfig.apiHeaders,
            body: jsonEncode(pack.toJson()),
          )
          .timeout(_headerTimeout);
      if (headerResp.statusCode != 200) {
        final msg = _serverError(headerResp.statusCode, headerResp.body);
        print('❌ PACK SYNC: header failed $label — $msg');
        return msg;
      }

      // A CANCELLED pack is closed server-side, so pushing its lines would be
      // rejected. The header carries the cancellation; skip the item upload.
      if (pack.status == 'X') {
        pack.isSynced = true;
        final lines = await isar.packListItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .packPreLabelEqualTo(label)
            .findAll();
        for (final it in lines) {
          it.isSynced = true;
        }
        await isar.writeTxn(() async {
          await isar.packLists.put(pack);
          if (lines.isNotEmpty) await isar.packListItems.putAll(lines);
        });
        print('✅ PACK SYNC: $label cancelled (header only)');
        return null;
      }

      // 2) Items delta-upload. Tombstones (status='X') → removals.
      final allRows = await isar.packListItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .packPreLabelEqualTo(label)
          .findAll();
      final tombstones = allRows.where((e) => e.status == 'X').toList();
      final items = allRows.where((e) => e.status != 'X').toList();

      final itemsResp = await http
          .post(
            Uri.parse('${AppConfig.apiBaseUrl}/api/pack-items'),
            headers: AppConfig.apiHeaders,
            body: jsonEncode({
              'Company_Code': cc,
              'Pack_PreLabel': label,
              'Upload_Token': pack.uploadToken,
              'items': items.map((e) => e.toJson()).toList(),
              'removals': tombstones.map((e) => e.toJson()).toList(),
            }),
          )
          .timeout(_headerTimeout);
      if (itemsResp.statusCode != 200) {
        final msg = _serverError(itemsResp.statusCode, itemsResp.body);
        print('❌ PACK SYNC: items failed $label — $msg');
        return msg;
      }

      Map<String, dynamic> serverTotals = const {};
      String? serverStatus;
      var skippedKeys = const <String>{};
      var duplicate = false;
      try {
        final decoded = jsonDecode(itemsResp.body);
        if (decoded is Map && decoded['server'] is Map) {
          serverTotals = Map<String, dynamic>.from(decoded['server']);
        }
        if (decoded is Map && decoded['status'] is String) {
          serverStatus = decoded['status'] as String;
        }
        if (decoded is Map && decoded['skippedKeys'] is List) {
          skippedKeys =
              (decoded['skippedKeys'] as List).map((e) => '$e').toSet();
        }
        if (decoded is Map && decoded['duplicate'] == true) duplicate = true;
      } catch (_) {}

      // Must match the server's lineKey exactly — these look up the
      // authoritative per-line totals it returns.
      String keyOf(PackListItem it) =>
          '${it.parentPreLabel ?? ''}|${it.sourceSq ?? ''}|'
          '${it.sourceSi ?? ''}|${it.skuNo}|${it.uom}';

      // The server recognised this token: these deltas were ALREADY applied by
      // an earlier attempt whose response we never saw. Re-baseline to the
      // server's truth, mint a fresh token, and send only what is genuinely
      // left over — treating a duplicate as success would silently drop any
      // work done since that lost response.
      if (duplicate && !afterDuplicate) {
        for (final it in items) {
          final serverVal = serverTotals[keyOf(it)];
          if (serverVal is num) it.baselinePackQty = serverVal.toDouble();
        }
        pack.uploadToken =
            'pk-${pack.id.toRadixString(16)}-${DateTime.now().microsecondsSinceEpoch}';
        await isar.writeTxn(() async {
          await isar.packLists.put(pack);
          if (items.isNotEmpty) await isar.packListItems.putAll(items);
        });
        print('↩️  PACK SYNC: $label was already applied — re-baselined, '
            'resending the remainder');
        return _syncOne(pack, afterDuplicate: true);
      }

      // Delete-wins: the server refused these lines because they were deleted
      // elsewhere. Drop them locally rather than marking them synced — treating
      // a refusal as success re-baselined the line, silently consuming a delta
      // the server never applied and stranding a row that could never upload.
      final refused =
          items.where((it) => skippedKeys.contains(keyOf(it))).toList();
      final accepted =
          items.where((it) => !skippedKeys.contains(keyOf(it))).toList();

      final now = DateTime.now();
      pack.isSynced = true;
      if (serverStatus != null) pack.status = serverStatus;
      pack.lastWriteTimeStamp = pack.lastWriteTimeStamp ?? now;
      for (final it in accepted) {
        it.isSynced = true;
        final serverVal = serverTotals[keyOf(it)];
        if (serverVal is num) {
          it.packQty = serverVal.toDouble();
          it.baselinePackQty = serverVal.toDouble();
        } else {
          it.baselinePackQty = it.packQty ?? 0;
        }
      }
      await isar.writeTxn(() async {
        await isar.packLists.put(pack);
        if (accepted.isNotEmpty) await isar.packListItems.putAll(accepted);
        if (tombstones.isNotEmpty) {
          await isar.packListItems.deleteAll(tombstones.map((e) => e.id).toList());
        }
        if (refused.isNotEmpty) {
          await isar.packListItems.deleteAll(refused.map((e) => e.id).toList());
        }
      });

      print('✅ PACK SYNC: $label (${accepted.length} items, '
          '${tombstones.length} removed'
          '${refused.isEmpty ? '' : ', ${refused.length} deleted elsewhere'})');
      // Surface it — a line vanishing from the packer's screen needs a reason.
      if (refused.isNotEmpty) {
        lastNotices[label] =
            '${refused.length} line(s) were deleted on another device and have '
            'been removed here.';
      }
      return null;
    } catch (e) {
      print('❌ PACK SYNC: $label error: $e');
      return e.toString();
    }
  }
}
