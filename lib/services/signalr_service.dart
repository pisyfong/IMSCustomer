import 'dart:async';
import 'dart:convert';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

/// SignalR service for real-time communication with the IMS Customer API
class SignalRService {
  // Use dynamic URL from configuration
  static String get _hubUrl => AppConfig.signalRUrl;
  
  HubConnection? _hubConnection;
  bool _isConnected = false;
  bool _isConnecting = false; // Prevent concurrent connection attempts
  
  // Stream controllers for real-time events
  final StreamController<bool> _connectionStateController = StreamController<bool>.broadcast();
  final StreamController<Map<String, dynamic>> _customerCreatedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _customerUpdatedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<String> _customerDeletedController = StreamController<String>.broadcast();
  
  // Stream controllers for real-time database changes
  final StreamController<Map<String, dynamic>> _companyChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _customerChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _inventoryChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _quotationChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _invoiceChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _pluChangedController = StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _customerPluChangedController = StreamController<Map<String, dynamic>>.broadcast();
  
  // Getters for streams
  Stream<bool> get connectionState => _connectionStateController.stream;
  Stream<Map<String, dynamic>> get customerCreated => _customerCreatedController.stream;
  Stream<Map<String, dynamic>> get customerUpdated => _customerUpdatedController.stream;
  Stream<String> get customerDeleted => _customerDeletedController.stream;
  
  // Getters for real-time change streams
  Stream<Map<String, dynamic>> get companyChanged => _companyChangedController.stream;
  Stream<Map<String, dynamic>> get customerChanged => _customerChangedController.stream;
  Stream<Map<String, dynamic>> get inventoryChanged => _inventoryChangedController.stream;
  Stream<Map<String, dynamic>> get quotationChanged => _quotationChangedController.stream;
  Stream<Map<String, dynamic>> get invoiceChanged => _invoiceChangedController.stream;
  Stream<Map<String, dynamic>> get pluChanged => _pluChangedController.stream;
  Stream<Map<String, dynamic>> get customerPluChanged => _customerPluChangedController.stream;
  
  bool get isConnected {
    // Direct check of hub connection state instead of relying on our flag
    if (_hubConnection == null) return false;
    
    // Check if the hub connection is actually connected
    // Note: signalr_netcore doesn't expose connection state directly,
    // so we'll use our flag but with additional validation
    return _isConnected && _hubConnection != null;
  }
  
  /// Force update connection state - for debugging
  void forceConnectionState(bool connected) {
    print('SignalR: Forcing connection state to $connected');
    _isConnected = connected;
    _connectionStateController.add(connected);
  }
  

  
  // Connection promise to handle multiple simultaneous connection attempts
  Future<void>? _connectionPromise;
  
  /// Initialize SignalR connection with improved concurrency control
  Future<void> connect() async {
    print('\n=== SignalR Connect Method Called ===');
    print('Current connection state: $_isConnected');
    print('Hub connection exists: ${_hubConnection != null}');
    print('Is connecting: $_isConnecting');
    
    // If already connected, return immediately
    if (_isConnected && _hubConnection != null) {
      print('✅ Already connected, skipping connection attempt');
      return;
    }
    
    // If there's already a connection attempt in progress, wait for it
    if (_connectionPromise != null) {
      print('🔄 SignalR: Connection already in progress, joining existing attempt...');
      try {
        await _connectionPromise;
        print('✅ SignalR: Joined existing connection attempt successfully');
        return;
      } catch (e) {
        print('⚠️ SignalR: Existing connection attempt failed: $e');
        // Continue with new connection attempt
      }
    }
    
    // Start new connection attempt
    _connectionPromise = _performConnection();
    
    try {
      await _connectionPromise;
      print('✅ SignalR: New connection attempt completed successfully');
    } catch (e) {
      print('❌ SignalR: New connection attempt failed: $e');
      rethrow;
    } finally {
      _connectionPromise = null;
    }
  }
  
