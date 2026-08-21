import 'package:isar/isar.dart';
import '../main.dart';
import '../models/app_location.dart';
import 'auth_service.dart';
import 'offline_first_service.dart';
import 'signalr_service.dart';

/// The locations the signed-in user may work in, plus which one is currently
/// selected. Offline-first: the cache is authoritative for the UI and is
/// refreshed from the hub in the background.
class LocationService {
  /// Is a document visible while working in [scope]?
  ///
  /// The single definition of location scoping — the hubs, the add-item sheets
  /// and anything else must agree, or a document shows in one list and not
  /// another. A document with NO location is ALWAYS visible: records created
  /// before location scoping existed carry none, and hiding them would make
  /// them invisible and unfixable.
  static bool inScope(String? documentLocation, String? scope) {
    final s = (scope ?? '').trim();
    if (s.isEmpty) return true; // no scope chosen -> show everything
    final d = (documentLocation ?? '').trim();
    return d.isEmpty || d == s;
  }

  static final LocationService _i = LocationService._();
  factory LocationService() => _i;
  LocationService._();

  final _signalR = SignalRService();

  // ── Cache ────────────────────────────────────────────────────────────
  /// Cached locations for a company (all companies when [companyCode] is null).
  Future<List<AppLocation>> locations({int? companyCode}) async {
    final rows = companyCode == null
        ? await isar.appLocations.where().findAll()
        : await isar.appLocations
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
    rows.sort((a, b) {
      if (a.isDefault != b.isDefault) return a.isDefault ? -1 : 1;
      return a.locationCode.compareTo(b.locationCode);
    });
    return rows;
  }

  Future<AppLocation?> byCode(int companyCode, String locationCode) =>
      isar.appLocations
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .locationCodeEqualTo(locationCode)
          .findFirst();

  // ── Selection ────────────────────────────────────────────────────────
  Future<SelectedLocation?> selected() async =>
      isar.selectedLocations.get(SelectedLocation.singletonId);

  /// The active location code, or null when nothing is selected.
  Future<String?> selectedCode() async {
    final s = await selected();
    final c = s?.locationCode ?? '';
    return c.isEmpty ? null : c;
  }

  Future<void> select(AppLocation loc) async {
    final sel = SelectedLocation()
      ..companyCode = loc.companyCode
      ..locationCode = loc.locationCode
      ..name = loc.name
      ..selectedAt = DateTime.now();
    await isar.writeTxn(() async {
      await isar.selectedLocations.put(sel);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.selectedLocations.clear();
    });
  }

  /// Make sure a location is selected for [companyCode].
  ///
  /// Keeps a valid existing choice; otherwise falls back to the user's default
  /// (Def_Location = 'Y'), then to the only option when there is just one.
  /// Returns the active location, or null when the user has none.
  Future<AppLocation?> ensureSelected(int companyCode) async {
    var list = await locations(companyCode: companyCode);
    if (list.isEmpty) {
      await sync(companyCode: companyCode);
      list = await locations(companyCode: companyCode);
    }
    if (list.isEmpty) return null;

    final cur = await selected();
    if (cur != null && cur.companyCode == companyCode) {
      final match = list.where((e) => e.locationCode == cur.locationCode);
      if (match.isNotEmpty) return match.first;
    }

    final pick = list.firstWhere((e) => e.isDefault, orElse: () => list.first);
    await select(pick);
    return pick;
  }

  // ── Sync ─────────────────────────────────────────────────────────────
  bool _syncing = false;

  /// Pull the user's permitted locations from the hub and replace the cache.
  Future<int> sync({int? companyCode}) async {
    if (_syncing) return 0;
    _syncing = true;
    try {
      final userId = AuthService().currentUser?.userId;
      if (userId == null) return 0;
      if (!await OfflineFirstService.isServerReachable()) return 0;
      if (!_signalR.isConnected) {
        try {
          await _signalR.connect();
        } catch (_) {
          return 0;
        }
      }
      if (!_signalR.isConnected) return 0;

      dynamic result;
      for (final m in const ['getUserLocations', 'getLocations']) {
        try {
          result = await _signalR.invoke(m, [userId, companyCode]);
          if (result != null) break;
        } catch (_) {}
      }
      if (result is! List) return 0;

      final rows = <AppLocation>[];
      for (final r in result) {
        if (r is! Map) continue;
        try {
          final loc = AppLocation.fromJson(Map<String, dynamic>.from(r));
          if (loc.locationCode.isNotEmpty) rows.add(loc);
        } catch (_) {}
      }
      if (rows.isEmpty) return 0;

      await isar.writeTxn(() async {
        // Access can be revoked, so replace rather than merge — but replace
        // only what this call actually fetched. A scoped sync (the picker
        // passes a company) that cleared everything would delete the other
        // companies' locations, so switching company offline afterwards found
        // no locations at all and every document looked out of scope.
        if (companyCode == null) {
          await isar.appLocations.clear();
        } else {
          final stale = await isar.appLocations
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
          if (stale.isNotEmpty) {
            await isar.appLocations.deleteAll(stale.map((e) => e.id).toList());
          }
        }
        await isar.appLocations.putAll(rows);
      });
      print('✅ Locations: cached ${rows.length} for user $userId');
      return rows.length;
    } catch (e) {
      print('❌ Location sync failed: $e');
      return 0;
    } finally {
      _syncing = false;
    }
  }
}
