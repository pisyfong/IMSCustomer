import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'models/inventory_item.dart';
import 'models/plu.dart';
import '../services/inventory_service.dart';
import '../services/auth_service.dart';
import '../services/plu_service.dart';
import '../services/signalr_service.dart';
import '../services/cart_service.dart';
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
  InventoryFilter _currentFilter = InventoryFilter();
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

  @override
  void initState() {
    super.initState();
    _pluService = PluService(Isar.getInstance()!);
    _loadCompanyAndInventory();
    _loadCartCount();
    _setupScrollListener();
    _initializeServices();
    // Setup search listeners
    _searchController.addListener(_onSearchChanged);
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

  // Handle regular search changes
  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query != _currentSearchQuery) {
      final wasNonEmpty = _currentSearchQuery.isNotEmpty;
      _currentSearchQuery = query;
      // If user cleared the search from a non-empty query, force refresh to repopulate full catalog
      if (query.isEmpty && wasNonEmpty) {
        _resetAndLoadInventory(forceRefresh: true);
      } else {
        _resetAndLoadInventory();
      }
    }
  }

  // Handle PLU search changes (like normal search)
  void _onPluSearchChanged() {
    final pluQuery = _pluController.text.trim();
    if (pluQuery.isEmpty) {
      // If PLU search is cleared, clear the main search too
      if (_currentSearchQuery.isNotEmpty) {
        _currentSearchQuery = '';
        _resetAndLoadInventory(forceRefresh: true);
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

      print('🔍 PLU SEARCH: No PLU found, searching by text: $pluQuery');
      // If no exact match, search by PLU number as text (fallback)
      if (pluQuery != _currentSearchQuery) {
        _currentSearchQuery = pluQuery;
        _resetAndLoadInventory();
      }
    } catch (e) {
      print('🔍 PLU SEARCH: Error during PLU lookup: $e');
      // On error, search by PLU number as text (fallback)
      if (pluQuery != _currentSearchQuery) {
        _currentSearchQuery = pluQuery;
        _resetAndLoadInventory();
      }
    }
  }

  // Handle PLU search submission (for Enter key and barcode scanner)
  Future<void> _onPluSearchSubmitted(String pluNo) async {
    if (pluNo.trim().isEmpty) return;

    try {
      final plu = await _pluService.getPlu(pluNo.trim());
      if (plu != null && plu.skuNo != null) {
        // Set the search to the SKU number
        _currentSearchQuery = plu.skuNo.toString();
        _resetAndLoadInventory();
      } else {
        // If no exact match, try partial search
        final plus = await _pluService.searchPlus(pluNo.trim());
        if (plus.isNotEmpty) {
          // If we found matching PLUs, show a dialog to select one
          if (!mounted) return;
          
          final selectedPlu = await showDialog<Plu>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Select PLU'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: plus.length,
                  itemBuilder: (context, index) {
                    final plu = plus[index];
                    return ListTile(
                      title: Text('${plu.pluNo} - ${plu.desc1 ?? ''}'),
                      subtitle: plu.skuNo != null ? Text('SKU: ${plu.skuNo}') : null,
                      onTap: () => Navigator.pop(context, plu),
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

          if (selectedPlu != null && selectedPlu.skuNo != null) {
            _currentSearchQuery = selectedPlu.skuNo.toString();
            _resetAndLoadInventory();
          }
        } else {
          // If no PLU match, search directly by the entered text
          _currentSearchQuery = pluNo.trim();
          _resetAndLoadInventory();
        }
      }
    } catch (e) {
      // On error, search directly by the entered text
      _currentSearchQuery = pluNo.trim();
      _resetAndLoadInventory();
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
    setState(() {
      _currentOffset = 0;
      _hasMoreData = true;
    });

    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      
      final items = await _inventoryService.getInventory(
        companyCode: companyCode,
        searchQuery: _currentSearchQuery.isEmpty ? null : _currentSearchQuery,
        filter: _currentFilter,
        limit: _pageSize,
        offset: 0,
        forceRefresh: true,
      );

      setState(() {
        _inventoryItems = _dedupeByCompanySku(items);
        _currentOffset = _inventoryItems.length;
        _hasMoreData = items.length == _pageSize;
        _isOnline = true;
        _debugInfo = 'Refreshed: ${items.length} inventory items';
        _errorMessage = '';
      });

    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to refresh inventory: $e';
        _debugInfo = 'Refresh error: $e';
        _isOnline = false;
      });
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
                child: InventoryImageWidget(
                  companyCode: companyCode,
                  skuNo: item.skuNo,
                  uom: item.uom,
                  borderRadius: BorderRadius.zero,
                  fit: BoxFit.cover,
                  showLoadingIndicator: true,
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
          Text('$qty', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
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

  void _addToCart(InventoryItem item, {String? remark, String? uom, double? customGstPrice}) async {
    try {
      final int qty = _qtySelections[item.skuNo] ?? 1;
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      // Use custom price if provided, otherwise use item's default price
      final double finalGstPrice = customGstPrice ?? item.gstPrice ?? 0.0;
      final double finalUnitPrice = customGstPrice != null ? (customGstPrice / 1.06) : (item.price ?? 0.0);
      
      await _cartService.addToCart(
        companyCode: companyCode,
        skuNo: item.skuNo,
        pluNo: item.pluNo != null ? item.pluNo.toString() : null,
        description: item.description ?? '',
        uom: uom ?? item.uom ?? '',
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
        _debugInfo = 'All cache clear error: $e';
        _isOnline = false;
      });

      // Show error message
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

  void _clearSearch() {
    _searchController.clear();
    _currentSearchQuery = '';
    // Force refresh to ensure full catalog is shown after clearing search
    _resetAndLoadInventory(forceRefresh: true);
  }

  Future<void> _openBarcodeScanner() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
    );
    if (result != null && result.isNotEmpty) {
      _pluController.text = result;
      // The _onPluSearchChanged listener will handle the search automatically
    }
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
    if (!_currentFilter.hasActiveFilters) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 8,
        children: [
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
      backgroundColor: Colors.grey[50],
      drawer: _buildSideFilterDrawer(),
      body: Stack(
        children: [
          CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Header with Background Image
          SliverAppBar(
            expandedHeight: 100,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Page title
                        const Text(
                          'Inventory',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Company info
                        if (_selectedCompany != null) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.business,
                                size: 12,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  _selectedCompany!['companyName'] ?? '',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 12,
                                  ),
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
                ),
              ),
            ),
            actions: [
              // Online status
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: OnlineStatusIcon(isOnline: _isOnline),
              ),
              // Filter button
              IconButton(
                onPressed: _toggleFilters,
                icon: Icon(
                  _showFilters ? Icons.filter_list_off : Icons.filter_list,
                  color: Colors.white,
                ),
                tooltip: _showFilters ? 'Hide Filters' : 'Show Filters',
              ),
              // Grid/List toggle
              IconButton(
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
                icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view, color: Colors.white),
                tooltip: _isGridView ? 'Switch to List View' : 'Switch to Grid View',
              ),
              // Cart button with badge
              Stack(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartPage()),
                      );
                      if (result == true) {
                        _loadCartCount(); // Refresh cart count
                      }
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    tooltip: 'View Cart',
                  ),
                  if (_cartItemCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$_cartItemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              // Clear cache button
              IconButton(
                onPressed: _showClearCacheDialog,
                icon: const Icon(Icons.cleaning_services, color: Colors.white),
                tooltip: 'Clear Inventory Cache',
              ),
              // Refresh button
              IconButton(
                onPressed: _refreshInventory,
                icon: const Icon(Icons.refresh, color: Colors.white),
                tooltip: 'Refresh Inventory',
              ),
            ],
          ),

          // Filter Panel (now above search bar)
          SliverToBoxAdapter(
            child: _buildFilterPanel(),
          ),

          // Search Bar with PLU input
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  // Regular search field
                  Expanded(
                    child: Container(
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
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search by name, SKU, brand...',
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: _clearSearch,
                                  icon: const Icon(Icons.clear, color: Colors.grey),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // PLU search with scanner
                  Container(
                    width: 180,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _pluController,
                            decoration: InputDecoration(
                              hintText: 'Search by PLU...',
                              prefixIcon: const Icon(Icons.tag, color: Colors.blue, size: 20),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted: _onPluSearchSubmitted,
                          ),
                        ),
                        IconButton(
                          onPressed: _openBarcodeScanner,
                          icon: const Icon(Icons.qr_code_scanner, color: Colors.blue),
                          tooltip: 'Scan Barcode',
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Secondary Grid/List toggle for discoverability
                  Tooltip(
                    message: _isGridView ? 'Switch to List View' : 'Switch to Grid View',
                    child: Container(
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
                      child: IconButton(
                        icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view, color: Colors.blue),
                        onPressed: () {
                          setState(() {
                            _isGridView = !_isGridView;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Active Filter Chips
          SliverToBoxAdapter(
            child: _buildFilterChips(),
          ),



          // Error Message
          if (_errorMessage.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red.shade600),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red.shade700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Loading Indicator
          if (_isLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

          // Inventory items (Grid/List toggle)
          if (!_isLoading && _inventoryItems.isNotEmpty)
            (_isGridView
                ? SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.72,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = _inventoryItems[index];
                        return _buildInventorySquareCard(item);
                      },
                      childCount: _inventoryItems.length,
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = _inventoryItems[index];
                        return _buildInventoryListItem(item);
                      },
                      childCount: _inventoryItems.length,
                    ),
                  )),

          // No Results Message
          if (!_isLoading && _inventoryItems.isEmpty && _errorMessage.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _currentSearchQuery.isEmpty
                          ? 'No inventory items found'
                          : 'No items match your search',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (_currentSearchQuery.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Try adjusting your search terms',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

          // Load More Indicator
          if (_isLoadingMore)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
          // Invisible gesture detector for left edge swipe
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 30,
            child: GestureDetector(
              onPanEnd: (details) {
                if (details.velocity.pixelsPerSecond.dx > 300) {
                  _scaffoldKey.currentState?.openDrawer();
                }
              },
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
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
      margin: EdgeInsets.zero, // Remove card margin to eliminate gaps
      elevation: 1,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showInventoryDetails(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image section: full-width square image
            AspectRatio(
              aspectRatio: 1.0,
              child: InventoryImageWidget(
                companyCode: _selectedCompany?['companyCode'] is String
                    ? int.parse(_selectedCompany!['companyCode'])
                    : _selectedCompany?['companyCode'] ?? 0,
                skuNo: item.skuNo,
                uom: item.uom,
                borderRadius: BorderRadius.zero,
                fit: BoxFit.cover,
                showLoadingIndicator: true,
              ),
            ),
            // Details section: compact padding, no Expanded/Spacer to avoid overflow
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.displayName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'SKU: ${item.skuNo}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (item.brand != null && item.brand!.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      item.brand!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: (item.qtyOnHand ?? 0) > 0 ? Colors.green[50] : Colors.red[50],
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: (item.qtyOnHand ?? 0) > 0 ? Colors.green[200]! : Colors.red[200]!,
                      ),
                    ),
                    child: Text(
                      'Stock: ${item.displayQtyOnHand}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: (item.qtyOnHand ?? 0) > 0 ? Colors.green[700] : Colors.red[700],
                      ),
                    ),
                  ),
                ],
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

  Future<List<InStockUom>> _loadUomOptions(InventoryItem item) async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      return await _inventoryService.getUomPricing(
        companyCode: companyCode,
        skuNo: item.skuNo,
      );
    } catch (e) {
      print('❌ Error loading UOM options: $e');
      return [];
    }
  }

  void _showInventoryDetails(InventoryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final int sku = item.skuNo;
        int localQty = _qtySelections[sku] ?? 1;
        String selectedUom = (item.uom ?? '').trim();
        final TextEditingController remarkCtrl = TextEditingController();
        final TextEditingController qtyCtrl = TextEditingController(text: localQty.toString());
        // Initialize price from map or item's default price
        if (!_priceSelections.containsKey(sku)) {
          _priceSelections[sku] = item.gstPrice ?? 0.0;
        }
        final TextEditingController priceCtrl = TextEditingController(text: _priceSelections[sku]!.toStringAsFixed(2));
        List<InStockUom> uomOptions = [];
        bool isLoadingUom = true;
        InStockUom? selectedUomData;
        bool canEditPrice = false;
        bool isCheckingPermission = true;
        return DraggableScrollableSheet(
          initialChildSize: 0.45,
          maxChildSize: 0.9,
          minChildSize: 0.35,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setSheetState) {
                // Load UOM options when sheet opens
                if (isLoadingUom) {
                  _loadUomOptions(item).then((options) {
                    if (mounted) {
                      setSheetState(() {
                        uomOptions = options;
                        isLoadingUom = false;
                        // Set default selected UOM
                        if (options.isNotEmpty) {
                          selectedUomData = options.firstWhere(
                            (uom) => uom.uom?.toLowerCase() == selectedUom.toLowerCase(),
                            orElse: () => options.first,
                          );
                          selectedUom = selectedUomData?.uom ?? selectedUom;
                        }
                      });
                    }
                  });
                }
                
                // Check price edit permission
                if (isCheckingPermission) {
                  _authService.getSelectedCompany().then((company) async {
                    final companyCodeRaw = company?['companyCode'] ?? 1;
                    final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
                    final settingsService = UserAppSettingsService();
                    final canEdit = await settingsService.canChangePrice(companyCode: companyCode);
                    if (mounted) {
                      setSheetState(() {
                        canEditPrice = canEdit;
                        isCheckingPermission = false;
                      });
                    }
                  });
                }
                
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Handle bar
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 4,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        // Header with code and name
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Text('${item.skuNo}', style: const TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.displayName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Get the current price BEFORE clearing selections
                                final currentPrice = _priceSelections[sku] ?? item.gstPrice ?? 0.0;
                                
                                // commit local qty and clear selections
                                setState(() { 
                                  _qtySelections[sku] = localQty;
                                  // Clear price selection after adding to cart
                                  _priceSelections.remove(sku);
                                });
                                Navigator.of(context).pop();
                                
                                // Add to cart with the correct price for selected UOM
                                _addToCart(
                                  item, 
                                  remark: remarkCtrl.text, 
                                  uom: selectedUom.isEmpty ? null : selectedUom,
                                  customGstPrice: currentPrice,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                minimumSize: const Size(0, 36),
                              ),
                              icon: const Icon(Icons.add_shopping_cart, size: 18),
                              label: const Text('Add'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Price row with qty input
                        Row(
                          children: [
                            // Dynamic price tag that updates with UOM selection
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.amber.shade200),
                              ),
                              child: Text(
                                'RM ${_priceSelections[sku]!.toStringAsFixed(2)} / ${selectedUom.isEmpty ? (item.uom ?? 'PCS') : selectedUom}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black87),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Price display with edit icon (only if permission granted)
                            if (canEditPrice) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.green.shade300),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'RM ${_priceSelections[sku]!.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    InkWell(
                                      onTap: () async {
                                        final newPrice = await showDialog<double>(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (dialogContext) => _InventoryPriceEditDialog(
                                            itemName: item.displayName,
                                            initialPrice: _priceSelections[sku]!,
                                          ),
                                        );
                                        if (newPrice != null) {
                                          setState(() {
                                            _priceSelections[sku] = newPrice;
                                          });
                                          setSheetState(() {
                                            priceCtrl.text = newPrice.toStringAsFixed(2);
                                          });
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        child: const Icon(
                                          Icons.edit,
                                          size: 16,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            const SizedBox(width: 12),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blue.shade200),
                                color: Colors.blue.shade50,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Qty', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () => setSheetState(() { 
                                      localQty = (localQty - 1).clamp(1, 999);
                                      qtyCtrl.text = localQty.toString();
                                      _qtySelections[sku] = localQty;
                                    }),
                                    child: const Icon(Icons.remove, size: 20),
                                  ),
                                  SizedBox(
                                    width: 64,
                                    child: TextField(
                                      key: ValueKey('sheet_qty_${item.skuNo}'),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: qtyCtrl,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      onChanged: (val) {
                                        final parsed = int.tryParse(val);
                                        setSheetState(() {
                                          localQty = (parsed ?? localQty).clamp(1, 999);
                                          _qtySelections[sku] = localQty;
                                        });
                                      },
                                      onEditingComplete: () {
                                        final parsed = int.tryParse(qtyCtrl.text) ?? localQty;
                                        setSheetState(() {
                                          localQty = parsed.clamp(1, 999);
                                          qtyCtrl.text = localQty.toString();
                                          _qtySelections[sku] = localQty;
                                        });
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => setSheetState(() { 
                                      localQty = (localQty + 1).clamp(1, 999);
                                      qtyCtrl.text = localQty.toString();
                                      _qtySelections[sku] = localQty;
                                    }),
                                    child: const Icon(Icons.add, size: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Remark input
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              color: Colors.blue.shade600,
                              child: const Text('Remark', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: remarkCtrl,
                                decoration: const InputDecoration(
                                  hintText: 'Enter item remark',
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // UOM list (chips)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              color: Colors.blue.shade600,
                              child: const Text('UOM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  ...uomOptions.map((uomOption) => 
                                    ChoiceChip(
                                      label: Text(uomOption.uom ?? ''),
                                      selected: selectedUom == (uomOption.uom ?? ''),
                                      onSelected: (_) => setSheetState(() { 
                                        selectedUom = uomOption.uom ?? '';
                                        selectedUomData = uomOption;
                                        // Update price when UOM changes
                                        final newPrice = uomOption.gstPrice ?? uomOption.price ?? 0.0;
                                        _priceSelections[sku] = newPrice;
                                        priceCtrl.text = newPrice.toStringAsFixed(2);
                                        print('🔄 UOM changed to ${uomOption.uom}, price updated to RM ${newPrice.toStringAsFixed(2)}');
                                      }),
                                      selectedColor: Colors.orange.shade200,
                                    ),
                                  ).toList(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Previous orders
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              color: Colors.blue.shade600,
                              child: const Text('Previous Orders', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: FutureBuilder<List<Map<String, dynamic>>>(
                                key: ValueKey('prev_orders_${item.skuNo}_$selectedUom'), // Rebuild when UOM changes
                                future: _loadPreviousOrdersForItem(item, filterUom: selectedUom.isEmpty ? null : selectedUom),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Center(child: SizedBox(height: 16, width: 16, child: CircularProgressIndicator(strokeWidth: 2))),
                                    );
                                  }
                                  if (snapshot.hasError) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Text('Failed to load previous orders: ${snapshot.error}', style: const TextStyle(color: Colors.redAccent)),
                                    );
                                  }
                                  final data = snapshot.data ?? const [];
                                  if (data.isEmpty) {
                                    final isOnline = signalRService.isConnected;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        isOnline
                                          ? 'No previous orders found for this item.'
                                          : 'No cached previous orders available offline. Connect to internet to sync order history.',
                                        style: const TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                                      ),
                                    );
                                  }
                                  // Render as grid for better readability
                                  return LayoutBuilder(
                                    builder: (context, constraints) {
                                      final width = constraints.maxWidth;
                                      final int crossAxisCount = width >= 600
                                          ? 3
                                          : width >= 360
                                              ? 2
                                              : 1;
                                      return GridView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: crossAxisCount,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          childAspectRatio: 2.8,
                                        ),
                                        itemCount: data.length,
                                        itemBuilder: (context, index) {
                                          final order = data[index];
                                          final DateTime? dt = order['date'] as DateTime?;
                                          final dateStr = dt == null ? '-' : '${dt.day.toString().padLeft(2,'0')}/${dt.month.toString().padLeft(2,'0')}/${dt.year}';
                                          final qty = order['qty'];
                                          final uom = order['uom'] ?? '';
                                          final price = (order['price'] ?? 0).toStringAsFixed(2);
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: const Color(0xFFE0E0E0)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.03),
                                                  blurRadius: 4,
                                                  offset: const Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        '#${order['quoteNo']}',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(fontWeight: FontWeight.w600),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateStr,
                                                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 6),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue.shade50,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Text('Qty: $qty $uom', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Container(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                      decoration: BoxDecoration(
                                                        color: Colors.green.shade50,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Text('RM $price', style: const TextStyle(fontSize: 12, color: Colors.black87)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
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

      // If customer is selected, ensure we prefer their quotes first
      if (selectedCustomer != null) {
        final custLabels = quotes
            .where((q) => q.customer == selectedCustomer.code)
            .map((q) => q.quotePreLabel)
            .whereType<String>()
            .toSet();
        final custMatched = matched.where((qi) => qi.quotePreLabel != null && custLabels.contains(qi.quotePreLabel)).toList();
        // Prefer customer-specific; fallback to company-wide if empty
        if (custMatched.isNotEmpty) {
          matched = custMatched;
        }
        print('🔎 PreviousOrders: After customer preference, ${matched.length} items remain');
      }

      // Build compact view model and sort by parent quote date desc
      matched.sort((a, b) {
        final qa = quoteByLabel[a.quotePreLabel]?.addedDate ?? DateTime(1970);
        final qb = quoteByLabel[b.quotePreLabel]?.addedDate ?? DateTime(1970);
        return qb.compareTo(qa);
      });

      return matched.take(5).map((qi) {
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

  Widget _buildInventoryDetailsContent(InventoryItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Basic Information
        _buildDetailSection(
          'Basic Information',
          [
            _buildDetailRow('Name', item.displayName),
            _buildDetailRow('SKU', item.skuNo.toString()),
            _buildDetailRow('Article No', item.articleNo ?? 'N/A'),
            _buildDetailRow('Brand', item.displayBrand),
            _buildDetailRow('Category', item.displayCategory),
            _buildDetailRow('Status', item.displayStatus),
            _buildDetailRow('UOM', item.uom ?? 'N/A'),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Stock Information
        _buildDetailSection(
          'Stock Information',
          [
            _buildDetailRow('Quantity on Hand', item.displayQtyOnHand),
            _buildDetailRow('Quantity on Order', item.qtyOnOrder?.toStringAsFixed(2) ?? '0.00'),
            _buildDetailRow('Quantity on Sales', item.qtyOnSales?.toStringAsFixed(2) ?? '0.00'),
            _buildDetailRow('Min Stock Level', item.minStockLevel?.toStringAsFixed(2) ?? '0.00'),
            _buildDetailRow('Max Stock Level', item.maxStockLevel?.toStringAsFixed(2) ?? '0.00'),
            _buildDetailRow('Reorder Level', item.reorderLevel?.toStringAsFixed(2) ?? '0.00'),
            _buildDetailRow('Location', item.displayLocation),
          ],
        ),
        
        const SizedBox(height: 24),
        
        // Cost Information
        if (item.averageCost != null || item.lastCost != null || item.standardCost != null)
          _buildDetailSection(
            'Cost Information',
            [
              if (item.averageCost != null)
                _buildDetailRow('Average Cost', '\$${item.averageCost!.toStringAsFixed(2)}'),
              if (item.lastCost != null)
                _buildDetailRow('Last Cost', '\$${item.lastCost!.toStringAsFixed(2)}'),
              if (item.standardCost != null)
                _buildDetailRow('Standard Cost', '\$${item.standardCost!.toStringAsFixed(2)}'),
            ],
          ),
        
        const SizedBox(height: 24),
        
        // Additional Information
        _buildDetailSection(
          'Additional Information',
          [
            if (item.size != null) _buildDetailRow('Size', item.size!),
            if (item.color != null) _buildDetailRow('Color', item.color!),
            if (item.packSize != null) _buildDetailRow('Pack Size', item.packSize!.toString()),
            if (item.packSizeDescription != null) _buildDetailRow('Pack Size Desc', item.packSizeDescription!),
            if (item.warrantyPeriod != null) _buildDetailRow('Warranty Period', '${item.warrantyPeriod} ${item.warrantyPeriodType ?? ''}'),
            if (item.remarks != null && item.remarks!.isNotEmpty) _buildDetailRow('Remarks', item.remarks!),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stable price edit dialog for inventory items
class _InventoryPriceEditDialog extends StatefulWidget {
  final String itemName;
  final double initialPrice;

  const _InventoryPriceEditDialog({
    required this.itemName,
    required this.initialPrice,
  });

  @override
  State<_InventoryPriceEditDialog> createState() => _InventoryPriceEditDialogState();
}

class _InventoryPriceEditDialogState extends State<_InventoryPriceEditDialog> {
  late final TextEditingController _controller;
  late final String _fixedItemName;
  late final double _fixedPrice;

  @override
  void initState() {
    super.initState();
    // Freeze values at initialization to prevent external rebuilds from affecting dialog
    _fixedPrice = widget.initialPrice;
    _fixedItemName = widget.itemName;
    _controller = TextEditingController(text: _fixedPrice.toStringAsFixed(2));
    
    print('💰 Inventory price dialog initialized with $_fixedPrice for: $_fixedItemName');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Prevent widget updates from affecting the dialog
  @override
  void didUpdateWidget(covariant _InventoryPriceEditDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('💰 Inventory price dialog update blocked - keeping original values');
    // Don't update anything - keep original frozen values
  }

  void _submitPrice() {
    final value = _controller.text.trim();
    final price = double.tryParse(value);
    
    if (price != null && price >= 0) {
      Navigator.pop(context, price);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid price'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button dismissal
      child: AlertDialog(
        title: const Text('Edit Price'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fixedItemName, // Use frozen item name
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Unit Price (RM)',
                prefixText: 'RM ',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              autofocus: false,
              onFieldSubmitted: (_) => _submitPrice(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _submitPrice,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
