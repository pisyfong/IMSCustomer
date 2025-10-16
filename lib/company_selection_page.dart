import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:isar/isar.dart';
import 'company.dart';
import 'main.dart'; // For global signalRService
import 'online_status_icon.dart';
import 'services/auth_service.dart';
import 'services/enhanced_sync_service.dart';
import 'services/signalr_service.dart';
import 'services/offline_first_service.dart';
import 'config/app_config.dart';
import 'dart:math' as math;
import 'pages/customer_selection_page.dart';
import 'pages/settings_page.dart';

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({Key? key}) : super(key: key);

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage> {
  bool _isOnline = false;
  bool _loading = false;
  String _searchQuery = '';
  String _userFullName = '';
  String? _error;
  String? _debugInfo;
  List<String> _debugMessages = []; // Accumulate debug messages
  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();
    _initIsarAndMaybeFetch();
    _loadUserInfo();
    _clearSelectedCompany();
    _setupRealTimeListenersWhenReady();
    _setupEnhancedSyncListener();
  }
  
  @override
  void dispose() {
    // Clean up any listeners if needed
    super.dispose();
  }
  
  /// Set up real-time listeners when SignalR connection is ready (offline-first)
  void _setupRealTimeListenersWhenReady() async {
    print('🔌 CompanySelectionPage: Setting up real-time listeners (offline-first approach)...');
    
    // First, check if we're likely online by testing connectivity quickly
    bool isLikelyOnline = false;
    try {
      isLikelyOnline = await OfflineFirstService.isServerReachable();
    } catch (e) {
      print('🔍 CompanySelectionPage: Connectivity check failed: $e');
      isLikelyOnline = false;
    }
    
    if (!isLikelyOnline) {
      print('📱 CompanySelectionPage: Offline detected - skipping SignalR setup, app ready immediately');
      print('📱 CompanySelectionPage: Real-time sync disabled, but app fully functional with cached data');
      
      // Try to reconnect in background without blocking the UI
      _retrySignalRConnectionInBackground();
      return; // Exit immediately - don't wait for SignalR
    }
    
    // We're online, so try to set up SignalR with a short timeout
    print('🌐 CompanySelectionPage: Online detected - attempting SignalR setup with 3s timeout...');
    
    int attempts = 0;
    const maxAttempts = 3; // Reduced to 3 seconds for online scenarios
    
    while (!signalRService.isConnected && attempts < maxAttempts) {
      await Future.delayed(Duration(seconds: 1));
      attempts++;
      print('🔌 CompanySelectionPage: Waiting for SignalR connection... (${attempts}s)');
    }
    
    if (signalRService.isConnected) {
      print('✅ CompanySelectionPage: SignalR connected, setting up real-time listeners...');
      _setupRealTimeListeners();
    } else {
      print('⚠️ CompanySelectionPage: SignalR connection timeout after ${maxAttempts}s, continuing without real-time updates');
      print('📱 CompanySelectionPage: App will work normally, but real-time sync is disabled');
      
      // Try to reconnect in background without blocking the UI
      _retrySignalRConnectionInBackground();
    }
  }
  
  /// Retry SignalR connection in background without blocking UI
  void _retrySignalRConnectionInBackground() {
    Future.delayed(Duration(seconds: 30), () async {
      if (mounted && !signalRService.isConnected) {
        print('🔄 CompanySelectionPage: Attempting background SignalR reconnection...');
        try {
          await signalRService.connect();
          if (signalRService.isConnected) {
            print('✅ CompanySelectionPage: Background reconnection successful, setting up listeners...');
            _setupRealTimeListeners();
          } else {
            print('❌ CompanySelectionPage: Background reconnection failed, will retry later');
            _retrySignalRConnectionInBackground(); // Retry again
          }
        } catch (e) {
          print('❌ CompanySelectionPage: Background reconnection error: $e');
          _retrySignalRConnectionInBackground(); // Retry again
        }
      }
    });
  }
  
  /// Set up Enhanced Sync listener to refresh UI when sync completes
  void _setupEnhancedSyncListener() {
    print('🔌 CompanySelectionPage: Setting up Enhanced Sync completion listener...');
    
    // Listen for Enhanced Sync completion to refresh UI
    enhancedSyncService.syncStatus.listen(
      (isSyncing) {
        if (!isSyncing) {
          // Sync completed, refresh UI with fresh data
          print('🔄 CompanySelectionPage: Enhanced Sync completed, refreshing UI...');
          Future.delayed(Duration(milliseconds: 500), () {
            _refreshCompaniesFromDatabase();
          });
        }
      },
      onError: (error) {
        print('❌ CompanySelectionPage: Error in sync status stream: $error');
      }
    );
    
    print('✅ CompanySelectionPage: Enhanced Sync listener set up successfully');
  }
  
  /// Set up real-time listeners for company changes
  void _setupRealTimeListeners() {
    print('🔌 CompanySelectionPage: Setting up real-time listeners...');
    
    // Listen for company changes from SignalR
    signalRService.companyChanged.listen(
      (changeData) {
        print('🔄 CompanySelectionPage: Received real-time company change, refreshing UI...');
        print('🔄 CompanySelectionPage: Change data: $changeData');
        // Add longer delay to ensure enhanced sync service completes database update first
        Future.delayed(Duration(milliseconds: 1000), () {
          _refreshCompaniesFromDatabase();
        });
      },
      onError: (error) {
        print('❌ CompanySelectionPage: Error in company change stream: $error');
      },
      onDone: () {
        print('🔌 CompanySelectionPage: Company change stream closed');
      }
    );
    
    print('✅ CompanySelectionPage: Real-time listeners set up successfully');
  }
  
  /// Refresh companies from local database (for real-time updates)
  Future<void> _refreshCompaniesFromDatabase() async {
    try {
      final updatedCompanies = await isar.companys.where().findAll();
      if (mounted) {
        setState(() {
          _companies = updatedCompanies;
          // Force a complete rebuild by updating a timestamp
          _debugInfo = 'Last updated: ${DateTime.now().toString().substring(11, 19)}';
        });
        print('✅ CompanySelectionPage: UI refreshed with ${updatedCompanies.length} companies');
        print('🔄 CompanySelectionPage: Company names: ${updatedCompanies.map((c) => c.companyName).join(", ")}');
        
        // Force widget tree rebuild
        await Future.delayed(Duration(milliseconds: 100));
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      print('❌ CompanySelectionPage: Error refreshing companies from database: $e');
    }
  }
  
  // Helper methods for debug message management
  void _addDebugMessage(String message) {
    setState(() {
      _debugMessages.add('${DateTime.now().toString().substring(11, 19)}: $message');
      _debugInfo = _debugMessages.join('\n');
    });
  }
  
  void _clearDebugMessages() {
    setState(() {
      _debugMessages.clear();
      _debugInfo = null;
    });
  }
  
  Future<void> _loadUserInfo() async {
    try {
      // Use the AuthService to get the current user's name
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      
      if (user != null && mounted) {
        setState(() {
          _userFullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error loading user info: $e');
    }
  }
  
  // Clear any previously selected company
  Future<void> _clearSelectedCompany() async {
    try {
      final authService = AuthService();
      await authService.clearSelectedCompany();
    } catch (e) {
      print('Error clearing selected company: $e');
    }
  }

  Future<void> _initIsarAndMaybeFetch() async {
    // Use offline-first pattern for initial load
    print('🚀 CompanySelectionPage: Initial load using offline-first pattern');
    
    try {
      // Get current user
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      
      if (user != null) {
        // Use offline-first service for consistent behavior
        final companies = await OfflineFirstService.getCompaniesOfflineFirst(
          userId: user.userId,
        );
        
        setState(() {
          _companies = companies;
          _loading = false;
        });
        
        // Update online status
        final isOnline = await OfflineFirstService.isServerReachable();
        setState(() {
          _isOnline = isOnline;
        });
        
        print('✅ Initial load completed: ${companies.length} companies (${isOnline ? "Online" : "Offline"})');
      } else {
        print('❌ No user found for initial load');
        setState(() {
          _loading = false;
          _error = 'No user logged in';
        });
      }
    } catch (e) {
      print('❌ Initial load failed: $e');
      
      // Fallback: Load whatever is in local DB
      try {
        final fallbackCompanies = await isar.companys.where().findAll();
        setState(() {
          _companies = fallbackCompanies;
          _loading = false;
          _isOnline = false;
          _error = fallbackCompanies.isEmpty ? 'No cached companies available' : null;
        });
        print('🔄 Initial load fallback: ${fallbackCompanies.length} companies from cache');
      } catch (fallbackError) {
        setState(() {
          _companies = [];
          _loading = false;
          _isOnline = false;
          _error = 'Failed to load companies: $e';
        });
        print('❌ Complete initial load failure');
      }
    }
  }

  Future<void> _fetchCompaniesFromServer() async {
    // This method handles the actual fetching from server (used by both page load and refresh)
    print('\n🔄 CompanySelectionPage: _fetchCompaniesFromServer() called');
    print('📱 Current loading state: $_loading');
    
    // Clear previous debug messages and start fresh
    _clearDebugMessages();
    
    setState(() { 
      _loading = true; 
      _error = null;
    });
    
    try {
      print('📡 CompanySelectionPage: About to call enhancedSyncService.syncCompaniesForUser()');
      print('🔗 SignalR connection status: ${signalRService.isConnected}');
      
      // Add debug info
      _addDebugMessage('🔄 Starting company sync...');
      _addDebugMessage('🔗 SignalR connected: ${signalRService.isConnected}');
      _addDebugMessage('📡 Calling enhancedSyncService.syncCompaniesForUser()');
      
      // If SignalR is not connected, add more debug info
      if (!signalRService.isConnected) {
        _addDebugMessage('⚠️ SignalR disconnected - will attempt reconnection');
      }
      
      // Use global enhanced sync service to fetch companies
      _addDebugMessage('🔄 About to call syncCompaniesForUser()...');
      
      try {
        // BYPASS enhanced sync service and test SignalR directly
        _addDebugMessage('🧪 Testing SignalR directly (bypassing enhanced sync)...');
        
        // Get current user
        final authService = AuthService();
        final user = await authService.loadSavedLogin();
        List<dynamic>? signalRResult;
        
        if (user != null) {
          _addDebugMessage('👤 User found: ${user.loginName} (ID: ${user.userId})');
          
          // Test SignalR connection directly
          if (!signalRService.isConnected) {
            _addDebugMessage('🔗 SignalR not connected, attempting direct connection...');
            try {
              await signalRService.connect();
              _addDebugMessage('🔗 Direct SignalR connection result: ${signalRService.isConnected}');
            } catch (connectError) {
              _addDebugMessage('🚨 Direct SignalR connection failed: ${connectError.toString()}');
            }
          }
          
          // Test getCompany directly
          if (signalRService.isConnected) {
            _addDebugMessage('📡 Calling signalRService.getCompany(${user.userId}) directly...');
            try {
              final result = await signalRService.getCompany(user.userId);
              _addDebugMessage('📥 Direct getCompany result: $result');
              _addDebugMessage('📊 Result type: ${result.runtimeType}');
              if (result != null && result is List) {
                _addDebugMessage('✅ Received ${result.length} companies directly from SignalR');
                signalRResult = result; // Store for later use
              }
            } catch (getCompanyError) {
              _addDebugMessage('🚨 Direct getCompany failed: ${getCompanyError.toString()}');
            }
          } else {
            _addDebugMessage('❌ SignalR still not connected after direct attempt');
          }
        } else {
          _addDebugMessage('❌ No user found for direct SignalR test');
        }
        
        // Now call the FIXED enhanced sync service
        _addDebugMessage('🔄 Calling FIXED enhanced sync service...');
        
        // Check companies in DB before sync
        final companiesBefore = await isar.companys.where().findAll();
        _addDebugMessage('📊 Companies in DB before sync: ${companiesBefore.length}');
        
        try {
          await enhancedSyncService.syncCompaniesForUser();
          _addDebugMessage('🏁 Enhanced sync completed successfully');
        } catch (enhancedSyncError) {
          _addDebugMessage('🚨 Enhanced sync FAILED: ${enhancedSyncError.toString()}');
          _addDebugMessage('🔄 Enhanced sync error type: ${enhancedSyncError.runtimeType}');
          // Don't rethrow - we want to see the debug info
        }
        
        // Check companies in DB after sync
        final companiesAfter = await isar.companys.where().findAll();
        _addDebugMessage('📊 Companies in DB after sync: ${companiesAfter.length}');
        
        if (companiesAfter.length > companiesBefore.length) {
          _addDebugMessage('✅ ${companiesAfter.length - companiesBefore.length} new companies saved to DB!');
          _addDebugMessage('🎉 FIXED enhanced sync service SUCCESS!');
        } else if (companiesAfter.length == companiesBefore.length && companiesAfter.length > 0) {
          _addDebugMessage('🔄 ${companiesAfter.length} companies updated in DB');
          _addDebugMessage('✅ FIXED enhanced sync service SUCCESS!');
        } else {
          _addDebugMessage('❌ Enhanced sync service still has issues');
        }
        
      } catch (syncError) {
        _addDebugMessage('🚨 Sync failed: ${syncError.toString()}');
        _addDebugMessage('🔄 Sync error type: ${syncError.runtimeType}');
        // Re-throw to trigger the existing error handling
        rethrow;
      }
      
      print('✅ CompanySelectionPage: enhancedSyncService.syncCompaniesForUser() completed successfully');
      
      // Add debug info
      _addDebugMessage('✅ Sync method completed successfully');
      _addDebugMessage('🔗 SignalR connected after sync: ${signalRService.isConnected}');
      _addDebugMessage('🔍 Checking local database...');
      
      // Reload companies from Isar after sync
      _companies = await isar.companys.where().findAll();
      
      // Add debug info with results
      _addDebugMessage('📊 Found ${_companies.length} companies in local DB');
      _addDebugMessage('✅ Sync completed successfully!');
      
      setState(() {
        _isOnline = true;
        _loading = false;
      });
    } catch (e) {
      print('Server sync failed: $e');
      print('Attempting to use local database as fallback...');
      
      // Add debug info about error
      _addDebugMessage('🚨 Sync failed: ${e.toString()}');
      _addDebugMessage('💾 Trying local database fallback...');
      
      // Fallback to local database when server sync fails
      try {
        _companies = await isar.companys.where().findAll();
        
        if (_companies.isNotEmpty) {
          print('Found ${_companies.length} companies in local database');
          _addDebugMessage('📊 Found ${_companies.length} companies in local DB');
          _addDebugMessage('🔄 Using offline mode');
          
          setState(() {
            _isOnline = false; // Mark as offline but data available
            _loading = false;
            _error = null; // Clear error since we have local data
          });
        } else {
          print('No companies found in local database');
          _addDebugMessage('❌ No companies found in local database');
          _addDebugMessage('🚨 No data available (online or offline)');
          
          setState(() { 
            _error = 'No internet connection and no local data available';
            _isOnline = false;
            _loading = false;
          });
        }
      } catch (localError) {
        print('Local database fallback also failed: $localError');
        _addDebugMessage('🚨 Local database fallback also failed: ${localError.toString()}');
        _addDebugMessage('❌ Both sync and local DB failed');
        
        setState(() { 
          _error = 'Failed to load companies from server and local database: ${e.toString()}';
          _isOnline = false;
          _loading = false;
        });
      }
    }
  }

  Future<void> checkOnlineStatus() async {
    setState(() { _loading = true; });
    try {
      // Check SignalR connection status instead of HTTP
      final isConnected = signalRService.isConnected;
      
      setState(() {
        _isOnline = isConnected;
        _loading = false;
      });
    } catch (_) {
      setState(() {
        _isOnline = false;
        _loading = false;
      });
    }
  }

  Future<void> _refreshCompanies() async {
    setState(() { 
      _loading = true; 
      _error = null;
      _debugInfo = 'Refreshing companies...';
    });
    
    try {
      // Get current user
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      
      if (user == null) {
        throw Exception('No user logged in');
      }
      
      // Use the new offline-first pattern
      final companies = await OfflineFirstService.getCompaniesOfflineFirst(
        userId: user.userId,
      );
      
      // Check online status separately
      final isOnline = await OfflineFirstService.isServerReachable();
      
      setState(() {
        _companies = companies;
        _loading = false;
        _isOnline = isOnline;
        _debugInfo = 'Refresh completed: ${companies.length} companies loaded (${isOnline ? "Online" : "Offline"})';
      });
      
      print('✅ Refresh completed successfully: ${companies.length} companies');
      
    } catch (e) {
      print('❌ Refresh failed: $e');
      
      // Final fallback: Load whatever is in local DB
      try {
        final fallbackCompanies = await isar.companys.where().findAll();
        setState(() {
          _companies = fallbackCompanies;
          _error = 'Refresh failed, showing ${fallbackCompanies.length} cached companies';
          _debugInfo = 'Error fallback: ${fallbackCompanies.length} companies from cache';
          _isOnline = false;
          _loading = false;
        });
        print('🔄 Refresh: Error fallback successful - ${fallbackCompanies.length} companies');
      } catch (fallbackError) {
        setState(() { 
          _error = 'Complete refresh failure: ${e.toString()}'; 
          _debugInfo = 'Complete failure: No cached data available';
          _isOnline = false;
          _loading = false;
          _companies = [];
        });
        print('❌ Refresh: Complete failure - no data available');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Colors.redAccent;
    final secondaryColor = Colors.redAccent.shade100;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Company',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
        ),
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            // Clear login data from Isar
            final authService = AuthService();
            await authService.logout();
            
            // Navigate to login screen
            if (mounted) {
              Navigator.of(context).pushReplacementNamed('/login');
            }
          },
          tooltip: 'Logout',
        ),
        actions: [
          OnlineStatusIcon(
            isOnline: _isOnline,
            onTap: checkOnlineStatus,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            tooltip: 'Sync Settings',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loading ? null : _refreshCompanies,
            tooltip: 'Refresh Companies',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Welcome message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
            color: Colors.white,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: _userFullName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Please select company message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
            color: Colors.white,
            child: Text(
              'Please select company',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          // Header section with search and info
          Container(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 16),
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search companies...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 18),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.grey[600], size: 18),
                              onPressed: () {
                                setState(() {
                                  _searchQuery = '';
                                });
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Error message if any
          if (_error != null)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[700], size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(color: Colors.red[700], fontSize: 12),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red[700], size: 16),
                    onPressed: () => setState(() => _error = null),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
          
          // Debug information text field (configurable)
          if (_debugInfo != null && AppConfig.showDebugInfo)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              height: 120, // Fixed height for scrollable area
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.bug_report, color: Colors.blue[700], size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Debug Information',
                          style: TextStyle(
                            color: Colors.blue[700], 
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => setState(() => _debugInfo = null),
                          child: Icon(Icons.close, color: Colors.blue[700], size: 16),
                        ),
                      ],
                    ),
                  ),
                  // Scrollable debug content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(12),
                      child: SelectableText(
                        _debugInfo!,
                        style: TextStyle(
                          color: Colors.grey[800], 
                          fontSize: 10,
                          fontFamily: 'monospace',
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
          // Company list
          Expanded(
            child: StreamBuilder<List<Company>>(
                stream: isar.companys.where().watch(fireImmediately: true),
                    builder: (context, snapshot) {
                      if (_loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Loading companies...',
                                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      final allCompanies = snapshot.data ?? [];
                      
                      // Filter companies based on search query
                      final companies = _searchQuery.isEmpty
                          ? allCompanies
                          : allCompanies.where((company) {
                              return company.companyName.toLowerCase().contains(_searchQuery);
                            }).toList();
                      
                      if (allCompanies.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.business_center, size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 12),
                              Text(
                                'No companies found',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton.icon(
                                onPressed: _refreshCompanies,
                                icon: const Icon(Icons.refresh),
                                label: const Text('Refresh'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      // Show "no search results" message if search query exists but no matches
                      if (companies.isEmpty && _searchQuery.isNotEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 12),
                              Text(
                                'No companies match "$_searchQuery"',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try a different search term',
                                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _searchQuery = '';
                                  });
                                },
                                icon: const Icon(Icons.clear),
                                label: const Text('Clear Search'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: ListView.builder(
                          itemCount: companies.length,
                          itemBuilder: (context, index) {
                            final company = companies[index];
                            final hasLogo = company.companyLogo != null && company.companyLogo!.isNotEmpty;
                            final nameInitial = company.companyName.isNotEmpty ? company.companyName[0].toUpperCase() : '?';
                            final hasLocation = [company.city, company.state, company.country].any((e) => e != null && e.isNotEmpty);
                            
                            // Generate a consistent color based on company name
                            final nameHash = company.companyName.hashCode;
                            final hue = (nameHash % 360).abs().toDouble();
                            final avatarColor = HSLColor.fromAHSL(1.0, hue, 0.6, 0.8).toColor();
                            
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.04),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () async {
                                    // Save selected company to Isar
                                    try {
                                      final authService = AuthService();
                                      await authService.saveSelectedCompany({
                                        'companyId': company.companyCode,
                                        'companyName': company.companyName,
                                        'companyCode': company.companyCode,
                                      });
                                    } catch (e) {
                                      print('Error saving selected company: $e');
                                    }
                                    // Navigate directly to Sales Quotation customer selection
                                    if (!mounted) return;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CustomerSelectionPage(
                                          selectedCompany: {
                                            'companyId': company.companyCode,
                                            'companyName': company.companyName,
                                            'companyCode': company.companyCode,
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        // Company logo or avatar
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: hasLogo ? Colors.transparent : avatarColor,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.grey.shade200),
                                          ),
                                          child: hasLogo
                                              ? ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: Image.network(
                                                    company.companyLogo!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (_, __, ___) => Center(
                                                      child: Text(
                                                        nameInitial,
                                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(
                                                    nameInitial,
                                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                ),
                                        ),
                                        const SizedBox(width: 12),
                                        
                                        // Company information
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                company.companyName,
                                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius: BorderRadius.circular(4),
                                                      border: Border.all(color: Colors.grey.shade300),
                                                    ),
                                                    child: Text(
                                                      company.companyCode,
                                                      style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                                                    ),
                                                  ),
                                                  if (company.registrationNo != null && company.registrationNo!.isNotEmpty) ...[  
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      'Reg: ${company.registrationNo}',
                                                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                              if (hasLocation) ...[  
                                                const SizedBox(height: 2),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                                                    const SizedBox(width: 4),
                                                    Expanded(
                                                      child: Text(
                                                        [company.city, company.state, company.country]
                                                            .where((e) => e != null && e.isNotEmpty)
                                                            .join(', '),
                                                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        
                                        // Selection indicator
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
          
          // Footer with version info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Center(
              child: Text(
                'IMS Customer Portal v1.0.0',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

