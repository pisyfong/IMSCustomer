import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'models/adjustment.dart';
import 'models/adjustment_item.dart';
import 'models/adjustment_lookup.dart';
import 'package:path_provider/path_provider.dart';
// HTTP removed - using SignalR-only architecture
import 'services/taxonomy_mode_service.dart';
import 'services/inventory_service.dart';
import 'services/base_transaction_sync_service.dart';
import 'models/app_user.dart';
import 'models/app_location.dart';
import 'models/printer_settings.dart';
import 'models/receipt_template.dart';
import 'login_page.dart';
import 'company_selection_page.dart';
import 'pages/home_page.dart';
import 'menu_page.dart';
import 'inventory_page.dart';
import 'company.dart';
import 'sync_info.dart';
import 'current_login.dart';
import 'selected_company.dart';
import 'login_cache.dart';
import 'models/inventory_item.dart';
import 'models/in_stock_uom.dart';
import 'models/cart_item.dart';
import 'models/brand_lookup.dart';
import 'models/customer.dart';
import 'models/quote.dart';
import 'models/quote_item.dart';
import 'models/invoice.dart';
import 'models/plu.dart';
import 'models/user_role.dart';
import 'models/user_customer.dart';
import 'models/user_app_settings.dart';
import 'models/quotation.dart';
import 'models/credit_term.dart';
import 'models/representative.dart';
import 'models/in_stock_location.dart';
import 'models/sync_checkpoint.dart';
import 'models/group_lookup.dart';
import 'models/department_lookup.dart';
import 'models/customer_plu.dart';
import 'models/in_stock_plu.dart';
import 'models/pending_plu.dart';
import 'models/uom_master.dart';
import 'models/draft_quotation.dart';
import 'models/sync_metadata.dart';
import 'models/pick_list.dart';
import 'models/pick_list_item.dart';
import 'models/pack_list.dart';
import 'models/pack_list_item.dart';
import 'services/auth_service.dart';
import 'services/base_inventory_sync_service.dart';
import 'services/signalr_service.dart';
import 'services/enhanced_sync_service.dart';
import 'config/app_config.dart';
import 'services/offline_first_service.dart';
import 'dart:convert';
import 'services/activation_service.dart';
import 'services/license_service.dart';
import 'license_blocked_page.dart';
import 'activation_page.dart';
import 'services/quote_context.dart';

part 'main.g.dart';

@Collection()
class DummyItem {
  Id id = Isar.autoIncrement;
  late String name;
}


// Global Isar instance
late Isar isar;

/// Global route observer so pages can hook into didPush/didPopNext and refresh
/// when they become visible again (e.g. PendingUploadsPage).
final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();

// Global SignalR service instances
late SignalRService signalRService;
late EnhancedSyncService enhancedSyncService;

