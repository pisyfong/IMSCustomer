import 'package:isar/isar.dart';
import '../models/user_app_settings.dart';
import '../main.dart';
import 'auth_service.dart';
import 'signalr_service.dart';

/// Service to handle user app settings and permissions
class UserAppSettingsService {
  final AuthService _authService = AuthService();
  final SignalRService _signalR = SignalRService();

  /// Users whose permissions have been refreshed this session.
  ///
  /// Permissions were only fetched during a full sync, so a change made in the
  /// desktop app did not reach a device until someone ran one — a permission
  /// grant appeared not to work. One row per user is cheap enough to refresh
  /// on first use instead.
  static final Set<int> _refreshed = <int>{};

  /// Re-reads this user's permissions from the server and replaces the local
  /// copy. Silent on failure: offline devices keep working from cache.
  Future<void> refreshPermissions({bool force = false}) async {
    // currentUser is only set once a login has been loaded this session; on a
    // cold start it can still be null while a saved login exists, and the old
    // code simply gave up there.
    var userId = _authService.currentUser?.userId;
    userId ??= (await _authService.loadSavedLogin())?.userId;
    if (userId == null) {
      print('⚙️ UserAppSettings: refresh skipped (no user)');
      return;
    }
    final id = userId;
    // The guard is per user id, so switching accounts refetches rather than
    // inheriting whoever was signed in before.
    if (!force && _refreshed.contains(id)) {
      print('⚙️ UserAppSettings: already refreshed this session for user $id');
      return;
    }
    // isConnected is false during every reconnect window, and this connection
    // reconnects often — so treating it as "offline" meant the refresh almost
    // never ran. Try to establish the connection first, and only give up if
    // that fails.
    if (!_signalR.isConnected) {
      try {
        await _signalR.connect().timeout(const Duration(seconds: 4));
      } catch (e) {
        print('⚙️ UserAppSettings: connect for refresh failed ($e)');
      }
    }
    if (!_signalR.isConnected) {
      // Not marked as refreshed, so the next read tries again once the
      // connection is up.
      print('⚙️ UserAppSettings: refresh skipped (offline)');
      return;
    }

    try {
      List<dynamic>? rows;
      for (var attempt = 1; attempt <= 2; attempt++) {
        try {
          rows = await _signalR.invoke(
            'getUserAppSettings',
            [
              {'userId': id}
            ],
          ).timeout(const Duration(seconds: 8)) as List<dynamic>?;
          break;
        } catch (e) {
          if (attempt == 2) rethrow;
          print('⚙️ UserAppSettings: attempt $attempt failed ($e) — retrying');
          await Future<void>.delayed(const Duration(milliseconds: 600));
        }
      }
      final fetched = rows;
      if (fetched == null || fetched.isEmpty) {
        print('⚙️ UserAppSettings: server returned no permission rows');
        return;
      }

      await isar.writeTxn(() async {
        await isar.userAppSettings.where().userIdEqualTo(id).deleteAll();
        for (final row in fetched) {
          await isar.userAppSettings
              .put(UserAppSettings.fromJson(row as Map<String, dynamic>));
        }
      });
      _refreshed.add(id);
      print('⚙️ UserAppSettings: refreshed ${fetched.length} permission row(s) '
          'for user $id');
    } catch (e) {
      print('⚙️ UserAppSettings: refresh skipped ($e)');
    }
  }

  /// Forgets the once-per-session guard, so the next read refetches.
  static void invalidateRefreshCache() {
    _refreshed.clear();
    _denyVerified.clear();
  }

  /// Users whose denial has already been re-checked against the server.
  static final Set<int> _denyVerified = <int>{};

  /// Re-reads permissions when the cached answer is "no".
  ///
  /// A stale grant is harmless — the operator simply has a button they cannot
  /// use — but a stale DENIAL blocks work that has already been authorised.
  /// So a refusal is confirmed against the server once per session before it
  /// is acted on.
  Future<UserAppSettings?> _verifyDenial(int companyCode) async {
    final id = _authService.currentUser?.userId ??
        (await _authService.loadSavedLogin())?.userId;
    if (id == null || _denyVerified.contains(id)) return null;
    _denyVerified.add(id);
    print('⚙️ UserAppSettings: cached answer denies — re-checking with server');
    await refreshPermissions(force: true);
    return getCurrentUserSettings(companyCode: companyCode);
  }

  /// Get user app settings for current user and company
  Future<UserAppSettings?> getCurrentUserSettings({required int companyCode}) async {
    try {
      var currentUser = _authService.currentUser;
      if (currentUser?.userId == null) {
        currentUser = await _authService.loadSavedLogin();
      }
      if (currentUser?.userId == null) {
        print('⚙️ UserAppSettings: No user logged in');
        return null;
      }

      // Once per session, and only when connected: picks up permission
      // changes without waiting for a full sync.
      await refreshPermissions();

      final settings = await isar.userAppSettings
          .where()
          .userIdEqualTo(currentUser!.userId)
          .filter()
          .companyCodeEqualTo(companyCode)
          .findFirst();

      if (settings == null) {
        print('⚙️ UserAppSettings: No settings found for userId=${currentUser.userId}, company=$companyCode');
      } else {
        print('⚙️ UserAppSettings: Found settings for userId=${currentUser.userId}, company=$companyCode');
      }

      return settings;
    } catch (e) {
      print('❌ Error getting user app settings: $e');
      return null;
    }
  }

