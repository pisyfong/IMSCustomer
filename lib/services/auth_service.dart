import 'dart:convert';
import 'package:isar/isar.dart';
import '../models/user.dart';
import '../current_login.dart';
import '../selected_company.dart';
import '../main.dart'; // For the global Isar and signalRService instances
import 'signalr_service.dart';
import 'offline_first_service.dart'; // For the global Isar and signalRService instances
import 'cart_service.dart';
import '../config/app_config.dart';

class AuthService {
  static String get baseUrl => '${AppConfig.baseUrl}/api';
  
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();
  
  // Store the current user and customer
  User? _currentUser;
  User? get currentUser => _currentUser;
  
  // Store the currently selected customer
  Map<String, dynamic>? _currentCustomer;
  Map<String, dynamic>? get currentCustomer => _currentCustomer;
  
  // Login method using offline-first pattern
  Future<User?> login(String username, String password) async {
    try {
      print('\n=== AuthService Login Started (Offline-First) ===');
      print('Username: $username');
      print('Password: ${password.isNotEmpty ? '[PRESENT]' : '[MISSING]'}');
      
      // Use offline-first login pattern
      final result = await OfflineFirstService.loginOfflineFirst(
        username: username,
        password: password,
      );
      
      print('Login result received: $result');
      
      if (result != null && result['success'] == true) {
        final isOfflineLogin = result['offline'] == true;
        print('✅ AuthService: Login successful (${isOfflineLogin ? "Offline" : "Online"})');
        
        final userData = result['user'];
        _currentUser = User.fromJson(userData);
        
        // Log the roleId from the server
        print('📋 AuthService: User roleId from server = ${userData['Role_ID']}');
        print('📋 AuthService: Mapped to User object with roleId = ${_currentUser?.roleId}');
        
        // Save login to Isar database (always update current login)
        await _saveCurrentLogin(userData);
        
        // Establish SignalR connection if we're online (with timeout)
        if (!isOfflineLogin) {
          try {
            print('Establishing SignalR connection for online login...');
            await signalRService.connect().timeout(
              const Duration(seconds: 3),
              onTimeout: () {
                print('⏱️ SignalR connection timed out after 3s - continuing without connection');
              },
            );
            print('✅ SignalR connection established');
          } catch (signalRError) {
            print('⚠️ SignalR connection failed after login: $signalRError');
            // Don't fail login just because SignalR connection failed
          }
        } else {
          print('📱 Offline login - SignalR connection deferred');
        }
        
        print('User saved to Isar database');
        print('=== AuthService Login Completed Successfully ===\n');
        return _currentUser;
      } else {
        // Login failed
        final message = result?['message'] ?? 'Authentication failed';
        print('❌ AuthService: Login failed - $message');
        print('=== AuthService Login Failed ===\n');
        throw Exception(message);
      }
    } catch (e) {
      print('❌ AuthService: Login exception - ${e.toString()}');
      print('Exception type: ${e.runtimeType}');
      print('=== AuthService Login Exception ===\n');
      throw Exception('Login failed: ${e.toString()}');
    }
  }
  
  // Save current login to Isar
  Future<void> _saveCurrentLogin(Map<String, dynamic> userData) async {
    try {
      final currentLogin = CurrentLogin.fromUser(userData);
      
      // Use direct collection access method
      await isar.writeTxn(() async {
        await isar.collection<CurrentLogin>().put(currentLogin);
      });
    } catch (e) {
      print('Error saving login: $e');
    }
  }
  
  // Logout method
  Future<void> logout() async {
    _currentUser = null;
    
    // Clear current login from Isar
    try {
      await isar.writeTxn(() async {
        await isar.collection<CurrentLogin>().clear();
      });
    } catch (e) {
      print('Error clearing login: $e');
    }
  }
  
  // Check if user is logged in
  bool isLoggedIn() {
    return _currentUser != null;
  }
  
  // Check if there's a saved login in Isar
  Future<bool> hasSavedLogin() async {
    try {
      final savedLogin = await isar.collection<CurrentLogin>().get(CurrentLogin.singletonId);
      return savedLogin != null;
    } catch (e) {
      print('Error checking saved login: $e');
      return false;
    }
  }
  
