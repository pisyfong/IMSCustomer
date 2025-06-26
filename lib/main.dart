import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';
import 'company_selection_page.dart';
import 'menu_page.dart';
import 'company.dart';
import 'sync_info.dart';
import 'current_login.dart';
import 'selected_company.dart';
import 'services/auth_service.dart';
import 'dart:convert';

part 'main.g.dart';

@Collection()
class DummyItem {
  Id id = Isar.autoIncrement;
  late String name;
}


// Global Isar instance
late Isar isar;

// Initialize Isar and open the database
Future<void> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [DummyItemSchema, CompanySchema, SyncInfoSchema, CurrentLoginSchema, SelectedCompanySchema],
    directory: dir.path,
  );
  
  // Initialize SyncInfo if it doesn't exist
  final syncInfo = await isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
  if (syncInfo == null) {
    final initialSyncInfo = SyncInfo.create();
    initialSyncInfo.lastSyncTime = DateTime.now();
    initialSyncInfo.isOnline = false;
    
    await isar.writeTxn(() async {
      await isar.syncInfos.put(initialSyncInfo);
    });
  }
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
  
  @override
  void initState() {
    super.initState();
    _checkForExistingLogin();
  }
  
  Future<void> _checkForExistingLogin() async {
    final authService = AuthService();
    final hasLogin = await authService.hasSavedLogin();
    
    if (hasLogin) {
      await authService.loadSavedLogin();
    }
    
    setState(() {
      _hasExistingLogin = hasLogin;
      _initialized = true;
    });
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
          ? (_hasExistingLogin ? const CompanySelectionPage() : const LoginPage())
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
      routes: {
        '/login': (context) => const LoginPage(),
        '/company': (context) => const CompanySelectionPage(),
        '/menu': (context) => const MenuPage(),
        '/home': (context) => const MyHomePage(title: 'IMS Customer'),
        '/sales_quotation': (context) => const Scaffold(body: Center(child: Text('Sales Quotation - Coming Soon'))),
        '/sales_order': (context) => const Scaffold(body: Center(child: Text('Sales Order - Coming Soon'))),
        '/sales_invoice': (context) => const Scaffold(body: Center(child: Text('Sales Invoice - Coming Soon'))),
        '/inventory': (context) => const Scaffold(body: Center(child: Text('Inventory - Coming Soon'))),
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
    const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=1';
    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 3));
      setState(() {
        _isOnline = response.statusCode == 200;
      });
    } catch (_) {
      setState(() {
        _isOnline = false;
      });
    }
  }

  Future<void> fetchAndStoreCustomers() async {
    // Replace with your actual local IP if running on a device
    const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=10';
    print('Fetching: $apiUrl');
    try {
      final response = await http.get(Uri.parse(apiUrl));
      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> data = json['data'];
        final isar = await openIsar();
        await isar.writeTxn(() async {
          await isar.dummyItems.clear(); // Clear old data
          for (var item in data) {
            final name = item['Name']?.toString() ?? 'No Name';
            await isar.dummyItems.put(DummyItem()..name = name);
          }
        });
      } else {
        print('Failed to fetch data: Status ${response.statusCode}');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to fetch data: Status ${response.statusCode}')),
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
