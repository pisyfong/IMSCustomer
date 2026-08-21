import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../config/app_config.dart';
import '../main.dart';
import 'plu_service.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';

/// Uploads locally-created / edited pick lists to the server.
///
/// Each pick posts its header to `POST /api/picks` (upsert) then its items to
/// `POST /api/pick-items` (replace-all). On success the local rows are flagged
/// `isSynced = true`. Fully offline-safe — a network error just leaves the
/// pick unsynced for the next attempt.
class PickService {
  static const _headerTimeout = Duration(seconds: 15);

  /// Sync all unsynced picks for the company (or all companies if null).
  /// Returns a summary map: {total, synced, failed}.
  Future<Map<String, int>> syncUnsyncedPicks({int? companyCode}) async {
    var q = isar.pickLists.filter().isSyncedEqualTo(false);
    final picks = companyCode == null
        ? await q.findAll()
        : await q.and().companyCodeEqualTo(companyCode).findAll();
    return _syncList(picks);
  }

  /// Sync a specific subset of picks by their Pick_PreLabel.
  Future<Map<String, int>> syncPicksByPreLabels(List<String> preLabels) async {
    if (preLabels.isEmpty) return {'total': 0, 'synced': 0, 'failed': 0};
    final all = await isar.pickLists.filter().isSyncedEqualTo(false).findAll();
    final wanted = preLabels.toSet();
    final picks =
        all.where((p) => wanted.contains(p.pickPreLabel)).toList();
    return _syncList(picks);
  }

  /// Last error message from the most recent sync run (e.g. a conflict /
  /// over-allocation rejection from the server), keyed by Pick_PreLabel.
  final Map<String, String> lastErrors = {};

  /// Set when a sync stopped because a unit's factor disagrees with the
  /// server. The UI offers to adopt the server's answer; without that the
  /// device retries the same conflict forever.
  SkuUomConflict? lastUomConflict;

  /// Informational messages from a SUCCESSFUL sync, keyed by pre-label — e.g.
  /// lines the server refused because they were deleted on another device.
  /// Separate from [lastErrors] because callers only read that on failure.
  final Map<String, String> lastNotices = {};

  Future<Map<String, int>> _syncList(List<PickList> picks) async {
    lastErrors.clear();
    lastNotices.clear();
    lastUomConflict = null;
    final result = {'total': picks.length, 'synced': 0, 'failed': 0};

    // Barcodes linked on this device go up FIRST. A pick line can refer to
    // goods that were only identifiable because someone attached a barcode to
    // them mid-pick; uploading the pick first would land it against a code the
    // server has never heard of.
    //
    // A barcode already taken by a DIFFERENT item stops everything: it means
    // this device has been scanning that code as the wrong goods, and pushing
    // the picks anyway would commit that mistake to the ledger.
    final cc = picks.isEmpty ? null : picks.first.companyCode;
    if (cc != null) {
      // Units first: a barcode can reference a unit created in the same trip.
      final pluSvc = PluService(isar);
      final uomErr = await pluSvc.syncPendingSkuUoms(cc);
      if (uomErr != null) {
        // Hand the conflict up so the caller can OFFER the fix rather than
        // just reporting a wall.
        lastUomConflict = pluSvc.lastUomConflict;
        result['failed'] = picks.length;
        for (final p in picks) {
          lastErrors[p.pickPreLabel ?? '?'] = uomErr;
        }
        print('❌ PICK SYNC: aborted before upload — $uomErr');
        return result;
      }
      final pluErr = await PluService(isar).syncPendingPlus(cc);
      if (pluErr != null) {
        result['failed'] = picks.length;
        for (final p in picks) {
          lastErrors[p.pickPreLabel ?? '?'] = pluErr;
        }
        print('❌ PICK SYNC: aborted before upload — $pluErr');
        return result;
      }
    }

    for (final pick in picks) {
      final err = await _syncOne(pick);
      if (err == null) {
        result['synced'] = result['synced']! + 1;
      } else {
        result['failed'] = result['failed']! + 1;
        final label = pick.pickPreLabel ?? '?';
        lastErrors[label] = err;
      }
    }
    return result;
  }

  // NOTE: this used to send a `Last_Sync` watermark, documented as letting the
  // server "detect concurrent edits". The server never read it. A guard that
  // exists only in a comment is worse than none, so it's gone; concurrency is
  // actually handled by the UPDLOCK/HOLDLOCK transaction and the additive
  // deltas on /api/pick-items.

  /// Extract the server's human-readable reason from an error response body.
  String _serverError(int status, String body) {
    try {
      final j = jsonDecode(body);
      if (j is Map && (j['details'] != null || j['error'] != null)) {
        return (j['details'] ?? j['error']).toString();
      }
    } catch (_) {}
    return 'HTTP $status';
  }