// Initialize Isar and open the database
Future<void> initIsar() async {
  try {
    print('\n=== Initializing Isar Database ===');
    print('Getting application documents directory...');
    final dir = await getApplicationDocumentsDirectory();
    print('Directory path: ${dir.path}');
    
    print('Opening Isar database...');
    isar = await Isar.open([
      DummyItemSchema,
      CompanySchema,
      SyncInfoSchema,
      CurrentLoginSchema,
      SelectedCompanySchema,
      LoginCacheSchema,
      InventoryItemSchema,
      InStockUomSchema,
      CartItemSchema,
      BrandLookupSchema,
      CustomerSchema,
      QuoteSchema,
      QuoteItemSchema,
      InvoiceSchema,
      InvoiceItemSchema,
      PluSchema,
      UserRoleSchema,
      UserCustomerSchema,
      UserAppSettingsSchema,
      QuotationSchema,
      CreditTermSchema,
      RepresentativeSchema,
      InStockLocationSchema,
      SyncCheckpointSchema,
      GroupLookupSchema,
      DepartmentLookupSchema,
      CustomerPluSchema,
      InStockPluSchema,
      PendingPluSchema,
      UomMasterSchema,
      PendingSkuUomSchema,
      DraftQuotationSchema,
      DraftQuotationItemSchema,
      SyncMetadataSchema,
      PickListSchema,
      PickListItemSchema,
      PackListSchema,
      AdjustmentSchema,
      AdjustmentItemSchema,
      AdjustmentCodeRowSchema,
      AdjustmentBatchRowSchema,
      PackListItemSchema,
      AppUserSchema,
      AppLocationSchema,
      SelectedLocationSchema,
      PrinterSettingsSchema,
      ReceiptTemplateSchema,
    ], directory: dir.path);
    print('Isar database opened successfully');
    
    print('Checking for existing SyncInfo...');
    // Initialize SyncInfo if it doesn't exist
    final syncInfo = await isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
    if (syncInfo == null) {
      print('Creating initial SyncInfo...');
      final initialSyncInfo = SyncInfo.create();
      initialSyncInfo.lastSyncTime = DateTime.now();
      initialSyncInfo.isOnline = false;
      
      await isar.writeTxn(() async {
        await isar.syncInfos.put(initialSyncInfo);
      });
      print('Initial SyncInfo created');
    } else {
      print('SyncInfo already exists');
    }
    
    print('=== Isar Database Initialization Completed ===\n');
  } catch (e) {
    print('\n❌ ERROR in initIsar: $e');
    print('Error type: ${e.runtimeType}');
    print('Stack trace: ${StackTrace.current}');
    print('=== Isar Database Initialization Failed ===\n');
    rethrow;
  }
  
  // Print backend configuration
  AppConfig.printConfig();
  
  // Initialize SignalR services (but don't connect yet)
  print('Initializing SignalR services...');
  signalRService = SignalRService();
  enhancedSyncService = EnhancedSyncService(isar, signalRService);
  
  // NOTE: SignalR connection will be established when needed (during login)
  // This prevents the app from hanging at splash screen
  
  print('Services initialized: Isar, SignalR, Enhanced Sync (connection deferred)');
  print('=== App Services Initialization Completed ===\n');
}

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Isar
  await initIsar();

  // Warm the taxonomy-mode cache so modeOrDefault is correct on first read
  await TaxonomyModeService.instance.getMode();

  // One-time: tag pre-existing (untagged) group/dept lookups as 'pi' taxonomy.
  await InventoryService.migrateLegacyLookupModes();

  // Self-healing: collapse duplicate pick/pack items and re-key them onto the
  // stable id scheme (fixes dupes from the old sequenceNo-based ids).
  await BaseTransactionSyncService.dedupePickItems();
  await BaseTransactionSyncService.dedupePackItems();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _hasExistingLogin = false;
  bool _isActivated = false;

  /// Non-null when the licence server (or the cached record) refuses this
  /// device. Blocks the app ahead of login.
  LicenseResult? _licenseBlock;
  
  @override
  void initState() {
    super.initState();
    print('\n=== MyApp InitState Called ===');
    _checkForExistingLogin();
  }
  
  Future<void> _checkForExistingLogin() async {
    try {
      print('=== Checking for existing login ===');
      // Activation gate first
      final activationService = ActivationService();
      _isActivated = await activationService.isActivated();
      print('Activation state: $_isActivated');
      // Load quote prefix into memory if activated
      if (_isActivated) {
        await QuoteContext.I.loadFromStorage();
        print('Quote prefix loaded: \\${QuoteContext.I.quotePrefix}');

        // Re-validate the licence. Revoke / expiry / maintenance / forced
        // upgrade are honoured here, before anything else runs. Offline is not
        // a refusal — LicenseService falls back to the cached record for a
        // grace window, because a handheld is out of coverage all day.
        final lic = await activationService.checkLicense();
        print('Licence state: ${lic.state}');
        if (!lic.state.allowsUse) {
          setState(() {
            _licenseBlock = lic;
            _hasExistingLogin = false;
            _initialized = true;
          });
          return;
        }
      }
      if (!_isActivated) {
        setState(() {
          _hasExistingLogin = false;
          _initialized = true;
        });
        print('Activation required. Initialization completed (activation gate).');
        return;
      }

      final authService = AuthService();
      
      print('Checking if user has saved login...');
      final hasLogin = await authService.hasSavedLogin();
      print('Has saved login: $hasLogin');
      
      if (hasLogin) {
        print('Loading saved login...');
        await authService.loadSavedLogin();
        print('Saved login loaded successfully');
        
        // Trigger full data preload at startup if user is logged in
        print('=== Starting Full Data Preload ===');
        print('🔍 DEBUG: About to call _startFullDataPreload()');
        _startFullDataPreload();
        print('🔍 DEBUG: _startFullDataPreload() called');
      }
      
      print('Setting state - initialized: true, hasExistingLogin: $hasLogin');
      setState(() {
        _hasExistingLogin = hasLogin;
        _initialized = true;
      });
      
      print('=== App initialization completed successfully ===\n');
    } catch (e) {
      print('\n❌ ERROR in _checkForExistingLogin: $e');
      print('Error type: ${e.runtimeType}');
      print('Stack trace: ${StackTrace.current}');
      
      // Set initialized to true even on error to prevent infinite hang
      setState(() {
        _hasExistingLogin = false;
        _initialized = true;
      });
      
      print('=== App initialization completed with error ===\n');
    }
  }
  
  /// Start full data preload in background (non-blocking)
  /// OFFLINE-FIRST: Never blocks the UI, runs silently in background
  void _startFullDataPreload() {
    if (AppConfig.enableAutoSync) {
      print('🚀 APP STARTUP: Scheduling background data preload...');
      // Fire and forget - don't await, don't block
      // The preload method itself handles all errors and offline scenarios
      enhancedSyncService.preloadAllDataAtStartup();
      print('✅ APP STARTUP: Background preload scheduled (non-blocking)');
    } else {
      print('🚀 APP STARTUP: Skipping startup preload (AppConfig.enableAutoSync = false)');
      // ...but barcodes are pulled regardless. The table is ~3.5k rows and
      // usually unchanged, so this costs a round trip — and a barcode this
      // device has never seen is how a picker links it to the wrong item and
      // strands a whole sync behind the conflict.
      _pullBarcodesQuietly();
    }
  }

  /// Cheap barcode refresh, independent of the auto-sync switch.
  ///
  /// Never awaited and never fatal: a stale barcode table degrades to
  /// "not recognised", which a picker can still resolve by hand.
  void _pullBarcodesQuietly() {
    () async {
      try {
        final company = await AuthService().getSelectedCompany();
        final raw = company?['companyCode'];
        final cc = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
        if (cc == null) return;
        await BaseInventorySyncService().syncPlusOnly(companyCode: cc);
      } catch (e) {
        print('⚠️ APP STARTUP: barcode refresh skipped: $e');
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMS Customer',
      navigatorObservers: [appRouteObserver],
      // Clamp the OS font-scale so a device set to "large text" doesn't blow
      // up the whole UI. The app's layouts are tuned for a compact scale;
      // allow a little growth (up to 1.1x) but no more.
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final clamped = mq.textScaler.clamp(
          minScaleFactor: 0.9,
          maxScaleFactor: 1.1,
        );
        return MediaQuery(
          data: mq.copyWith(textScaler: clamped),
          child: child ?? const SizedBox.shrink(),
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent.shade100, brightness: Brightness.light),
        scaffoldBackgroundColor: Colors.red[50],
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.redAccent),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        useMaterial3: true,
      ),
      home: _initialized
          ? (_licenseBlock != null
              ? LicenseBlockedPage(result: _licenseBlock!)
              : !_isActivated
                  ? const ActivationPage()
              : (_hasExistingLogin ? const HomePage() : const LoginPage()))
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/company': (context) => const CompanySelectionPage(),
        '/menu': (context) => const MenuPage(),
        '/activate': (context) => const ActivationPage(),
        '/sales_quotation': (context) => const Scaffold(body: Center(child: Text('Sales Quotation - Coming Soon'))),
        '/sales_order': (context) => const Scaffold(body: Center(child: Text('Sales Order - Coming Soon'))),
        '/sales_invoice': (context) => const Scaffold(body: Center(child: Text('Sales Invoice - Coming Soon'))),
        '/inventory': (context) => const InventoryPage(),
        '/reports': (context) => const Scaffold(body: Center(child: Text('Reports - Coming Soon'))),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOnline = false;
  late Isar _isar;

  Isar? _isarInstance;
Future<Isar> openIsar() async {
  if (_isarInstance != null) return _isarInstance!;
  final dir = await getApplicationDocumentsDirectory();
  _isarInstance = await Isar.open([
    DummyItemSchema,
    CompanySchema,
    CustomerPluSchema,
  ], directory: dir.path);
  return _isarInstance!;
}

  Future<void> checkOnlineStatus() async {
    try {
      // Check SignalR connection status instead of HTTP
      final isConnected = signalRService.isConnected;
      setState(() {
        _isOnline = isConnected;
      });
    } catch (_) {
      setState(() {
        _isOnline = false;
      });
    }
  }

  Future<void> fetchAndStoreCustomers() async {
    print('Fetching customers via SignalR');
    try {
      // Use SignalR to get customers instead of HTTP
      final result = await signalRService.getCustomers(page: 1, limit: 10);
      
      print('SignalR result: $result');
      
      if (result != null && result.isNotEmpty) {
        final List<Map<String, dynamic>> data = result;
        final isar = await openIsar();
        await isar.writeTxn(() async {
          await isar.dummyItems.clear(); // Clear old data
          for (var item in data) {
            final name = item['Name']?.toString() ?? 'No Name';
            await isar.dummyItems.put(DummyItem()..name = name);
          }
        });
      } else {
        print('Failed to fetch data via SignalR');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to fetch data via SignalR')),
          );
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching data: $e')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    openIsar().then((isar) {
      _isar = isar;
      setState(() {});
    });
    checkOnlineStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMS Customer'),
        actions: [
          IconButton(
            icon: Icon(
              _isOnline ? Icons.cloud : Icons.cloud_off,
              color: _isOnline ? Colors.blue : Colors.grey,
            ),
            tooltip: _isOnline ? 'Online' : 'Offline',
            onPressed: checkOnlineStatus,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await fetchAndStoreCustomers();
                checkOnlineStatus();
              },
              child: const Text('Fetch Customers from API'),
            ),
          ),
          Expanded(
            child: _isarInstance == null
                ? const Center(child: CircularProgressIndicator())
                : StreamBuilder<List<DummyItem>>(
                    stream: _isar.dummyItems.where().watch(fireImmediately: true),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: \\${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data found.'));
                      }
                      final items = snapshot.data!;
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(items[index].name),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
