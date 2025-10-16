import 'package:flutter/material.dart';
import '../services/enhanced_sync_service.dart';
import '../services/signalr_service.dart';
import '../services/auth_service.dart';
import '../services/inventory_service.dart';
import '../main.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/invoice.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../models/group_lookup.dart';
import '../models/department_lookup.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final EnhancedSyncService _syncService;
  final SignalRService _signalRService = SignalRService();
  final AuthService _authService = AuthService();
  
  bool _isSyncing = false;
  String _syncStatus = 'Ready';
  DateTime? _lastSyncTime;
  
  // Cache statistics
  int _quotesCount = 0;
  int _invoicesCount = 0;
  int _customersCount = 0;
  int _inventoryCount = 0;
  
  @override
  void initState() {
    super.initState();
    _syncService = EnhancedSyncService(isar, _signalRService);
    _loadCacheStats();
    _loadLastSyncTime();
  }
  
  Future<void> _loadCacheStats() async {
    try {
      final quotes = await isar.quotes.count();
      final invoices = await isar.invoices.count();
      final customers = await isar.customers.count();
      final inventory = await isar.inventoryItems.count();
      
      setState(() {
        _quotesCount = quotes;
        _invoicesCount = invoices;
        _customersCount = customers;
        _inventoryCount = inventory;
      });
    } catch (e) {
      print('Error loading cache stats: $e');
    }
  }
  
  Future<void> _loadLastSyncTime() async {
    try {
      // SyncInfo doesn't exist in this schema, use a placeholder
      setState(() {
        _lastSyncTime = DateTime.now(); // Placeholder
      });
    } catch (e) {
      print('Error loading last sync time: $e');
    }
  }
  
  Future<void> _performFullSync() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing all data...';
    });
    
    try {
      // Perform full sync (no parameters needed)
      await _syncService.performSync();
      
      // Reload stats
      await _loadCacheStats();
      await _loadLastSyncTime();
      
      setState(() {
        _syncStatus = 'Sync completed successfully!';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Full sync completed successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _syncStatus = 'Sync failed: $e';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }
  
  Future<void> _syncGroupsAndDepartments() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing group & department descriptions...';
    });
    
    try {
      final inventoryService = InventoryService(_signalRService);
      
      // Get all companies
      final companies = await isar.companys.where().findAll();
      int totalGroups = 0;
      int totalDepartments = 0;
      
      for (final company in companies) {
        final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
        if (companyCode <= 0) continue;
        
        setState(() {
          _syncStatus = 'Syncing lookups for ${company.companyName}...';
        });
        
        // Fetch and cache groups
        final groups = await inventoryService.getGroupMap(companyCode: companyCode);
        totalGroups += groups.length;
        
        // Fetch and cache departments
        final departments = await inventoryService.getDepartmentMap(companyCode: companyCode);
        totalDepartments += departments.length;
      }
      
      setState(() {
        _syncStatus = 'Sync completed! $totalGroups groups, $totalDepartments departments';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced $totalGroups groups, $totalDepartments departments'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _syncStatus = 'Sync failed: $e';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }
  
  Future<void> _clearCache(String type) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: Text('Are you sure you want to clear $type cache?\n\nThis will remove all locally stored data and require a fresh sync.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    try {
      await isar.writeTxn(() async {
        switch (type) {
          case 'Quotations':
            await isar.collection<Quote>().clear();
            await isar.collection<QuoteItem>().clear();
            break;
          case 'Invoices':
            await isar.collection<Invoice>().clear();
            await isar.collection<InvoiceItem>().clear();
            break;
          case 'Customers':
            await isar.collection<Customer>().clear();
            break;
          case 'Inventory':
            await isar.collection<InventoryItem>().clear();
            await isar.collection<InStockUom>().clear();
            break;
          case 'All':
            await isar.collection<Quote>().clear();
            await isar.collection<QuoteItem>().clear();
            await isar.collection<Invoice>().clear();
            await isar.collection<InvoiceItem>().clear();
            await isar.collection<Customer>().clear();
            await isar.collection<InventoryItem>().clear();
            await isar.collection<InStockUom>().clear();
            break;
        }
      });
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ $type cache cleared'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to clear cache: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  String _formatLastSync() {
    if (_lastSyncTime == null) return 'Never';
    
    final now = DateTime.now();
    final diff = now.difference(_lastSyncTime!);
    
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Settings'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _loadCacheStats();
          await _loadLastSyncTime();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Sync Status Card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _signalRService.isConnected ? Icons.cloud_done : Icons.cloud_off,
                          color: _signalRService.isConnected ? Colors.green : Colors.grey,
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _signalRService.isConnected ? 'Connected' : 'Offline',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Last sync: ${_formatLastSync()}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (_isSyncing) ...[
                      const SizedBox(height: 16),
                      const LinearProgressIndicator(),
                      const SizedBox(height: 8),
                      Text(
                        _syncStatus,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Sync Actions
            const Text(
              'Sync Actions',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            ElevatedButton.icon(
              onPressed: _isSyncing ? null : _performFullSync,
              icon: const Icon(Icons.sync),
              label: const Text('Full Sync'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            
            const SizedBox(height: 12),
            
            ElevatedButton.icon(
              onPressed: _isSyncing ? null : _syncGroupsAndDepartments,
              icon: const Icon(Icons.label),
              label: const Text('Sync Group & Department Descriptions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Cache Statistics
            const Text(
              'Cache Statistics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            _buildCacheStatCard(
              'Quotations',
              _quotesCount,
              Icons.description,
              Colors.blue,
            ),
            const SizedBox(height: 8),
            
            _buildCacheStatCard(
              'Invoices',
              _invoicesCount,
              Icons.receipt_long,
              Colors.green,
            ),
            const SizedBox(height: 8),
            
            _buildCacheStatCard(
              'Customers',
              _customersCount,
              Icons.people,
              Colors.orange,
            ),
            const SizedBox(height: 8),
            
            _buildCacheStatCard(
              'Inventory Items',
              _inventoryCount,
              Icons.inventory_2,
              Colors.purple,
            ),
            
            const SizedBox(height: 24),
            
            // Clear Cache Actions
            const Text(
              'Clear Cache',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            OutlinedButton.icon(
              onPressed: () => _clearCache('All'),
              icon: const Icon(Icons.delete_sweep),
              label: const Text('Clear All Cache'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Info Card
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue.shade700),
                        const SizedBox(width: 8),
                        const Text(
                          'About Offline-First Sync',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '• Data loads instantly from local cache\n'
                      '• Background sync keeps data fresh\n'
                      '• Works seamlessly offline\n'
                      '• Manual sync available anytime',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCacheStatCard(String title, int count, IconData icon, Color color) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.delete_outline, size: 20),
              onPressed: () => _clearCache(title),
              color: Colors.red.shade300,
              tooltip: 'Clear $title cache',
            ),
          ],
        ),
      ),
    );
  }
}
