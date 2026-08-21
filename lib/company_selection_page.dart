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
import 'services/invoice_service.dart';
import 'config/app_config.dart';
import 'dart:math' as math;
import 'pages/customer_selection_page.dart';
import 'pages/settings_page.dart';
import 'pages/pending_uploads_page.dart';
import 'widgets/app_nav_drawer.dart';
import 'models/quotation.dart';

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({Key? key}) : super(key: key);

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage>
    with RouteAware {
  bool _isOnline = false;
  bool _loading = false;
  String _searchQuery = '';
  String _userFullName = '';
  String? _error;
  String? _debugInfo;
  List<String> _debugMessages = []; // Accumulate debug messages
  List<Company> _companies = [];
  int _pendingUploadsCount = 0;
  bool _navigating = false; // one-shot guard for auto-forward / tap

  /// Save the company and open the ordering (customer selection) flow.
  /// Guarded so the single-company auto-forward can't double-fire.
  Future<void> _selectAndOpen(Company company) async {
    if (_navigating) return;
    _navigating = true;
    try {
      final authService = AuthService();
      await authService.saveSelectedCompany({
        'companyId': company.companyCode,
        'companyName': company.companyName,
        'companyCode': company.companyCode,
      });
      print('🔄 Company selected: ${company.companyName} (${company.companyCode})');
      final invoiceService = InvoiceService(signalRService);
      final companyCodeInt = int.tryParse(company.companyCode) ?? 0;
      if (companyCodeInt > 0) {
        invoiceService.syncNewInvoices(companyCodeInt).then((result) {
          print('✅ Incremental invoice sync completed for company ${company.companyCode}');
        }).catchError((e) {
          print('⚠️ Incremental invoice sync failed: $e');
        });
      }
    } catch (e) {
      print('Error saving selected company: $e');
    }
    if (!mounted) {
      _navigating = false;
      return;
    }
    await Navigator.push(
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
    // Allow re-entry after returning (e.g. user backs out of customer page).
    _navigating = false;
  }

  @override
  void initState() {
    super.initState();
    _initIsarAndMaybeFetch();
    _loadUserInfo();
    _clearSelectedCompany();
    _setupRealTimeListenersWhenReady();
    _setupEnhancedSyncListener();
    _refreshPendingUploadsCount();
  }

  /// Counts unsynced (offline-created) quotations and updates the badge
  /// shown on the Pending Uploads button.
  Future<void> _refreshPendingUploadsCount() async {
    try {
      final count = await isar.quotations
          .filter()
          .isSyncedEqualTo(false)
          .count();
      if (mounted) {
        setState(() => _pendingUploadsCount = count);
      }
    } catch (_) {
      // Best-effort badge — stay silent on failure.
    }
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  /// Refresh the pending-uploads badge whenever this page becomes visible
  /// (initial push, or returning from any pushed route).
  @override
  void didPush() => _refreshPendingUploadsCount();

  @override
  void didPopNext() => _refreshPendingUploadsCount();
  
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
          await signalRService.connect().timeout(
            const Duration(seconds: 3),
            onTimeout: () {
              print('⏱️ CompanySelectionPage: Background reconnection timed out after 3s');
            },
          );
          if (signalRService.isConnected) {
            print('✅ CompanySelectionPage: Background reconnection successful, setting up listeners...');
            _setupRealTimeListeners();
          } else {
            print('⚠️ CompanySelectionPage: Background reconnection failed');
          }
        } catch (e) {
          print('⚠️ CompanySelectionPage: Background reconnection failed: $e');
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
    // OFFLINE-FIRST page load.
    // 1. Read whatever is in local Isar and paint immediately — never wait
    //    on the network for the first frame.
    // 2. Kick off a background server refresh (fire-and-forget). When it
    //    finishes, the existing isar.companys.where().watch() stream
    //    listener at the StreamBuilder updates the list automatically.
    // 3. Connectivity probe runs in parallel, also non-blocking.
    print('🚀 CompanySelectionPage: Initial load (offline-first, paint-then-refresh)');

    // ── Step 1: paint local cache instantly ──
    try {
      final localCompanies = await isar.companys.where().findAll();
      if (mounted) {
        setState(() {
          _companies = localCompanies;
          _loading = false;
          _error = null;
        });
      }
      print('📱 Painted ${localCompanies.length} companies from local cache');

      // Skip the picker and go straight into Ordering when:
      //   1. a company is already selected (saved), or
      //   2. there's only one company to choose from.
      final saved = await AuthService().getSelectedCompany();
      final savedCode = saved?['companyCode']?.toString();
      Company? target;
      if (savedCode != null && savedCode.isNotEmpty) {
        for (final c in localCompanies) {
          if (c.companyCode == savedCode) {
            target = c;
            break;
          }
        }
      }
      target ??= localCompanies.length == 1 ? localCompanies.first : null;

      if (target != null) {
        final t = target;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _selectAndOpen(t);
        });
      }
    } catch (e) {
      // Even local read failed — keep loading state so the user knows
      // something is happening, but don't hang.
      print('❌ Local read failed: $e');
    }

    // ── Step 2 & 3: background refresh + connectivity probe (fire-and-forget) ──
    // Errors are swallowed; UI never sees them.
    // Skip the network attempt entirely if cached connectivity already says
    // we're offline — no point firing connect/timeout cycles that just spam
    // the log when the user is testing offline mode.
    if (!OfflineFirstService.isLikelyOnline()) {
      print('🔁 Background init: offline (cached) — skipping server probe');
      if (mounted) setState(() => _isOnline = false);
      return;
    }

    // ignore: unawaited_futures
    () async {
      try {
        final authService = AuthService();
        final user = await authService.loadSavedLogin();
        if (user == null) return;
        // Connectivity probe — no UI block, no exception bubbling.
        try {
          final isOnline = await OfflineFirstService.isServerReachable();
          if (mounted) setState(() => _isOnline = isOnline);
        } catch (_) {}
        // Fetch companies; OfflineFirstService writes them to Isar internally,
        // and the page's StreamBuilder picks up the change.
        try {
          await OfflineFirstService.getCompaniesOfflineFirst(userId: user.userId);
        } catch (e) {
          print('🔁 Background company refresh failed (cache preserved): $e');
        }
      } catch (e) {
        print('🔁 Background init step skipped: $e');
      }
    }();
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
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: const AppNavDrawer(current: AppSection.ordering),
      body: SafeArea(
        child: Column(
          children: [
            // Compact Header
            _buildCompactHeader(),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search companies...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? GestureDetector(
                            onTap: () => setState(() => _searchQuery = ''),
                            child: Icon(Icons.close, color: Colors.grey.shade400, size: 18),
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
            ),
            
            // Error message
            if (_error != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red.shade600, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _error!,
                          style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _error = null),
                        child: Icon(Icons.close, color: Colors.red.shade400, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
            
            // Debug information (configurable)
            if (_debugInfo != null && AppConfig.showDebugInfo)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.bug_report, color: Colors.blue.shade600, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _debugInfo!,
                          style: TextStyle(color: Colors.blue.shade700, fontSize: 10),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _debugInfo = null),
                        child: Icon(Icons.close, color: Colors.blue.shade400, size: 16),
                      ),
                    ],
                  ),
                ),
              ),
            
            // Company list
            Expanded(
              child: StreamBuilder<List<Company>>(
                  stream: isar.companys.where().watch(fireImmediately: true),
                  builder: (context, snapshot) {
                    if (_loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    final allCompanies = snapshot.data ?? [];
                    final companies = _searchQuery.isEmpty
                        ? allCompanies
                        : allCompanies.where((c) => c.companyName.toLowerCase().contains(_searchQuery)).toList();
                    
                    if (allCompanies.isEmpty) {
                      return _buildEmptyState();
                    }
                    
                    if (companies.isEmpty && _searchQuery.isNotEmpty) {
                      return _buildNoSearchResults();
                    }
                    
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                      itemCount: companies.length,
                      itemBuilder: (context, index) => _buildCompanyCard(companies[index]),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hamburger — opens the module drawer (Ordering / Picking / CN /
          // Settings / Log out).
          Builder(
            builder: (context) => GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.menu, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome, ',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    Expanded(
                      child: Text(
                        _userFullName,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red.shade600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Select a company',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          // Online status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _isOnline ? Colors.green.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _isOnline ? Colors.green : Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: _isOnline ? Colors.green.shade700 : Colors.orange.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Settings button
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage())),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.settings, size: 18, color: Colors.grey.shade700),
            ),
          ),
          const SizedBox(width: 8),
          // Pending uploads button — offline-created quotations awaiting sync
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PendingUploadsPage(),
                ),
              );
              _refreshPendingUploadsCount();
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _pendingUploadsCount > 0
                        ? Colors.deepOrange.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.cloud_upload_outlined,
                    size: 18,
                    color: _pendingUploadsCount > 0
                        ? Colors.deepOrange.shade700
                        : Colors.grey.shade700,
                  ),
                ),
                if (_pendingUploadsCount > 0)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      constraints: const BoxConstraints(
                          minWidth: 16, minHeight: 16),
                      child: Text(
                        _pendingUploadsCount > 99
                            ? '99+'
                            : '$_pendingUploadsCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Refresh button
          GestureDetector(
            onTap: _loading ? null : _refreshCompanies,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _loading
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
                      ),
                    )
                  : Icon(Icons.refresh, size: 18, color: Colors.blue.shade600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.business_center, size: 48, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 16),
          Text(
            'No companies found',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _refreshCompanies,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Refresh', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoSearchResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 16),
          Text(
            'No companies match "$_searchQuery"',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 4),
          Text(
            'Try a different search term',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard(Company company) {
    final hasLogo = company.companyLogo != null && company.companyLogo!.isNotEmpty;
    final nameInitial = company.companyName.isNotEmpty ? company.companyName[0].toUpperCase() : '?';
    final hasLocation = [company.city, company.state, company.country].any((e) => e != null && e.isNotEmpty);
    
    final nameHash = company.companyName.hashCode;
    final hue = (nameHash % 360).abs().toDouble();
    final avatarColor = HSLColor.fromAHSL(1.0, hue, 0.5, 0.7).toColor();
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _selectAndOpen(company),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Company avatar
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: hasLogo ? Colors.transparent : avatarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: hasLogo
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            company.companyLogo!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: Text(nameInitial, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(nameInitial, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                ),
                const SizedBox(width: 10),
                // Company details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.companyName,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              company.companyCode,
                              style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                            ),
                          ),
                          if (hasLocation) ...[
                            const SizedBox(width: 8),
                            Icon(Icons.location_on, size: 12, color: Colors.grey.shade500),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Text(
                                [company.city, company.state, company.country].where((e) => e != null && e.isNotEmpty).join(', '),
                                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 20, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
