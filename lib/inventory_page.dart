import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;
import 'models/inventory_item.dart';
import 'models/plu.dart';
import '../services/inventory_service.dart';
import '../services/auth_service.dart';
import '../services/plu_service.dart';
import '../services/signalr_service.dart';
import '../services/cart_service.dart';
import '../services/inventory_image_service.dart';
import '../services/user_app_settings_service.dart';
import '../main.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import 'pages/cart_page.dart';
import 'widgets/inventory_image_widget.dart';
import 'online_status_icon.dart';
import 'pages/barcode_scanner_page.dart';
import 'services/customer_state_service.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/invoice.dart';
import '../services/invoice_service.dart';
import 'widgets/inventory_details_bottom_sheet.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  final InventoryService _inventoryService = InventoryService();
  // final InventoryImageService _imageService = InventoryImageService();
  final AuthService _authService = AuthService();
  final CartService _cartService = CartService();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _pluController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late final PluService _pluService;

  List<InventoryItem> _inventoryItems = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _isOnline = false;
  String _errorMessage = '';
  String _debugInfo = '';
  Map<String, dynamic>? _selectedCompany;
  // Quantity selections per SKU
  final Map<int, int> _qtySelections = {};
  // Price selections per SKU (for custom pricing in bottom sheet)
  final Map<int, double> _priceSelections = {};
  
  // Pagination
  static const int _pageSize = 50;
  int _cartItemCount = 0;
  int _currentOffset = 0;
  bool _hasMoreData = true;
  
  // Search and Filters
  String _currentSearchQuery = '';
  String _scannedPluNo = ''; // Track the scanned PLU barcode for display
  InventoryFilter _currentFilter = InventoryFilter()..stockStatus = StockStatus.inStock;
  bool _showFilters = false;
  Map<String, List<String>> _filterOptions = {};
  bool _loadingFilterOptions = false;
  // Dept code -> description mapping (loaded on demand, cache in-memory per page lifecycle)
  Map<String, String> _deptDescriptions = {};
  // Group code -> description mapping
  Map<String, String> _groupDescriptions = {};
  // View toggle: grid or list
  bool _isGridView = true;
  // Side drawer filter state
  bool _showSideFilter = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Collapsible sections state (default: only Group expanded)
  final Map<String, bool> _sectionExpanded = {
    'more': false,
    'group': true,
    'department': false,
    'subDept': false,
    'category': false,
  };
  
  // Cache working UOMs to prevent multiple HTTP requests
  final Map<String, String?> _workingUomCache = {};
  
  // Loading guard to prevent multiple simultaneous data loads for same SKU
  final Set<int> _loadingSkus = {};

  @override
  void initState() {
    super.initState();
    _pluService = PluService(Isar.getInstance()!);
    _loadCompanyAndInventory();
    _loadCartCount();
    _setupScrollListener();
    _initializeServices();
    // Setup PLU search listener only (PLU still auto-searches)
    _pluController.addListener(_onPluSearchChanged);
  }

  Future<void> _loadCartCount() async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      final count = await _cartService.getCartItemCount(companyCode: companyCode);
      setState(() {
        _cartItemCount = count;
      });
    } catch (e) {
      print('❌ Error loading cart count: $e');
    }
  }

  Future<void> _loadGroupDescriptionsOnly() async {
    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      final grpMap = await _inventoryService.getGroupMap(companyCode: companyCode);
      if (grpMap.isNotEmpty) {
        setState(() {
          _groupDescriptions = grpMap;
        });
        print('🟦 InventoryPage: Loaded ${grpMap.length} group descriptions');
      } else {
        print('🟨 InventoryPage: Group descriptions map is empty (fallback to codes)');
      }
    } catch (e) {
      print('❌ InventoryPage: Failed to load group descriptions: $e');
    }
  }

  Future<void> _initializeServices() async {
    // Image service initialization removed - not implemented yet
  }



  @override
  void dispose() {
    _searchController.dispose();
    _pluController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 
          _scrollController.position.maxScrollExtent - 200) {
        _loadMoreInventory();
      }
    });
  }

  // Handle manual search execution (called by Enter key or search button)
  void _executeSearch() {
    final query = _searchController.text.trim();
    if (query != _currentSearchQuery) {
      _currentSearchQuery = query;
      // Search input changed — reload from local Isar (no server call).
      // The full catalog is always cached; clearing the filter just re-reads it.
      _resetAndLoadInventory();
    }
  }

  // Handle PLU search changes (like normal search)
  void _onPluSearchChanged() {
    final pluQuery = _pluController.text.trim();
    if (pluQuery.isEmpty) {
      // If PLU search is cleared, clear the main search too. Just re-read
      // from local Isar — the full catalog is already cached.
      if (_currentSearchQuery.isNotEmpty) {
        _currentSearchQuery = '';
        _resetAndLoadInventory();
      }
      return;
    }

    // Try to convert PLU to SKU for better search results
    _convertPluToSkuAndSearch(pluQuery);
  }

  // Convert PLU to SKU and search
  Future<void> _convertPluToSkuAndSearch(String pluQuery) async {
    try {
      print('🔍 PLU SEARCH: Looking up PLU: $pluQuery');
      
      // First try exact PLU lookup
      final plu = await _pluService.getPlu(pluQuery);
      print('🔍 PLU SEARCH: PLU lookup result: $plu');
      
      if (plu != null && plu.skuNo != null) {
        print('🔍 PLU SEARCH: Found PLU ${plu.pluNo} -> SKU ${plu.skuNo}');
        // Found exact PLU match, search by SKU
        if (plu.skuNo.toString() != _currentSearchQuery) {
          _currentSearchQuery = plu.skuNo.toString();
          print('🔍 PLU SEARCH: Searching inventory by SKU: ${_currentSearchQuery}');
          _resetAndLoadInventory();
        }
        return;
      }

      print('🔍 PLU SEARCH: No PLU found - not searching by text to avoid confusion');
      // Don't fallback to text search - it could match wrong items
    } catch (e) {
      print('🔍 PLU SEARCH: Error during PLU lookup: $e');
      // Don't fallback to text search - it could match wrong items
    }
  }

  // Handle Customer PLU search submission (for barcode scanner)
  // Searches offline Customer_PLU table for customer-specific codes
  Future<void> _onCustomerPluSearchSubmitted(String pluNo) async {
    if (pluNo.trim().isEmpty) return;

    final scannedPlu = pluNo.trim();
    print('🔍 CUSTOMER PLU SEARCH: Starting search for Customer PLU: "$scannedPlu"');

    // Get selected customer code
    final selectedCustomer = await _authService.getCurrentCustomer();
    final customerCode = selectedCustomer?['code']?.toString();
    
    if (customerCode == null || customerCode.isEmpty) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('No Customer Selected'),
            content: const Text('Please select a customer first to scan customer-specific barcodes.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
      return;
    }

    try {
      // Search the offline Customer_PLU table
      print('🔍 CUSTOMER PLU SEARCH: Searching offline Customer_PLU table for customer: $customerCode...');
      final offlineResults = await _pluService.searchCustomerPluOffline(scannedPlu, customerCode);
      
      if (offlineResults.isNotEmpty) {
        print('✅ CUSTOMER PLU SEARCH: Found ${offlineResults.length} matches in offline database');
        
        if (offlineResults.length == 1) {
          // Single match - show popup directly
          final skuNo = offlineResults[0].skuNo;
          print('✅ CUSTOMER PLU SEARCH: Single match - SKU: $skuNo, showing popup directly');
          await _showItemDetailsForSku(skuNo);
          return;
        } else {
          // Multiple matches - show selection dialog
          if (!mounted) return;
          
          final companyCode = int.tryParse(_selectedCompany?['companyCode']?.toString() ?? '0') ?? 0;
          
          final selectedItem = await showDialog<int>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Select Item'),
              content: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: offlineResults.length,
                  itemBuilder: (context, index) {
                    final item = offlineResults[index];
                    final skuNo = item.skuNo;
                    final plu = item.pluNo;
                    final uom = item.uom ?? '';
                    
                    // Skip if SKU is null
                    if (skuNo == null) return const SizedBox.shrink();
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => Navigator.pop(context, skuNo),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              // Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: InventoryImageWidget(
                                  companyCode: companyCode,
                                  skuNo: skuNo,
                                  uom: uom,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Product Details - Fetch description from inventory
                              Expanded(
                                child: FutureBuilder<String>(
                                  future: _getItemDescription(companyCode, skuNo),
                                  builder: (context, snapshot) {
                                    final description = snapshot.data ?? 'SKU $skuNo';
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Description (larger)
                                        Text(
                                          description,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        // SKU, PLU and UOM (smaller)
                                        Text(
                                          'SKU: $skuNo | PLU: $plu | UOM: $uom',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Icon(Icons.chevron_right, color: Colors.grey.shade400),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );

          if (selectedItem != null) {
            await _showItemDetailsForSku(selectedItem);
          }
          return;
        }
      }
      
      // No offline match found - show dialog message
      print('❌ CUSTOMER PLU SEARCH: No Customer PLU match found for barcode: "$scannedPlu"');
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Customer PLU Not Found'),
            content: Text('No customer-specific item found for barcode:\n$scannedPlu\n\nCustomer: $customerCode'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('❌ CUSTOMER PLU SEARCH: Error during search: $e');
    }
  }

  // Handle PLU search submission (for Enter key and barcode scanner)
  // Searches offline In_Stock_Plu table first, then falls back to server
  Future<void> _onPluSearchSubmitted(String pluNo) async {
    if (pluNo.trim().isEmpty) return;

    final scannedPlu = pluNo.trim();
    print('🔍 PLU SEARCH: Starting search for PLU: "$scannedPlu"');

    try {
      // First, search the offline In_Stock_PLU table
      print('🔍 PLU SEARCH: Searching offline In_Stock_PLU table...');
      final offlineResults = await _pluService.searchInStockPluOffline(scannedPlu);
      
      if (offlineResults.isNotEmpty) {
        print('✅ PLU SEARCH: Found ${offlineResults.length} matches in offline database');
        
        if (offlineResults.length == 1) {
          // Single match - show popup directly (faster, no filter tag)
          final skuNo = offlineResults[0].skuNo;
          if (skuNo != null) {
            print('✅ PLU SEARCH: Single match - SKU: $skuNo, showing popup directly');
            // Show bottom sheet directly without filter tag or inventory reload
            await _showItemDetailsForSku(skuNo);
            return;
          } else {
            // PLU found but no SKU - show error
            print('❌ PLU SEARCH: PLU found but SKU is null');
            if (mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Invalid PLU'),
                  content: Text('PLU "$scannedPlu" found but has no SKU assigned.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
            return;
          }
        } else {
          // Multiple matches - show selection dialog
          if (!mounted) return;
          
          final companyCode = int.tryParse(_selectedCompany?['companyCode']?.toString() ?? '0') ?? 0;
          
          final selectedItem = await showDialog<int>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Select Item'),
              content: SizedBox(
                width: double.maxFinite,
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: offlineResults.length,
                  itemBuilder: (context, index) {
                    final item = offlineResults[index];
                    final skuNo = item.skuNo;
                    final plu = item.pluNo;
                    final desc = item.desc1 ?? 'Item $skuNo';
                    final uom = item.uom ?? '';
                    
                    // Skip if SKU is null
                    if (skuNo == null) return const SizedBox.shrink();
                    
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => Navigator.pop(context, skuNo),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              // Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: InventoryImageWidget(
                                  companyCode: companyCode,
                                  skuNo: skuNo,
                                  uom: uom,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Description (larger)
                                    Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    // SKU, PLU and UOM (smaller)
                                    Text(
                                      'SKU: $skuNo | PLU: $plu | UOM: $uom',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right, color: Colors.grey.shade400),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );

          if (selectedItem != null) {
            // Show bottom sheet directly without filter tag or inventory reload
            await _showItemDetailsForSku(selectedItem);
          }
          return;
        }
      }
      
      // No offline match found - show dialog message
      print('❌ PLU SEARCH: No PLU match found for barcode: "$scannedPlu"');
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('PLU Not Found'),
            content: Text('No item found for barcode:\n$scannedPlu'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('❌ PLU SEARCH: Error during search: $e');
    }
  }

  Future<void> _loadCompanyAndInventory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _debugInfo = 'Loading company information...';
    });

    try {
      // Load selected company
      final selectedCompany = await _authService.getSelectedCompany();
      
      setState(() {
        _selectedCompany = selectedCompany;
        _debugInfo = 'Company loaded: ${selectedCompany?['companyName'] ?? 'Unknown'}';
      });

      // Sync PLU data first (in background)
      _syncPluData();

      // Load inventory
      await _loadInventory();

    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load company information: $e';
        _debugInfo = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  // Sync PLU data in background
  Future<void> _syncPluData() async {
    try {
      print('🔍 INVENTORY PAGE: Starting PLU sync...');
      await _pluService.syncPlus();
      print('✅ INVENTORY PAGE: PLU sync completed');
    } catch (e) {
      print('❌ INVENTORY PAGE: PLU sync failed: $e');
    }
  }

  Future<void> _loadInventory() async {
    if (_isLoadingMore) return;

    setState(() {
      if (_currentOffset == 0) {
        _isLoading = true;
        _inventoryItems.clear();
      } else {
        _isLoadingMore = true;
      }
      _debugInfo = 'Loading inventory items...';
    });

    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      
      final items = await _inventoryService.getInventory(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        filter: _currentFilter,
        limit: _pageSize,
        offset: _currentOffset,
      );

      List<InventoryItem> filteredItems = items;
      if (_currentFilter.stockStatus != null || 
          (_currentFilter.categories?.isNotEmpty ?? false) ||
          (_currentFilter.brands?.isNotEmpty ?? false)) {
        // Note: This is a simplified filter application - the service handles the full filtering
        filteredItems = items;
      }

      setState(() {
        if (_currentOffset == 0) {
          _inventoryItems = _dedupeByCompanySku(filteredItems);
        } else {
          final combined = List<InventoryItem>.from(_inventoryItems)..addAll(filteredItems);
          _inventoryItems = _dedupeByCompanySku(combined);
        }
        _hasMoreData = items.length == _pageSize;
        _currentOffset = _inventoryItems.length;
        _errorMessage = '';
      });

      setState(() {
        _isOnline = true;
        _debugInfo = 'Loaded ${_inventoryItems.length} inventory items';
      });

    } catch (e, stackTrace) {
      setState(() {
        _isLoading = false;
        _isLoadingMore = false;
        _errorMessage = 'Failed to load inventory: $e';
        _debugInfo = 'Error Details:\n$e\n\nStack Trace:\n$stackTrace';
      });
      print('❌ INVENTORY PAGE ERROR: $e');
      print('📍 Stack trace: $stackTrace');
    } finally {
      setState(() {
        _isLoading = false;
        _isLoadingMore = false;
      });
    }
  }

  Future<void> _loadMoreInventory() async {
    if (!_hasMoreData || _isLoadingMore) return;
    await _loadInventory();
  }

  void _resetAndLoadInventory({bool forceRefresh = false}) {
    _currentOffset = 0;
    _hasMoreData = true;
    if (forceRefresh) {
      _refreshInventory();
    } else {
      _loadInventory();
    }
  }

  Future<void> _refreshInventory() async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.refresh, color: Colors.green),
            SizedBox(width: 8),
            Text('Refresh Inventory'),
          ],
        ),
        content: const Text(
          'This will clear the local cache and fetch fresh inventory data from the server. Continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    // Clear inventory and show loading state
    setState(() {
      _inventoryItems = [];
      _isLoading = true;
      _currentOffset = 0;
      _hasMoreData = true;
      _debugInfo = 'Refreshing inventory from server...';
    });
    
    // Show feedback to user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🔄 Clearing cache and refreshing from server...'),
        duration: Duration(seconds: 2),
      ),
    );

    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      
      // Clear local database first to remove old flag3='N' items
      await isar.writeTxn(() async {
        if (companyCode != null) {
          await isar.inventoryItems.filter().companyCodeEqualTo(companyCode).deleteAll();
        }
      });
      
      // Force sync from server (clears cache and refetches)
      await _inventoryService.syncInventory(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        filter: _currentFilter,
      );
      
      // Fetch fresh data
      final items = await _inventoryService.getInventory(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        filter: _currentFilter,
        limit: _pageSize,
        offset: 0,
        forceRefresh: true,
      );

      if (mounted) {
        setState(() {
          _inventoryItems = _dedupeByCompanySku(items);
          _currentOffset = _inventoryItems.length;
          _hasMoreData = items.length == _pageSize;
          _isOnline = true;
          _isLoading = false;
          _debugInfo = 'Refreshed: ${items.length} inventory items';
          _errorMessage = '';
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Refreshed ${items.length} items from server'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }

    } catch (e) {
      print('❌ Error refreshing inventory: $e');
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to refresh inventory: $e';
          _debugInfo = 'Refresh error: $e';
          _isOnline = false;
          _isLoading = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to refresh: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  // Show dialog to clear inventory cache
  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.cleaning_services, color: Colors.orange),
              SizedBox(width: 8),
              Text('Clear Inventory Cache'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This will clear all cached inventory data and fetch fresh data from the server.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Choose an option:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('• Clear Current Company: Clears inventory cache for this company only'),
              const SizedBox(height: 4),
              const Text('• Clear All Companies: Clears all inventory cache (all companies)'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _clearCurrentCompanyCache();
              },
              child: const Text(
                'Clear Current Company',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _clearAllInventoryCache();
              },
              child: const Text(
                'Clear All Companies',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper: Active filter chips (same as original top panel chips)
  Widget _buildActiveFiltersChips() {
    return _buildFilterChips();
  }

  // Helper: Full filters content (exactly same structure used in top panel)
  Widget _buildFiltersContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.filter_list, size: 20),
            const SizedBox(width: 8),
            const Text(
              'Filters',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            TextButton(
              onPressed: _clearAllFilters,
              child: const Text('Clear All'),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // More Filters: stock status and brand
        _buildCollapsibleSection(
          title: 'More Filters',
          sectionKey: 'more',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stock Status
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  'Stock Status',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text('All Items'),
                    selected: _currentFilter.stockStatus == StockStatus.all || _currentFilter.stockStatus == null,
                    onSelected: (_) => _applyStockFilter(StockStatus.all),
                  ),
                  FilterChip(
                    label: const Text('In Stock'),
                    selected: _currentFilter.stockStatus == StockStatus.inStock,
                    onSelected: (_) => _applyStockFilter(StockStatus.inStock),
                    selectedColor: Colors.green.shade100,
                  ),
                  FilterChip(
                    label: const Text('Out of Stock'),
                    selected: _currentFilter.stockStatus == StockStatus.outOfStock,
                    onSelected: (_) => _applyStockFilter(StockStatus.outOfStock),
                    selectedColor: Colors.red.shade100,
                  ),
                  FilterChip(
                    label: const Text('Low Stock'),
                    selected: _currentFilter.stockStatus == StockStatus.lowStock,
                    onSelected: (_) => _applyStockFilter(StockStatus.lowStock),
                    selectedColor: Colors.orange.shade100,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_filterOptions['brands']?.isNotEmpty == true) ...[
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Brand',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: _filterOptions['brands']!
                      .map((brand) => FilterChip(
                            label: Text(brand),
                            selected: _currentFilter.brands?.contains(brand) ?? false,
                            onSelected: (_) => _toggleBrandFilter(brand),
                            selectedColor: Colors.cyan.shade100,
                          ))
                      .toList(),
                ),
              ],
            ],
          ),
        ),

        // Group Filter (collapsible)
        if (_filterOptions['groups']?.isNotEmpty == true) ...[
          _buildCollapsibleSection(
            title: 'Group',
            sectionKey: 'group',
            child: _loadingFilterOptions
                ? const CircularProgressIndicator(strokeWidth: 2)
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final int crossAxisCount = width >= 600
                          ? 6
                          : width >= 480
                              ? 5
                              : width >= 360
                                  ? 4
                                  : 3;
                      final groups = _filterOptions['groups']!;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: 1,
                        ),
                        itemCount: groups.length,
                        itemBuilder: (context, index) {
                          final group = groups[index];
                          final labelText = _groupDescriptions[group] ?? group;
                          final bool selected = _currentFilter.groups?.contains(group) ?? false;
                          return InkWell(
                            onTap: () => _toggleGroupFilter(group),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected ? Colors.purple.shade50 : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selected ? Colors.purple.shade300 : const Color(0xFFE0E0E0),
                                  width: selected ? 2 : 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    labelText,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 1.15,
                                      fontWeight: FontWeight.w600,
                                      color: selected ? Colors.purple.shade700 : Colors.black87,
                                    ),
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
          if (_groupDescriptions.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 14, color: Colors.black45),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Showing group codes (descriptions not available). Ensure server exposes group lookup.',
                      style: const TextStyle(fontSize: 12, color: Colors.black54, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
        ],

        // Department Filter (collapsible)
        if (_filterOptions['departments']?.isNotEmpty == true) ...[
          _buildCollapsibleSection(
            title: 'Department',
            sectionKey: 'department',
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final int crossAxisCount = width >= 600
                    ? 6
                    : width >= 480
                        ? 5
                        : width >= 360
                            ? 4
                            : 3;
                final depts = _filterOptions['departments']!;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 1,
                  ),
                  itemCount: depts.length,
                  itemBuilder: (context, index) {
                    final dept = depts[index];
                    final labelText = _deptDescriptions[dept] ?? dept;
                    final bool selected = _currentFilter.departments?.contains(dept) ?? false;
                    return InkWell(
                      onTap: () => _toggleDepartmentFilter(dept),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected ? Colors.purple.shade50 : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selected ? Colors.purple.shade300 : const Color(0xFFE0E0E0),
                            width: selected ? 2 : 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              labelText,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.15,
                                fontWeight: FontWeight.w600,
                                color: selected ? Colors.purple.shade700 : Colors.black87,
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (_deptDescriptions.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, size: 14, color: Colors.black45),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Showing department codes (descriptions not available). Ensure server exposes department lookup.',
                      style: const TextStyle(fontSize: 12, color: Colors.black54, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
        ],

        // Sub-Department Filter (collapsible)
        if (_filterOptions['subDepartments']?.isNotEmpty == true) ...[
          _buildCollapsibleSection(
            title: 'Sub-Department',
            sectionKey: 'subDept',
            child: Wrap(
              spacing: 8,
              children: _filterOptions['subDepartments']!
                  .map((subDept) => FilterChip(
                        label: Text(subDept),
                        selected: _currentFilter.subDepartments?.contains(subDept) ?? false,
                        onSelected: (_) => _toggleSubDepartmentFilter(subDept),
                        selectedColor: Colors.teal.shade100,
                      ))
                  .toList(),
            ),
          ),
        ],

        // Category Filter (collapsible)
        if (_filterOptions['categories']?.isNotEmpty == true) ...[
          _buildCollapsibleSection(
            title: 'Category',
            sectionKey: 'category',
            child: Wrap(
              spacing: 8,
              children: _filterOptions['categories']!
                  .map((category) => FilterChip(
                        label: Text(category),
                        selected: _currentFilter.categories?.contains(category) ?? false,
                        onSelected: (_) => _toggleCategoryFilter(category),
                        selectedColor: Colors.indigo.shade100,
                      ))
                  .toList(),
            ),
          ),
        ],
      ],
    );
  }

  // Build single-row inventory item (one item per line)
  Widget _buildInventoryListItem(InventoryItem item) {
    final int companyCode = _selectedCompany?['companyCode'] is String
        ? int.tryParse(_selectedCompany!['companyCode']) ?? 0
        : (_selectedCompany?['companyCode'] ?? 0);
    final bool inStock = (item.qtyOnHand ?? 0) > 0;
    final Color stockColor = inStock ? Colors.green.shade400 : Colors.red.shade400;

    return InkWell(
      onTap: () => _showInventoryDetails(item),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(color: Color(0xFFEAEAEA), width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left colored stock indicator
            Container(
              width: 4,
              height: 56,
              decoration: BoxDecoration(
                color: stockColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 10),
            // Left image (small square)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 56,
                height: 56,
                child: FutureBuilder<String?>(
                  future: _getWorkingUomForImage(companyCode, item.skuNo),
                  builder: (context, snapshot) {
                    final uom = snapshot.data ?? item.uom;
                    print('📷 IMAGE DEBUG - SKU ${item.skuNo}: Using UOM "$uom" for image (working UOM method)');
                    return InventoryImageWidget(
                      companyCode: companyCode,
                      skuNo: item.skuNo,
                      uom: uom,
                      width: 56,
                      height: 56,
                      borderRadius: BorderRadius.zero,
                      fit: BoxFit.cover,
                      showLoadingIndicator: true,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Right text (item details)
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.description ?? '',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'SKU: ${item.skuNo}',
                          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      if (item.brand != null && item.brand!.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Text(
                            item.brand!,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _buildPriceTag(item),
                      const SizedBox(width: 6),
                      _buildUomFactorTag(item),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Qty on hand chip
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: inStock ? Colors.green.shade50 : Colors.red.shade50,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: inStock ? Colors.green.shade200 : Colors.red.shade200),
                    ),
                    child: Text(
                      'Stock: ${item.displayQtyOnHand}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: inStock ? Colors.green.shade700 : Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }

  // UI: price tag widget
  Widget _buildPriceTag(InventoryItem item) {
    // Prefer server-provided prices from In_Stock_UOM join
    final double? price = item.gstPrice ?? item.price ?? item.lastCost ?? item.standardCost ?? item.fifoCost ?? item.averageCost;
    final String uom = (item.uom == null || item.uom!.trim().isEmpty) ? '' : ' / ${item.uom}';
    if (price == null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          'Price N/A$uom',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black54),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Text(
        'RM ${price.toStringAsFixed(2)}$uom',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black87),
      ),
    );
  }

  // UI: UOM and factor chip
  Widget _buildUomFactorTag(InventoryItem item) {
    final String uom = (item.uom ?? '').trim();
    // Use server-provided Factor for this UOM when available
    final double factor = (item.uomFactor ?? item.stockFactor ?? 1).toDouble();

    String label;
    if (uom.isNotEmpty && factor != 1) {
      label = '$uom x${factor.toStringAsFixed(factor.truncateToDouble() == factor ? 0 : 2)}';
    } else if (uom.isNotEmpty) {
      label = uom;
    } else if (factor != 1) {
      label = 'x${factor.toStringAsFixed(factor.truncateToDouble() == factor ? 0 : 2)}';
    } else {
      label = '-';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  // UI: qty stepper
  Widget _buildQtyStepper(InventoryItem item) {
    final int sku = item.skuNo;
    final int qty = _qtySelections[sku] ?? 1;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            splashRadius: 18,
            onPressed: () => _updateQty(item, -1),
          ),
          GestureDetector(
            onTap: () => _showQtyInputDialog(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('$qty', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            splashRadius: 18,
            onPressed: () => _updateQty(item, 1),
          ),
        ],
      ),
    );
  }

  void _updateQty(InventoryItem item, int delta) {
    final int sku = item.skuNo;
    final int current = _qtySelections[sku] ?? 1;
    final int next = (current + delta).clamp(1, 999);
    setState(() {
      _qtySelections[sku] = next;
    });
  }
  
  Future<void> _showQtyInputDialog(InventoryItem item) async {
    final int sku = item.skuNo;
    final int current = _qtySelections[sku] ?? 1;
    
    final result = await showDialog<int>(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: current.toString());
        return AlertDialog(
          title: const Text('Enter Quantity'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              hintText: 'Enter quantity (1-999)',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) {
              final qty = int.tryParse(value);
              if (qty != null && qty >= 1 && qty <= 999) {
                Navigator.pop(context, qty);
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final qty = int.tryParse(controller.text);
                if (qty != null && qty >= 1 && qty <= 999) {
                  Navigator.pop(context, qty);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid quantity (1-999)')),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    
    if (result != null && mounted) {
      setState(() {
        _qtySelections[sku] = result;
      });
    }
  }

  void _addToCart(InventoryItem item, {String? remark, String? uom, double? customGstPrice}) async {
    try {
      final int qty = _qtySelections[item.skuNo] ?? 1;
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      // Determine final UOM - fetch from database if not provided
      String finalUom = uom ?? item.uom ?? '';
      if (finalUom.trim().isEmpty) {
        // Try to get default UOM from InStockUom table
        final uomOptions = await isar.inStockUoms
            .filter()
            .companyCodeEqualTo(companyCode)
            .skuNoEqualTo(item.skuNo)
            .findAll();
        
        if (uomOptions.isNotEmpty) {
          // Use the first UOM option as default
          finalUom = uomOptions.first.uom ?? 'PCS';
        } else {
          // Fallback to PCS if no UOM options found
          finalUom = 'PCS';
        }
      }
      
      // Use custom price if provided, otherwise use item's default price
      final double finalGstPrice = customGstPrice ?? item.gstPrice ?? 0.0;
      final double finalUnitPrice = customGstPrice != null ? (customGstPrice / 1.06) : (item.price ?? 0.0);
      
      await _cartService.addToCart(
        companyCode: companyCode,
        skuNo: item.skuNo,
        pluNo: item.pluNo != null ? item.pluNo.toString() : null,
        description: item.description ?? '',
        uom: finalUom,
        unitPrice: finalUnitPrice,
        gstPrice: finalGstPrice,
        factor: 1.0,
        quantity: qty,
        remarks: remark ?? '',
      );
      
      await _loadCartCount(); // Refresh cart count
      
      final uomPart = (uom != null && uom.trim().isNotEmpty) ? ' ($uom)' : '';
      final remarkPart = (remark != null && remark.trim().isNotEmpty) ? ' – "$remark"' : '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added ${item.displayName} x$qty$uomPart$remarkPart'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding to cart: $e')),
      );
    }
  }

  // Clear cache for current company and force refresh
  Future<void> _clearCurrentCompanyCache() async {
    try {
      setState(() {
        _isLoading = true;
        _debugInfo = 'Clearing inventory cache for current company...';
      });

      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;

      // Clear cache and force refresh
      final items = await _inventoryService.forceRefreshInventory(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        filter: _currentFilter,
        limit: _pageSize,
        offset: 0,
      );

      setState(() {
        _inventoryItems = _dedupeByCompanySku(items);
        _currentOffset = _inventoryItems.length;
        _hasMoreData = items.length == _pageSize;
        _isOnline = true;
        _debugInfo = 'Cache cleared! Loaded ${items.length} fresh inventory items';
        _errorMessage = '';
      });

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Inventory cache cleared! Loaded ${items.length} fresh items'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to clear cache: $e';
        _debugInfo = 'Cache clear error: $e';
        _isOnline = false;
      });

      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to clear cache: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Clear all inventory cache (all companies)
  Future<void> _clearAllInventoryCache() async {
    try {
      setState(() {
        _isLoading = true;
        _debugInfo = 'Clearing ALL inventory cache...';
      });

      // Clear all cache
      await _inventoryService.clearAllInventoryCache();

      // Reload current company's inventory
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;

      final items = await _inventoryService.fetchInventoryFromServer(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        limit: _pageSize,
        offset: 0,
      );

      // Save fresh data to cache
      await _inventoryService.saveInventoryToLocal(items);

      setState(() {
        _inventoryItems = _dedupeByCompanySku(items);
        _currentOffset = _inventoryItems.length;
        _hasMoreData = items.length == _pageSize;
        _isOnline = true;
        _debugInfo = 'ALL cache cleared! Loaded ${items.length} fresh inventory items';
        _errorMessage = '';
      });

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ ALL inventory cache cleared! Loaded ${items.length} fresh items'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to clear all cache: $e';
        _debugInfo = 'Cache clear error: $e';
        _isOnline = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to clear all cache: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _openBarcodeScanner() async {
    // Show selection dialog for PLU type
    final pluType = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Barcode Type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code_2, color: Colors.blue),
              title: const Text('Regular PLU'),
              subtitle: const Text('Scan general product barcode'),
              onTap: () => Navigator.pop(context, 'plu'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person_pin, color: Colors.green),
              title: const Text('Customer PLU'),
              subtitle: const Text('Scan customer-specific barcode'),
              onTap: () => Navigator.pop(context, 'customer_plu'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (pluType == null) return;

    // Open barcode scanner
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
    );
    
    if (result != null && result.isNotEmpty) {
      print('🔍 BARCODE SCANNER: Scanned barcode: $result (type: $pluType)');
      
      if (pluType == 'customer_plu') {
        await _onCustomerPluSearchSubmitted(result);
      } else {
        await _onPluSearchSubmitted(result);
      }
    }
  }

  Future<String> _getItemDescription(int companyCode, int skuNo) async {
    try {
      final item = await _inventoryService.getInventoryItemBySku(companyCode, skuNo);
      return item?.description ?? 'SKU $skuNo';
    } catch (e) {
      return 'SKU $skuNo';
    }
  }

  void _clearScannedPlu() {
    setState(() {
      _scannedPluNo = '';
    });
    // Just re-read from local Isar; no server refetch needed.
    _resetAndLoadInventory();
  }

  void _clearSearch() {
    _searchController.clear();
    _executeSearch();
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });
    
    // Load filter options when opening filters
    if (_showFilters) {
      if (_filterOptions.isEmpty) {
        _loadFilterOptions();
      }
      // Ensure department descriptions are loaded even if options were cached previously
      if (_deptDescriptions.isEmpty) {
        _loadDeptDescriptionsOnly();
      }
      // Ensure group descriptions are loaded
      if (_groupDescriptions.isEmpty) {
        _loadGroupDescriptionsOnly();
      }
      // If groups already selected, auto-expand Department
      if ((_currentFilter.groups?.isNotEmpty ?? false)) {
        setState(() {
          _sectionExpanded['department'] = true;
        });
      }
    }
  }

  Future<void> _loadDeptDescriptionsOnly() async {
    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      final deptMap = await _inventoryService.getDepartmentMap(companyCode: companyCode);
      if (deptMap.isNotEmpty) {
        setState(() {
          _deptDescriptions = deptMap;
        });
        print('🟦 InventoryPage: Loaded ${deptMap.length} department descriptions');
      } else {
        print('🟨 InventoryPage: Department descriptions map is empty (fallback to codes)');
      }
    } catch (e) {
      print('❌ InventoryPage: Failed to load department descriptions: $e');
    }
  }

  void _applyStockFilter(StockStatus? status) {
    setState(() {
      _currentFilter.stockStatus = status;
    });
    _resetAndLoadInventory();
  }

  void _clearAllFilters() {
    setState(() {
      _currentFilter.clear();
      _showFilters = false;
    });
    _resetAndLoadInventory();
  }

  Future<void> _loadFilterOptions() async {
    if (_loadingFilterOptions) return;
    
    setState(() {
      _loadingFilterOptions = true;
    });
    
    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      // Interlocking: pass current selections to constrain downstream options
      final options = await _inventoryService.getFilterOptions(
        companyCode: companyCode,
        groups: _currentFilter.groups,
        departments: _currentFilter.departments,
        subDepartments: _currentFilter.subDepartments,
      );
      // Load department descriptions (best-effort)
      final deptMap = await _inventoryService.getDepartmentMap(companyCode: companyCode);
      // Load group descriptions (best-effort)
      final grpMap = await _inventoryService.getGroupMap(companyCode: companyCode);
      // Prune invalid selections that are no longer available after interlocking
      List<String>? _prune(List<String>? current, List<String>? allowed) {
        if (current == null) return null;
        final set = allowed?.toSet() ?? <String>{};
        final pruned = current.where((e) => set.contains(e)).toList();
        return pruned.isEmpty ? null : pruned;
      }

      final newDepartments = _prune(_currentFilter.departments, options['departments']);
      final newSubDepartments = _prune(_currentFilter.subDepartments, options['subDepartments']);
      final newCategories = _prune(_currentFilter.categories, options['categories']);

      setState(() {
        _filterOptions = options;
        _deptDescriptions = deptMap;
        _groupDescriptions = grpMap;
        _currentFilter.departments = newDepartments;
        _currentFilter.subDepartments = newSubDepartments;
        _currentFilter.categories = newCategories;
      });
    } catch (e) {
      print('❌ Failed to load filter options: $e');
    } finally {
      setState(() {
        _loadingFilterOptions = false;
      });
    }
  }

  void _toggleGroupFilter(String group) {
    setState(() {
      _currentFilter.groups ??= [];
      if (_currentFilter.groups!.contains(group)) {
        _currentFilter.groups!.remove(group);
        if (_currentFilter.groups!.isEmpty) _currentFilter.groups = null;
      } else {
        _currentFilter.groups!.add(group);
      }
      // Interlocking: clearing downstream selections when group changes
      _currentFilter.departments = null;
      _currentFilter.subDepartments = null;
      _currentFilter.categories = null;
      // Auto-expand/collapse Department based on group selection
      final hasGroup = _currentFilter.groups?.isNotEmpty ?? false;
      _sectionExpanded['department'] = hasGroup;
    });
    _resetAndLoadInventory();
    if (_showFilters) _loadFilterOptions();
  }

  void _toggleDepartmentFilter(String dept) {
    setState(() {
      _currentFilter.departments ??= [];
      if (_currentFilter.departments!.contains(dept)) {
        _currentFilter.departments!.remove(dept);
        if (_currentFilter.departments!.isEmpty) _currentFilter.departments = null;
      } else {
        _currentFilter.departments!.add(dept);
      }
      // Interlocking: clear sub-dept and category when department changes
      _currentFilter.subDepartments = null;
      _currentFilter.categories = null;
    });
    _resetAndLoadInventory();
    if (_showFilters) _loadFilterOptions();
  }

  void _toggleSubDepartmentFilter(String subDept) {
    setState(() {
      _currentFilter.subDepartments ??= [];
      if (_currentFilter.subDepartments!.contains(subDept)) {
        _currentFilter.subDepartments!.remove(subDept);
        if (_currentFilter.subDepartments!.isEmpty) _currentFilter.subDepartments = null;
      } else {
        _currentFilter.subDepartments!.add(subDept);
      }
      // Interlocking: clear categories when sub-dept changes
      _currentFilter.categories = null;
    });
    _resetAndLoadInventory();
    if (_showFilters) _loadFilterOptions();
  }

  void _toggleCategoryFilter(String category) {
    setState(() {
      _currentFilter.categories ??= [];
      if (_currentFilter.categories!.contains(category)) {
        _currentFilter.categories!.remove(category);
        if (_currentFilter.categories!.isEmpty) _currentFilter.categories = null;
      } else {
        _currentFilter.categories!.add(category);
      }
    });
    _resetAndLoadInventory();
  }

  void _toggleBrandFilter(String brand) {
    setState(() {
      _currentFilter.brands ??= [];
      if (_currentFilter.brands!.contains(brand)) {
        _currentFilter.brands!.remove(brand);
        if (_currentFilter.brands!.isEmpty) _currentFilter.brands = null;
      } else {
        _currentFilter.brands!.add(brand);
      }
    });
    _resetAndLoadInventory();
  }
  
  // Deduplicate items by (companyCode, skuNo)
  List<InventoryItem> _dedupeByCompanySku(List<InventoryItem> items) {
    final seen = <String>{};
    final result = <InventoryItem>[];
    for (final it in items) {
      final key = '${it.companyCode}:${it.skuNo}';
      if (!seen.contains(key)) {
        seen.add(key);
        result.add(it);
      }
    }
    return result;
  }

  Widget _buildFilterChips() {
    final hasFilters = _currentFilter.hasActiveFilters || _scannedPluNo.isNotEmpty;
    if (!hasFilters) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 8,
        children: [
          // Scanned PLU Tag
          if (_scannedPluNo.isNotEmpty)
            FilterChip(
              label: Text('PLU: $_scannedPluNo'),
              selected: true,
              onSelected: (_) => _clearScannedPlu(),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: _clearScannedPlu,
              selectedColor: Colors.green.shade100,
              checkmarkColor: Colors.green.shade700,
              avatar: const Icon(Icons.qr_code_scanner, size: 16),
            ),
          // Stock Status
          if (_currentFilter.stockStatus != null)
            FilterChip(
              label: Text(_getStockStatusLabel(_currentFilter.stockStatus!)),
              selected: true,
              onSelected: (_) => _applyStockFilter(null),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _applyStockFilter(null),
              selectedColor: Colors.blue.shade100,
              checkmarkColor: Colors.blue.shade700,
            ),
          // Groups
          if (_currentFilter.groups?.isNotEmpty == true)
            ..._currentFilter.groups!.map((group) {
              final labelText = _groupDescriptions[group] ?? group;
              return FilterChip(
              label: Text('Grp: $labelText'),
              selected: true,
              onSelected: (_) => _toggleGroupFilter(group),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _toggleGroupFilter(group),
              selectedColor: Colors.purple.shade100,
              checkmarkColor: Colors.purple.shade700,
            );
            }),
          // Departments (show description if available)
          if (_currentFilter.departments?.isNotEmpty == true)
            ..._currentFilter.departments!.map((dept) {
              final labelText = _deptDescriptions[dept] ?? dept;
              return FilterChip(
                label: Text('Dept: $labelText'),
                selected: true,
                onSelected: (_) => _toggleDepartmentFilter(dept),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () => _toggleDepartmentFilter(dept),
                selectedColor: Colors.orange.shade100,
                checkmarkColor: Colors.orange.shade700,
              );
            }),
          // Sub-Departments
          if (_currentFilter.subDepartments?.isNotEmpty == true)
            ..._currentFilter.subDepartments!.map((subDept) => FilterChip(
              label: Text('SubDept: $subDept'),
              selected: true,
              onSelected: (_) => _toggleSubDepartmentFilter(subDept),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _toggleSubDepartmentFilter(subDept),
              selectedColor: Colors.teal.shade100,
              checkmarkColor: Colors.teal.shade700,
            )),
          // Categories
          if (_currentFilter.categories?.isNotEmpty == true)
            ..._currentFilter.categories!.map((category) => FilterChip(
              label: Text('Cat: $category'),
              selected: true,
              onSelected: (_) => _toggleCategoryFilter(category),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _toggleCategoryFilter(category),
              selectedColor: Colors.indigo.shade100,
              checkmarkColor: Colors.indigo.shade700,
            )),
          // Brands
          if (_currentFilter.brands?.isNotEmpty == true)
            ..._currentFilter.brands!.map((brand) => FilterChip(
              label: Text('Brand: $brand'),
              selected: true,
              onSelected: (_) => _toggleBrandFilter(brand),
              deleteIcon: const Icon(Icons.close, size: 16),
              onDeleted: () => _toggleBrandFilter(brand),
              selectedColor: Colors.cyan.shade100,
              checkmarkColor: Colors.cyan.shade700,
            )),
          // Clear All
          ActionChip(
            label: const Text('Clear All'),
            onPressed: _clearAllFilters,
            backgroundColor: Colors.red.shade50,
            labelStyle: TextStyle(color: Colors.red.shade700),
          ),
        ],
      ),
    );
  }

  String _getStockStatusLabel(StockStatus status) {
    switch (status) {
      case StockStatus.inStock:
        return 'In Stock';
      case StockStatus.outOfStock:
        return 'Out of Stock';
      case StockStatus.lowStock:
        return 'Low Stock';
      case StockStatus.all:
        return 'All Items';
    }
  }

  Widget _buildCollapsibleSection({
    required String title,
    required String sectionKey,
    required Widget child,
    Color? backgroundColor,
  }) {
    final expanded = _sectionExpanded[sectionKey] ?? true;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? _getSectionBackgroundColor(sectionKey),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _sectionExpanded[sectionKey] = !expanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(expanded ? Icons.expand_less : Icons.expand_more, color: Colors.black54),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          if (expanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: child,
            ),
        ],
      ),
    );
  }

  // Determine a light background color per section based on selected chip color scheme
  Color _getSectionBackgroundColor(String sectionKey) {
    // All sections follow stock status color theme
    final status = _currentFilter.stockStatus;
    if (status == StockStatus.inStock) return Colors.green.shade50;
    if (status == StockStatus.outOfStock) return Colors.red.shade50;
    if (status == StockStatus.lowStock) return Colors.orange.shade50;
    // All or null -> light blue default
    return Colors.blue.shade50;
  }

  Widget _buildFilterPanel() {
    if (!_showFilters) return const SizedBox.shrink();
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.filter_list, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Filters',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              TextButton(
                onPressed: _clearAllFilters,
                child: const Text('Clear All'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          
          // More Filters: hide stock status and brand under a single dropdown
          _buildCollapsibleSection(
            title: 'More Filters',
            sectionKey: 'more',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stock Status (inline section)
                const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    'Stock Status',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    FilterChip(
                      label: const Text('All Items'),
                      selected: _currentFilter.stockStatus == StockStatus.all || _currentFilter.stockStatus == null,
                      onSelected: (_) => _applyStockFilter(StockStatus.all),
                    ),
                    FilterChip(
                      label: const Text('In Stock'),
                      selected: _currentFilter.stockStatus == StockStatus.inStock,
                      onSelected: (_) => _applyStockFilter(StockStatus.inStock),
                      selectedColor: Colors.green.shade100,
                    ),
                    FilterChip(
                      label: const Text('Out of Stock'),
                      selected: _currentFilter.stockStatus == StockStatus.outOfStock,
                      onSelected: (_) => _applyStockFilter(StockStatus.outOfStock),
                      selectedColor: Colors.red.shade100,
                    ),
                    FilterChip(
                      label: const Text('Low Stock'),
                      selected: _currentFilter.stockStatus == StockStatus.lowStock,
                      onSelected: (_) => _applyStockFilter(StockStatus.lowStock),
                      selectedColor: Colors.orange.shade100,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (_filterOptions['brands']?.isNotEmpty == true) ...[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      'Brand',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    children: _filterOptions['brands']!
                        .map((brand) => FilterChip(
                              label: Text(brand),
                              selected: _currentFilter.brands?.contains(brand) ?? false,
                              onSelected: (_) => _toggleBrandFilter(brand),
                              selectedColor: Colors.cyan.shade100,
                            ))
                        .toList(),
                  ),
                ],
              ],
            ),
          ),

          // Group Filter (collapsible)
          if (_filterOptions['groups']?.isNotEmpty == true) ...[
            _buildCollapsibleSection(
              title: 'Group',
              sectionKey: 'group',
              child: _loadingFilterOptions
                  ? const CircularProgressIndicator(strokeWidth: 2)
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        // Determine responsive column count based on available width
                        final width = constraints.maxWidth;
                        final int crossAxisCount = width >= 600
                            ? 6
                            : width >= 480
                                ? 5
                                : width >= 360
                                    ? 4
                                    : 3;
                        final groups = _filterOptions['groups']!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 1, // square tiles
                          ),
                          itemCount: groups.length,
                          itemBuilder: (context, index) {
                            final group = groups[index];
                            final labelText = _groupDescriptions[group] ?? group;
                            final bool selected = _currentFilter.groups?.contains(group) ?? false;
                            return InkWell(
                              onTap: () => _toggleGroupFilter(group),
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selected ? Colors.purple.shade50 : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selected ? Colors.purple.shade300 : const Color(0xFFE0E0E0),
                                    width: selected ? 2 : 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2), // reduced padding
                                    child: Text(
                                      labelText,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1.15, // tighter line height to fit more text
                                        fontWeight: FontWeight.w600,
                                        color: selected ? Colors.purple.shade700 : Colors.black87,
                                      ),
                                      maxLines: 4, // allow up to 4 lines to use more of the tile space
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
            if (_groupDescriptions.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 14, color: Colors.black45),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Showing group codes (descriptions not available). Ensure server exposes group lookup.',
                        style: const TextStyle(fontSize: 12, color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
          ],
          
          // Department Filter (collapsible)
          if (_filterOptions['departments']?.isNotEmpty == true) ...[
            _buildCollapsibleSection(
              title: 'Department',
              sectionKey: 'department',
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final int crossAxisCount = width >= 600
                      ? 6
                      : width >= 480
                          ? 5
                          : width >= 360
                              ? 4
                              : 3;
                  final depts = _filterOptions['departments']!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: depts.length,
                    itemBuilder: (context, index) {
                      final dept = depts[index];
                      final labelText = _deptDescriptions[dept] ?? dept;
                      final bool selected = _currentFilter.departments?.contains(dept) ?? false;
                      return InkWell(
                        onTap: () => _toggleDepartmentFilter(dept),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected ? Colors.purple.shade50 : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selected ? Colors.purple.shade300 : const Color(0xFFE0E0E0),
                              width: selected ? 2 : 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                labelText,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 1.15,
                                  fontWeight: FontWeight.w600,
                                  color: selected ? Colors.purple.shade700 : Colors.black87,
                                ),
                                maxLines: 4,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (_deptDescriptions.isEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 14, color: Colors.black45),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Showing department codes (descriptions not available). Ensure server exposes department lookup.',
                        style: const TextStyle(fontSize: 12, color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
          ],
          
          // Sub-Department Filter (collapsible)
          if (_filterOptions['subDepartments']?.isNotEmpty == true) ...[
            _buildCollapsibleSection(
              title: 'Sub-Department',
              sectionKey: 'subDept',
              child: Wrap(
                spacing: 8,
                children: _filterOptions['subDepartments']!
                    .map((subDept) => FilterChip(
                          label: Text(subDept),
                          selected: _currentFilter.subDepartments?.contains(subDept) ?? false,
                          onSelected: (_) => _toggleSubDepartmentFilter(subDept),
                          selectedColor: Colors.teal.shade100,
                        ))
                    .toList(),
              ),
            ),
          ],
          
          // Category Filter (collapsible)
          if (_filterOptions['categories']?.isNotEmpty == true) ...[
            _buildCollapsibleSection(
              title: 'Category',
              sectionKey: 'category',
              child: Wrap(
                spacing: 8,
                children: _filterOptions['categories']!
                    .map((category) => FilterChip(
                          label: Text(category),
                          selected: _currentFilter.categories?.contains(category) ?? false,
                          onSelected: (_) => _toggleCategoryFilter(category),
                          selectedColor: Colors.indigo.shade100,
                        ))
                    .toList(),
              ),
            ),
          ],
          
          // (Brand already rendered above)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      drawer: _buildSideFilterDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Compact Header
            _buildCompactHeader(),
            
            // Filter Panel (collapsible)
            _buildFilterPanel(),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Row(
                children: [
                  Expanded(
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
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (_) => _executeSearch(),
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                          prefixIcon: GestureDetector(
                            onTap: _executeSearch,
                            child: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: _clearSearch,
                                  child: Icon(Icons.close, color: Colors.grey.shade400, size: 18),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // PLU/Barcode scanner button
                  GestureDetector(
                    onTap: _openBarcodeScanner,
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                      child: Icon(Icons.qr_code_scanner, color: Colors.blue.shade600, size: 20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Grid/List toggle
                  GestureDetector(
                    onTap: () => setState(() => _isGridView = !_isGridView),
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                      child: Icon(
                        _isGridView ? Icons.view_list : Icons.grid_view,
                        color: Colors.blue.shade600,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Active Filter Chips
            _buildFilterChips(),

            // Error Message
            if (_errorMessage.isNotEmpty)
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
                          _errorMessage,
                          style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Inventory Content
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _inventoryItems.isEmpty && _errorMessage.isEmpty
                      ? _buildEmptyState()
                      : _isGridView
                          ? _buildGridView()
                          : _buildListView(),
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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Inventory',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                if (_selectedCompany != null)
                  Text(
                    _selectedCompany!['companyName'] ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
          // Filter button
          GestureDetector(
            onTap: _toggleFilters,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _showFilters ? Colors.blue.shade50 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.filter_list,
                size: 18,
                color: _showFilters ? Colors.blue.shade600 : Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Cart button with badge
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
              if (result == true) {
                _loadCartCount();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.shopping_cart, size: 18, color: Colors.blue.shade600),
                  if (_cartItemCount > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$_cartItemCount',
                          style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
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
            child: Icon(Icons.inventory_2_outlined, size: 48, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 16),
          Text(
            _currentSearchQuery.isEmpty ? 'No inventory items' : 'No items match your search',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
          ),
          if (_currentSearchQuery.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Try adjusting your search',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75, // Card uses Expanded so any ratio works without overflow
      ),
      itemCount: _inventoryItems.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _inventoryItems.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return _buildInventorySquareCard(_inventoryItems[index]);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: _inventoryItems.length + (_isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _inventoryItems.length) {
          return const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()));
        }
        return _buildInventoryListItem(_inventoryItems[index]);
      },
    );
  }

  // Build side filter drawer - exact copy of original top filter design
  Widget _buildSideFilterDrawer() {
    // Ensure filter options are loaded even when offline (offline-first)
    if (_filterOptions.isEmpty && !_loadingFilterOptions) {
      // Defer to next microtask to avoid setState during build
      Future.microtask(() => _loadFilterOptions());
    }
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.filter_list, color: Colors.white, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Filters',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Filter content - exact copy of original
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // Active filters display
                    _buildActiveFiltersChips(),
                    
                    // Filter sections
                    _buildFiltersContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build individual inventory square card for grid layout
  Widget _buildInventorySquareCard(InventoryItem item) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showInventoryDetails(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section: flexible height image
            Expanded(
              flex: 3,
              child: FutureBuilder<String?>(
                future: _getWorkingUomForImage(
                  _selectedCompany?['companyCode'] is String
                      ? int.parse(_selectedCompany!['companyCode'])
                      : _selectedCompany?['companyCode'] ?? 0,
                  item.skuNo,
                ),
                builder: (context, snapshot) {
                  final uom = snapshot.data ?? item.uom;
                  return InventoryImageWidget(
                    companyCode: _selectedCompany?['companyCode'] is String
                        ? int.parse(_selectedCompany!['companyCode'])
                        : _selectedCompany?['companyCode'] ?? 0,
                    skuNo: item.skuNo,
                    uom: uom,
                    borderRadius: BorderRadius.zero,
                    fit: BoxFit.cover,
                    showLoadingIndicator: true,
                  );
                },
              ),
            ),
            // Details section: fixed content
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product name
                    Text(
                      item.displayName,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // SKU
                    Text(
                      'SKU: ${item.skuNo}',
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                    // Price and Stock row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RM ${(item.gstPrice ?? item.price ?? 0.0).toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                          decoration: BoxDecoration(
                            color: (item.qtyOnHand ?? 0) > 0 ? Colors.green[50] : Colors.red[50],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${item.displayQtyOnHand}',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              color: (item.qtyOnHand ?? 0) > 0 ? Colors.green[700] : Colors.red[700],
                            ),
                          ),
                        ),
                      ],
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

  // Build individual inventory card (legacy method - keep for reference)
  Widget _buildInventoryCard(InventoryItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () => _showInventoryDetails(item),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row with name and status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.displayStatus),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.displayStatus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // SKU and Brand
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.displayCode,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (item.displayBrand.isNotEmpty)
                      Text(
                        item.displayBrand,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Quantity and Location
                Row(
                  children: [
                    Icon(
                      Icons.inventory,
                      size: 16,
                      color: Colors.green.shade600,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Qty: ${item.displayQtyOnHand}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.displayLocation,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                
                // Category (if available)
                if (item.displayCategory.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Category: ${item.displayCategory}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'A':
      case 'ACTIVE':
        return Colors.green;
      case 'I':
      case 'INACTIVE':
        return Colors.red;
      case 'D':
      case 'DISCONTINUED':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  // Try all available UOMs until one returns a successful image download (offline-first)
  Future<String?> _getWorkingUomForImage(int companyCode, int skuNo) async {
    final cacheKey = '${companyCode}_$skuNo';
    
    // Check memory cache first
    if (_workingUomCache.containsKey(cacheKey)) {
      final cachedUom = _workingUomCache[cacheKey];
      print('📷 SKU $skuNo: Using cached working UOM "$cachedUom"');
      return cachedUom;
    }

    // OFFLINE-FIRST: Check if we have any cached image for this SKU
    try {
      final imageService = InventoryImageService();
      final cachedImagePath = await imageService.findAnyCachedImageForSku(companyCode, skuNo);
      if (cachedImagePath != null) {
        // Extract UOM from cached filename: COMPANY_SKU_SKUCODE_UOM.jpg
        final fileName = cachedImagePath.split('/').last;
        final parts = fileName.split('_');
        if (parts.length >= 4) {
          final uomPart = parts.last.replaceAll('.jpg', '');
          print('📷 SKU $skuNo: Using OFFLINE cached image UOM "$uomPart"');
          _workingUomCache[cacheKey] = uomPart; // Cache the result
          return uomPart;
        }
      }
    } catch (e) {
      print('❌ OFFLINE: Error checking cached images for SKU $skuNo: $e');
    }
    
    try {
      final uomOptions = await isar.inStockUoms
        .filter()
        .companyCodeEqualTo(companyCode)
        .skuNoEqualTo(skuNo)
        .statusEqualTo('A') // Only get active UOMs (status A)
        .findAll();
      
      if (uomOptions.isEmpty) {
        print('📷 No UOM options found for SKU $skuNo, using item.uom');
        _workingUomCache[cacheKey] = null;
        return null; // Will fallback to item.uom
      }
      
      print('📷 SKU $skuNo: Testing ${uomOptions.length} UOM options for working image...');
      
      // Try each UOM until we find one that works
      for (final uomOption in uomOptions) {
        final uom = uomOption.uom;
        if (uom == null || uom.trim().isEmpty) continue;
        
        // Check if image exists for this UOM
        final imageUrl = 'http://fungseng.dyndns.org:88/ItemMasterImages/${skuNo.toString().padLeft(6, '0')}_$uom.jpg';
        
        try {
          print('📷 SKU $skuNo: Testing UOM "$uom" - $imageUrl');
          
          // Quick HEAD request to check if image exists (don't download full image)
          final response = await http.head(Uri.parse(imageUrl));
          if (response.statusCode == 200) {
            print('📷 ✅ SKU $skuNo: Found working image with UOM "$uom"');
            _workingUomCache[cacheKey] = uom; // Cache the result
            return uom;
          } else {
            print('📷 ❌ SKU $skuNo: UOM "$uom" returned ${response.statusCode}');
          }
        } catch (e) {
          print('📷 ❌ SKU $skuNo: UOM "$uom" failed: $e');
          continue;
        }
      }
      
      print('📷 ⚠️ SKU $skuNo: No working UOM found, falling back to item.uom');
      _workingUomCache[cacheKey] = null; // Cache the null result
      return null; // Will fallback to item.uom
    } catch (e) {
      print('❌ Error testing UOMs for SKU $skuNo: $e');
      _workingUomCache[cacheKey] = null; // Cache the null result
      return null; // Will fallback to item.uom
    }
  }

  // Load all initial data without triggering any rebuilds
  Future<void> _loadInitialData(
    InventoryItem item,
    String selectedUom,
    ValueNotifier<List<InStockUom>> uomOptions,
    ValueNotifier<List<Map<String, dynamic>>> invoicesData,
    ValueNotifier<List<Map<String, dynamic>>> quotationsData,
    ValueNotifier<bool> canEditPrice,
  ) async {
    final int sku = item.skuNo;
    
    // 🛡️ LOADING GUARD: Prevent multiple simultaneous loads for same SKU
    if (_loadingSkus.contains(sku)) {
      print('🔄 SKU $sku: Already loading initial data, skipping duplicate call');
      return;
    }
    
    _loadingSkus.add(sku);
    print('🔄 SKU $sku: Starting initial data load...');
    
    try {
      // Load UOM options (always set a value to stop loading spinner)
      final options = await _loadUomOptions(item);
      uomOptions.value = options;
      
      // Check price permission
      final company = await _authService.getSelectedCompany();
      final companyCodeRaw = company?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      final settingsService = UserAppSettingsService();
      final canEdit = await settingsService.canChangePrice(companyCode: companyCode);
      canEditPrice.value = canEdit;
      
      // Load history data
      final filterUom = selectedUom.isEmpty ? null : selectedUom;
      final invoices = await _loadPreviousInvoicesForItem(item, filterUom: filterUom);
      invoicesData.value = invoices;
      
      final quotations = await _loadPreviousOrdersForItem(item, filterUom: filterUom);
      quotationsData.value = quotations;
      
      print('✅ SKU $sku: Initial data loaded - UOM: ${options.length}, Invoices: ${invoices.length}, Quotations: ${quotations.length}');
    } catch (e) {
      print('❌ SKU $sku: Error loading initial data: $e');
      
      // CRITICAL: Always set UOM options to prevent infinite loading spinner
      if (uomOptions.value.isEmpty) {
        // Create a fallback UOM option from item data
        final fallbackUom = InStockUom()
          ..companyCode = 1 // Default company
          ..skuNo = item.skuNo
          ..uom = item.uom ?? 'EA'
          ..factor = 1.0
          ..price = item.price
          ..gstPrice = item.gstPrice;
        
        uomOptions.value = [fallbackUom];
        print('🔄 SKU $sku: Set fallback UOM option to prevent infinite loading');
      }
    } finally {
      // 🛡️ LOADING GUARD: Always remove SKU from loading set
      _loadingSkus.remove(sku);
      print('🔄 SKU $sku: Removed from loading guard');
    }
  }

  Future<List<InStockUom>> _loadUomOptions(InventoryItem item) async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      final result = await _inventoryService.getUomPricing(
        companyCode: companyCode,
        skuNo: item.skuNo,
      );
      
      // If service returns empty (due to timeout or no data), create fallback
      if (result.isEmpty) {
        print('🔄 UOM service returned empty, creating fallback UOM option');
        final fallbackUom = InStockUom()
          ..companyCode = companyCode
          ..skuNo = item.skuNo
          ..uom = item.uom ?? 'EA'
          ..factor = 1.0
          ..price = item.price
          ..gstPrice = item.gstPrice;
        return [fallbackUom];
      }
      
      return result;
    } catch (e) {
      print('❌ Error loading UOM options: $e');
      
      // Create fallback UOM to prevent infinite loading
      final fallbackUom = InStockUom()
        ..companyCode = 1
        ..skuNo = item.skuNo
        ..uom = item.uom ?? 'EA'
        ..factor = 1.0
        ..price = item.price
        ..gstPrice = item.gstPrice;
      return [fallbackUom];
    }
  }

  // Public getters for bottom sheet widget access
  Map<int, int> get qtySelections => _qtySelections;
  Map<int, double> get priceSelections => _priceSelections;
  AuthService get authService => _authService;
  
  // Public methods for bottom sheet widget access
  Future<List<InStockUom>> loadUomOptions(InventoryItem item) => _loadUomOptions(item);
  Future<List<Map<String, dynamic>>> loadPreviousInvoicesForItem(InventoryItem item, {String? filterUom}) => 
      _loadPreviousInvoicesForItem(item, filterUom: filterUom);
  Future<List<Map<String, dynamic>>> loadPreviousOrdersForItem(InventoryItem item, {String? filterUom}) => 
      _loadPreviousOrdersForItem(item, filterUom: filterUom);
  Widget buildHistoryList(List<Map<String, dynamic>> data, String type) => _buildHistoryList(data, type);
  void addToCart(InventoryItem item, {String? remark, String? uom, double? customGstPrice}) => 
      _addToCart(item, remark: remark, uom: uom, customGstPrice: customGstPrice);

  void _showInventoryDetails(InventoryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => InventoryDetailsBottomSheet(
        item: item,
        inventoryPageState: this,
      ),
    );
  }

  /// Show inventory details bottom sheet for a specific SKU number
  Future<void> _showItemDetailsForSku(int skuNo) async {
    if (!mounted) return;
    
    // Find the item in the loaded inventory list
    InventoryItem? item;
    try {
      item = _inventoryItems.firstWhere((i) => i.skuNo == skuNo);
    } catch (_) {
      item = null; // Not found in list
    }
    
    // If item not found in list, try to fetch from service using exact SKU lookup
    if (item == null) {
      try {
        final companyCode = int.tryParse(_selectedCompany?['companyCode']?.toString() ?? '0') ?? 0;
        if (companyCode > 0) {
          // Use exact SKU lookup instead of text search to avoid matching descriptions
          item = await _inventoryService.getInventoryItemBySku(companyCode, skuNo);
        }
      } catch (e) {
        print('❌ Error fetching item for SKU $skuNo: $e');
      }
    }
    
    // Show bottom sheet if we have a valid item
    if (item != null && item.skuNo != null && item.skuNo != 0 && mounted) {
      _showInventoryDetails(item);
    }
  }

  Widget _buildHistoryList(List<Map<String, dynamic>> data, String type) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          'No previous ${type == 'invoice' ? 'invoices' : 'quotations'}',
          style: TextStyle(color: Colors.grey.shade500),
        ),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        final DateTime? dt = item['date'] as DateTime?;
        final dateStr = dt == null ? '-' : '${dt.day}/${dt.month}/${dt.year}';
        final qty = item['qty'];
        final uom = item['uom'] ?? '';
        final price = (item['price'] ?? 0).toStringAsFixed(2);
        final docNo = type == 'invoice' 
          ? (item['invoiceNo'] ?? '-')
          : (item['quoteNo'] ?? '-');
        
        return Container(
          width: 140,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: type == 'invoice' ? Colors.green.shade50 : Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: type == 'invoice' ? Colors.green.shade200 : Colors.blue.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#$docNo',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                dateStr,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade600,
                ),
              ),
              const Spacer(),
              Text(
                '$qty $uom',
                style: const TextStyle(fontSize: 11),
              ),
              Text(
                'RM $price',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: type == 'invoice' ? Colors.green : Colors.blue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> _loadPreviousOrdersForItem(InventoryItem item, {String? filterUom}) async {
    try {
      final selectedCustomer = CustomerStateService().selectedCustomer;
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 0 : (companyCodeRaw as int?) ?? 0;
      if (companyCode == 0) {
        print('🔎 PreviousOrders: companyCode is 0 or null; skipping');
        return [];
      }

      // Strategy:
      // 1) If customer selected: show their recent orders for this SKU.
      // 2) If no customer selected or none found: show recent orders for this SKU across all customers (company-wide).

      List<Quote> quotes = [];
      if (selectedCustomer != null) {
        print('🔎 PreviousOrders: Loading quotes for selected customer ${selectedCustomer.code}');
        quotes = await isar.quotes
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .customerEqualTo(selectedCustomer.code)
            .findAll();
        print('🔎 PreviousOrders: Found ${quotes.length} quotes for customer ${selectedCustomer.code}');
      } else {
        print('🔎 PreviousOrders: No selected customer; will fallback to company-wide history');
      }

      // Fetch all quote items for this SKU within the company (local only)
      var itemsQuery = isar.quoteItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .skuNoEqualTo(item.skuNo);
      
      // Filter by UOM if specified
      if (filterUom != null && filterUom.isNotEmpty) {
        itemsQuery = itemsQuery.and().uomEqualTo(filterUom);
        print('🔎 PreviousOrders: Filtering by UOM: $filterUom');
      }
      
      final items = await itemsQuery.findAll();

      if (items.isEmpty) {
        print('🔎 PreviousOrders: No quote items found locally for SKU ${item.skuNo}');
        return [];
      }
      print('🔎 PreviousOrders: Found ${items.length} local quote items for SKU ${item.skuNo}');

      // Load all quotes for the company to join and sort by date
      final allQuotesForCompany = await isar.quotes
          .filter()
          .companyCodeEqualTo(companyCode)
          .findAll();
      if (allQuotesForCompany.isEmpty) {
        print('🔎 PreviousOrders: No quotes found locally for company $companyCode');
        return [];
      }
      print('🔎 PreviousOrders: Found ${allQuotesForCompany.length} quotes locally for company $companyCode');

      final quoteByLabel = { for (final q in allQuotesForCompany) q.quotePreLabel: q };
      var matched = items.where((qi) => qi.quotePreLabel != null && quoteByLabel.containsKey(qi.quotePreLabel)).toList();
      print('🔎 PreviousOrders: Matched ${matched.length} quote items to parent quotes after join');

      // Filter to only show quotes for the selected customer
      if (selectedCustomer != null) {
        final custLabels = quotes
            .where((q) => q.customer == selectedCustomer.code)
            .map((q) => q.quotePreLabel)
            .whereType<String>()
            .toSet();
        matched = matched.where((qi) => qi.quotePreLabel != null && custLabels.contains(qi.quotePreLabel)).toList();
        print('🔎 PreviousOrders: Filtered to customer ${selectedCustomer.code} only - ${matched.length} items');
      } else {
        // This shouldn't happen since customer selection is required for inventory access
        print('⚠️ PreviousOrders: No customer selected - this should not happen');
        return [];
      }

      // Build compact view model and sort by parent quote date desc
      matched.sort((a, b) {
        final qa = quoteByLabel[a.quotePreLabel]?.addedDate ?? DateTime(1970);
        final qb = quoteByLabel[b.quotePreLabel]?.addedDate ?? DateTime(1970);
        return qb.compareTo(qa);
      });

      return matched.take(3).map((qi) {
        final q = quoteByLabel[qi.quotePreLabel];
        return {
          'quoteNo': qi.quotePreLabel,
          'date': q?.addedDate,
          'qty': qi.quoteQuantity ?? 0,
          'uom': qi.uom,
          'price': qi.unitPrice ?? qi.gstPrice ?? 0,
        };
      }).toList();
    } catch (e) {
      print('❌ InventoryPage: _loadPreviousOrdersForItem error: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> _loadPreviousInvoicesForItem(InventoryItem item, {String? filterUom}) async {
    try {
      final selectedCustomer = CustomerStateService().selectedCustomer;
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 0 : (companyCodeRaw as int?) ?? 0;
      
      print('🔎 PreviousInvoices: SKU ${item.skuNo}, companyCode=$companyCode, customer=${selectedCustomer?.code ?? "NULL"}, filterUom=$filterUom');
      
      if (companyCode == 0) {
        print('❌ PreviousInvoices: companyCode is 0 or null; skipping');
        return [];
      }

      // If no customer selected, return empty (invoices are customer-specific)
      if (selectedCustomer == null) {
        print('❌ PreviousInvoices: No selected customer; skipping invoice lookup');
        return [];
      }

      print('🔎 PreviousInvoices: Calling InvoiceService for customer ${selectedCustomer.code}...');
      
      // Use optimized query with online fallback to populate cache when empty
      final invoiceService = InvoiceService(SignalRService());
      final matchedItems = await invoiceService.getInvoiceItemsBySkuWithOnlineFallback(
        companyCode: companyCode,
        customerCode: selectedCustomer.code,
        skuNo: item.skuNo,
        filterUom: filterUom,
        limit: 3,
        fetchInvoicesLimit: 10,
      );

      print('✅ PreviousInvoices: Query returned ${matchedItems.length} items for SKU ${item.skuNo}');
      if (matchedItems.isNotEmpty) {
        print('📋 Sample invoice: ${matchedItems.first}');
      }
      return matchedItems;
    } catch (e) {
      print('❌ InventoryPage: _loadPreviousInvoicesForItem error: $e');
      return [];
    }
  }
}
