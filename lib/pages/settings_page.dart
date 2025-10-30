import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'dart:async';
import '../services/enhanced_sync_service.dart';
import '../services/signalr_service.dart';
import '../services/auth_service.dart';
import '../services/inventory_service.dart';
import '../services/invoice_service.dart';
import '../services/inventory_image_service.dart';
import '../services/offline_first_service.dart';
import '../services/plu_service.dart';
import '../main.dart';
import '../sync_info.dart';
import '../company.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/quotation.dart';
import '../models/invoice.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../models/group_lookup.dart';
import '../models/department_lookup.dart';
import '../models/plu.dart';
import '../models/customer_plu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {
  late final EnhancedSyncService _syncService;
  final SignalRService _signalRService = SignalRService();
  final AuthService _authService = AuthService();
  final InventoryImageService _imageService = InventoryImageService();
  late final AnimationController _animationController;
  late final Animation<double> _rotationAnimation;
  StreamSubscription<bool>? _syncStatusSubscription;
  Timer? _refreshTimer;
  
  bool _isSyncing = false;
  String _syncStatus = 'Ready';
  DateTime? _lastSyncTime;
  double _syncProgress = 0.0;
  
  // Cache statistics
  int _quotesCount = 0;
  int _quoteItemsCount = 0;
  int _unsyncedQuotesCount = 0;
  int _invoicesCount = 0;
  int _invoiceItemsCount = 0;
  int _customersCount = 0;
  int _inventoryCount = 0;
  int _pluCount = 0;
  int _customerPluCount = 0;
  int _groupsCount = 0;
  int _departmentsCount = 0;
  int _uomCount = 0;
  
  // Image cache statistics
  int _cachedImagesCount = 0;
  String _imageCacheSize = '0 MB';
  
  // Connection status
  bool _isOnline = false;
  bool _signalRConnected = false;
  List<Quotation> _unsyncedQuotations = [];
  bool _showUnsyncedTable = false;
  
  @override
  void initState() {
    super.initState();
    _syncService = EnhancedSyncService(isar, _signalRService);
    _imageService.initialize();
    
    // Setup animation controller for sync icon
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
    
    // Listen to sync status
    _syncStatusSubscription = _syncService.syncStatus.listen((isSyncing) {
      setState(() {
        _isSyncing = isSyncing;
        if (isSyncing) {
          _animationController.repeat();
        } else {
          _animationController.stop();
          _loadCacheStats();
        }
      });
    });
    
    // Auto-refresh stats every 30 seconds
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!_isSyncing) _loadCacheStats();
    });
    
    _loadCacheStats();
    _loadLastSyncTime();
    _checkConnectionStatus();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    _syncStatusSubscription?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }
  
  Future<void> _checkConnectionStatus() async {
    try {
      final isOnline = await OfflineFirstService.isServerReachable();
      setState(() {
        _isOnline = isOnline;
        _signalRConnected = _signalRService.isConnected;
      });
    } catch (e) {
      setState(() {
        _isOnline = false;
        _signalRConnected = false;
      });
    }
  }
  
  Future<void> _loadCacheStats() async {
    try {
      // Load all statistics in parallel for better performance
      final quotesCount = await isar.quotes.count();
      final quoteItemsCount = await isar.quoteItems.count();
      final unsyncedQuotesCount = await isar.quotations.filter().isSyncedEqualTo(false).count();
      final unsyncedQuotations = await isar.quotations.filter().isSyncedEqualTo(false).findAll();
      final invoicesCount = await isar.invoices.count();
      final invoiceItemsCount = await isar.invoiceItems.count();
      final customersCount = await isar.customers.count();
      final inventoryCount = await isar.inventoryItems.count();
      final pluCount = await isar.plus.count();
      final customerPluCount = await isar.customerPlus.count();
      final groupsCount = await isar.groupLookups.count();
      final departmentsCount = await isar.departmentLookups.count();
      final uomCount = await isar.inStockUoms.count();
      
      // Load image cache stats
      final imageStats = await _imageService.getCacheStats();
      
      print('📊 SETTINGS: Unsynced quotations count: $unsyncedQuotesCount');
      print('📊 SETTINGS: Unsynced quotations list length: ${unsyncedQuotations.length}');
      if (unsyncedQuotations.isNotEmpty) {
        print('📊 SETTINGS: First unsynced: ${unsyncedQuotations.first.quotePreLabel}');
      }
      
      setState(() {
        _quotesCount = quotesCount;
        _quoteItemsCount = quoteItemsCount;
        _unsyncedQuotesCount = unsyncedQuotesCount;
        _unsyncedQuotations = unsyncedQuotations;
        _invoicesCount = invoicesCount;
        _invoiceItemsCount = invoiceItemsCount;
        _customersCount = customersCount;
        _inventoryCount = inventoryCount;
        _pluCount = pluCount;
        _customerPluCount = customerPluCount;
        _groupsCount = groupsCount;
        _departmentsCount = departmentsCount;
        _uomCount = uomCount;
        
        _cachedImagesCount = imageStats['totalCachedImages'] ?? 0;
        _imageCacheSize = imageStats['totalSizeFormatted'] ?? '0 MB';
      });
    } catch (e) {
      print('Error loading cache stats: $e');
    }
  }
  
  Future<void> _loadLastSyncTime() async {
    try {
      final syncInfo = await isar.syncInfos.where().idEqualTo(SyncInfo.singletonId).findFirst();
      setState(() {
        _lastSyncTime = syncInfo?.lastSyncTime;
      });
    } catch (e) {
      print('Error loading last sync time: $e');
    }
  }
  
  Future<void> _performFullSync() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Starting full sync...';
    });
    
    try {
      // Step 1: Core sync (customers, inventory, quotes)
      setState(() {
        _syncStatus = 'Syncing core data...';
      });
      await _syncService.performSync();
      
      // Step 2: Sync PLU codes
      setState(() {
        _syncStatus = 'Syncing PLU codes...';
      });
      try {
        final pluService = PluService(isar);
        // Fetch all PLUs from server and sync to local database
        await pluService.syncPlus();
      } catch (e) {
        print('⚠️ PLU sync failed during full sync: $e');
      }
      
      // Step 3: Sync Customer PLU mappings
      setState(() {
        _syncStatus = 'Syncing customer PLU mappings...';
      });
      try {
        await _syncService.syncCustomerPlu();
      } catch (e) {
        print('⚠️ Customer PLU sync failed during full sync: $e');
      }
      
      // Step 4: Sync UOM Pricing
      setState(() {
        _syncStatus = 'Syncing UOM pricing...';
      });
      try {
        await _syncUomPricing();
      } catch (e) {
        print('⚠️ UOM pricing sync failed during full sync: $e');
      }
      
      // Step 5: Sync Invoices
      setState(() {
        _syncStatus = 'Syncing invoices...';
      });
      try {
        final invoiceService = InvoiceService(_signalRService);
        await _syncService.preloadAllInvoices();
      } catch (e) {
        print('⚠️ Invoice sync failed during full sync: $e');
      }
      
      // Step 6: Sync Invoice Items
      setState(() {
        _syncStatus = 'Syncing invoice items...';
      });
      try {
        final invoiceService = InvoiceService(_signalRService);
        final invoices = await isar.invoices.where().findAll();
        for (final invoice in invoices) {
          if (invoice.invoicePreLabel.isEmpty || invoice.companyCode == null) continue;
          try {
            await invoiceService.getInvoiceItems(
              companyCode: invoice.companyCode is String 
                  ? int.tryParse(invoice.companyCode as String) ?? 1 
                  : invoice.companyCode as int,
              invoicePreLabel: invoice.invoicePreLabel,
            );
          } catch (e) {
            // Continue with next invoice
          }
        }
      } catch (e) {
        print('⚠️ Invoice items sync failed during full sync: $e');
      }
      
      // Reload stats
      await _loadCacheStats();
      await _loadLastSyncTime();
      
      setState(() {
        _syncStatus = 'Full sync completed!';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Full sync completed successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
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
  
  Future<void> _syncUomPricing() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing UOM pricing data...';
    });
    
    try {
      final inventoryService = InventoryService();
      
      // Get all inventory items to sync their UOM pricing
      final inventoryItems = await isar.inventoryItems.where().findAll();
      int syncedCount = 0;
      int totalItems = inventoryItems.length;
      
      for (final item in inventoryItems) {
        setState(() {
          _syncStatus = 'Syncing UOM pricing... ($syncedCount/$totalItems)';
        });
        
        try {
          // Force refresh to get latest UOM pricing from server
          await inventoryService.getUomPricing(
            companyCode: item.companyCode,
            skuNo: item.skuNo,
            forceRefresh: true,
          );
          syncedCount++;
        } catch (e) {
          print('⚠️ Failed to sync UOM pricing for SKU ${item.skuNo}: $e');
          // Continue with next item
        }
        
        // Small delay to prevent overwhelming the server
        if (syncedCount % 10 == 0) {
          await Future.delayed(const Duration(milliseconds: 100));
        }
      }
      
      await _loadCacheStats(); // Refresh stats
      
      setState(() {
        _syncStatus = 'UOM pricing sync completed! Synced $syncedCount items';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced UOM pricing for $syncedCount items'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _syncStatus = 'UOM pricing sync failed: $e';
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ UOM pricing sync failed: $e'),
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
      final inventoryService = InventoryService();
      
      // Get all companies using collection accessor
      final IsarCollection<Company> companyCollection = isar.collection<Company>();
      final companies = await companyCollection.where().findAll();
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
        totalGroups += groups.length as int;
        
        // Fetch and cache departments
        final departments = await inventoryService.getDepartmentMap(companyCode: companyCode);
        totalDepartments += departments.length as int;
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
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Sync & Storage'),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Icon(
                    Icons.refresh,
                    color: _isSyncing ? Colors.white70 : Colors.white,
                  ),
                );
              },
            ),
            onPressed: _isSyncing ? null : () async {
              await _checkConnectionStatus();
              await _loadCacheStats();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _checkConnectionStatus();
          await _loadCacheStats();
          await _loadLastSyncTime();
        },
        child: CustomScrollView(
          slivers: [
            // Connection Status Header
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.primaryColor,
                      theme.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildConnectionStatus(),
                        const SizedBox(height: 16),
                        if (_isSyncing) _buildSyncProgress(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Main Content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Quick Actions
                  _buildSectionTitle('Quick Actions'),
                  const SizedBox(height: 12),
                  _buildActionButtons(),
                  
                  const SizedBox(height: 24),
                  
                  // Storage Overview
                  _buildSectionTitle('Storage Overview'),
                  const SizedBox(height: 12),
                  _buildStorageOverview(),
                  
                  const SizedBox(height: 24),
                  
                  // Detailed Statistics
                  _buildSectionTitle('Detailed Statistics'),
                  const SizedBox(height: 12),
                  _buildDetailedStats(),
                  
                  const SizedBox(height: 24),
                  
                  // Maintenance
                  _buildSectionTitle('Maintenance'),
                  const SizedBox(height: 12),
                  _buildMaintenanceSection(),
                  
                  const SizedBox(height: 80), // Bottom padding
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildConnectionStatus() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _isOnline ? Colors.green.shade50 : Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isOnline ? Icons.cloud_done : Icons.cloud_off,
              size: 32,
              color: _isOnline ? Colors.green.shade600 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOnline ? 'Online' : 'Offline Mode',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Last sync: ${_formatLastSync()}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                if (_signalRConnected)
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'SignalR Connected',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSyncProgress() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: _syncProgress > 0 ? _syncProgress : null,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _syncStatus,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
  
  Widget _buildActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          icon: Icons.sync_alt,
          label: 'Full Sync',
          subtitle: 'Sync all data from server',
          color: Colors.blue,
          onPressed: _isSyncing ? null : _performFullSync,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.image,
          label: 'Sync Images',
          subtitle: 'Download all product images',
          color: Colors.purple,
          onPressed: _isSyncing ? null : _syncImages,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.receipt,
          label: 'Sync Invoices',
          subtitle: 'Update invoice history',
          color: Colors.green,
          onPressed: _isSyncing ? null : _syncInvoices,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.receipt_long,
          label: 'Sync Invoice Items',
          subtitle: 'Update invoice line items',
          color: Colors.teal,
          onPressed: _isSyncing ? null : _syncInvoiceItems,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.qr_code_2,
          label: 'Sync PLU',
          subtitle: 'Update product lookup codes',
          color: Colors.orange,
          onPressed: _isSyncing ? null : _syncPLU,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.straighten,
          label: 'Sync UOM Pricing',
          subtitle: 'Update unit pricing & options',
          color: Colors.cyan,
          onPressed: _isSyncing ? null : _syncUomPricing,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.person_pin,
          label: 'Sync Customer PLU',
          subtitle: 'Update customer-specific PLUs',
          color: Colors.indigo,
          onPressed: _isSyncing ? null : _syncCustomerPLU,
        ),
      ],
    );
  }
  
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    VoidCallback? onPressed,
  }) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: onPressed == null
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withOpacity(0.05),
                      color.withOpacity(0.1),
                    ],
                  ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStorageOverview() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade50,
            Colors.purple.shade50,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue.shade100,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStorageStat(
                'Images',
                _cachedImagesCount.toString(),
                _imageCacheSize,
                Icons.image,
                Colors.purple,
              ),
              _buildStorageStat(
                'Invoices',
                _invoicesCount.toString(),
                '${_invoiceItemsCount} items',
                Icons.receipt_long,
                Colors.green,
              ),
              _buildStorageStat(
                'Inventory',
                _inventoryCount.toString(),
                '${_pluCount} PLUs',
                Icons.inventory_2,
                Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildStorageStat(
    String label,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildDetailedStats() {
    return Column(
      children: [
        _buildStatCard('Quotations', _quotesCount, _quoteItemsCount, 'items', Icons.description, Colors.blue),
        const SizedBox(height: 8),
        // Unsynced Quotations Card with Expandable Table
        // Show always for visibility (change to > 0 if you want to hide when empty)
        if (true)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade200, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.shade100,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.cloud_upload, color: Colors.orange.shade700, size: 24),
                  ),
                  title: Row(
                    children: [
                      const Text(
                        'Unsynced Quotations',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'PENDING',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Tap to ${_showUnsyncedTable ? "hide" : "view"} details',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _unsyncedQuotesCount.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        _showUnsyncedTable ? Icons.expand_less : Icons.expand_more,
                        color: Colors.orange.shade700,
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _showUnsyncedTable = !_showUnsyncedTable;
                    });
                  },
                ),
                if (_showUnsyncedTable) _buildUnsyncedQuotationsTable(),
              ],
            ),
          ),
        _buildStatCard('Invoices', _invoicesCount, _invoiceItemsCount, 'items', Icons.receipt_long, Colors.green),
        const SizedBox(height: 8),
        _buildStatCard('Customers', _customersCount, _customerPluCount, 'PLU mappings', Icons.people, Colors.orange),
        const SizedBox(height: 8),
        _buildStatCard('PLU Codes', _pluCount, 0, '', Icons.qr_code_2, Colors.amber),
        const SizedBox(height: 8),
        _buildStatCard('Inventory', _inventoryCount, _uomCount, 'UOM options', Icons.inventory_2, Colors.purple),
        const SizedBox(height: 8),
        _buildStatCard('Lookups', _groupsCount, _departmentsCount, 'departments', Icons.category, Colors.teal),
      ],
    );
  }
  
  Widget _buildStatCard(
    String title,
    int mainCount,
    int subCount,
    String subLabel,
    IconData icon,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '$subCount $subLabel',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Text(
          mainCount.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
  
  Widget _buildMaintenanceSection() {
    return Column(
      children: [
        _buildMaintenanceButton(
          'Clear All Cache',
          'Remove all cached data',
          Icons.delete_sweep,
          Colors.red,
          () => _clearCache('All'),
        ),
        const SizedBox(height: 12),
        _buildMaintenanceButton(
          'Clear Image Cache',
          'Free up $_imageCacheSize',
          Icons.image_not_supported,
          Colors.orange,
          _clearImageCache,
        ),
      ],
    );
  }
  
  Widget _buildMaintenanceButton(
    String label,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        side: BorderSide(color: color.withOpacity(0.5)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Future<void> _syncImages() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Downloading product images...';
    });
    
    try {
      // Initialize image service
      final imageService = InventoryImageService();
      await imageService.initialize();
      
      // Get all companies
      final companies = await isar.companys.where().findAll();
      int totalImagesDownloaded = 0;
      
      for (final company in companies) {
        final companyCode = int.tryParse(company.companyCode ?? '0') ?? 0;
        if (companyCode <= 0) continue;
        
        // Check if this company has image configuration
        if (!imageService.hasImageConfig(companyCode)) {
          continue;
        }
        
        setState(() {
          _syncStatus = 'Downloading images for ${company.companyName}...';
        });
        
        // Get all inventory items for this company
        final inventoryItems = await isar.inventoryItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
        
        // Download images in batches
        final List<Future<String?>> downloadTasks = [];
        int processedCount = 0;
        int successCount = 0;
        
        for (final item in inventoryItems) {
          final imageUrl = imageService.getImageUrl(companyCode, item.skuNo, item.uom);
          if (imageUrl != null) {
            // Check if already cached
            final isCached = await imageService.isImageCached(imageUrl, companyCode, item.skuNo);
            if (!isCached) {
              // Queue download
              downloadTasks.add(
                imageService.downloadAndCacheImage(imageUrl, companyCode, item.skuNo, item.uom)
                  .timeout(const Duration(seconds: 10), onTimeout: () {
                    print('⏱️ Timeout downloading: $imageUrl');
                    return null;
                  })
              );
              
              // Process in batches of 20
              if (downloadTasks.length >= 20) {
                final results = await Future.wait(downloadTasks);
                final successful = results.where((path) => path != null).length;
                processedCount += downloadTasks.length;
                successCount += successful;
                totalImagesDownloaded += successful;
                downloadTasks.clear();
                
                setState(() {
                  _syncStatus = '${company.companyName}: $successCount successful, $processedCount processed';
                });
                
                print('📊 Batch complete: $successful/$processedCount successful');
              }
            }
          }
        }
        
        // Process remaining downloads
        if (downloadTasks.isNotEmpty) {
          final results = await Future.wait(downloadTasks);
          final successful = results.where((path) => path != null).length;
          successCount += successful;
          totalImagesDownloaded += successful;
          
          print('📊 Final batch: $successful/${downloadTasks.length} successful');
          print('📊 Total for ${company.companyName}: $successCount successful downloads');
        }
      }
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Downloaded $totalImagesDownloaded new images'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('❌ Image sync error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Image sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
        _syncStatus = 'Ready';
      });
    }
  }
  
  Future<void> _syncInvoices() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing invoices...';
    });
    
    try {
      final invoiceService = InvoiceService(_signalRService);
      final customers = await isar.customers.where().findAll();
      int totalSynced = 0;
      
      for (final customer in customers) {
        if (customer.code.isEmpty || customer.companyCode == null) continue;
        
        setState(() {
          _syncStatus = 'Syncing invoices for ${customer.name}...';
        });
        
        final invoices = await invoiceService.getInvoices(
          companyCode: customer.companyCode,
          customerCode: customer.code,
        );
        
        totalSynced += invoices.length as int;
      }
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced $totalSynced invoices'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Invoice sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
        _syncStatus = 'Ready';
      });
    }
  }
  
  Future<void> _syncInvoiceItems() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing invoice items...';
    });
    
    try {
      final invoiceService = InvoiceService(_signalRService);
      final invoices = await isar.invoices.where().findAll();
      int totalSynced = 0;
      int processedCount = 0;
      
      for (final invoice in invoices) {
        if (invoice.invoicePreLabel.isEmpty || invoice.companyCode == null) continue;
        
        processedCount++;
        setState(() {
          _syncStatus = 'Syncing items for invoice ${processedCount}/${invoices.length}...';
        });
        
        try {
          final items = await invoiceService.getInvoiceItems(
            companyCode: invoice.companyCode is String 
                ? int.tryParse(invoice.companyCode as String) ?? 1 
                : invoice.companyCode as int,
            invoicePreLabel: invoice.invoicePreLabel,
          );
          
          totalSynced += items.length;
        } catch (e) {
          print('⚠️ Failed to sync items for ${invoice.invoicePreLabel}: $e');
        }
      }
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced $totalSynced invoice items from ${processedCount} invoices'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Invoice items sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
        _syncStatus = 'Ready';
      });
    }
  }
  
  Future<void> _syncPLU() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing PLU codes...';
    });
    
    try {
      final pluService = PluService(isar);
      
      // Fetch all PLUs from server and sync to local database
      await pluService.syncPlus();
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced ${_pluCount} PLU codes'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ PLU sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
        _syncStatus = 'Ready';
      });
    }
  }
  
  Future<void> _syncCustomerPLU() async {
    setState(() {
      _isSyncing = true;
      _syncStatus = 'Syncing customer PLU mappings...';
    });
    
    try {
      // Call the enhanced sync service method for customer PLU
      await _syncService.syncCustomerPlu();
      
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced ${_customerPluCount} customer PLU mappings'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Customer PLU sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
        _syncStatus = 'Ready';
      });
    }
  }
  
  Future<void> _clearImageCache() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Image Cache'),
        content: Text('This will free up $_imageCacheSize of storage.\n\nImages will be re-downloaded when needed.'),
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
    
    if (confirmed == true) {
      await _imageService.clearCache();
      await _loadCacheStats();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Image cache cleared'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  Widget _buildUnsyncedQuotationsTable() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Quote No',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Customer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  alignment: Alignment.center,
                  child: const Text(
                    'Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Table Rows
          _unsyncedQuotations.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 48,
                          color: Colors.green.shade400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'All quotations are synced!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'No pending quotations to upload',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _unsyncedQuotations.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                  itemBuilder: (context, index) {
                    final quotation = _unsyncedQuotations[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              quotation.quotePreLabel,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              quotation.customer ?? 'N/A',
                              style: const TextStyle(fontSize: 11),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'RM ${(quotation.netAmount ?? 0).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade600,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.schedule,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
