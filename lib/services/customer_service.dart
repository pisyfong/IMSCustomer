import 'package:isar/isar.dart';
import '../models/customer.dart';
import '../services/signalr_service.dart';
import '../main.dart';
import 'role_customer_service.dart';
import 'auth_service.dart';

class CustomerService {
  final SignalRService _signalRService;
  final RoleCustomerService _roleCustomerService = RoleCustomerService();

  CustomerService(this._signalRService);

  /// Sync customers from server and save to local database
  Future<List<Customer>> syncCustomers(int companyCode) async {
    try {
      print('🔄 Syncing customers for company $companyCode...');

      // Fetch customers from server via SignalR
      final customersData = await _signalRService.invoke(
        'getCustomers',
        [companyCode],
      ) as List<dynamic>?;

      if (customersData == null || customersData.isEmpty) {
        print('⚠️ No customers received from server');
        return [];
      }

      // Convert to Customer objects and set the correct company code
      final customers = customersData
          .map((data) {
            final customer = Customer.fromJson(data as Map<String, dynamic>);
            // Ensure the customer has the correct company code
            customer.companyCode = companyCode;
            return customer;
          })
          .toList();

      // Save to local database
      await _saveCustomersToLocal(customers, companyCode);

      print('✅ Synced ${customers.length} customers for company $companyCode');
      return customers;
    } catch (e) {
      print('❌ Error syncing customers: $e');
      throw Exception('Failed to sync customers: $e');
    }
  }

  /// Get customers from local database with role-based filtering
  Future<List<Customer>> getLocalCustomers(int companyCode) async {
    try {
      print('🔍 CustomerService.getLocalCustomers: Starting for company $companyCode');
      
      // Debug: Check current user's roleId
      final currentUser = AuthService().currentUser;
      print('👤 CustomerService: Current user = ${currentUser?.loginName}, roleId = ${currentUser?.roleId}');
      
      // Get role-filtered customers automatically
      final roleFilteredCustomers = await _roleCustomerService.getAccessibleCustomers(
        companyCode: companyCode,
      );
      
      print('📋 CustomerService: RoleCustomerService returned ${roleFilteredCustomers.length} customers');

      // Strict mode: if no accessible customers, return empty list
      if (roleFilteredCustomers.isEmpty) {
        print('🚫 CustomerService: No accessible customers for current role (roleId=${currentUser?.roleId}) in company $companyCode');
        return [];
      }

      print('✅ CustomerService: Returning ${roleFilteredCustomers.length} role-filtered customers for company $companyCode');
      return roleFilteredCustomers;
    } catch (e) {
      print('❌ Error getting local customers: $e');
      return [];
    }
  }

  /// Get customers with offline-first approach
  Future<List<Customer>> getCustomers(int companyCode, {bool forceSync = false}) async {
    try {
      // If force sync requested, try server first but fallback to local
      if (forceSync) {
        try {
          await syncCustomers(companyCode);
          // Always return role-filtered local view after syncing
          return await getLocalCustomers(companyCode);
        } catch (e) {
          print('⚠️ Force sync failed, falling back to local data: $e');
          final localCustomers = await getLocalCustomers(companyCode);
          return localCustomers; // Return local data even if empty
        }
      }

      // OFFLINE-FIRST: Always try local data first, regardless of whether it's empty
      final localCustomers = await getLocalCustomers(companyCode);
      
      // If we have local data, return it immediately (offline-first)
      if (localCustomers.isNotEmpty) {
        print('📱 Using ${localCustomers.length} cached customers (offline-first)');
        return localCustomers;
      }

      // No local data available, check if we're online before attempting sync
      print('📱 No local customers found, checking connectivity...');
      
      try {
        // Only attempt server sync if we can reach the server
        final isOnline = await _isServerReachable();
        if (!isOnline) {
          print('📱 Offline: Server unreachable, returning empty list');
          return []; // Return empty list when offline (offline-first)
        }

        print('🌐 Online: Attempting to sync customers from server...');
        await syncCustomers(companyCode);
        // After syncing, still return role-filtered local list
        return await getLocalCustomers(companyCode);
      } catch (e) {
        print('❌ Server sync failed, returning empty list: $e');
        return []; // Return empty list on sync failure (offline-first)
      }
    } catch (e) {
      print('❌ Error in getCustomers: $e');
      return [];
    }
  }

