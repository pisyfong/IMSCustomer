import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
// HTTP removed - using SignalR-only architecture
import 'login_page.dart';
import 'company_selection_page.dart';
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
import 'services/auth_service.dart';
import 'services/signalr_service.dart';
import 'services/enhanced_sync_service.dart';
import 'config/app_config.dart';
import 'services/offline_first_service.dart';
import 'dart:convert';
import 'services/activation_service.dart';
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
  void _startFullDataPreload() {
    print('🔍 DEBUG: _startFullDataPreload method called');
    // Run preload in background without blocking UI
    Future.delayed(Duration.zero, () async {
      try {
        print('🚀 APP STARTUP: Starting background data preload...');
        print('🔍 DEBUG: About to call enhancedSyncService.preloadAllDataAtStartup()');
        await enhancedSyncService.preloadAllDataAtStartup();
        print('✅ APP STARTUP: Background data preload completed');
      } catch (e) {
        print('❌ APP STARTUP: Background data preload failed: $e');
        print('📱 APP STARTUP: App will work in offline mode with cached data');
        // Don't break the app if preload fails - offline-first approach
      }
    });
    print('🔍 DEBUG: Future.delayed scheduled for preload');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMS Customer',
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
          ? (!_isActivated
              ? const ActivationPage()
              : (_hasExistingLogin ? const CompanySelectionPage() : const LoginPage()))
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
      routes: {
        '/login': (context) => const LoginPage(),
        '/company': (context) => const CompanySelectionPage(),
        '/menu': (context) => const MenuPage(),
        '/home': (context) => const MyHomePage(title: 'IMS Customer'),
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