  /// Perform the actual connection (internal method)
  Future<void> _performConnection() async {
    
    try {
      print('🔗 SignalR: Starting connection to: $_hubUrl');
      
      // Set connecting flag to prevent concurrent attempts
      _isConnecting = true;
      
      // Clean up existing connection
      if (_hubConnection != null) {
        print('Cleaning up existing connection...');
        try {
          await _hubConnection!.stop();
        } catch (e) {
          print('Error stopping existing connection: $e');
        }
        _hubConnection = null;
      }
      
      // Reset connection state
      _isConnected = false;
      _connectionStateController.add(false);
      
      print('Creating new hub connection...');
      // Create hub connection
      _hubConnection = HubConnectionBuilder()
          .withUrl(_hubUrl)
          .build();
      
      print('Setting up event listeners...');
      // Set up event listeners
      _setupEventListeners();
      
      print('Starting SignalR connection...');
      // Start connection and wait for it to complete
      await _hubConnection!.start();
      
      // Check connection state immediately after start
      final connectionState = _hubConnection!.state;
      print('Connection state after start: $connectionState');
      
      if (connectionState == HubConnectionState.Connected) {
        _isConnected = true;
        _connectionStateController.add(true);
        print('✅ SignalR: Connected successfully!');
        print('Connection URL: $_hubUrl');
        print('Connection state: $_isConnected');
      } else {
        _isConnected = false;
        _connectionStateController.add(false);
        print('❌ SignalR: Connection failed - State: $connectionState');
        throw Exception('SignalR connection failed - State: $connectionState');
      }
      
      print('=== SignalR Connect Method Completed Successfully ===\n');
      
    } catch (e) {
      print('\n❌ SignalR Connection Exception:');
      print('Error type: ${e.runtimeType}');
      print('Error message: $e');
      print('Hub URL: $_hubUrl');
      
      _isConnected = false;
      _connectionStateController.add(false);
      
      if (_hubConnection != null) {
        try {
          await _hubConnection!.stop();
        } catch (stopError) {
          print('Error stopping connection after failure: $stopError');
        }
        _hubConnection = null;
      }
      
      print('=== SignalR Connect Method Failed ===\n');
      throw Exception('SignalR connection failed: ${e.toString()}');
    } finally {
      // Always reset connecting flag
      _isConnecting = false;
      print('SignalR: Connection attempt completed, _isConnecting = false');
    }
  }
  