  /// Returns null on success, else a user-facing error message.
  Future<String?> _syncOne(PickList pick, {bool afterDuplicate = false}) async {
    final cc = pick.companyCode;
    final label = pick.pickPreLabel;
    if (cc == null || label == null || label.isEmpty) {
      return 'Missing company/label';
    }

    try {
      // 1) Header upsert.
      final headerResp = await http
          .post(
            Uri.parse('${AppConfig.apiBaseUrl}/api/picks'),
            headers: AppConfig.apiHeaders,
            body: jsonEncode(pick.toJson()),
          )
          .timeout(_headerTimeout);

      if (headerResp.statusCode != 200) {
        final msg = _serverError(headerResp.statusCode, headerResp.body);
        print('❌ PICK SYNC: header failed $label — $msg');
        return msg;
      }

      // A CANCELLED pick is closed server-side, so pushing its lines would be
      // rejected. The header carries the cancellation; skip the item upload.
      if (pick.status == 'X') {
        pick.isSynced = true;
        final lines = await isar.pickListItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .pickPreLabelEqualTo(label)
            .findAll();
        for (final it in lines) {
          it.isSynced = true;
        }
        await isar.writeTxn(() async {
          await isar.pickLists.put(pick);
          if (lines.isNotEmpty) await isar.pickListItems.putAll(lines);
        });
        print('✅ PICK SYNC: $label cancelled (header only)');
        return null;
      }

      // 2) Items delta-upload. Tombstones (status='X') go in `removals`; the
      // server hard-deletes them and logs a REMOVE. Live lines go in `items`.
      final allRows = await isar.pickListItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .pickPreLabelEqualTo(label)
          .findAll();
      final tombstones = allRows.where((e) => e.status == 'X').toList();
      final items = allRows.where((e) => e.status != 'X').toList();

      final itemsResp = await http
          .post(
            Uri.parse('${AppConfig.apiBaseUrl}/api/pick-items'),
            headers: AppConfig.apiHeaders,
            body: jsonEncode({
              'Company_Code': cc,
              'Pick_PreLabel': label,
              'Upload_Token': pick.uploadToken,
              'items': items.map((e) => e.toJson()).toList(),
              'removals': tombstones.map((e) => e.toJson()).toList(),
            }),
          )
          .timeout(_headerTimeout);

      if (itemsResp.statusCode != 200) {
        final msg = _serverError(itemsResp.statusCode, itemsResp.body);
        print('❌ PICK SYNC: items failed $label — $msg');
        return msg;
      }

      // Re-baseline from the server's authoritative post-apply totals so the
      // NEXT upload sends a correct delta (and the line shows the accumulated
      // total across pickers). Server returns { "parent|sku|uom": pickQty }.
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

      String keyOf(PickListItem it) =>
          '${it.parentPreLabel ?? ''}|${it.skuNo}|${it.uom}';

      // The server recognised this token: these deltas were ALREADY applied by
      // an earlier attempt whose response we never saw. Re-baseline to the
      // server's truth, mint a fresh token, and send only what is genuinely
      // left over — treating a duplicate as success would silently drop any
      // work done since that lost response.
      if (duplicate && !afterDuplicate) {
        for (final it in items) {
          final serverVal = serverTotals[keyOf(it)];
          if (serverVal is num) it.baselinePickQty = serverVal.toDouble();
        }
        pick.uploadToken =
            'pk-${pick.id.toRadixString(16)}-${DateTime.now().microsecondsSinceEpoch}';
        await isar.writeTxn(() async {
          await isar.pickLists.put(pick);
          if (items.isNotEmpty) await isar.pickListItems.putAll(items);
        });
        print('↩️  PICK SYNC: $label was already applied — re-baselined, '
            'resending the remainder');
        return _syncOne(pick, afterDuplicate: true);
      }

      // Delete-wins: the server refused these lines because they were deleted
      // elsewhere. They must be dropped locally, NOT marked synced — treating a
      // refusal as success re-baselined the line, silently consuming a delta
      // the server never applied and stranding a row that could never upload.
      final refused =
          items.where((it) => skippedKeys.contains(keyOf(it))).toList();
      final accepted =
          items.where((it) => !skippedKeys.contains(keyOf(it))).toList();

      // 3) Mark header + accepted items synced locally + re-baseline.
      final now = DateTime.now();
      pick.isSynced = true;
      // Completion is server-decided on sync: 'C' once fully picked.
      if (serverStatus != null) pick.status = serverStatus;
      pick.lastWriteTimeStamp = pick.lastWriteTimeStamp ?? now;
      for (final it in accepted) {
        it.isSynced = true;
        final serverVal = serverTotals[keyOf(it)];
        if (serverVal is num) {
          it.pickQty = serverVal.toDouble();
          it.baselinePickQty = serverVal.toDouble();
        } else {
          it.baselinePickQty = it.pickQty ?? 0;
        }
      }
      await isar.writeTxn(() async {
        await isar.pickLists.put(pick);
        if (accepted.isNotEmpty) await isar.pickListItems.putAll(accepted);
        // Removals are now applied server-side → drop the local tombstones.
        if (tombstones.isNotEmpty) {
          await isar.pickListItems.deleteAll(tombstones.map((e) => e.id).toList());
        }
        if (refused.isNotEmpty) {
          await isar.pickListItems.deleteAll(refused.map((e) => e.id).toList());
        }
      });

      print('✅ PICK SYNC: $label (${accepted.length} items, '
          '${tombstones.length} removed'
          '${refused.isEmpty ? '' : ', ${refused.length} deleted elsewhere'})');
      // Surface it — a line vanishing from the picker's screen needs a reason.
      if (refused.isNotEmpty) {
        lastNotices[label] =
            '${refused.length} line(s) were deleted on another device and have '
            'been removed here.';
      }
      return null;
    } catch (e) {
      print('❌ PICK SYNC: $label error: $e');
      return e.toString();
    }
  }
}
