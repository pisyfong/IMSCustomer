import 'package:flutter/material.dart';
import '../models/quotation.dart';
import '../models/quote_item.dart';
import '../models/inventory_item.dart';
import '../services/quotation_service.dart';
import '../services/inventory_service.dart';
import '../services/invoice_service.dart';
import '../services/signalr_service.dart';
import '../services/customer_state_service.dart';
import '../config/company_image_config.dart';
import '../main.dart';

class EditUnsyncedQuotationPage extends StatefulWidget {
  final Quotation quotation;

  const EditUnsyncedQuotationPage({Key? key, required this.quotation}) : super(key: key);

  @override
  State<EditUnsyncedQuotationPage> createState() => _EditUnsyncedQuotationPageState();
}

class _EditUnsyncedQuotationPageState extends State<EditUnsyncedQuotationPage> {
  late QuotationService _quotationService;
  late InventoryService _inventoryService;
  
  List<QuoteItem> _items = [];
  Map<int, String> _itemDescriptions = {};
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _quotationService = QuotationService(signalRService);
    _inventoryService = InventoryService();
    _loadItems();
  }

  Future<void> _loadItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final items = await _quotationService.getQuotationItems(
        companyCode: widget.quotation.companyCode,
        quotePreLabel: widget.quotation.quotePreLabel,
      );

      setState(() {
        _items = items;
      });
      
      await _loadItemDescriptions();
    } catch (e) {
      setState(() {
        _error = 'Failed to load items: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadItemDescriptions() async {
    for (final item in _items) {
      final inventoryItem = await _inventoryService.getInventoryItemBySku(
        item.companyCode,
        item.skuNo,
      );
      
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
      }
    }
  }

  String _getItemDescription(QuoteItem item) {
    return _itemDescriptions[item.skuNo]
        ?? item.remark
        ?? item.alternateDescription
        ?? 'SKU ${item.skuNo}';
  }

  String _constructImageUrl(QuoteItem item) {
    return CompanyImageConfig.constructImageUrl(
      item.companyCode,
      item.skuNo,
      item.uom,
    ) ?? '';
  }

  double _calculateTotal() {
    return _items.fold(0.0, (sum, item) => sum + (item.netAmount ?? 0));
  }

  Future<void> _updateItemQuantity(QuoteItem item, double newQuantity) async {
    if (newQuantity <= 0) return;
    
    setState(() {
      item.quoteQuantity = newQuantity;
      item.netAmount = newQuantity * (item.unitPrice ?? 0);
      _hasChanges = true;
    });
    
    try {
      await _quotationService.updateQuotationItem(item);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating quantity: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _updateItemPrice(QuoteItem item, double newPrice) async {
    if (newPrice < 0) return;
    
    setState(() {
      item.unitPrice = newPrice;
      item.netAmount = (item.quoteQuantity ?? 0) * newPrice;
      _hasChanges = true;
    });
    
    try {
      await _quotationService.updateQuotationItem(item);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating price: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _deleteItem(QuoteItem item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: Text('Remove ${_getItemDescription(item)} from this quotation?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _quotationService.deleteQuotationItem(item);
        setState(() {
          _items.remove(item);
          _hasChanges = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item removed'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting item: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _showEditQuantityDialog(QuoteItem item) {
    final controller = TextEditingController(text: (item.quoteQuantity ?? 0).toStringAsFixed(0));
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Quantity'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getItemDescription(item), style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newQty = double.tryParse(controller.text) ?? 0;
              if (newQty > 0) {
                _updateItemQuantity(item, newQty);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEditPriceDialog(QuoteItem item) {
    final controller = TextEditingController(text: (item.unitPrice ?? 0).toStringAsFixed(2));
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Price'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getItemDescription(item), style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Unit Price (RM)',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newPrice = double.tryParse(controller.text) ?? 0;
              if (newPrice >= 0) {
                _updateItemPrice(item, newPrice);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _addNewItem() async {
    // Show item selector bottom sheet
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ItemSelectorBottomSheet(
        companyCode: widget.quotation.companyCode,
      ),
    );

    if (result != null) {
      final item = result['item'] as InventoryItem;
      final qty = result['quantity'] as double;
      final price = result['price'] as double;
      final uom = result['uom'] as String;
      final remark = result['remark'] as String?;
      
      try {
        await _quotationService.addQuotationItem(
          companyCode: widget.quotation.companyCode,
          quotePreLabel: widget.quotation.quotePreLabel,
          skuNo: item.skuNo,
          uom: uom,
          quantity: qty,
          unitPrice: price,
          pluNo: item.pluNo?.toString(),
          remark: remark ?? item.description,
        );
        
        setState(() {
          _hasChanges = true;
        });
        
        await _loadItems();
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item added'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding item: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _hasChanges);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edit Quotation', style: TextStyle(fontSize: 16)),
              Text(
                widget.quotation.quotePreLabel,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadItems,
            ),
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
                        const SizedBox(height: 16),
                        Text(_error!, style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 16),
                        ElevatedButton(onPressed: _loadItems, child: const Text('Retry')),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      // Header info
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.quotation.customer ?? 'No Customer',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.quotation.displayQuoteDate,
                                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.cloud_off, size: 14, color: Colors.orange.shade700),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Unsynced',
                                    style: TextStyle(fontSize: 11, color: Colors.orange.shade700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Items count and add button
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              '${_items.length} item(s)',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: _addNewItem,
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Add Item'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Items list
                      Expanded(
                        child: _items.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.inbox_outlined, size: 48, color: Colors.grey[400]),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No items in this quotation',
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton.icon(
                                      onPressed: _addNewItem,
                                      icon: const Icon(Icons.add),
                                      label: const Text('Add First Item'),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemCount: _items.length,
                                itemBuilder: (context, index) => _buildItemCard(_items[index]),
                              ),
                      ),
                      
                      // Total bar
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              'RM ${_calculateTotal().toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
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

  Widget _buildItemCard(QuoteItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _constructImageUrl(item).isNotEmpty
                    ? Image.network(
                        _constructImageUrl(item),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[400],
                        ),
                      )
                    : Icon(Icons.inventory_2_outlined, color: Colors.grey[400]),
              ),
            ),
            const SizedBox(width: 12),
            
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getItemDescription(item),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SKU: ${item.skuNo} • ${item.uom}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  
                  // Quantity and Price row
                  Row(
                    children: [
                      // Quantity controls
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                final currentQty = item.quoteQuantity ?? 0;
                                if (currentQty > 1) {
                                  _updateItemQuantity(item, currentQty - 1);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                child: const Icon(Icons.remove, size: 16),
                              ),
                            ),
                            InkWell(
                              onTap: () => _showEditQuantityDialog(item),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  border: Border.symmetric(
                                    vertical: BorderSide(color: Colors.grey[300]!),
                                  ),
                                ),
                                child: Text(
                                  (item.quoteQuantity ?? 0).toStringAsFixed(0),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final currentQty = item.quoteQuantity ?? 0;
                                _updateItemQuantity(item, currentQty + 1);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                child: const Icon(Icons.add, size: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      
                      // Price (tappable)
                      InkWell(
                        onTap: () => _showEditPriceDialog(item),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'RM ${(item.unitPrice ?? 0).toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Icon(Icons.edit, size: 12, color: Colors.green.shade700),
                            ],
                          ),
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Subtotal
                      Text(
                        'RM ${(item.netAmount ?? 0).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Delete button
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red[400]),
              onPressed: () => _deleteItem(item),
              tooltip: 'Remove item',
            ),
          ],
        ),
      ),
    );
  }
}

// Item selector bottom sheet - follows inventory page popup style
class _ItemSelectorBottomSheet extends StatefulWidget {
  final int companyCode;

  const _ItemSelectorBottomSheet({required this.companyCode});

  @override
  State<_ItemSelectorBottomSheet> createState() => _ItemSelectorBottomSheetState();
}

class _ItemSelectorBottomSheetState extends State<_ItemSelectorBottomSheet> {
  final InventoryService _inventoryService = InventoryService();
  final TextEditingController _searchController = TextEditingController();
  
  List<InventoryItem> _items = [];
  bool _isLoading = false;
  String _searchQuery = '';
  
  // Selected item state
  InventoryItem? _selectedItem;
  int _quantity = 1;
  double _price = 0;
  String _selectedUom = '';
  String _remark = '';
  
  // Invoice price state
  bool _isLoadingInvoicePrice = false;
  bool _priceFromInvoice = false;
  List<Map<String, dynamic>> _invoicesData = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);
    
    try {
      final items = await _inventoryService.getInventory(
        companyCode: widget.companyCode,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        limit: 50,
        offset: 0,
      );
      
      setState(() => _items = items);
    } catch (e) {
      print('Error loading items: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _onSearch(String query) {
    setState(() => _searchQuery = query);
    _loadItems();
  }

  String _getItemImageUrl(InventoryItem item) {
    return CompanyImageConfig.constructImageUrl(
      widget.companyCode,
      item.skuNo,
      item.uom ?? 'PCS',
    ) ?? '';
  }

  Future<void> _selectItem(InventoryItem item) async {
    setState(() {
      _selectedItem = item;
      _price = item.gstPrice ?? item.price ?? 0;
      _selectedUom = item.uom ?? 'PCS';
      _quantity = 1;
      _remark = '';
      _priceFromInvoice = false;
      _isLoadingInvoicePrice = true;
    });
    
    // Load invoice price for this item
    await _loadInvoicePrice(item);
  }

  Future<void> _loadInvoicePrice(InventoryItem item) async {
    try {
      final selectedCustomer = CustomerStateService().selectedCustomer;
      
      if (selectedCustomer == null) {
        print('⚠️ No customer selected, using default price');
        setState(() => _isLoadingInvoicePrice = false);
        return;
      }
      
      final invoiceService = InvoiceService(SignalRService());
      final invoices = await invoiceService.getInvoiceItemsBySkuWithOnlineFallback(
        companyCode: widget.companyCode,
        customerCode: selectedCustomer.code,
        skuNo: item.skuNo,
        filterUom: _selectedUom,
        limit: 3,
        fetchInvoicesLimit: 10,
      );
      
      if (mounted) {
        setState(() {
          _invoicesData = invoices;
          _isLoadingInvoicePrice = false;
          
          // Set price to latest invoice price if available
          if (invoices.isNotEmpty) {
            final latestInvoice = invoices.first;
            final latestInvoicePrice = latestInvoice['price'];
            if (latestInvoicePrice != null && latestInvoicePrice > 0) {
              _price = (latestInvoicePrice is int) 
                  ? (latestInvoicePrice as int).toDouble() 
                  : latestInvoicePrice as double;
              _priceFromInvoice = true;
              print('💰 SKU ${item.skuNo}: Set price to latest invoice price: RM ${_price.toStringAsFixed(2)}');
            }
          }
        });
      }
    } catch (e) {
      print('❌ Error loading invoice price: $e');
      if (mounted) {
        setState(() => _isLoadingInvoicePrice = false);
      }
    }
  }

  void _clearSelection() {
    setState(() {
      _selectedItem = null;
      _priceFromInvoice = false;
      _invoicesData = [];
    });
  }

  void _addToQuotation() {
    if (_selectedItem == null) return;
    
    Navigator.pop(context, {
      'item': _selectedItem,
      'quantity': _quantity.toDouble(),
      'price': _price,
      'uom': _selectedUom,
      'remark': _remark.isEmpty ? null : _remark,
    });
  }

  void _editRemark() {
    final controller = TextEditingController(text: _remark);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Remark'),
        content: TextField(
          controller: controller,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter remark...',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _remark = controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _editPrice() {
    final controller = TextEditingController(text: _price.toStringAsFixed(2));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Price'),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Unit Price (RM)',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newPrice = double.tryParse(controller.text) ?? _price;
              setState(() => _price = newPrice);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Drag Handle
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (_selectedItem != null)
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _clearSelection,
                      ),
                    Expanded(
                      child: Text(
                        _selectedItem == null ? 'Select Item' : 'Add to Quotation',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: _selectedItem == null
                    ? _buildItemList(scrollController)
                    : _buildItemDetails(scrollController),
              ),
              
              // Bottom action button (only when item selected)
              if (_selectedItem != null) _buildActionButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItemList(ScrollController scrollController) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onSubmitted: _onSearch,
            decoration: InputDecoration(
              hintText: 'Search by SKU, PLU, or description...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _onSearch('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        
        // Items list
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _items.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            _searchQuery.isEmpty
                                ? 'Search for items to add'
                                : 'No items match "$_searchQuery"',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return _buildItemCard(item);
                      },
                    ),
        ),
      ],
    );
  }

  Widget _buildItemCard(InventoryItem item) {
    final imageUrl = _getItemImageUrl(item);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _selectItem(item),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.inventory_2_outlined,
                              color: Colors.grey[400],
                            ),
                          )
                        : Icon(Icons.inventory_2_outlined, color: Colors.grey[400]),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.description ?? 'SKU ${item.skuNo}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SKU: ${item.skuNo} • ${item.uom ?? "PCS"}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'RM ${(item.gstPrice ?? 0).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails(ScrollController scrollController) {
    final item = _selectedItem!;
    final imageUrl = _getItemImageUrl(item);
    
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Row(
              children: [
                // Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.inventory_2_outlined,
                              color: Colors.grey[400],
                              size: 40,
                            ),
                          )
                        : Icon(Icons.inventory_2_outlined, color: Colors.grey[400], size: 40),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.description ?? 'Product',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SKU: ${item.skuNo}',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      if (item.brand != null && item.brand!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.brand!,
                            style: TextStyle(fontSize: 11, color: Colors.purple.shade700),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Price section
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _isLoadingInvoicePrice
                            ? Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            : Text(
                                'RM ${_price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                              ),
                        if (_priceFromInvoice && !_isLoadingInvoicePrice) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.blue.shade200),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.receipt_long, size: 12, color: Colors.blue.shade700),
                                const SizedBox(width: 4),
                                Text(
                                  'Last Invoice',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                TextButton.icon(
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Edit'),
                  onPressed: _isLoadingInvoicePrice ? null : _editPrice,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Order configuration
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                
                // Quantity
                Row(
                  children: [
                    const Icon(Icons.inventory_2_outlined, size: 20, color: Colors.blue),
                    const SizedBox(width: 12),
                    const Text('Quantity', style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 18),
                            onPressed: () {
                              if (_quantity > 1) setState(() => _quantity--);
                            },
                          ),
                          Container(
                            constraints: const BoxConstraints(minWidth: 50),
                            alignment: Alignment.center,
                            child: Text(
                              _quantity.toString(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, size: 18),
                            onPressed: () {
                              if (_quantity < 999) setState(() => _quantity++);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const Divider(height: 24),
                
                // UOM
                Row(
                  children: [
                    const Icon(Icons.straighten_outlined, size: 20, color: Colors.green),
                    const SizedBox(width: 12),
                    const Text('Unit', style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    ChoiceChip(
                      label: Text(_selectedUom),
                      selected: true,
                      selectedColor: Colors.green.shade100,
                      onSelected: (_) {},
                    ),
                  ],
                ),
                
                const Divider(height: 24),
                
                // Remark
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.note_outlined, size: 20, color: Colors.orange),
                    const SizedBox(width: 12),
                    const Text('Remark', style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    Expanded(
                      child: InkWell(
                        onTap: _editRemark,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _remark.isEmpty ? 'Tap to add remark' : _remark,
                            style: TextStyle(
                              color: _remark.isEmpty ? Colors.grey.shade500 : Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Invoice History Section
          if (_invoicesData.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildInvoiceHistory(),
          ],
        ],
      ),
    );
  }

  Widget _buildInvoiceHistory() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long, size: 18, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                'Previous Invoices (${_invoicesData.length})',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _invoicesData.length,
              itemBuilder: (context, index) {
                final invoice = _invoicesData[index];
                final DateTime? dt = invoice['date'] as DateTime?;
                final dateStr = dt == null ? '-' : '${dt.day}/${dt.month}/${dt.year}';
                final qty = invoice['qty'];
                final uom = invoice['uom'] ?? '';
                final price = (invoice['price'] ?? 0).toStringAsFixed(2);
                final invoiceNo = invoice['invoiceNo'] ?? '-';
                
                return GestureDetector(
                  onTap: () {
                    // Apply this invoice's price
                    final invoicePrice = invoice['price'];
                    if (invoicePrice != null && invoicePrice > 0) {
                      setState(() {
                        _price = (invoicePrice is int) 
                            ? (invoicePrice as int).toDouble() 
                            : invoicePrice as double;
                        _priceFromInvoice = true;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Price updated to RM $price from invoice #$invoiceNo'),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 130,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#$invoiceNo',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          dateStr,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$qty $uom',
                          style: const TextStyle(fontSize: 10),
                        ),
                        Row(
                          children: [
                            Text(
                              'RM $price',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade700,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.touch_app,
                              size: 12,
                              color: Colors.green.shade400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap an invoice to use its price',
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    final total = _quantity * _price;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: _addToQuotation,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_shopping_cart, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Add $_quantity × RM ${_price.toStringAsFixed(2)} = RM ${total.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
