import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/inventory_item.dart';
import '../services/quote_item_service.dart';
import '../services/inventory_service.dart';
import '../services/signalr_service.dart';
import '../online_status_icon.dart';
import '../config/company_image_config.dart';
import '../main.dart';

class QuoteItemDetailsPage extends StatefulWidget {
  final Quote quote;

  const QuoteItemDetailsPage({Key? key, required this.quote}) : super(key: key);

  @override
  State<QuoteItemDetailsPage> createState() => _QuoteItemDetailsPageState();
}

class _QuoteItemDetailsPageState extends State<QuoteItemDetailsPage> {
  late QuoteItemService _quoteItemService;
  late InventoryService _inventoryService;
  
  List<QuoteItem> _quoteItems = [];
  Set<int> _selectedItems = <int>{}; // Store selected item IDs
  Map<int, double> _adjustedQuantities = <int, double>{}; // Store adjusted quantities by item ID
  Map<int, double> _adjustedPrices = <int, double>{}; // Store adjusted prices by item ID
  Map<int, String> _itemDescriptions = <int, String>{}; // Cache for item descriptions
  bool _isLoading = false;
  bool _isOnline = false;
  String? _error;
  bool _isGridView = true; // Toggle between list and grid views (default to grid)

  @override
  void initState() {
    super.initState();
    _quoteItemService = QuoteItemService(signalRService);
    _inventoryService = InventoryService();
    _loadQuoteItems();
  }

  Future<void> _loadQuoteItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('🔍 QUOTE ITEMS: Loading items for quote ${widget.quote.quotePreLabel}');
      
      final items = await _quoteItemService.getQuoteItems(
        quotePreLabel: widget.quote.quotePreLabel ?? '',
        companyCode: widget.quote.companyCode ?? 0,
      );

      print('📋 QUOTE ITEMS: Loaded ${items.length} items');

      setState(() {
        _quoteItems = items;
        _isOnline = true;
      });
      
