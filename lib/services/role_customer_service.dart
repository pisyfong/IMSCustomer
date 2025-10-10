import 'package:isar/isar.dart';
import '../models/user_role.dart';
import '../models/user_customer.dart';
import '../models/customer.dart';
import '../main.dart';
import 'auth_service.dart';

/// Service to handle role-based customer access control
class RoleCustomerService {
  final AuthService _authService = AuthService();

  /// Get customers accessible to the current user based on their role
  Future<List<Customer>> getAccessibleCustomers({required int companyCode}) async {
    try {
      print('\n========== RoleCustomerService.getAccessibleCustomers ==========');
      print('🏯 Company Code: $companyCode');
      
      // Get current user's role ID
      final currentUser = _authService.currentUser;
      final roleId = currentUser?.roleId;
      
      print('👤 Current User: ${currentUser?.loginName} (userId=${currentUser?.userId})');
      print('🎭 Role ID: $roleId');
      
      if (roleId == null || roleId == 0) {
        // Users with no roleId or roleId=0 have no customer access
        print('❌ RoleCustomerService: BLOCKED - User has no valid roleId (roleId=$roleId)');
        print('❌ Returning EMPTY customer list');
        print('================================================================\n');
        return [];
      }

      // Get customer codes accessible to this role (load + filter in memory)
      final allMappings = await isar.userCustomers.where().findAll();
      print('📊 Total role-customer mappings in DB: ${allMappings.length}');
      
      // Debug: Show sample mappings
      if (allMappings.isNotEmpty) {
        final sample = allMappings.take(3).toList();
        print('📋 Sample mappings:');
        for (var m in sample) {
          print('   - Role ${m.userId} -> Customer ${m.customer} (Company ${m.companyCode})');
        }
      }
      
      final userCustomers = allMappings
          .where((m) => m.userId == roleId && m.companyCode == companyCode)
          .toList();

      print('🎯 Mappings for roleId=$roleId, company=$companyCode: ${userCustomers.length}');
      
      if (userCustomers.isEmpty) {
        print('❌ No customer mappings found for role $roleId in company $companyCode');
        print('❌ Returning EMPTY customer list');
        print('================================================================\n');
        return [];
      }

      // Extract customer codes
      final customerCodes = userCustomers.map((uc) => uc.customer).toList();
      print('📝 Allowed customer codes: ${customerCodes.take(5).join(", ")}${customerCodes.length > 5 ? "..." : ""}');

      // Get full customer details for accessible customers
      // Fetch all customers and filter in memory by permitted codes
      final allCompanyCustomers = await isar.customers.where().findAll();
      print('📊 Total customers in DB: ${allCompanyCustomers.length}');
      
      final allowedSet = customerCodes.toSet();
      final accessibleCustomers = allCompanyCustomers
          .where((c) => c.companyCode == companyCode && allowedSet.contains(c.code))
          .toList();

      print('✅ Accessible customers after filtering: ${accessibleCustomers.length}');
      print('================================================================\n');
      return accessibleCustomers;
    } catch (e) {
      print('Error getting accessible customers: $e');
      return [];
    }
  }

  /// Get the default customer for the current user's role
  Future<Customer?> getDefaultCustomer({required int companyCode}) async {
    try {
      final currentUser = _authService.currentUser;
      final roleId = currentUser?.roleId;
      
      if (roleId == null) return null;

      // Find default customer for this role (in memory)
      final mappings = await isar.userCustomers.where().findAll();
      final defaultUserCustomer = mappings.firstWhere(
        (m) => m.userId == roleId && m.companyCode == companyCode && m.isDefault == 'Y',
        orElse: () => null as UserCustomer,
      );

      if (defaultUserCustomer == null) return null;

      // Get the full customer details
      final allCustomers = await isar.customers.where().findAll();
      final customer = allCustomers.firstWhere(
        (c) => c.companyCode == companyCode && c.code == defaultUserCustomer.customer,
        orElse: () => null as Customer,
      );

      return customer;
    } catch (e) {
      print('Error getting default customer: $e');
      return null;
    }
  }

  /// Check if current user has access to a specific customer
  Future<bool> hasAccessToCustomer({
    required int companyCode,
    required String customerCode,
  }) async {
    try {
      final currentUser = _authService.currentUser;
      final roleId = currentUser?.roleId;
      
      if (roleId == null) return false;

      final mappings = await isar.userCustomers.where().findAll();
      final has = mappings.any((m) =>
          m.userId == roleId && m.companyCode == companyCode && m.customer == customerCode);
      return has;
    } catch (e) {
      print('Error checking customer access: $e');
      return false;
    }
  }

  /// Sync user roles from server
  Future<void> syncUserRoles(List<Map<String, dynamic>> rolesData) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing roles
        await isar.userRoles.clear();
        
        // Add new roles
        for (final roleData in rolesData) {
          final role = UserRole.fromJson(roleData);
          await isar.userRoles.put(role);
        }
      });
      print('Synced ${rolesData.length} user roles');
    } catch (e) {
      print('Error syncing user roles: $e');
    }
  }

  /// Sync user-customer mappings from server
  Future<void> syncUserCustomers(List<Map<String, dynamic>> userCustomersData) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing mappings
        await isar.userCustomers.clear();
        
        // Add new mappings
        for (final ucData in userCustomersData) {
          final userCustomer = UserCustomer.fromJson(ucData);
          await isar.userCustomers.put(userCustomer);
        }
      });
      print('Synced ${userCustomersData.length} user-customer mappings');
    } catch (e) {
      print('Error syncing user-customer mappings: $e');
    }
  }
}
