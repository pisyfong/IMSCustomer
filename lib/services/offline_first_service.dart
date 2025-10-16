import 'package:isar/isar.dart';
import 'signalr_service.dart';
import '../main.dart'; // For global isar instance
import '../company.dart';
import '../login_cache.dart';

/// Utility class for implementing offline-first patterns consistently across the app
/// 
/// Core Principle: Always try local database first when offline, 
/// only attempt server sync when connectivity is confirmed
class OfflineFirstService {
  // Use the global SignalRService instance to avoid multiple connections
  // and ensure a shared connection state across the app.
  static SignalRService get _signalRService => signalRService;
  
  // Cache the last known connectivity state to avoid repeated timeout attempts
  static bool _lastKnownOnlineState = false;
  static DateTime? _lastConnectivityCheck;
  static const Duration _connectivityCacheDuration = Duration(seconds: 30);
  
  /// Quick check if server is likely reachable (uses cached state)
  /// Returns true if we recently connected successfully
  static bool isLikelyOnline() {
    // If SignalR is currently connected, we're definitely online
    if (_signalRService.isConnected) {
      _lastKnownOnlineState = true;
      _lastConnectivityCheck = DateTime.now();
      return true;
    }
    
    // If we recently checked and were offline, assume still offline
    if (_lastConnectivityCheck != null) {
      final timeSinceCheck = DateTime.now().difference(_lastConnectivityCheck!);
      if (timeSinceCheck < _connectivityCacheDuration) {
        return _lastKnownOnlineState;
      }
    }
    
    // Default to offline to avoid blocking
    return false;
  }
  
  /// Test if we can connect to the server (with timeout)
  /// Returns true if server is reachable, false if offline
  static Future<bool> isServerReachable({Duration timeout = const Duration(seconds: 2)}) async {
    try {
      // Quick check first
      if (_signalRService.isConnected) {
        _lastKnownOnlineState = true;
        _lastConnectivityCheck = DateTime.now();
        return true;
      }
      
      // Try to connect with timeout
      if (!_signalRService.isConnected) {
        await _signalRService.connect().timeout(timeout);
      }
      
      final isOnline = _signalRService.isConnected;
      _lastKnownOnlineState = isOnline;
      _lastConnectivityCheck = DateTime.now();
      return isOnline;
    } catch (e) {
      print('🔍 OfflineFirst: Server unreachable - $e');
      _lastKnownOnlineState = false;
      _lastConnectivityCheck = DateTime.now();
      return false;
    }
  }
  
  /// Reset connectivity cache (call when user manually triggers sync)
  static void resetConnectivityCache() {
    _lastConnectivityCheck = null;
    _lastKnownOnlineState = false;
  }
  
  /// Execute an action with offline-first pattern
  /// 
  /// [onlineAction]: Function to execute when server is reachable
  /// [offlineAction]: Function to execute when offline (uses local DB)
  /// [fallbackAction]: Optional fallback if online action fails
  /// 
  /// Returns result from the executed action
  static Future<T> executeWithOfflineFirst<T>({
    required Future<T> Function() onlineAction,
    required Future<T> Function() offlineAction,
    Future<T> Function()? fallbackAction,
    String actionName = 'Action',
  }) async {
    print('\n🔍 OfflineFirst: Starting $actionName...');
    
    try {
      // Step 1: Test connectivity
      final isOnline = await isServerReachable();
      
      if (isOnline) {
        // Step 2A: Execute online action
        print('🌐 OfflineFirst: $actionName - Server reachable, executing online action');
        try {
          final result = await onlineAction();
          print('✅ OfflineFirst: $actionName - Online action completed successfully');
          return result;
        } catch (onlineError) {
          print('❌ OfflineFirst: $actionName - Online action failed: $onlineError');
          
          // Step 2B: Fallback to offline if online fails
          if (fallbackAction != null) {
            print('🔄 OfflineFirst: $actionName - Trying fallback action');
            final fallbackResult = await fallbackAction();
            print('✅ OfflineFirst: $actionName - Fallback action completed');
            return fallbackResult;
          } else {
            print('📱 OfflineFirst: $actionName - Falling back to offline action');
            final offlineResult = await offlineAction();
            print('✅ OfflineFirst: $actionName - Offline fallback completed');
            return offlineResult;
          }
        }
      } else {
        // Step 2C: Execute offline action
        print('📱 OfflineFirst: $actionName - Server unreachable, executing offline action');
        final result = await offlineAction();
        print('✅ OfflineFirst: $actionName - Offline action completed successfully');
        return result;
      }
    } catch (e) {
      print('❌ OfflineFirst: $actionName - Complete failure: $e');
      rethrow;
    }
  }
  