  // Load saved login from Isar
  Future<User?> loadSavedLogin() async {
    try {
      final savedLogin = await isar.collection<CurrentLogin>().get(CurrentLogin.singletonId);
      
      if (savedLogin != null) {
        print('\n=== Loading Saved Login ===');
        print('Found saved login for: ${savedLogin.username}');
        
        // Establish SignalR connection when loading saved login (with timeout)
        print('Establishing SignalR connection for saved login...');
        try {
          await signalRService.connect().timeout(
            const Duration(seconds: 3),
            onTimeout: () {
              print('⏱️ SignalR connection timed out after 3s - continuing in offline mode');
            },
          );
          print('✅ SignalR connection established for saved login');
        } catch (e) {
          print('⚠️ SignalR connection failed during saved login: $e');
          // Continue anyway - app should work offline
        }
        
        _currentUser = User(
          userId: savedLogin.userId,
          loginName: savedLogin.username,
          fullName: savedLogin.fullName,
          status: 'A', // Assuming active
          designation: savedLogin.designation,
          email: savedLogin.email,
          userPhoto: savedLogin.userPhoto,
          roleId: savedLogin.roleId ?? 0, // Default to 0 if null
        );
        
        print('📋 AuthService: Loaded user with roleId = ${_currentUser?.roleId}');
        print('Saved login loaded successfully');
        print('=== Saved Login Loading Completed ===\n');
        return _currentUser;
      }
    } catch (e) {
      print('Error loading saved login: $e');
    }
    
    return null;
  }

  // Save selected company to Isar
  Future<void> saveSelectedCompany(Map<String, dynamic> company) async {
    try {
      final selectedCompany = SelectedCompany.fromCompany(company);
      
      await isar.writeTxn(() async {
        await isar.collection<SelectedCompany>().put(selectedCompany);
      });
    } catch (e) {
      print('Error saving selected company: $e');
    }
  }
  
  // Get selected company from Isar
  Future<Map<String, dynamic>?> getSelectedCompany() async {
    try {
      final selectedCompany = await isar.collection<SelectedCompany>().get(SelectedCompany.singletonId);
      
      if (selectedCompany != null) {
        return {
          'companyId': selectedCompany.companyId,
          'companyName': selectedCompany.companyName,
          'companyCode': selectedCompany.companyCode,
          'selectedAt': selectedCompany.selectedAt,
        };
      }
    } catch (e) {
      print('Error getting selected company: $e');
    }
    
    return null;
  }
  
  // Clear selected company from Isar
  Future<void> clearSelectedCompany() async {
    try {
      await isar.writeTxn(() async {
        await isar.collection<SelectedCompany>().clear();
      });
    } catch (e) {
      print('Error clearing selected company: $e');
    }
  }
  
  // Set the currently selected customer
  Future<void> setCurrentCustomer(Map<String, dynamic>? customer) async {
    final previousCustomer = _currentCustomer;
    _currentCustomer = customer;
    
    // If customer changed, clear the cart
    if (previousCustomer != null && customer != null) {
      final previousId = previousCustomer['customerId'] ?? previousCustomer['id'];
      final currentId = customer['customerId'] ?? customer['id'];
      
      if (previousId != currentId) {
        print('🔄 Customer changed from $previousId to $currentId - clearing cart');
        // Import and use CartService to clear cart
        final cartService = CartService();
        await cartService.clearCart();
      }
    } else if (previousCustomer != null && customer == null) {
      // Customer was deselected, clear cart
      print('🔄 Customer deselected - clearing cart');
      final cartService = CartService();
      await cartService.clearCart();
    }
  }
  
  // Get the currently selected customer
  Future<Map<String, dynamic>?> getCurrentCustomer() async {
    return _currentCustomer;
  }

  // Update the current user's role and persist to CurrentLogin
  Future<void> updateCurrentUserRole(int roleId) async {
    if (_currentUser == null) return;
    final u = _currentUser!;
    _currentUser = User(
      userId: u.userId,
      userPhoto: u.userPhoto,
      loginName: u.loginName,
      fullName: u.fullName,
      status: u.status,
      accessLevel: u.accessLevel,
      designation: u.designation,
      email: u.email,
      phoneNo: u.phoneNo,
      roleId: roleId,
    );

    try {
      await isar.writeTxn(() async {
        final saved = await isar.collection<CurrentLogin>().get(CurrentLogin.singletonId);
        if (saved != null) {
          saved.roleId = roleId;
          await isar.collection<CurrentLogin>().put(saved);
        }
      });
      print('💾 AuthService: Updated current user roleId to $roleId and persisted to CurrentLogin');
    } catch (e) {
      print('⚠️ AuthService: Failed to persist updated roleId - $e');
    }
  }
}