  /// Set up SignalR event listeners
  void _setupEventListeners() {
    if (_hubConnection == null) return;
    
    // Listen for customer created events
    _hubConnection!.on('CustomerCreated', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final customerData = arguments[0] as Map<String, dynamic>;
        print('SignalR: Customer created - ${customerData['name']}');
        _customerCreatedController.add(customerData);
      }
    });
    
    // Listen for customer updated events
    _hubConnection!.on('CustomerUpdated', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final customerData = arguments[0] as Map<String, dynamic>;
        print('SignalR: Customer updated - ${customerData['name']}');
        _customerUpdatedController.add(customerData);
      }
    });
    
    // Listen for customer deleted events
    _hubConnection!.on('CustomerDeleted', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final customerCode = arguments[0] as String;
        print('SignalR: Customer deleted - $customerCode');
        _customerDeletedController.add(customerCode);
      }
    });
    
    // Listen for real-time company changes
    _hubConnection!.on('CompanyChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('📡 SignalR: Company ${changeData['changeType']} - ${changeData['companyData']?['Company_Name']}');
        print('📡 SignalR: Full change data: $changeData');
        _companyChangedController.add(changeData);
      }
    });
    
    // Listen for real-time customer changes
    _hubConnection!.on('customerChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('SignalR: Customer ${changeData['changeType']} - ${changeData['data']?['Code']}');
        _customerChangedController.add(changeData);
      }
    });
    
    // Listen for inventory changes
    _hubConnection!.on('inventoryChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('📦 SignalR: Inventory ${changeData['changeType']} - SKU ${changeData['data']?['SKU_No']}');
        _inventoryChangedController.add(changeData);
      }
    });
    
    // Listen for quotation changes
    _hubConnection!.on('quotationChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('📝 SignalR: Quotation ${changeData['changeType']} - ${changeData['data']?['Quote_PreLabel']}');
        _quotationChangedController.add(changeData);
      }
    });
    
    // Listen for invoice changes
    _hubConnection!.on('invoiceChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('🧾 SignalR: Invoice ${changeData['changeType']} - ${changeData['data']?['Invoice_PreLabel']}');
        _invoiceChangedController.add(changeData);
      }
    });
    
    // Listen for PLU changes
    _hubConnection!.on('pluChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('🏷️ SignalR: PLU ${changeData['changeType']} - SKU ${changeData['data']?['SKU_No']}');
        _pluChangedController.add(changeData);
      }
    });
    
    // Listen for customer PLU changes
    _hubConnection!.on('customerPluChanged', (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final changeData = arguments[0] as Map<String, dynamic>;
        print('🏷️ SignalR: Customer PLU ${changeData['changeType']} - Customer ${changeData['data']?['Customer_Code']} SKU ${changeData['data']?['SKU_No']}');
        _customerPluChangedController.add(changeData);
      }
    });
    
    // Connection state events - these might be overriding our connection state
    _hubConnection!.onclose(({Exception? error}) {
      print('SignalR: Connection closed - $error');
      _isConnected = false;
      _connectionStateController.add(false);
    });
    
    _hubConnection!.onreconnecting(({Exception? error}) {
      print('SignalR: Reconnecting - $error');
      _isConnected = false;
      _connectionStateController.add(false);
    });
    
    _hubConnection!.onreconnected(({String? connectionId}) {
      print('SignalR: Reconnected - $connectionId');
      _isConnected = true;
      _connectionStateController.add(true);
    });
  }
  
  /// Disconnect from SignalR hub
  Future<void> disconnect() async {
    if (_hubConnection != null) {
      await _hubConnection!.stop();
      _isConnected = false;
      _connectionStateController.add(false);
      print('SignalR: Disconnected');
    }
  }
  
  /// Login via SignalR with HTTP fallback
  Future<Map<String, dynamic>?> login(String username, String password) async {
    print('\n=== CLIENT Login Attempt ===');
    print('Timestamp: ${DateTime.now().toIso8601String()}');
    print('Username: $username');
    print('Password: ${password.isNotEmpty ? '[PRESENT]' : '[MISSING]'}');
    
    // Try SignalR login first
    if (_hubConnection != null && _isConnected) {
      print('Attempting SignalR login...');
      try {
        final credentials = {
          'username': username,
          'password': password,
        };
        
        print('Calling SignalR invoke method...');
        final result = await _hubConnection!.invoke('login', args: [credentials]);
        
        print('SignalR login result: $result');
        
        if (result is Map<String, dynamic>) {
          if (result['success'] == true) {
            print('✅ SIGNALR LOGIN SUCCESS');
            return result;
          } else {
            print('❌ SIGNALR LOGIN FAILED: ${result['message']}');
            return result;
          }
        }
      } catch (e) {
        print('❌ SignalR login failed: $e');
        print('Falling back to HTTP login...');
      }
    } else {
      print('SignalR not connected, using HTTP login directly...');
    }
    
    // Fallback to HTTP-based login
    return await _httpLogin(username, password);
  }
  
  /// HTTP-based login as fallback
  Future<Map<String, dynamic>?> _httpLogin(String username, String password) async {
    try {
      print('\n=== HTTP Login Attempt ===');
      
      final url = Uri.parse('$_hubUrl/login');
      print('Login URL: $url');
      
      final requestBody = {
        'username': username,
        'password': password,
      };
      
      print('Sending HTTP POST request...');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(requestBody),
      );
      
      print('HTTP Response status: ${response.statusCode}');
      print('HTTP Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print('Parsed HTTP response: $result');
        
        if (result is Map<String, dynamic>) {
          if (result['result'] != null) {
            // Extract result from server response
            final loginResult = result['result'] as Map<String, dynamic>;
            if (loginResult['success'] == true) {
              print('✅ HTTP LOGIN SUCCESS');
              return loginResult;
            } else {
              print('❌ HTTP LOGIN FAILED: ${loginResult['message']}');
              return loginResult;
            }
          }
        }
      }
      
      print('❌ HTTP login failed with status ${response.statusCode}');
      return {
        'success': false,
        'message': 'HTTP login failed: ${response.statusCode}'
      };
      
    } catch (e) {
      print('❌ HTTP LOGIN EXCEPTION: $e');
      return {
        'success': false,
        'message': 'HTTP login exception: ${e.toString()}'
      };
    }
  }
  

  
  /// Get customers via SignalR
  Future<List<Map<String, dynamic>>?> getCustomers({int page = 1, int limit = 50}) async {
    if (!_isConnected) {
      print('SignalR: Not connected, cannot get customers');
      return null;
    }
    
    try {
      final result = await _hubConnection!.invoke('getCustomers', args: [
        {'page': page, 'limit': limit}
      ]);
      
      if (result is List) {
        return List<Map<String, dynamic>>.from(result);
      } else if (result is Map && result['data'] is List) {
        return List<Map<String, dynamic>>.from(result['data']);
      }
      
      return null;
    } catch (e) {
      print('SignalR: Get customers failed - $e');
      return null;
    }
  }
  
  /// Update customer via SignalR
  Future<Map<String, dynamic>?> updateCustomer(Map<String, dynamic> customerData) async {
    if (!_isConnected) {
      print('SignalR: Not connected, cannot update customer');
      return null;
    }
    
    try {
      final result = await _hubConnection!.invoke('updateCustomer', args: [customerData]);
      return result as Map<String, dynamic>?;
    } catch (e) {
      print('SignalR: Update customer failed - $e');
      return null;
    }
  }
  
  /// Get companies for user via SignalR
  Future<List<Map<String, dynamic>>?> getCompany(int userId) async {
    print('\n🔍 SignalR: getCompany() called for user: $userId');
    
    if (_hubConnection == null) {
      print('❌ SignalR: No hub connection available for getCompany');
      throw Exception('SignalR: No hub connection available');
    }
    
    if (!_isConnected) {
      print('❌ SignalR: Connection not established');
      throw Exception('SignalR: Connection not established');
    }
    
    try {
      print('📡 SignalR: Invoking getCompany method on server...');
      print('🔗 SignalR: Connection state: $_isConnected');
      print('🔌 SignalR: HubConnection null check: ${_hubConnection != null}');
      print('🎯 SignalR: About to call _hubConnection.invoke("getCompany", args: [$userId])');
      
      final result;
      try {
        result = await _hubConnection!.invoke('getCompany', args: [userId]);
        print('🎉 SignalR: invoke() call completed successfully');
      } catch (invokeError) {
        print('🚨 SignalR: invoke() call failed with error: $invokeError');
        print('🚨 SignalR: invoke() error type: ${invokeError.runtimeType}');
        rethrow;
      }
      
      print('📥 SignalR: Raw result received: $result');
      print('📊 SignalR: Result type: ${result.runtimeType}');
      
      if (result == null) {
        print('⚠️ SignalR: Server returned null');
        throw Exception('Server returned null response');
      }
      
      if (result is List) {
        print('✅ SignalR: Received List with ${result.length} items');
        return List<Map<String, dynamic>>.from(result);
      } else if (result is Map<String, dynamic>) {
        print('✅ SignalR: Received single Map, wrapping in List');
        return [result]; // Single company wrapped in array
      } else {
        print('❌ SignalR: Unexpected result type: ${result.runtimeType}');
        throw Exception('Unexpected result type: ${result.runtimeType}');
      }
    } catch (e) {
      print('🚨 SignalR: getCompany failed with error: $e');
      print('🚨 SignalR: Error type: ${e.runtimeType}');
      rethrow; // Re-throw so enhanced sync service can handle it
    }
  }
  
  /// Generic invoke method for SignalR hub methods
  Future<dynamic> invoke(String methodName, List<dynamic> args) async {
    // Invoking SignalR method: $methodName
    
    if (_hubConnection == null) {
      print('❌ SignalR: No hub connection available for $methodName');
      throw Exception('SignalR: No hub connection available');
    }
    
    if (!_isConnected) {
      print('❌ SignalR: Connection not established');
      throw Exception('SignalR: Connection not established');
    }
    
    try {
      // Invoking $methodName on server
      final result = await _hubConnection!.invoke(methodName, args: args.cast<Object>());
      
      return result;
    } catch (e) {
      print('🚨 SignalR: $methodName failed with error: $e');
      print('🚨 SignalR: Error type: ${e.runtimeType}');
      rethrow;
    }
  }

  /// Get user roles via SignalR with HTTP fallback
  Future<List<Map<String, dynamic>>?> getUserRoles() async {
    print('\n🔍 SignalR: getUserRoles() called');
    
    // Try SignalR first
    if (_isConnected) {
      try {
        print('📡 SignalR: Invoking getUserRoles method on server...');
        final result = await _hubConnection!.invoke('getUserRoles');
        
        print('📥 SignalR: getUserRoles result: $result');
        print('📊 SignalR: Result type: ${result.runtimeType}');
        
        if (result is List) {
          print('✅ SignalR: Received ${result.length} user roles');
          return List<Map<String, dynamic>>.from(result);
        } else if (result is Map && result['data'] is List) {
          final roles = List<Map<String, dynamic>>.from(result['data']);
          print('✅ SignalR: Received ${roles.length} user roles from data field');
          return roles;
        }
        
        print('⚠️ SignalR: Unexpected getUserRoles result format');
        return [];
      } catch (e) {
        print('🚨 SignalR: getUserRoles failed - $e, trying HTTP fallback...');
      }
    } else {
      print('❌ SignalR: Not connected, trying HTTP fallback...');
    }
    
    // HTTP fallback
    return await _getUserRolesHttp();
  }

  /// HTTP fallback for getUserRoles
  Future<List<Map<String, dynamic>>?> _getUserRolesHttp() async {
    try {
      print('🌐 HTTP: Fetching user roles from PI_User_Role...');
      
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/user-roles');
      print('📡 HTTP: GET $url');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      
      print('📥 HTTP: getUserRoles status: ${response.statusCode}');
      print('📥 HTTP: getUserRoles body: ${response.body}');
      
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        
        if (result is List) {
          print('✅ HTTP: Received ${result.length} user roles');
          return List<Map<String, dynamic>>.from(result);
        } else if (result is Map && result['data'] is List) {
          final roles = List<Map<String, dynamic>>.from(result['data']);
          print('✅ HTTP: Received ${roles.length} user roles from data field');
          return roles;
        }
        
        print('⚠️ HTTP: Unexpected getUserRoles result format');
        return [];
      } else {
        print('❌ HTTP: getUserRoles failed with status ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('🚨 HTTP: getUserRoles exception - $e');
      return null;
    }
  }

  /// Get user-customer mappings via SignalR with HTTP fallback
  Future<List<Map<String, dynamic>>?> getUserCustomers({int? roleId, int? companyCode}) async {
    print('\n🔍 SignalR: getUserCustomers() called with roleId: $roleId, companyCode: $companyCode');
    
    // Try SignalR first
    if (_isConnected) {
      try {
        print('📡 SignalR: Invoking getUserCustomers method on server...');
        
        // Build parameters object
        final params = <String, dynamic>{};
        if (roleId != null) params['roleId'] = roleId;
        if (companyCode != null) params['companyCode'] = companyCode;
        
        final result = await _hubConnection!.invoke('getUserCustomers', args: [params]);
        
        print('📥 SignalR: getUserCustomers result: $result');
        print('📊 SignalR: Result type: ${result.runtimeType}');
        
        if (result is List) {
          print('✅ SignalR: Received ${result.length} user-customer mappings');
          return List<Map<String, dynamic>>.from(result);
        } else if (result is Map && result['data'] is List) {
          final mappings = List<Map<String, dynamic>>.from(result['data']);
          print('✅ SignalR: Received ${mappings.length} user-customer mappings from data field');
          return mappings;
        }
        
        print('⚠️ SignalR: Unexpected getUserCustomers result format');
        return [];
      } catch (e) {
        print('🚨 SignalR: getUserCustomers failed - $e, trying HTTP fallback...');
      }
    } else {
      print('❌ SignalR: Not connected, trying HTTP fallback...');
    }
    
    // HTTP fallback
    return await _getUserCustomersHttp(roleId: roleId, companyCode: companyCode);
  }

  /// HTTP fallback for getUserCustomers
  Future<List<Map<String, dynamic>>?> _getUserCustomersHttp({int? roleId, int? companyCode}) async {
    try {
      print('🌐 HTTP: Fetching user-customer mappings from PI_User_Customer...');
      
      // Use AppConfig for the API URL
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/user-customers');
      print('📡 HTTP: GET $url');
      
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          print('⏱️ HTTP: getUserCustomers request timed out after 10 seconds');
          throw TimeoutException('Request timed out');
        },
      );
      
      print('📥 HTTP: getUserCustomers status: ${response.statusCode}');
      print('📥 HTTP: getUserCustomers body length: ${response.body.length} chars');
      
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        
        if (result is List) {
          print('✅ HTTP: Received ${result.length} user-customer mappings');
          return List<Map<String, dynamic>>.from(result);
        } else if (result is Map && result['data'] is List) {
          final mappings = List<Map<String, dynamic>>.from(result['data']);
          print('✅ HTTP: Received ${mappings.length} user-customer mappings from data field');
          return mappings;
        }
        
        print('⚠️ HTTP: Unexpected getUserCustomers result format');
        return [];
      } else {
        print('❌ HTTP: getUserCustomers failed with status ${response.statusCode}');
        return null;
      }
    } on TimeoutException catch (e) {
      print('⏱️ HTTP: getUserCustomers timed out - $e');
      return null;
    } catch (e) {
      print('🚨 HTTP: getUserCustomers exception - $e');
      return null;
    }
  }

  /// Request full sync via SignalR
  Future<List<Map<String, dynamic>>?> requestFullSync() async {
    if (!_isConnected) {
      print('SignalR: Not connected, cannot request full sync');
      return null;
    }
    
    try {
      final result = await _hubConnection!.invoke('fullSync');
      
      if (result is List) {
        return List<Map<String, dynamic>>.from(result);
      } else if (result is Map && result['customers'] is List) {
        return List<Map<String, dynamic>>.from(result['customers']);
      }
      
      return null;
    } catch (e) {
      print('SignalR: Full sync failed - $e');
      return null;
    }
  }
  
  /// Dispose resources
  void dispose() {
    _connectionStateController.close();
    _customerCreatedController.close();
    _customerUpdatedController.close();
    _customerDeletedController.close();
    _companyChangedController.close();
    _customerChangedController.close();
    disconnect();
  }
}