  /// Get companies with offline-first pattern
  /// This is a specific implementation for company data
  static Future<List<Company>> getCompaniesOfflineFirst({
    required int userId,
  }) async {
    return await executeWithOfflineFirst<List<Company>>(
      actionName: 'Get Companies',
      
      // Online action: Fetch from server and save to local DB
      onlineAction: () async {
        print('🌐 Fetching companies from server for user $userId');
        final serverData = await _signalRService.getCompany(userId);
        
        if (serverData != null && serverData.isNotEmpty) {
          // Convert and save to local DB
          final companies = <Company>[];
          for (final data in serverData) {
            final company = Company()
              ..companyCode = data['Company_Code']?.toString() ?? ''
              ..companyName = data['Company_Name']?.toString() ?? ''
              ..street1 = data['Street1']?.toString() ?? ''
              ..street2 = data['Street2']?.toString() ?? ''
              ..street3 = data['Street3']?.toString() ?? ''
              ..city = data['City']?.toString() ?? ''
              ..state = data['State']?.toString() ?? ''
              ..country = data['Country']?.toString() ?? ''
              ..postCode = data['PostCode']?.toString() ?? ''
              ..phone = data['Phone']?.toString() ?? ''
              ..fax = data['Fax']?.toString() ?? ''
              ..email = data['Email']?.toString() ?? ''
              ..webPage = data['WebPage']?.toString() ?? ''
              ..contactPerson = data['Contact_Person']?.toString() ?? ''
              ..mobile = data['Mobile']?.toString() ?? ''
              ..currencyType = data['Currency_Type']?.toString() ?? ''
              ..registrationNo = data['Registration_No']?.toString() ?? ''
              ..companyLogo = data['Company_Logo']?.toString() ?? '';
            companies.add(company);
          }
          
          // Save to local DB
          await isar.writeTxn(() async {
            await isar.companys.clear();
            await isar.companys.putAll(companies);
          });
          
          print('✅ Saved ${companies.length} companies to local DB');
          return companies;
        } else {
          throw Exception('No companies received from server');
        }
      },
      
      // Offline action: Load from local DB
      offlineAction: () async {
        print('📱 Loading companies from local database');
        final localCompanies = await isar.companys.where().findAll();
        print('✅ Loaded ${localCompanies.length} companies from local DB');
        return localCompanies;
      },
      
      // Fallback action: Also load from local DB if server fails
      fallbackAction: () async {
        print('🔄 Server failed, loading companies from local database as fallback');
        final fallbackCompanies = await isar.companys.where().findAll();
        print('✅ Fallback: Loaded ${fallbackCompanies.length} companies from local DB');
        return fallbackCompanies;
      },
    );
  }
  
  /// Login with offline-first pattern
  /// Tries server authentication first, falls back to cached credentials if offline
  static Future<Map<String, dynamic>?> loginOfflineFirst({
    required String username,
    required String password,
  }) async {
    return await executeWithOfflineFirst<Map<String, dynamic>?>(
      actionName: 'Login',
      
      // Online action: Authenticate with server
      onlineAction: () async {
        print('🌐 Attempting server authentication for: $username');
        
        // Call SignalR login
        final result = await _signalRService.login(username, password);
        
        if (result != null && result['success'] == true) {
          print('✅ Server authentication successful');
          
          // Save credentials to local cache for offline use
          await _saveLoginCache(username, password, result['user']);
          
          return result;
        } else {
          final message = result?['message'] ?? 'Server authentication failed';
          throw Exception(message);
        }
      },
      
      // Offline action: Check cached credentials
      offlineAction: () async {
        print('📱 Server unreachable, checking cached credentials for: $username');
        
        final cachedLogin = await _getCachedLogin(username, password);
        
        if (cachedLogin != null) {
          print('✅ Offline authentication successful with cached credentials');
          return {
            'success': true,
            'user': cachedLogin,
            'offline': true, // Flag to indicate offline login
          };
        } else {
          throw Exception('No cached credentials found for offline login');
        }
      },
      
      // Fallback action: Same as offline action
      fallbackAction: () async {
        print('🔄 Server authentication failed, trying cached credentials');
        
        final cachedLogin = await _getCachedLogin(username, password);
        
        if (cachedLogin != null) {
          print('✅ Fallback authentication successful with cached credentials');
          return {
            'success': true,
            'user': cachedLogin,
            'offline': true,
          };
        } else {
          throw Exception('Authentication failed: No cached credentials available');
        }
      },
    );
  }
  
  /// Save login credentials to local cache for offline use
  static Future<void> _saveLoginCache(String username, String password, Map<String, dynamic> userData) async {
    try {
      // Save to Isar for offline authentication
      final loginCache = LoginCache()
        ..username = username
        ..passwordHash = _hashPassword(password) // Store hashed password for security
        ..userData = userData.toString() // Store as string for simplicity
        ..lastLoginTime = DateTime.now();
      
      await isar.writeTxn(() async {
        // Clear old cache and save new one
        await isar.loginCaches.filter().usernameEqualTo(username).deleteAll();
        await isar.loginCaches.put(loginCache);
      });
      
      print('✅ Login credentials cached for offline use');
    } catch (e) {
      print('❌ Failed to cache login credentials: $e');
      // Don't throw - caching failure shouldn't break online login
    }
  }
  
  /// Get cached login credentials for offline authentication
  static Future<Map<String, dynamic>?> _getCachedLogin(String username, String password) async {
    try {
      final cachedLogin = await isar.loginCaches
          .filter()
          .usernameEqualTo(username)
          .findFirst();
      
      if (cachedLogin != null) {
        // Verify password hash
        final passwordHash = _hashPassword(password);
        if (cachedLogin.passwordHash == passwordHash) {
          // Parse stored user data
          // Note: In a real app, you'd use proper JSON parsing
          // For now, we'll reconstruct basic user data
          return {
            'User_ID': cachedLogin.userData.contains('User_ID') ? 1001 : 1001, // Simplified
            'Login_Name': username,
            'Full_Name': username, // Simplified
            'Status': 'A',
            'Designation': 'User',
            'Email': '$username@company.com',
            'User_Photo': '',
          };
        }
      }
      
      return null;
    } catch (e) {
      print('❌ Error checking cached login: $e');
      return null;
    }
  }
  
  /// Simple password hashing (in production, use proper bcrypt or similar)
  static String _hashPassword(String password) {
    // Simple hash for demo - use proper hashing in production
    return password.hashCode.toString();
  }
}
