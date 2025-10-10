import 'package:isar/isar.dart';
import '../models/user_app_settings.dart';
import '../main.dart';
import 'auth_service.dart';

/// Service to handle user app settings and permissions
class UserAppSettingsService {
  final AuthService _authService = AuthService();

  /// Get user app settings for current user and company
  Future<UserAppSettings?> getCurrentUserSettings({required int companyCode}) async {
    try {
      final currentUser = _authService.currentUser;
      if (currentUser?.userId == null) {
        print('⚙️ UserAppSettings: No user logged in');
        return null;
      }

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
      
      final settings = await getCurrentUserSettings(companyCode: companyCode);
      
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
