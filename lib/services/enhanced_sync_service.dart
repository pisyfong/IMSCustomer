import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:isar/isar.dart';
import 'signalr_service.dart';
import 'company_service.dart';
import 'auth_service.dart';
import 'inventory_service.dart';
import 'customer_service.dart';
import 'quote_service.dart';
import 'quote_item_service.dart';
import 'role_customer_service.dart';
import '../sync_info.dart';
import '../company.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../models/plu.dart';
import '../models/user_role.dart';
import '../models/user_customer.dart';
import '../models/user_app_settings.dart';
import '../models/quotation.dart';
import '../current_login.dart';
import '../main.dart'; // For global isar instance
import '../config/app_config.dart'; // For sync timing configuration
import 'plu_service.dart';
import 'quotation_service.dart';
import 'credit_term_service.dart';
import 'invoice_service.dart';
import 'offline_first_service.dart';
import 'inventory_image_service.dart';
import '../models/credit_term.dart';
import '../models/invoice.dart';

/// Enhanced sync service that combines your existing sync with SignalR real-time updates
class EnhancedSyncService {
  final Isar _isar;
  final SignalRService _signalRService;
  late final InventoryService _inventoryService;
  late final CustomerService _customerService;
  late final QuoteService _quoteService;
  late final QuoteItemService _quoteItemService;
  late final PluService _pluService;
  late final RoleCustomerService _roleCustomerService;
  late final QuotationService _quotationService;
  late final CreditTermService _creditTermService;
  late final InvoiceService _invoiceService;
  
  Timer? _periodicSyncTimer;
  StreamSubscription? _connectivitySubscription;
  StreamSubscription? _customerCreatedSubscription;
  StreamSubscription? _customerUpdatedSubscription;
  StreamSubscription? _customerDeletedSubscription;
  StreamSubscription? _companyChangedSubscription;
  StreamSubscription? _customerChangedSubscription;
  StreamSubscription? _inventoryChangedSubscription;
  StreamSubscription? _quotationChangedSubscription;
  StreamSubscription? _invoiceChangedSubscription;
  StreamSubscription? _pluChangedSubscription;
  StreamSubscription? _customerPluChangedSubscription;
  
  bool _isOnline = false;
  bool _isSyncing = false;
  bool _isFullDataPreloaded = false;
  
  // Stream controllers for sync status
  final StreamController<bool> _syncStatusController = StreamController<bool>.broadcast();
  final StreamController<SyncStats> _syncStatsController = StreamController<SyncStats>.broadcast();
  
  // Getters for streams
  Stream<bool> get syncStatus => _syncStatusController.stream;
  Stream<SyncStats> get syncStats => _syncStatsController.stream;
  
  bool get isOnline => _isOnline;
  bool get isSyncing => _isSyncing;
  
  EnhancedSyncService(this._isar, this._signalRService) {
    _inventoryService = InventoryService();
    _customerService = CustomerService(_signalRService);
    _quoteService = QuoteService(_signalRService);
    _quoteItemService = QuoteItemService(_signalRService);
    _pluService = PluService(_isar);
    _roleCustomerService = RoleCustomerService();
    _quotationService = QuotationService(_signalRService);
    _creditTermService = CreditTermService(_signalRService);
    _invoiceService = InvoiceService(_signalRService);
    _initializeService();
  }
  
  /// Initialize the sync service
  void _initializeService() {
    // Listen to connectivity changes - handle the connectivity API properly
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);
    
    // Listen to SignalR real-time events
    _customerCreatedSubscription = _signalRService.customerCreated.listen(_onCustomerCreated);
    _customerUpdatedSubscription = _signalRService.customerUpdated.listen(_onCustomerUpdated);
    _customerDeletedSubscription = _signalRService.customerDeleted.listen(_onCustomerDeleted);
    
    // Listen to real-time database changes
    _companyChangedSubscription = _signalRService.companyChanged.listen(_onCompanyChanged);
    _customerChangedSubscription = _signalRService.customerChanged.listen(_onCustomerChanged);
    _inventoryChangedSubscription = _signalRService.inventoryChanged.listen(_onInventoryChanged);
    _quotationChangedSubscription = _signalRService.quotationChanged.listen(_onQuotationChanged);
    _invoiceChangedSubscription = _signalRService.invoiceChanged.listen(_onInvoiceChanged);
    _pluChangedSubscription = _signalRService.pluChanged.listen(_onPluChanged);
    _customerPluChangedSubscription = _signalRService.customerPluChanged.listen(_onCustomerPluChanged);
    
    // Start periodic sync using configured interval
    print('Enhanced Sync: Starting periodic sync every ${AppConfig.periodicSyncMinutes} minutes');
    _periodicSyncTimer = Timer.periodic(Duration(minutes: AppConfig.periodicSyncMinutes), (_) => performSync());
    