  /// Check if user can change/edit prices
  Future<bool> canChangePrice({required int companyCode}) async {
    try {
      print('\n🔍 ========== PERMISSION CHECK DEBUG ==========');
      final currentUser = _authService.currentUser;
      print('🔍 Current User ID: ${currentUser?.userId}');
      print('🔍 Company Code: $companyCode');
      
      var settings = await getCurrentUserSettings(companyCode: companyCode);

      // Confirm a refusal before acting on it: the local copy may predate a
      // grant made in the desktop app.
      if (settings != null && !settings.canChangePrice) {
        settings = await _verifyDenial(companyCode) ?? settings;
      }

      if (settings == null) {
        print('🔍 ❌ No settings found in database');
        print('🔍 Checking all settings in DB...');
        final allSettings = await isar.userAppSettings.where().findAll();
        print('🔍 Total settings in DB: ${allSettings.length}');
        if (allSettings.isNotEmpty) {
          for (var s in allSettings.take(5)) {
            print('🔍   - User ${s.userId}, Company ${s.companyCode}, SI_Allow_Change_Price: ${s.siAllowChangePrice}');
          }
        }
        print('🔍 =============================================\n');
        return false;
      }
      
      final canChange = settings.canChangePrice;
      print('🔍 ✅ Settings found!');
      print('🔍 User ID: ${settings.userId}');
      print('🔍 Company Code: ${settings.companyCode}');
      print('🔍 SI_Allow_Change_Price: ${settings.siAllowChangePrice}');
      print('🔍 Result: canChangePrice = $canChange');
      print('🔍 =============================================\n');
      
      return canChange;
    } catch (e) {
      print('❌ Error checking price change permission: $e');
      return false; // Default to no permission on error
    }
  }

  /// Check if user can sell below cost
  Future<bool> canSellBelowCost({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.canSellBelowCost ?? false;
    } catch (e) {
      print('❌ Error checking below cost permission: $e');
      return false;
    }
  }

  /// Check if user can exceed quantity
  Future<bool> canExceedQty({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.canExceedQty ?? false;
    } catch (e) {
      print('❌ Error checking exceed qty permission: $e');
      return false;
    }
  }

  /// Check if user can add FOC (Free of Charge) items
  Future<bool> canAddFoc({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.canAddFoc ?? false;
    } catch (e) {
      print('❌ Error checking FOC permission: $e');
      return false;
    }
  }

  /// Check if user can view all orders
  Future<bool> canViewAllOrders({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.canViewAllOrders ?? false;
    } catch (e) {
      print('❌ Error checking view all orders permission: $e');
      return false;
    }
  }

  /// Check if user can edit all orders
  Future<bool> canEditAllOrders({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.canEditAllOrders ?? false;
    } catch (e) {
      print('❌ Error checking edit all orders permission: $e');
      return false;
    }
  }

  /// Check if quantity should be shown
  Future<bool> shouldShowQuantity({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.showQuantity ?? true; // Default to true
    } catch (e) {
      print('❌ Error checking show quantity setting: $e');
      return true;
    }
  }

  /// Check if cost should be shown
  Future<bool> shouldShowCost({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      return settings?.showCost ?? false; // Default to false for security
    } catch (e) {
      print('❌ Error checking show cost setting: $e');
      return false;
    }
  }

  /// Get all permissions as a map for easy access
  Future<Map<String, bool>> getAllPermissions({required int companyCode}) async {
    try {
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      
      if (settings == null) {
        // Default permissions (most restrictive)
        return {
          'canChangePrice': false,
          'canSellBelowCost': false,
          'canExceedQty': false,
          'canAddFoc': false,
          'canViewAllOrders': false,
          'canEditAllOrders': false,
          'showQuantity': true,
          'showCost': false,
        };
      }

      return {
        'canChangePrice': settings.canChangePrice,
        'canSellBelowCost': settings.canSellBelowCost,
        'canExceedQty': settings.canExceedQty,
        'canAddFoc': settings.canAddFoc,
        'canViewAllOrders': settings.canViewAllOrders,
        'canEditAllOrders': settings.canEditAllOrders,
        'showQuantity': settings.showQuantity,
        'showCost': settings.showCost,
      };
    } catch (e) {
      print('❌ Error getting all permissions: $e');
      // Return default restrictive permissions on error
      return {
        'canChangePrice': false,
        'canSellBelowCost': false,
        'canExceedQty': false,
        'canAddFoc': false,
        'canViewAllOrders': false,
        'canEditAllOrders': false,
        'showQuantity': true,
        'showCost': false,
      };
    }
  }
}
