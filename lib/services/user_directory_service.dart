import 'package:isar/isar.dart';
import '../main.dart';
import '../models/app_user.dart';
import 'signalr_service.dart';
import 'offline_first_service.dart';

/// The PI_Users directory used by the "Assigned To" picker.
///
/// OFFLINE-FIRST: reads the Isar cache immediately and refreshes from the hub
/// in the background, so assignment works with no connection.
class UserDirectoryService {
  static final UserDirectoryService _i = UserDirectoryService._();
  factory UserDirectoryService() => _i;
  UserDirectoryService._();

  final _signalR = SignalRService();

  /// Cached users (alphabetical). Kicks off a background refresh.
  Future<List<AppUser>> users({bool refresh = true}) async {
    final cached = await isar.appUsers.where().findAll();
    cached.sort((a, b) =>
        a.displayName.toLowerCase().compareTo(b.displayName.toLowerCase()));
    if (refresh) sync(); // fire-and-forget
    return cached;
  }

  Future<AppUser?> byId(int userId) async =>
      isar.appUsers.filter().userIdEqualTo(userId).findFirst();

  /// Resolve a user id to a display name, falling back to the raw id.
  Future<String> nameFor(int? userId) async {
    if (userId == null) return 'Unassigned';
    final u = await byId(userId);
    return u?.displayName ?? 'User $userId';
  }

  bool _syncing = false;

  /// Pull the directory from the hub and replace the local cache.
  Future<int> sync() async {
    if (_syncing) return 0;
    _syncing = true;
    try {
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
      for (final m in const ['getPiUsers', 'getUsers']) {
        try {
          result = await _signalR.invoke(m, []);
          if (result != null) break;
        } catch (_) {}
      }
      if (result is! List) return 0;

      final rows = <AppUser>[];
      for (final r in result) {
        if (r is! Map) continue;
        try {
          final u = AppUser.fromJson(Map<String, dynamic>.from(r));
          if (u.userId > 0) rows.add(u);
        } catch (_) {}
      }
      if (rows.isEmpty) return 0;

      await isar.writeTxn(() async {
        await isar.appUsers.clear();
        await isar.appUsers.putAll(rows);
      });
      print('✅ UserDirectory: cached ${rows.length} users');
      return rows.length;
    } catch (e) {
      print('❌ UserDirectory sync failed: $e');
      return 0;
    } finally {
      _syncing = false;
    }
  }
}