    // Initial connectivity check
    _checkConnectivity();
  }
  
  /// Check current connectivity status
  Future<void> _checkConnectivity() async {
    final connectivity = await Connectivity().checkConnectivity();
    _handleConnectivityChange(connectivity);
  }
  
  /// Handle connectivity changes from stream or initial check
  void _handleConnectivityChange(dynamic connectivityResult) {
    final wasOnline = _isOnline;
    
    // Handle both single ConnectivityResult and List<ConnectivityResult>
    if (connectivityResult is List<ConnectivityResult>) {
      _isOnline = connectivityResult.isNotEmpty && !connectivityResult.contains(ConnectivityResult.none);
    } else if (connectivityResult is ConnectivityResult) {
      _isOnline = connectivityResult != ConnectivityResult.none;
    } else {
      _isOnline = false;
    }
    
    print('Enhanced Sync: Connectivity changed - Online: $_isOnline');
    
    // Update sync info in database
    _updateSyncInfo(isOnline: _isOnline);
    
    // If we just came online, connect SignalR and sync (non-blocking)
    if (!wasOnline && _isOnline) {
      // Run in background without blocking
      Future.microtask(() async {
        try {
          await _signalRService.connect();
          await performSync();
        } catch (e) {
          print('Enhanced Sync: Background sync failed (non-blocking): $e');
        }
      });
    } else if (wasOnline && !_isOnline) {
      _signalRService.disconnect();
    }
  }
  
  /// Handle real-time customer created events
  void _onCustomerCreated(Map<String, dynamic> customerData) async {
    print('Enhanced Sync: Real-time customer created - ${customerData['name']}');
    
    // Convert to Company object and store locally
    final company = _mapToCompany(customerData);
    if (company != null) {
      await _isar.writeTxn(() async {
        await _isar.companys.put(company);
      });
      
      print('Enhanced Sync: Customer created and stored locally');
      _emitSyncStats();
    }
  }
  
  /// Handle real-time customer updated events
  void _onCustomerUpdated(Map<String, dynamic> customerData) async {
    print('Enhanced Sync: Real-time customer updated - ${customerData['name']}');
    
    // Convert to Company object and update locally
    final company = _mapToCompany(customerData);
    if (company != null) {
      await _isar.writeTxn(() async {
        await _isar.companys.put(company);
      });
      
      print('Enhanced Sync: Customer updated locally');
      _emitSyncStats();
    }
  }
  
  /// Handle real-time customer deleted events
  void _onCustomerDeleted(String customerCode) async {
    print('Enhanced Sync: Real-time customer deleted - $customerCode');
    
    // Find and delete locally
    final existingCustomer = await _isar.companys.filter().companyCodeEqualTo(customerCode).findFirst();
    if (existingCustomer != null) {
      await _isar.writeTxn(() async {
        await _isar.companys.delete(existingCustomer.id);
      });
      
      print('Enhanced Sync: Customer deleted locally');
      _emitSyncStats();
    }
  }
  
  /// Handle real-time company change events
  void _onCompanyChanged(Map<String, dynamic> changeData) async {
    print('📡 Enhanced Sync: Received company change event: $changeData');
    
    final changeType = changeData['changeType'] as String;
    final companyData = changeData['companyData'] as Map<String, dynamic>; // Fixed: was 'data', now 'companyData'
    
    print('📡 Enhanced Sync: Real-time company $changeType - ${companyData['Company_Name']} (Code: ${companyData['Company_Code']})');
    
    try {
      if (changeType == 'updated' || changeType == 'created') {
        // Convert to Company object
        final company = Company()
          ..companyCode = companyData['Company_Code']?.toString() ?? ''
          ..companyName = companyData['Company_Name']?.toString() ?? ''
          ..street1 = companyData['Street1']?.toString() ?? ''
          ..street2 = companyData['Street2']?.toString() ?? ''
          ..street3 = companyData['Street3']?.toString() ?? ''
          ..city = companyData['City']?.toString() ?? ''
          ..state = companyData['State']?.toString() ?? ''
          ..country = companyData['Country']?.toString() ?? ''
          ..postCode = companyData['PostCode']?.toString() ?? ''
          ..phone = companyData['Phone']?.toString() ?? ''
          ..fax = companyData['Fax']?.toString() ?? ''
          ..email = companyData['Email']?.toString() ?? ''
          ..webPage = companyData['WebPage']?.toString() ?? ''
          ..contactPerson = companyData['Contact_Person']?.toString() ?? ''
          ..mobile = companyData['Mobile']?.toString() ?? ''
          ..currencyType = companyData['Currency_Type']?.toString() ?? ''
          ..registrationNo = companyData['Registration_No']?.toString() ?? ''
          ..companyLogo = companyData['Company_Logo']?.toString() ?? '';
        
        // Save to Isar
        await _isar.writeTxn(() async {
          await _isar.companys.put(company);
        });
        
        print('Enhanced Sync: Company $changeType locally - ${company.companyName}');
      } else if (changeType == 'deleted') {
        // Delete company locally
        final companyCode = companyData['Company_Code']?.toString() ?? '';
        final existingCompany = await _isar.companys.filter().companyCodeEqualTo(companyCode).findFirst();
        
        if (existingCompany != null) {
          await _isar.writeTxn(() async {
            await _isar.companys.delete(existingCompany.id);
          });
          
          print('Enhanced Sync: Company deleted locally - $companyCode');
        }
      }
      
      _emitSyncStats();
    } catch (e) {
      print('Enhanced Sync: Error handling company change - $e');
    }
  }
  
  /// Handle real-time customer change events
  void _onCustomerChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final customerData = changeData['data'] as Map<String, dynamic>;
    
    print('Enhanced Sync: Real-time customer $changeType - ${customerData['Code']}');
    
    // Note: This would need a Customer Isar model if you want to store customers locally
    // For now, just log the change
    print('Enhanced Sync: Customer change received but not processed (no Customer model)');
  }

  /// Handle real-time inventory change events
  void _onInventoryChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final inventoryData = changeData['data'] as Map<String, dynamic>;
    final skuNo = inventoryData['SKU_No'];
    
    print('📦 Enhanced Sync: Real-time inventory $changeType - SKU $skuNo');
    print('📦 Inventory change detected - will be synced on next periodic sync');
    // Note: Individual item sync will be handled by periodic sync
  }

  /// Handle real-time quotation change events
  void _onQuotationChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final quotationData = changeData['data'] as Map<String, dynamic>;
    final quoteLabel = quotationData['Quote_PreLabel'];
    
    print('📝 Enhanced Sync: Real-time quotation $changeType - $quoteLabel');
    print('📝 Quotation change detected - triggering background sync');
    // Trigger a background sync to fetch updated quotations
    Future.microtask(() => performSync());
  }

  /// Handle real-time invoice change events
  void _onInvoiceChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final invoiceData = changeData['data'] as Map<String, dynamic>;
    final invoiceLabel = invoiceData['Invoice_PreLabel'];
    
    print('🧾 Enhanced Sync: Real-time invoice $changeType - $invoiceLabel');
    print('🧾 Invoice change detected - data will be refreshed on next access');
    // Invoices are loaded on-demand when viewing invoice history
  }

  /// Handle real-time PLU change events
  void _onPluChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final pluData = changeData['data'] as Map<String, dynamic>;
    final skuNo = pluData['SKU_No'];
    
    print('🏷️ Enhanced Sync: Real-time PLU $changeType - SKU $skuNo');
    print('🏷️ PLU change detected - will be synced on next periodic sync');
    // PLU data is synced during periodic inventory sync
  }

  /// Handle real-time customer PLU change events
  void _onCustomerPluChanged(Map<String, dynamic> changeData) async {
    final changeType = changeData['changeType'] as String;
    final customerPluData = changeData['data'] as Map<String, dynamic>;
    final customerCode = customerPluData['Customer_Code'];
    final skuNo = customerPluData['SKU_No'];
    
    print('🏷️ Enhanced Sync: Real-time customer PLU $changeType - Customer $customerCode SKU $skuNo');
    
    // Trigger customer PLU refresh
    try {
      await _pluService.syncCustomerPlusForCustomer(
        companyCode: customerPluData['Company_Code'] ?? 1,
        customerCode: customerCode,
        skuNos: [skuNo],
      );
      print('✅ Enhanced Sync: Customer PLU for $customerCode SKU $skuNo synced successfully');
    } catch (e) {
      print('❌ Enhanced Sync: Error syncing customer PLU for $customerCode SKU $skuNo: $e');
    }
  }
  
  /// Perform sync operation
  Future<void> performSync() async {
    if (!_isOnline) {
      print('Enhanced Sync: Skipping sync - Offline');
      return;
    }
    
    if (_isSyncing) {
      print('Enhanced Sync: Skipping sync - Already syncing: $_isSyncing, Online: $_isOnline');
      print('🚨 ENHANCED SYNC: DEADLOCK DETECTED - Forcing reset of _isSyncing flag');
      _isSyncing = false; // Force reset deadlock
      _syncStatusController.add(false);
    }
    
    try {
      // FIRST: Sync credit terms (needed for checkout)
      print('🔄 ENHANCED SYNC: Step 1 - Syncing credit terms...');
      await _syncCreditTerms();
      print('✅ ENHANCED SYNC: Credit terms sync completed');
      
      await syncCompaniesForUser();
      
      // Sync user roles and customer mappings for role-based filtering
      await _syncUserRolesAndCustomers();
      
      // Sync user app settings for permission control
      print('🔄 ENHANCED SYNC: About to call _syncUserAppSettings...');
      await _syncUserAppSettings();
      print('🔄 ENHANCED SYNC: _syncUserAppSettings completed');
      
      // Sync unsynced quotations to server (offline-first)
      print('🔄 ENHANCED SYNC: About to sync unsynced quotations...');
      await _syncUnsyncedQuotations();
      print('🔄 ENHANCED SYNC: Quotation sync completed');

      // Periodic inventory sync (paged, per company)
      print('🔄 ENHANCED SYNC: About to sync inventory (periodic)...');
      await _syncInventoryPeriodically();
      print('🔄 ENHANCED SYNC: Inventory sync completed');

    } catch (e) {
      print('Enhanced Sync: Error during sync: $e');
      print('🚨 ENHANCED SYNC: Exception in performSync - ensuring _isSyncing reset');
      _isSyncing = false;
      _syncStatusController.add(false);
    }
    
    // Customer sync is now enabled with proper Customer table separation
    print('Enhanced Sync: Customer sync enabled with separate Customer table');
    
    // Update sync info
    await _updateSyncInfo(
      isOnline: _isOnline,
      lastSyncTime: DateTime.now(),
    );
    
    _emitSyncStats();
  }
  
  /// Sync companies for current user
  /// Sync companies for the current user - TRACE DEBUG VERSION
  Future<void> syncCompaniesForUser() async {
    print('\n\n🚨🚨🚨 ENHANCED SYNC METHOD CALLED - THIS SHOULD APPEAR IN LOGS 🚨🚨🚨');
    print('🔍 ENHANCED SYNC: Method called, _isSyncing = $_isSyncing');
    
    if (_isSyncing) {
      print('🔍 ENHANCED SYNC: Already syncing, returning early');
      print('🔍 ENHANCED SYNC: FORCING _isSyncing = false to break deadlock');
      _isSyncing = false; // Force reset to break potential deadlock
    }
    
    print('🔍 ENHANCED SYNC: Setting _isSyncing = true');
    _isSyncing = true;
    _syncStatusController.add(true);
    
    try {
      print('🔍 ENHANCED SYNC: STEP 1 - Getting current user...');
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      if (user?.userId == null) {
        print('🔍 ENHANCED SYNC: STEP 1 FAILED - No user');
        throw Exception('STEP 1 FAILED: No user logged in');
      }
      print('🔍 ENHANCED SYNC: STEP 1 SUCCESS - User: ${user!.loginName} (${user.userId})');
      
      print('🔍 ENHANCED SYNC: STEP 2 - Checking SignalR connection...');
      if (!_signalRService.isConnected) {
        print('🔍 ENHANCED SYNC: SignalR not connected, attempting to connect...');
        try {
          await _signalRService.connect();
        } catch (e) {
          print('🔍 ENHANCED SYNC: STEP 2 - SignalR connection failed (offline mode): $e');
          print('📱 ENHANCED SYNC: Continuing with cached data (offline-first)');
          return; // Exit gracefully, app will use cached data
        }
      }
      if (!_signalRService.isConnected) {
        print('🔍 ENHANCED SYNC: STEP 2 - SignalR not connected (offline mode)');
        print('📱 ENHANCED SYNC: Continuing with cached data (offline-first)');
        return; // Exit gracefully, app will use cached data
      }
      print('🔍 ENHANCED SYNC: STEP 2 SUCCESS - SignalR connected');
      
      print('🔍 ENHANCED SYNC: STEP 3 - Fetching companies from server...');
      final serverData = await _signalRService.getCompany(user.userId);
      if (serverData == null || serverData is! List || serverData.isEmpty) {
        print('🔍 ENHANCED SYNC: STEP 3 FAILED - No server data');
        throw Exception('STEP 3 FAILED: No company data received from server');
      }
      print('🔍 ENHANCED SYNC: STEP 3 SUCCESS - Received ${serverData.length} companies');
      
      print('🔍 ENHANCED SYNC: STEP 4 - Converting to Company objects...');
      final companies = <Company>[];
      for (int i = 0; i < serverData.length; i++) {
        final data = serverData[i];
        if (data is Map<String, dynamic>) {
          // Debug: Print raw data for first company to see what we're getting
          if (i == 0) {
            print('🔍 ENHANCED SYNC: DEBUG - Raw server data for first company:');
            print('🔍 Company_Code: ${data['Company_Code']} (${data['Company_Code'].runtimeType})');
            print('🔍 Company_Name: ${data['Company_Name']} (${data['Company_Name'].runtimeType})');
          }
          
          // Safe string conversion with encoding preservation
          final companyName = data['Company_Name'];
          final safeCompanyName = companyName != null ? companyName.toString() : '';
          
          if (i == 0) {
            print('🔍 ENHANCED SYNC: DEBUG - Converted company name: "$safeCompanyName"');
          }
          
          companies.add(Company()
            ..companyCode = data['Company_Code']?.toString() ?? ''
            ..companyName = safeCompanyName
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
            ..companyLogo = data['Company_Logo']?.toString() ?? '');
        }
      }
      
      if (companies.isEmpty) {
        print('🔍 ENHANCED SYNC: STEP 4 FAILED - No companies converted');
        throw Exception('STEP 4 FAILED: No valid companies converted from ${serverData.length} server records');
      }
      print('🔍 ENHANCED SYNC: STEP 4 SUCCESS - Converted ${companies.length} companies');
      
      // Step 5: Save to database (using global isar instance)
      print('🔍 ENHANCED SYNC: STEP 5 - Saving ${companies.length} companies to database...');
      await isar.writeTxn(() async {
        await isar.companys.clear();
        await isar.companys.putAll(companies);
      });
      
      // Step 6: Verify save
      final saved = await isar.companys.count();
      print('🔍 ENHANCED SYNC: STEP 6 - Verification: ${saved} companies saved to database');
      if (saved == 0) {
        throw Exception('Database save verification failed - no companies found after save');
      }
      
      // Step 7: Update sync metadata
      print('🔍 ENHANCED SYNC: STEP 7 - Updating sync metadata...');
      await _updateSyncInfo(lastSyncTime: DateTime.now());
      _emitSyncStats();
      
      print('🔍 ENHANCED SYNC: ✅ ALL STEPS COMPLETED SUCCESSFULLY - ${saved} companies saved!');
      print('🔍 ENHANCED SYNC: 🎉 SYNC OPERATION COMPLETED SUCCESSFULLY! 🎉');
      
    } catch (e) {
      print('🔍 ENHANCED SYNC: EXCEPTION CAUGHT: $e');
      rethrow;
    } finally {
      print('🔍 ENHANCED SYNC: Finally block - setting _isSyncing = false');
      _isSyncing = false;
      _syncStatusController.add(false);
    }
  }
  
  /// Request full sync via SignalR
  Future<void> requestFullSync() async {
    if (!_isOnline || !_signalRService.isConnected) {
      print('Enhanced Sync: Cannot request full sync - not connected');
      return;
    }
    
    try {
      final customers = await _signalRService.requestFullSync();
      
      if (customers != null && customers.isNotEmpty) {
        await _isar.writeTxn(() async {
          // Clear existing customers
          await _isar.companys.clear();
          
          // Add synced customers
          for (final customerData in customers) {
            final company = _mapToCompany(customerData);
            if (company != null) {
              await _isar.companys.put(company);
            }
          }
        });
        
        print('Enhanced Sync: Full sync completed - ${customers.length} customers');
        _emitSyncStats();
      }
    } catch (e) {
      print('Enhanced Sync: Full sync failed - $e');
    }
  }
  
  /// Map server customer data to Company object
  Company? _mapToCompany(Map<String, dynamic> data) {
    try {
      final company = Company();
      company.companyCode = data['code'] as String? ?? '';
      company.companyName = data['name'] as String? ?? '';
      company.registrationNo = data['registrationNo'] as String? ?? '';
      company.street1 = data['address1'] as String? ?? '';
      company.street2 = data['address2'] as String? ?? '';
      company.city = data['city'] as String? ?? '';
      company.state = data['state'] as String? ?? '';
      company.country = data['country'] as String? ?? '';
      company.postCode = data['postcode'] as String? ?? '';
      company.phone = data['telNo'] as String? ?? '';
      company.email = data['email'] as String? ?? '';
      company.contactPerson = data['contactName'] as String? ?? '';
      company.currencyType = data['customerType'] as String? ?? '';
      
      return company;
    } catch (e) {
      print('Enhanced Sync: Error mapping customer data - $e');
      return null;
    }
  }
  
  /// Update sync info in database
  Future<void> _updateSyncInfo({bool? isOnline, DateTime? lastSyncTime}) async {
    try {
      final syncInfo = await _isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
      
      if (syncInfo != null) {
        await _isar.writeTxn(() async {
          if (isOnline != null) syncInfo.isOnline = isOnline;
          if (lastSyncTime != null) syncInfo.lastSyncTime = lastSyncTime;
          await _isar.syncInfos.put(syncInfo);
        });
      }
    } catch (e) {
      print('Enhanced Sync: Error updating sync info - $e');
    }
  }
  
  /// Emit current sync statistics
  void _emitSyncStats() async {
    try {
      final totalCustomers = await _isar.companys.count();
      final syncInfo = await _isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
      
      final stats = SyncStats(
        totalCustomers: totalCustomers,
        unsyncedCustomers: 0, // All customers are synced in this implementation
        lastSyncTime: syncInfo?.lastSyncTime,
        isConnected: _signalRService.isConnected,
        isOnline: _isOnline,
      );
      
      _syncStatsController.add(stats);
    } catch (e) {
      print('Enhanced Sync: Error emitting sync stats - $e');
    }
  }
  
  /// Get current sync statistics
  Future<SyncStats> getSyncStats() async {
    final totalCustomers = await _isar.companys.count();
    final syncInfo = await _isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
    
    return SyncStats(
      totalCustomers: totalCustomers,
      unsyncedCustomers: 0,
      lastSyncTime: syncInfo?.lastSyncTime,
      isConnected: _signalRService.isConnected,
      isOnline: _isOnline,
    );
  }

  /// Public method to sync customer PLU mappings (called from settings page)
  Future<void> syncCustomerPlu() async {
    await _preloadCustomerPlus();
  }
  
  /// Public method to sync quotations (called from settings page)
  Future<void> syncQuotations() async {
    await _preloadAllQuotesForceSync();
    await _preloadAllQuoteItems();
  }
  
  /// Force sync all quotes (for manual sync from settings)
  Future<void> _preloadAllQuotesForceSync() async {
    try {
      print('📝 PRELOAD: Force syncing all quotes...');
      
      // Get all companies first
      final companies = await _isar.companys.where().findAll();
      double totalQuotes = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          print('📝 PRELOAD: Force syncing quotes for company $companyCode...');
          
          // Fetch ALL quotes for this company (no customer filter)
          // Server now supports fetching all quotes when customerCode is empty
          final quotes = await _quoteService.getQuotes(
            companyCode: companyCode,
            customerCode: null,  // Fetch all quotes for company
            forceSync: true,     // Force sync from server
          );
          
          if (quotes.isNotEmpty) {
            totalQuotes += quotes.length;
            print('📝 PRELOAD: Synced ${quotes.length} quotes for company $companyCode');
          } else {
            print('📝 PRELOAD: No quotes found for company $companyCode');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error syncing quotes for company ${company.companyCode}: $e');
        }
      }
      
      print('✅ PRELOAD: Total quotes synced: $totalQuotes');
      
    } catch (e) {
      print('❌ PRELOAD QUOTES ERROR: $e');
      rethrow;
    }
  }
  
  /// Public method to sync PLUs (called from settings page)
  Future<void> syncPlus() async {
    await _preloadAllPlus();
  }

  /// Preload customer-specific PLU mappings using server's getCustomerPlu function
  Future<void> _preloadCustomerPlus() async {
    try {
      print('🏷️ PRELOAD: Loading customer PLU mappings using getCustomerPlu...');

      // Try to connect if not connected
      if (!_signalRService.isConnected) {
        try {
          await _signalRService.connect().timeout(const Duration(seconds: 5));
        } catch (e) {
          print('🏷️ PRELOAD: Cannot connect to server, skipping customer PLU sync');
          return;
        }
      }

      // Strategy: Call getCustomerPlu for each customer with comprehensive SKU list
      final companies = await _isar.companys.where().findAll();

      for (final company in companies) {
        final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
        if (companyCode <= 0) continue;

        print('🏷️ PRELOAD: Processing company $companyCode for customer PLU...');

        // OPTIMIZATION: Get only customers that have PLU records from server
        List<String> customersWithPlu = [];
        try {
          final response = await _signalRService.invoke('getCustomersWithPlu', [companyCode])
              .timeout(const Duration(seconds: 10));
          if (response is List) {
            customersWithPlu = response.cast<String>();
            print('🏷️ PRELOAD: Found ${customersWithPlu.length} customers with PLU for company $companyCode');
          }
        } catch (e) {
          print('⚠️ PRELOAD: Failed to get customers with PLU, falling back to all customers: $e');
          // Fallback: get all customers if the query fails
          final allCustomers = await _isar.customers
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
          customersWithPlu = allCustomers.map((c) => c.code).toList();
        }

        if (customersWithPlu.isEmpty) {
          print('🏷️ PRELOAD: No customers with PLU found, skipping company $companyCode');
          continue;
        }

        // Get ALL SKUs for this company
        final inventoryItems = await _isar.inventoryItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
        final allSkus = inventoryItems
            .map((it) => it.skuNo)
            .where((sku) => sku > 0)
            .toList()
          ..sort();
        if (allSkus.isEmpty) {
          print('🏷️ PRELOAD: No inventory items found, skipping company $companyCode');
          continue;
        }

        int processedCustomers = 0;
        int syncedCustomers = 0;
        int skippedCustomers = 0;

        for (int i = 0; i < customersWithPlu.length; i += 5) {
          final batch = customersWithPlu.skip(i).take(5).toList();
          for (final customerCode in batch) {
            print('🏷️ PRELOAD: Syncing customer PLU for $customerCode with ALL ${allSkus.length} SKUs...');

            // Skip connection check here - already checked at method start
            {
              // Chunk SKUs to reduce payload and avoid potential server-side indexing issues
              const int chunkSize = 200;
              bool anyChunkSucceeded = false;
              for (int start = 0; start < allSkus.length; start += chunkSize) {
                final end = (start + chunkSize) > allSkus.length ? allSkus.length : (start + chunkSize);
                final chunk = allSkus.sublist(start, end);
                try {
                  await _pluService.syncCustomerPlusForCustomer(
                    companyCode: companyCode,
                    customerCode: customerCode,
                    skuNos: chunk,
                  );
                  anyChunkSucceeded = true;
                } catch (e) {
                  print('🏷️ PRELOAD: Customer PLU chunk sync failed for $customerCode at [$start..$end): $e');
                  // If a chunk fails, continue with next chunk to avoid halting entire customer
                }
                await Future.delayed(const Duration(milliseconds: 50));
              }
              if (anyChunkSucceeded) {
                print('🏷️ PRELOAD: ✅ Synced customer PLU for $customerCode (chunks=${(allSkus.length / chunkSize).ceil()})');
                syncedCustomers++;
              } else {
                print('🏷️ PRELOAD: ⚠️ No customer PLU chunks succeeded for $customerCode');
                skippedCustomers++;
              }
            }
            processedCustomers++;
            await Future.delayed(const Duration(milliseconds: 100));
          }
          await Future.delayed(const Duration(milliseconds: 500));
          print('🏷️ PRELOAD: Processed batch ${(i ~/ 5) + 1}/${(customersWithPlu.length / 5).ceil()} ($processedCustomers customers so far)');
        }

        print('🏷️ PRELOAD: Company $companyCode summary - processed: $processedCustomers, synced: $syncedCustomers, skipped: $skippedCustomers');
      }

      print('✅ PRELOAD: Customer PLU preload completed.');
    } catch (e) {
      print('❌ PRELOAD CUSTOMER PLU ERROR: $e');
    }
  }
  
  /// Full data preload at app startup
  /// Runs the heavy preload tasks in the background without blocking UI
  Future<void> preloadAllDataAtStartup() async {
    if (_isFullDataPreloaded) {
      print('🚀 FULL PRELOAD: Already completed, skipping');
      return;
    }
    // Run in background - don't await, don't block
    _runBackgroundPreload();
  }
  
  /// Internal method that runs the actual preload in background
  Future<void> _runBackgroundPreload() async {
    try {
      print('🚀 FULL PRELOAD: Starting background data preload...');
      
      // Get user info for context
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      if (user == null) {
        print('🚀 FULL PRELOAD: No user logged in, skipping preload');
        return;
      }

      // Check server reachability in background (with short timeout)
      // Don't wait - if it fails, individual methods will handle offline mode
      final reachable = await _isServerReachableForPreload().timeout(
        const Duration(seconds: 2),
        onTimeout: () {
          print('🚀 FULL PRELOAD: Server check timed out, continuing anyway');
          return false;
        },
      );
      
      if (!reachable) {
        print('🚀 FULL PRELOAD: Server not reachable, but continuing with cached data');
      }

      // Run all preloads - each handles its own offline fallback
      // These run sequentially but don't block the UI
      await _preloadCompanies();
      await _preloadAllInventory();
      await _preloadAllCustomers();
      await _preloadAllPlus();
      await _preloadAllQuotes();
      await _preloadAllQuoteItems();
      
      // Customer PLU preload with timeout to prevent hangs
      try {
        await _preloadCustomerPlus().timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            print('⏱️ PRELOAD: Customer PLU preload timed out after 30s, continuing...');
          },
        );
      } catch (e) {
        print('❌ PRELOAD: Customer PLU preload failed: $e');
      }
      
      // Disabled automatic invoice preloading for faster startup
      // Invoices will be loaded on-demand when user views Previous Orders
      // Manual sync still available in Settings page
      // await _preloadAllInvoices();
      
      await _preloadGroupAndDepartmentLookups();
      
      // Preload inventory images with timeout (5 minutes for all images)
      try {
        await _preloadInventoryImages().timeout(
          const Duration(minutes: 5),
          onTimeout: () {
            print('⏱️ PRELOAD: Image preload timed out after 5 minutes, continuing...');
          },
        );
      } catch (e) {
        print('❌ PRELOAD: Image preload failed: $e');
      }
      
      _isFullDataPreloaded = true;
      print('✅ FULL PRELOAD: Successfully completed full data preload');
      
    } catch (e) {
      print('❌ FULL PRELOAD ERROR: $e');
      // Don't throw - preload failure shouldn't break the app
    }
  }

  /// Preload all companies
  Future<void> _preloadCompanies() async {
    try {
      print('🏢 PRELOAD: Loading all companies...');
      
      await syncCompaniesForUser();
      final companyCount = await _isar.companys.count();
      print('✅ Preloaded $companyCount companies');
      
    } catch (e) {
      print('❌ PRELOAD COMPANIES ERROR: $e');
    }
  }

  /// Preload all inventory for all companies
  Future<void> _preloadAllInventory() async {
    try {
      print('📦 PRELOAD: Loading all inventory...');
      
      // Quick offline check - skip if we know we're offline
      if (!OfflineFirstService.isLikelyOnline()) {
        print('📦 PRELOAD: Skipping inventory sync (offline)');
        return;
      }
      
      // Get all companies first
      final companies = await _isar.companys.where().findAll();
      int totalItems = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          print('📦 PRELOAD: Loading inventory for company $companyCode...');
          // Some servers cap page size (e.g., 50). Paginate until all pages fetched.
          const int pageSize = 100; // try 100; server may cap to 50
          int offset = 0;
          final List<InventoryItem> allForCompany = [];
          while (true) {
            final page = await _inventoryService.fetchInventoryFromServer(
              companyCode: companyCode,
              limit: pageSize,
              offset: offset,
            );
            print('📦 PRELOAD: Company $companyCode - fetched page @offset=$offset size=${page.length}');
            if (page.isEmpty) break;
            allForCompany.addAll(page);
            if (page.length < pageSize) break; // last page
            offset += pageSize;
          }

          if (allForCompany.isNotEmpty) {
            await _inventoryService.saveInventoryToLocal(
              allForCompany,
              companyCode: companyCode,
            );
            totalItems += allForCompany.length;
            // Loaded ${allForCompany.length} items for company $companyCode
          } else {
            print('📦 PRELOAD: No inventory items found for company $companyCode');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading inventory for company ${company.companyCode}: $e');
          break; // Stop trying other companies if one fails
        }
      }
      
      print('✅ PRELOAD: Total inventory items loaded: $totalItems');
      
    } catch (e) {
      print('❌ PRELOAD INVENTORY ERROR: $e');
    }
  }

  /// Preload all customers for all companies
  Future<void> _preloadAllCustomers() async {
    try {
      print('👥 PRELOAD: Loading all customers...');
      
      // Always attempt customer sync - server is now reachable
      print('👥 PRELOAD: Server is reachable, proceeding with customer sync');
      
      // Get all companies first
      final companies = await _isar.companys.where().findAll();
      double totalCustomers = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          print('👥 PRELOAD: Loading customers for company $companyCode...');
          
          final customers = await _customerService.getCustomers(companyCode, forceSync: false);
          
          if (customers.isNotEmpty) {
            // Customers are already saved by the service
            totalCustomers += customers.length;
            // Loaded ${customers.length} customers for company $companyCode
          } else {
            print('📱 PRELOAD: No customers found for company $companyCode (offline or no data)');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading customers for company ${company.companyCode}: $e');
        }
      }
      
      print('✅ PRELOAD: Total customers loaded: $totalCustomers');
      
    } catch (e) {
      print('❌ PRELOAD CUSTOMERS ERROR: $e');
    }
  }

  /// Check if server is reachable for preload operations
  Future<bool> _isServerReachableForPreload() async {
    try {
      // Quick connectivity check without hanging the app
      if (!_signalRService.isConnected) {
        // Try to connect with a short timeout
        try {
          await _signalRService.connect().timeout(Duration(seconds: 3));
        } catch (e) {
          print('👥 PRELOAD: Server connection timeout after 3 seconds: $e');
          return false;
        }
      }
      
      return _signalRService.isConnected;
    } catch (e) {
      print('👥 PRELOAD: Server connectivity check failed: $e');
      return false;
    }
  }

  /// Preload all quotes for all companies
  Future<void> _preloadAllQuotes() async {
    try {
      print('📝 PRELOAD: Loading all quotes...');
      
      // Quick offline check - skip if we know we're offline
      if (!OfflineFirstService.isLikelyOnline()) {
        print('📝 PRELOAD: Skipping quotes sync (offline)');
        return;
      }
      
      // Get all companies first
      final companies = await _isar.companys.where().findAll();
      double totalQuotes = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          print('📝 PRELOAD: Loading quotes for company $companyCode (per-customer)...');
          
          // Server requires a customer code. Iterate through all customers and fetch quotes.
          final customers = await _isar.customers
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
          print('📝 PRELOAD: Found ${customers.length} customers for company $companyCode');
          
          final allQuotes = <Quote>[];
          for (final customer in customers) {
            try {
              final customerQuotes = await _quoteService.getQuotes(
                companyCode: companyCode,
                customerCode: customer.code,
                forceSync: false,
              );
              allQuotes.addAll(customerQuotes);
              if (customerQuotes.isNotEmpty) {
                print('📝 PRELOAD: Found ${customerQuotes.length} quotes for customer ${customer.code}');
              }
            } catch (e) {
              print('📝 PRELOAD: Error getting quotes for customer ${customer.code}: $e');
            }
          }
          final quotes = allQuotes;
          
          if (quotes.isNotEmpty) {
            // Quotes are already saved by the service
            totalQuotes += quotes.length;
            // Loaded ${quotes.length} quotes for company $companyCode
          } else {
            print('📝 PRELOAD: No quotes found for company $companyCode');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading quotes for company ${company.companyCode}: $e');
        }
      }
      
      print('✅ PRELOAD: Total quotes loaded: $totalQuotes');
      
    } catch (e) {
      print('❌ PRELOAD QUOTES ERROR: $e');
    }
  }

  /// Preload all quote items for all quotes
  Future<void> _preloadAllQuoteItems() async {
    try {
      // Loading all quote items...
      
      // Get all quotes first
      final quotes = await _isar.quotes.where().findAll();
      double totalQuoteItems = 0;
      
      for (final quote in quotes) {
        try {
          if (quote.quotePreLabel?.isEmpty != false || quote.companyCode == null) continue;
          
          // Loading items for quote ${quote.quotePreLabel}
          
          final quoteItems = await _quoteItemService.getQuoteItems(
            quotePreLabel: quote.quotePreLabel!,
            companyCode: quote.companyCode!,
            forceSync: false,
          );
          
          if (quoteItems.isNotEmpty) {
            // Quote items are already saved by the service
            totalQuoteItems += quoteItems.length;
            // Loaded ${quoteItems.length} items for quote
          } else {
            print('📋 PRELOAD: No items found for quote ${quote.quotePreLabel}');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading items for quote ${quote.quotePreLabel}: $e');
        }
      }
      
      print('✅ PRELOAD: Total quote items loaded: $totalQuoteItems');
      
    } catch (e) {
      print('❌ PRELOAD QUOTE ITEMS ERROR: $e');
    }
  }

  /// Preload all PLUs for all companies
  Future<void> _preloadAllPlus() async {
    try {
      print('🏷️ PRELOAD: Loading all PLUs...');
      final companies = await _isar.companys.where().findAll();
      int totalPlu = 0;
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          print('🏷️ PRELOAD: Syncing PLUs for company $companyCode...');
          await _pluService.syncPlus();
          final count = await _isar.plus.where().companyCodeEqualTo(companyCode).count();
          totalPlu += count;
          print('✅ PRELOAD: PLUs for company $companyCode now: $count');
        } catch (e) {
          print('❌ PRELOAD: Error syncing PLUs for company ${company.companyCode}: $e');
        }
      }
      print('✅ PRELOAD: Total PLUs synced (aggregate counts per company): $totalPlu');
    } catch (e) {
      print('❌ PRELOAD PLUS ERROR: $e');
    }
  }

  /// Sync user roles and customer mappings for role-based filtering
  Future<void> _syncUserRolesAndCustomers() async {
    try {
      print('\n👥 ROLE SYNC: Starting user roles and customer mappings sync...');
      
      // Get current user for context
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      if (user?.userId == null) {
        print('👥 ROLE SYNC: No user logged in, skipping role sync');
        return;
      }
      
      // 1. Sync user roles
      print('👥 ROLE SYNC: Fetching user roles from server...');
      final roles = await _signalRService.getUserRoles();
      if (roles != null && roles.isNotEmpty) {
        await _roleCustomerService.syncUserRoles(roles);
        print('✅ ROLE SYNC: Synced ${roles.length} user roles');
      } else {
        print('⚠️ ROLE SYNC: No user roles received from server');
      }
      
      // 2. Sync user-customer mappings
      print('👥 ROLE SYNC: Fetching user-customer mappings from server...');
      final mappings = await _signalRService.getUserCustomers();
      if (mappings != null && mappings.isNotEmpty) {
        await _roleCustomerService.syncUserCustomers(mappings);
        print('✅ ROLE SYNC: Synced ${mappings.length} user-customer mappings');
        
        // Diagnostic: Check what we have in local storage
        final localMappingsCount = await isar.userCustomers.count();
        final localRolesCount = await isar.userRoles.count();
        print('📊 ROLE SYNC: Local storage now has $localRolesCount roles and $localMappingsCount mappings');
        
        // Show sample mapping for debugging
        if (localMappingsCount > 0) {
          final sampleMapping = await isar.userCustomers.where().findFirst();
          if (sampleMapping != null) {
            print('📋 ROLE SYNC: Sample mapping - Role ${sampleMapping.userId} -> Customer ${sampleMapping.customer} (Company ${sampleMapping.companyCode})');
          }
        }

        // If current user has no roleId yet, infer from mappings ONLY if user has actual mappings
        try {
          final auth = AuthService();
          final cu = auth.currentUser;
          if (cu != null && cu.roleId == null) {
            // Don't auto-infer roleId - let users without explicit role have no access
            print('👥 ROLE SYNC: User ${cu.userId} has no roleId - no role access granted');
            // Note: PI_User_Customer.User_Id is actually the role ID, not user ID
            // Only users with explicit roleId should get customer access
          }
        } catch (e) {
          print('⚠️ ROLE SYNC: Failed to infer/persist roleId - $e');
        }
      } else {
        print('⚠️ ROLE SYNC: No user-customer mappings received from server');
      }
      
      print('✅ ROLE SYNC: User roles and customer mappings sync completed');
      
    } catch (e) {
      print('❌ ROLE SYNC ERROR: $e');
      // Don't throw - role sync failure shouldn't break the main sync
    }
  }

  /// Sync user app settings for permission control
  Future<void> _syncUserAppSettings() async {
    print('\n⚙️ USER APP SETTINGS SYNC: Method called!');
    try {
      print('⚙️ USER APP SETTINGS SYNC: Inside try block...');
      
      // Get current user for context
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      print('⚙️ USER APP SETTINGS SYNC: User loaded: ${user?.userId}');
      
      if (user?.userId == null) {
        print('⚙️ USER APP SETTINGS SYNC: No user logged in, skipping');
        return;
      }
      
      print('⚙️ USER APP SETTINGS SYNC: User check passed, getting userId...');
      final userId = user!.userId;
      print('⚙️ USER APP SETTINGS SYNC: userId = $userId');
      print('⚙️ USER APP SETTINGS SYNC: Fetching settings for userId=$userId...');
      print('⚙️ Calling SignalR method: getUserAppSettings with params: {"userId": $userId}');
      
      final settingsData = await _signalRService.invoke(
        'getUserAppSettings',
        [{'userId': userId}],
      ) as List<dynamic>?;
      
      print('⚙️ SignalR Response: ${settingsData != null ? "${settingsData.length} records" : "null"}');
      if (settingsData != null && settingsData.isNotEmpty) {
        print('⚙️ Raw settings data received:');
        for (var data in settingsData) {
          final d = data as Map<String, dynamic>;
          print('⚙️   - User_ID: ${d['User_ID']}, Company: ${d['Company_Code']}, SI_Allow_Change_Price: ${d['SI_Allow_Change_Price']}');
        }
      }
      
      if (settingsData != null && settingsData.isNotEmpty) {
        await isar.writeTxn(() async {
          // Clear existing settings for this user
          await isar.userAppSettings
              .where()
              .userIdEqualTo(userId)
              .deleteAll();
          
          // Add new settings
          for (final settingData in settingsData) {
            final setting = UserAppSettings.fromJson(settingData as Map<String, dynamic>);
            await isar.userAppSettings.put(setting);
          }
        });
        
        print('✅ USER APP SETTINGS SYNC: Synced ${settingsData.length} settings');
        
        // Show permissions for debugging
        if (settingsData.isNotEmpty) {
          final firstSetting = settingsData[0] as Map<String, dynamic>;
          print('⚙️ Permissions - SI_Allow_Change_Price: ${firstSetting['SI_Allow_Change_Price']}');
          print('⚙️ Permissions - SI_Allow_Below_Cost: ${firstSetting['SI_Allow_Below_Cost']}');
          print('⚙️ Permissions - SI_Show_Cost: ${firstSetting['SI_Show_Cost']}');
        }
      } else {
        print('⚠️ USER APP SETTINGS SYNC: No settings found for user $userId');
      }
      
    } catch (e) {
      print('❌ USER APP SETTINGS SYNC ERROR: $e');
      // Don't throw - settings sync failure shouldn't break the main sync
    }
  }

  /// Periodic: Sync inventory for all companies (paged)
  Future<void> _syncInventoryPeriodically() async {
    try {
      // Skip if offline
      if (!OfflineFirstService.isLikelyOnline()) {
        print('📦 PERIODIC: Skipping inventory sync (offline)');
        return;
      }
      // Companies
      final companies = await _isar.companys.where().findAll();
      for (final company in companies) {
        final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
        if (companyCode <= 0) continue;
        print('📦 PERIODIC: Syncing inventory for company $companyCode');
        const int pageSize = 100;
        int offset = 0;
        final List<InventoryItem> allForCompany = [];
        while (true) {
          final page = await _inventoryService.fetchInventoryFromServer(
            companyCode: companyCode,
            limit: pageSize,
            offset: offset,
          );
          if (page.isEmpty) break;
          allForCompany.addAll(page);
          if (page.length < pageSize) break;
          offset += pageSize;
        }
        if (allForCompany.isNotEmpty) {
          await _inventoryService.saveInventoryToLocal(
            allForCompany,
            companyCode: companyCode,
          );
          print('📦 PERIODIC: Inventory updated for company $companyCode (items=${allForCompany.length})');
        }
      }
    } catch (e) {
      print('❌ PERIODIC INVENTORY ERROR: $e');
    }
  }

  /// Periodic: Sync quotations (headers and items)
  Future<void> _syncQuotesPeriodically() async {
    try {
      // Reuse preload logic which already handles offline checks
      await _preloadAllQuotes();
      await _preloadAllQuoteItems();
    } catch (e) {
      print('❌ PERIODIC QUOTES ERROR: $e');
    }
  }

  /// Periodic: Sync recent invoices for each customer and a few items per invoice
  Future<void> _syncRecentInvoicesPeriodically({int invoicesPerCustomer = 5}) async {
    try {
      if (!OfflineFirstService.isLikelyOnline()) {
        print('🧾 PERIODIC: Skipping invoice sync (offline)');
        return;
      }
      final companies = await _isar.companys.where().findAll();
      for (final company in companies) {
        final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
        if (companyCode <= 0) continue;
        print('🧾 PERIODIC: Syncing invoices for company $companyCode');

        // Iterate customers for this company (cap to reduce load)
        final customers = await _isar.customers
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();

        for (final customer in customers) {
          final cust = customer.code;
          if (cust.isEmpty) continue;
          try {
            // Force refresh to fetch from server and cache locally
            final invoices = await _invoiceService.getInvoices(
              companyCode: companyCode,
              customerCode: cust,
              forceRefresh: true,
            );
            if (invoices.isEmpty) continue;
            // Take a few most recent and fetch items
            invoices.sort((a, b) {
              final da = a.invoiceDate ?? DateTime(1970);
              final db = b.invoiceDate ?? DateTime(1970);
              return db.compareTo(da);
            });
            final recent = invoices.take(invoicesPerCustomer).toList();
            for (final inv in recent) {
              if (inv.invoicePreLabel.isEmpty) continue;
              try {
                await _invoiceService.getInvoiceItems(
                  companyCode: companyCode,
                  invoicePreLabel: inv.invoicePreLabel,
                );
              } catch (e) {
                // Continue to next invoice on error
              }
            }
          } catch (e) {
            // Continue with next customer
          }
        }
      }
    } catch (e) {
      print('❌ PERIODIC INVOICES ERROR: $e');
    }
  }

  /// Reset preload flag (call on app restart)
  void resetPreloadFlag() {
    _isFullDataPreloaded = false;
    print('🚀 FULL PRELOAD: Reset preload flag for app restart');
  }
  

  

  /// Perform comprehensive full sync - syncs everything in correct sequence
  Future<void> performFullSync() async {
    print('🚀 FULL SYNC: Starting comprehensive sync...');
    
    if (!_isOnline) {
      print('❌ FULL SYNC: Cannot sync - offline');
      throw Exception('Cannot perform full sync while offline');
    }
    
    if (_isSyncing) {
      print('⚠️ FULL SYNC: Already syncing, forcing reset...');
      _isSyncing = false;
      _syncStatusController.add(false);
    }
    
    _isSyncing = true;
    _syncStatusController.add(true);
    
    try {
      // Step 1: Credit Terms (needed for checkout)
      print('📋 FULL SYNC [1/9]: Syncing credit terms...');
      await _syncCreditTerms();
      
      // Step 2: Companies (foundation data)
      print('🏢 FULL SYNC [2/9]: Syncing companies...');
      await syncCompaniesForUser();
      
      // Step 3: User Roles & Customers (access control)
      print('👥 FULL SYNC [3/9]: Syncing user roles and customers...');
      await _syncUserRolesAndCustomers();
      
      // Step 4: User App Settings (permissions)
      print('⚙️ FULL SYNC [4/9]: Syncing user app settings...');
      await _syncUserAppSettings();
      
      // Step 5: Inventory (products must exist before PLU)
      print('📦 FULL SYNC [5/9]: Syncing inventory...');
      await _syncInventoryPeriodically();
      
      // Step 6: PLU Codes (requires inventory to exist)
      print('🏷️ FULL SYNC [6/9]: Syncing PLU codes...');
      final pluService = PluService(_isar);
      await pluService.syncPlus();
      
      // Step 7: Customer PLU (requires customers and PLU)
      print('🏷️ FULL SYNC [7/9]: Syncing customer PLU mappings...');
      await syncCustomerPlu();
      
      // Step 8: Invoices (historical data)
      print('🧾 FULL SYNC [8/9]: Syncing invoices...');
      await preloadAllInvoices();
      
      // Step 9: Upload unsynced quotations
      print('📝 FULL SYNC [9/9]: Uploading unsynced quotations...');
      await _syncUnsyncedQuotations();
      
      // Update sync info
      await _updateSyncInfo(
        isOnline: _isOnline,
        lastSyncTime: DateTime.now(),
      );
      
      _emitSyncStats();
      
      print('✅ FULL SYNC: Completed successfully!');
    } catch (e) {
      print('❌ FULL SYNC: Failed - $e');
      rethrow;
    } finally {
      _isSyncing = false;
      _syncStatusController.add(false);
    }
  }

  /// Dispose resources
  void dispose() {
    _periodicSyncTimer?.cancel();
    _connectivitySubscription?.cancel();
    _customerCreatedSubscription?.cancel();
    _customerUpdatedSubscription?.cancel();
    _customerDeletedSubscription?.cancel();
    _companyChangedSubscription?.cancel();
    _customerChangedSubscription?.cancel();
    _inventoryChangedSubscription?.cancel();
    _quotationChangedSubscription?.cancel();
    _invoiceChangedSubscription?.cancel();
    _pluChangedSubscription?.cancel();
    _customerPluChangedSubscription?.cancel();
    _syncStatusController.close();
    _syncStatsController.close();
  }

  /// Sync credit terms from server to local database
  Future<void> _syncCreditTerms() async {
    try {
      print('💳 CREDIT TERMS SYNC: Starting sync...');
      
      // Get current user's company
      final currentUser = await AuthService().loadSavedLogin();
      if (currentUser == null) {
        print('⚠️ CREDIT TERMS SYNC: No logged-in user, skipping');
        return;
      }
      
      final selectedCompany = await AuthService().getSelectedCompany();
      if (selectedCompany == null) {
        print('⚠️ CREDIT TERMS SYNC: No selected company, skipping');
        return;
      }
      
      final companyCodeRaw = selectedCompany['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      print('💳 CREDIT TERMS SYNC: Fetching for company $companyCode...');
      final terms = await _creditTermService.fetchCreditTerms(companyCode: companyCode);
      
      if (terms.isNotEmpty) {
        print('✅ CREDIT TERMS SYNC: Successfully synced ${terms.length} credit terms');
      } else {
        print('⚠️ CREDIT TERMS SYNC: No credit terms found for company $companyCode');
      }
    } catch (e) {
      print('❌ CREDIT TERMS SYNC: Error syncing credit terms: $e');
      // Don't throw - allow other sync operations to continue
    }
  }

  /// Sync unsynced quotations to server (offline-first approach)
  Future<void> _syncUnsyncedQuotations() async {
    try {
      print('📝 QUOTATION SYNC: Starting sync of unsynced quotations...');
      
      final syncedCount = await _quotationService.syncUnsyncedQuotations();
      
      if (syncedCount > 0) {
        print('✅ QUOTATION SYNC: Successfully synced $syncedCount quotations to server');
      } else {
        print('📝 QUOTATION SYNC: No unsynced quotations to sync');
      }
    } catch (e) {
      print('❌ QUOTATION SYNC: Error syncing quotations: $e');
      // Don't throw - allow other sync operations to continue
    }
  }
  
  /// Preload all invoices for all customers (public for manual sync)
  Future<void> preloadAllInvoices() async {
    try {
      print('🧾 PRELOAD: Loading all invoices...');
      
      // Get all customers
      final customers = await _isar.customers.where().findAll();
      int totalInvoices = 0;
      
      for (final customer in customers) {
        try {
          if (customer.code.isEmpty || customer.companyCode == null) continue;
          
          print('🧾 PRELOAD: Loading invoices for customer ${customer.code}...');
          
          // Fetch invoices for this customer
          final invoices = await _invoiceService.getInvoices(
            companyCode: customer.companyCode,
            customerCode: customer.code,
          );
          
          totalInvoices += invoices.length;
          
          if (invoices.isNotEmpty) {
            print('✅ PRELOAD: Loaded ${invoices.length} invoices for customer ${customer.code}');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading invoices for customer ${customer.code}: $e');
        }
      }
      
      print('✅ PRELOAD: Total invoices loaded: $totalInvoices');
      
    } catch (e) {
      print('❌ PRELOAD INVOICES ERROR: $e');
    }
  }
  
  /// Preload inventory images for all inventory items
  Future<void> _preloadInventoryImages() async {
    try {
      print('🖼️ PRELOAD: Starting inventory image preload for ALL items...');
      
      // Initialize image service
      final imageService = InventoryImageService();
      await imageService.initialize();
      
      // Get all companies
      final companies = await _isar.companys.where().findAll();
      int totalImagesQueued = 0;
      int totalItemsProcessed = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          // Check if this company has image configuration
          if (!imageService.hasImageConfig(companyCode)) {
            print('🖼️ PRELOAD: No image config for company $companyCode, skipping');
            continue;
          }
          
          print('🖼️ PRELOAD: Preloading images for company $companyCode...');
          
          // Get ALL inventory items for this company
          final inventoryItems = await _isar.inventoryItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
          
          print('🖼️ PRELOAD: Found ${inventoryItems.length} inventory items for company $companyCode');
          
          if (inventoryItems.isEmpty) continue;
          
          // Queue image downloads in batches
          final List<Future> downloadTasks = [];
          int processedForCompany = 0;
          
          for (final item in inventoryItems) {
            final imageUrl = imageService.getImageUrl(companyCode, item.skuNo, item.uom);
            if (imageUrl != null) {
              // Check if already cached
              final isCached = await imageService.isImageCached(imageUrl, companyCode, item.skuNo);
              if (!isCached) {
                // Queue download (non-blocking)
                downloadTasks.add(
                  imageService.downloadAndCacheImage(imageUrl, companyCode, item.skuNo, item.uom)
                    .timeout(const Duration(seconds: 5), onTimeout: () => null)
                );
                totalImagesQueued++;
                
                // Process in batches of 20 to optimize network usage
                if (downloadTasks.length >= 20) {
                  await Future.wait(downloadTasks);
                  downloadTasks.clear();
                  processedForCompany += 20;
                  totalItemsProcessed += 20;
                  
                  // Progress report every 100 items
                  if (processedForCompany % 100 == 0) {
                    print('🖼️ PRELOAD: Company $companyCode - Processed $processedForCompany/${inventoryItems.length} items');
                  }
                }
              }
            }
          }
          
          // Process remaining downloads
          if (downloadTasks.isNotEmpty) {
            await Future.wait(downloadTasks);
            processedForCompany += downloadTasks.length;
            totalItemsProcessed += downloadTasks.length;
            print('🖼️ PRELOAD: Company $companyCode - Final batch of ${downloadTasks.length} images processed');
          }
          
          print('✅ PRELOAD: Company $companyCode completed - Processed ${inventoryItems.length} items');
          
        } catch (e) {
          print('❌ PRELOAD: Error preloading images for company ${company.companyCode}: $e');
        }
      }
      
      // Get cache stats
      final stats = await imageService.getCacheStats();
      print('✅ PRELOAD: Image preload completed for ALL inventory items');
      print('📊 Image cache stats:');
      print('   - Total items processed: $totalItemsProcessed');
      print('   - Total cached images: ${stats['totalCachedImages']}');
      print('   - Cache size: ${stats['totalSizeFormatted']}');
      print('   - New downloads: $totalImagesQueued images');
      print('   - Companies processed: ${companies.length}');
      
    } catch (e) {
      print('❌ PRELOAD IMAGES ERROR: $e');
    }
  }
  
  /// Preload group and department lookups for all companies
  Future<void> _preloadGroupAndDepartmentLookups() async {
    try {
      print('🏷️ PRELOAD: Loading group and department lookups...');
      
      // Get all companies
      final companies = await _isar.companys.where().findAll();
      int totalGroups = 0;
      int totalDepartments = 0;
      
      for (final company in companies) {
        try {
          final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
          if (companyCode <= 0) continue;
          
          print('🏷️ PRELOAD: Loading lookups for company $companyCode...');
          
          // Load groups (this will fetch from server and cache locally)
          final groups = await _inventoryService.getGroupMap(companyCode: companyCode);
          totalGroups += groups.length;
          
          // Load departments (this will fetch from server and cache locally)
          final departments = await _inventoryService.getDepartmentMap(companyCode: companyCode);
          totalDepartments += departments.length;
          
          if (groups.isNotEmpty || departments.isNotEmpty) {
            print('✅ PRELOAD: Loaded ${groups.length} groups, ${departments.length} departments for company $companyCode');
          }
          
        } catch (e) {
          print('❌ PRELOAD: Error loading lookups for company ${company.companyCode}: $e');
        }
      }
      
      print('✅ PRELOAD: Total lookups loaded - $totalGroups groups, $totalDepartments departments');
      
    } catch (e) {
      print('❌ PRELOAD LOOKUPS ERROR: $e');
    }
  }
}

/// Sync statistics data class
class SyncStats {
  final int totalCustomers;
  final int unsyncedCustomers;
  final DateTime? lastSyncTime;
  final bool isConnected;
  final bool isOnline;
  
  SyncStats({
    required this.totalCustomers,
    required this.unsyncedCustomers,
    this.lastSyncTime,
    required this.isConnected,
    required this.isOnline,
  });
}