      // Load descriptions for all items
      await _loadItemDescriptions();
    } catch (e) {
      print('❌ QUOTE ITEMS ERROR: $e');
      setState(() {
        _error = 'Failed to load quote items: $e';
        _isOnline = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshItems() async {
    print('🔄 QUOTE ITEMS: Refresh button pressed');
    await _loadQuoteItems();
  }

  void _toggleItemSelection(int itemId) {
    setState(() {
      if (_selectedItems.contains(itemId)) {
        _selectedItems.remove(itemId);
      } else {
        _selectedItems.add(itemId);
      }
    });
    print('📝 QUOTE ITEMS: Selected items: ${_selectedItems.length}');
  }

  void _updateQuantity(int itemId, double newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        _adjustedQuantities.remove(itemId);
      } else {
        _adjustedQuantities[itemId] = newQuantity;
      }
    });
    print('📊 QUOTE ITEMS: Updated quantity for item $itemId to $newQuantity');
  }

  void _updatePrice(int itemId, double newPrice) {
    setState(() {
      if (newPrice <= 0) {
        _adjustedPrices.remove(itemId);
      } else {
        _adjustedPrices[itemId] = newPrice;
      }
    });
    print('💰 QUOTE ITEMS: Updated price for item $itemId to $newPrice');
  }

  double _getDisplayQuantity(QuoteItem item) {
    return _adjustedQuantities[item.id] ?? item.displayQuantity;
  }

  double _getDisplayPrice(QuoteItem item) {
    return _adjustedPrices[item.id] ?? item.displayUnitPrice;
  }

  String _constructImageUrl(QuoteItem item) {
    return CompanyImageConfig.constructImageUrl(
      item.companyCode,
      item.skuNo,
      item.uom,
    ) ?? '';
  }

  Future<void> _loadItemDescriptions() async {
    try {
      print('📋 QUOTE ITEMS: Loading descriptions from in_stock table...');
      for (final item in _quoteItems) {
        final inventoryItem = await _inventoryService.getInventoryItemBySku(
          item.companyCode,
          item.skuNo,
        );
        
        // Prefer the first non-empty among Description, Article_Desc, Description2
        final resolved = [
          inventoryItem?.description,
          inventoryItem?.articleDesc,
          inventoryItem?.description2,
        ].firstWhere(
          (e) => e != null && e.trim().isNotEmpty,
          orElse: () => null,
        );

        if (resolved != null) {
          setState(() {
            _itemDescriptions[item.skuNo] = resolved;
          });
          print('✅ Found description for SKU ${item.skuNo}: $resolved');
        } else {
          print('❌ No description fields found in local cache for SKU ${item.skuNo}. Trying online fetch...');

          // Online fallback: try to fetch a small set from server using SKU as search
          try {
            final fetched = await _inventoryService.getInventory(
              companyCode: item.companyCode,
              searchQuery: item.skuNo.toString(),
              limit: 5,
              offset: 0,
              forceRefresh: true,
            );

            final matchedList = fetched.where((inv) => inv.skuNo == item.skuNo).toList();
            final matched = matchedList.isNotEmpty ? matchedList.first : null;

            final resolvedOnline = [
              matched?.description,
              matched?.articleDesc,
              matched?.description2,
            ].firstWhere(
              (e) => e != null && e.trim().isNotEmpty,
              orElse: () => null,
            );

            if (resolvedOnline != null) {
              setState(() {
                _itemDescriptions[item.skuNo] = resolvedOnline;
              });
              print('🌐 Loaded description online for SKU ${item.skuNo}: $resolvedOnline');
            } else {
              print('⚠️ Online fetch returned no usable description for SKU ${item.skuNo}');
            }
          } catch (e) {
            print('⚠️ Online description fetch failed for SKU ${item.skuNo}: $e');
          }
        }
      }
    } catch (e) {
      print('⚠️ QUOTE ITEMS: Error loading descriptions: $e');
    }
  }

  String _getItemDescription(QuoteItem item) {
    // Use cached in_stock description; fallback to quote item's alternateDescription; else SKU
    return _itemDescriptions[item.skuNo]
        ?? (item.alternateDescription != null && item.alternateDescription!.trim().isNotEmpty
            ? item.alternateDescription!
            : 'SKU ${item.displaySkuNo}');
  }

  void _selectAllItems() {
    setState(() {
      _selectedItems = _quoteItems.map((item) => item.id).toSet();
    });
    print('📝 QUOTE ITEMS: Selected all ${_selectedItems.length} items');
  }

  void _clearSelection() {
    setState(() {
      _selectedItems.clear();
    });
    print('📝 QUOTE ITEMS: Cleared selection');
  }

  void _showQuantityDialog(QuoteItem item) {
    // Capture values immediately to prevent rebuilds from affecting dialog
    final currentQuantity = _getDisplayQuantity(item);
    final description = _getItemDescription(item);
    
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent accidental dismissal
      builder: (BuildContext dialogContext) {
        return _QuantityEditDialog(
          item: item,
          initialQuantity: currentQuantity,
          onQuantityChanged: (newQty) => _updateQuantity(item.id, newQty),
          itemDescription: description,
        );
      },
    );
  }

  void _showPriceEditDialog(QuoteItem item) {
    // Capture values immediately to prevent rebuilds from affecting dialog
    final currentPrice = _getDisplayPrice(item);
    final description = _getItemDescription(item);
    
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent accidental dismissal
      builder: (BuildContext dialogContext) {
        return _PriceEditDialog(
          item: item,
          initialPrice: currentPrice,
          onPriceChanged: (newPrice) => _updatePrice(item.id, newPrice),
          itemDescription: description,
        );
      },
    );
  }

  void _copyOrderToCart() {
    if (_selectedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one item to add to cart'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Get selected items with adjusted quantities
    final selectedQuoteItems = _quoteItems.where((item) => _selectedItems.contains(item.id)).toList();
    
    // Log the items being added with their adjusted quantities and prices
    for (final item in selectedQuoteItems) {
      final adjustedQty = _getDisplayQuantity(item);
      final adjustedPrice = _getDisplayPrice(item);
      print('🛒 Adding to cart: SKU ${item.skuNo}, Qty: $adjustedQty, Price: $adjustedPrice');
    }
    
    // TODO: Implement cart functionality with adjusted quantities
    // For now, just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${selectedQuoteItems.length} items to cart with adjusted quantities'),
        backgroundColor: Colors.green,
      ),
    );
    
    print('🛒 QUOTE ITEMS: Added ${selectedQuoteItems.length} items to cart');
    
    // Clear selection and reset quantities/prices after adding to cart
    _clearSelection();
    setState(() {
      _adjustedQuantities.clear();
      _adjustedPrices.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Top row with back button and online status
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              ),
              const Spacer(),
              OnlineStatusIcon(isOnline: _isOnline),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _refreshItems,
                icon: const Icon(Icons.refresh, color: Colors.white, size: 24),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Quote information
          Column(
            children: [
              Text(
                'Quote Items',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.quote.quotePreLabel ?? 'No Quote Number',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.quote.formattedQuoteDate,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Loading quote items...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red[300], size: 64),
            const SizedBox(height: 16),
            Text(
              _error!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshItems,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_quoteItems.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, color: Colors.white54, size: 64),
            SizedBox(height: 16),
            Text(
              'No items found in this quote',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        // Selection controls
        _buildSelectionControls(),
        
        // Items list
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(12),
            ),
            child: _isGridView
                ? GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: _quoteItems.length,
                    itemBuilder: (context, index) {
                      final item = _quoteItems[index];
                      return _buildGridItemCard(item);
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _quoteItems.length,
                    itemBuilder: (context, index) {
                      final item = _quoteItems[index];
                      return _buildItemCard(item);
                    },
                  ),
          ),
        ),
        
        // Bottom action bar
        _buildBottomActionBar(),
      ],
    );
  }

  Widget _buildSelectionControls() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            '${_selectedItems.length} of ${_quoteItems.length} selected',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: _selectAllItems,
            child: const Text('Select All'),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: _clearSelection,
            child: const Text('Clear'),
          ),
          const SizedBox(width: 12),
          Container(
            height: 24,
            width: 1,
            color: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Tooltip(
            message: _isGridView ? 'Switch to List View' : 'Switch to Grid View',
            child: IconButton(
              icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
              onPressed: () {
                setState(() {
                  _isGridView = !_isGridView;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItemCard(QuoteItem item) {
    final isSelected = _selectedItems.contains(item.id);
    return InkWell
      (
      onTap: () => _toggleItemSelection(item.id),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.06) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: isSelected ? 1.5 : 0.7,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Large image area
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: _constructImageUrl(item).isNotEmpty
                    ? Image.network(
                        _constructImageUrl(item),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[100],
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey[400],
                              size: 48,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[100],
                            child: const Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        color: Colors.grey[100],
                        child: Icon(
                          Icons.inventory_2_outlined,
                          color: Colors.grey[400],
                          size: 48,
                        ),
                      ),
              ),
            ),
            // Details section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getItemDescription(item),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'RM ${_getDisplayPrice(item).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () => _showPriceEditDialog(item),
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'SKU ${item.displaySkuNo} • ${item.displayUom}',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Quantity quick controls
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        iconSize: 20,
                        color: Colors.grey[700],
                        onPressed: () {
                          final currentQty = _getDisplayQuantity(item);
                          if (currentQty > 1) {
                            _updateQuantity(item.id, currentQty - 1);
                          }
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!, width: 0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _getDisplayQuantity(item).toStringAsFixed(0),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        iconSize: 20,
                        color: Colors.grey[700],
                        onPressed: () {
                          final currentQty = _getDisplayQuantity(item);
                          _updateQuantity(item.id, currentQty + 1);
                        },
                      ),
                      const Spacer(),
                      // Selection indicator
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) => _toggleItemSelection(item.id),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(QuoteItem item) {
    final isSelected = _selectedItems.contains(item.id);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.08) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: isSelected ? 1.5 : 0.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () => _toggleItemSelection(item.id),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                // Compact radio button
                Transform.scale(
                  scale: 0.8,
                  child: Radio<bool>(
                    value: true,
                    groupValue: isSelected,
                    onChanged: (value) => _toggleItemSelection(item.id),
                    activeColor: Colors.blue,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                
                const SizedBox(width: 6),
                
                // Compact product image
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey[300]!, width: 0.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: _constructImageUrl(item).isNotEmpty
                        ? Image.network(
                            _constructImageUrl(item),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[100],
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey[400],
                                  size: 16,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[100],
                                child: Center(
                                  child: SizedBox(
                                    width: 12,
                                    height: 12,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.grey[100],
                            child: Icon(
                              Icons.inventory_2_outlined,
                              color: Colors.grey[400],
                              size: 16,
                            ),
                          ),
                  ),
                ),
                
                // Item details - compact layout
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Description (most prominent) - from in_stock table
                      Text(
                        _getItemDescription(item),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      const SizedBox(height: 2),
                      
                      // SKU, UOM, and Price in one compact row
                      Row(
                        children: [
                          Text(
                            'SKU: ${item.displaySkuNo}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '• ${item.displayUom}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'RM ${_getDisplayPrice(item).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 2),
                          InkWell(
                            onTap: () => _showPriceEditDialog(item),
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.edit,
                                size: 12,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Quantity controls and total in compact row
                      Row(
                        children: [
                          // Enhanced quantity controls with direct input
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!, width: 0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    final currentQty = _getDisplayQuantity(item);
                                    if (currentQty > 1) {
                                      _updateQuantity(item.id, currentQty - 1);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    child: Icon(
                                      Icons.remove,
                                      size: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => _showQuantityDialog(item),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    constraints: const BoxConstraints(minWidth: 40),
                                    child: Text(
                                      _getDisplayQuantity(item).toStringAsFixed(0),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    final currentQty = _getDisplayQuantity(item);
                                    _updateQuantity(item.id, currentQty + 1);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    child: Icon(
                                      Icons.add,
                                      size: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const Spacer(),
                          
                          // Total amount
                          Text(
                            'Total: MYR ${(_getDisplayQuantity(item) * _getDisplayPrice(item)).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      
                      // Remark if available (compact)
                      if (item.remark?.isNotEmpty == true) ...[
                        const SizedBox(height: 2),
                        Text(
                          item.remark!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _selectedItems.isNotEmpty ? _copyOrderToCart : null,
              icon: const Icon(Icons.shopping_cart_outlined),
              label: Text(
                _selectedItems.isEmpty 
                  ? 'Copy Order' 
                  : 'Add ${_selectedItems.length} to Cart',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stable quantity edit dialog that prevents text field reset
class _QuantityEditDialog extends StatefulWidget {
  final QuoteItem item;
  final double initialQuantity;
  final Function(double) onQuantityChanged;
  final String itemDescription;

  const _QuantityEditDialog({
    required this.item,
    required this.initialQuantity,
    required this.onQuantityChanged,
    required this.itemDescription,
  });

  @override
  State<_QuantityEditDialog> createState() => _QuantityEditDialogState();
}

class _QuantityEditDialogState extends State<_QuantityEditDialog> {
  late final TextEditingController _controller;
  late final String _fixedDescription;
  late final double _fixedQuantity;

  @override
  void initState() {
    super.initState();
    // Freeze values at initialization to prevent external rebuilds from affecting dialog
    _fixedQuantity = widget.initialQuantity;
    _fixedDescription = widget.itemDescription;
    _controller = TextEditingController(text: _fixedQuantity.toStringAsFixed(0));
    
    print('📊 Quantity dialog initialized with $_fixedQuantity for: $_fixedDescription');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Prevent widget updates from affecting the dialog
  @override
  void didUpdateWidget(covariant _QuantityEditDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('📊 Dialog update blocked - keeping original values');
    // Don't update anything - keep original frozen values
  }

  void _submitQuantity() {
    final value = _controller.text.trim();
    final quantity = double.tryParse(value);
    
    if (quantity != null && quantity > 0) {
      widget.onQuantityChanged(quantity);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid quantity greater than 0'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button dismissal
      child: AlertDialog(
        title: const Text('Enter Quantity'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fixedDescription, // Use frozen description
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.edit),
                filled: true,
                fillColor: Colors.white,
              ),
              autofocus: false,
              onFieldSubmitted: (_) => _submitQuantity(),
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
            onPressed: _submitQuantity,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}

// Stable price edit dialog that prevents text field reset
class _PriceEditDialog extends StatefulWidget {
  final QuoteItem item;
  final double initialPrice;
  final Function(double) onPriceChanged;
  final String itemDescription;

  const _PriceEditDialog({
    required this.item,
    required this.initialPrice,
    required this.onPriceChanged,
    required this.itemDescription,
  });

  @override
  State<_PriceEditDialog> createState() => _PriceEditDialogState();
}

class _PriceEditDialogState extends State<_PriceEditDialog> {
  late final TextEditingController _controller;
  late final String _fixedDescription;
  late final double _fixedPrice;

  @override
  void initState() {
    super.initState();
    // Freeze values at initialization to prevent external rebuilds from affecting dialog
    _fixedPrice = widget.initialPrice;
    _fixedDescription = widget.itemDescription;
    _controller = TextEditingController(text: _fixedPrice.toStringAsFixed(2));
    
    print('💰 Price dialog initialized with $_fixedPrice for: $_fixedDescription');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Prevent widget updates from affecting the dialog
  @override
  void didUpdateWidget(covariant _PriceEditDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('💰 Price dialog update blocked - keeping original values');
    // Don't update anything - keep original frozen values
  }

  void _submitPrice() {
    final value = _controller.text.trim();
    final price = double.tryParse(value);
    
    if (price != null && price >= 0) {
      widget.onPriceChanged(price);
      Navigator.pop(context);
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
              _fixedDescription, // Use frozen description
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