  /// Check if server is reachable (simple connectivity check)
  Future<bool> _isServerReachable() async {
    try {
      // Use the same connectivity check as other services
      return await _signalRService.isConnected || 
             await Future.delayed(Duration(seconds: 1), () => _signalRService.isConnected);
    } catch (e) {
      print('🔍 Connectivity check failed: $e');
      return false;
    }
  }

  /// Search customers by name or code with role-based filtering
  Future<List<Customer>> searchCustomers(int companyCode, String query) async {
    try {
      if (query.isEmpty) {
        return await getLocalCustomers(companyCode);
      }

      // Get role-accessible customers first
      final accessibleCustomers = await _roleCustomerService.getAccessibleCustomers(
        companyCode: companyCode,
      );

      if (accessibleCustomers.isEmpty) {
        print('🚫 No accessible customers for current role; search returns empty');
        return [];
      }

      // Filter accessible customers by search query
      final filteredCustomers = accessibleCustomers.where((customer) {
        final name = customer.name?.toLowerCase() ?? '';
        final name2 = customer.name2?.toLowerCase() ?? '';
        final code = customer.code?.toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();
        
        return name.contains(searchQuery) || 
               name2.contains(searchQuery) || 
               code.contains(searchQuery);
      }).toList();

      // Sort by name
      filteredCustomers.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));

      print('🔍 Found ${filteredCustomers.length} role-filtered customers matching "$query"');
      return filteredCustomers;
    } catch (e) {
      print('❌ Error searching customers: $e');
      return [];
    }
  }

  /// Get customer by code with role-based access check
  Future<Customer?> getCustomerByCode(int companyCode, String customerCode) async {
    try {
      final customer = await isar.customers
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .codeEqualTo(customerCode)
          .findFirst();

      if (customer == null) return null;

      // Check if user has access to this customer
      final hasAccess = await _roleCustomerService.hasAccessToCustomer(
        companyCode: companyCode,
        customerCode: customerCode,
      );

      if (!hasAccess) {
        print('🚫 Access denied to customer $customerCode for current user role');
        return null;
      }

      return customer;
    } catch (e) {
      print('❌ Error getting customer by code: $e');
      return null;
    }
  }

  /// Save customers to local database
  Future<void> _saveCustomersToLocal(List<Customer> customers, int companyCode) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing customers for this company
        await isar.customers
            .where()
            .companyCodeEqualTo(companyCode)
            .deleteAll();

        // Save new customers
        await isar.customers.putAll(customers);
      });

      print('💾 Saved ${customers.length} customers to local database');
    } catch (e) {
      print('❌ Error saving customers to local database: $e');
      throw e;
    }
  }

  /// Clear all local customers
  Future<void> clearLocalCustomers() async {
    try {
      await isar.writeTxn(() async {
        await isar.customers.clear();
      });
      print('🗑️ Cleared all local customers');
    } catch (e) {
      print('❌ Error clearing local customers: $e');
    }
  }

  /// Get customer statistics
  Future<Map<String, dynamic>> getCustomerStats(int companyCode) async {
    try {
      final totalCustomers = await isar.customers
          .where()
          .companyCodeEqualTo(companyCode)
          .count();

      final activeCustomers = await isar.customers
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .statusEqualTo('A')
          .count();

      return {
        'totalCustomers': totalCustomers,
        'activeCustomers': activeCustomers,
        'inactiveCustomers': totalCustomers - activeCustomers,
      };
    } catch (e) {
      print('❌ Error getting customer stats: $e');
      return {
        'totalCustomers': 0,
        'activeCustomers': 0,
        'inactiveCustomers': 0,
      };
    }
  }
}
