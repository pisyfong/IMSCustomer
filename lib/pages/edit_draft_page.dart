import 'package:flutter/material.dart';
import '../models/draft_quotation.dart';
import '../models/inventory_item.dart';
import '../models/cart_item.dart';
import '../services/draft_service.dart';
import '../services/inventory_service.dart';
import '../services/invoice_service.dart';
import '../services/signalr_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../config/company_image_config.dart';
import 'checkout_page.dart';

class EditDraftPage extends StatefulWidget {
  final DraftQuotation draft;

  const EditDraftPage({Key? key, required this.draft}) : super(key: key);

  @override
  State<EditDraftPage> createState() => _EditDraftPageState();
}

class _EditDraftPageState extends State<EditDraftPage> {
  final DraftService _draftService = DraftService();
  final AuthService _authService = AuthService();
  final CartService _cartService = CartService();

  List<DraftQuotationItem> _items = [];
  bool _isLoading = true;
  bool _hasChanges = false;
  String? _error;
  late TextEditingController _remarksController;
  late DraftQuotation _draft;
  bool _isConverting = false;

  @override
  void initState() {
    super.initState();
    _draft = widget.draft;
    _remarksController = TextEditingController(text: _draft.remarks ?? '');
    _loadItems();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  Future<void> _loadItems() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final items = await _draftService.getDraftItems(widget.draft.id);
      setState(() {
        _items = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteItem(DraftQuotationItem item) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text('Remove "${item.description ?? "SKU ${item.skuNo}"}" from draft?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Remove', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _draftService.deleteDraftItem(item.id, widget.draft.id);
        setState(() => _hasChanges = true);
        await _loadItems();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item removed'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _editItemQuantity(DraftQuotationItem item) async {
    final controller = TextEditingController(text: item.quantity.toStringAsFixed(0));

    final newQty = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Quantity'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Quantity',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final qty = double.tryParse(controller.text);
              if (qty != null && qty > 0) {
                Navigator.pop(context, qty);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (newQty != null && newQty != item.quantity) {
      item.quantity = newQty;
      await _draftService.updateDraftItem(item);
      setState(() => _hasChanges = true);
      await _loadItems();
    }
  }

  Future<void> _editItemPrice(DraftQuotationItem item) async {
    final controller = TextEditingController(text: item.unitPrice.toStringAsFixed(2));

    final newPrice = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Price'),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Unit Price (RM)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final price = double.tryParse(controller.text);
              if (price != null && price >= 0) {
                Navigator.pop(context, price);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (newPrice != null && newPrice != item.unitPrice) {
      item.unitPrice = newPrice;
      await _draftService.updateDraftItem(item);
      setState(() => _hasChanges = true);
      await _loadItems();
    }
  }

  Future<void> _addNewItem() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _DraftItemSelectorBottomSheet(
        companyCode: widget.draft.companyCode,
      ),
    );

    if (result != null) {
      final item = result['item'] as InventoryItem;
      final qty = result['quantity'] as double;
      final price = result['price'] as double;
      final uom = result['uom'] as String;
      final remark = result['remark'] as String?;

      try {
        await _draftService.addDraftItem(
          draftId: widget.draft.id,
          companyCode: widget.draft.companyCode,
          skuNo: item.skuNo,
          uom: uom,
          quantity: qty,
          unitPrice: price,
          pluNo: item.pluNo?.toString(),
          description: item.description,
          remark: remark,
          brand: item.brand,
        );

        setState(() => _hasChanges = true);
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

  String _getItemImageUrl(DraftQuotationItem item) {
    return CompanyImageConfig.constructImageUrl(
      widget.draft.companyCode,
      item.skuNo,
      item.uom ?? 'PCS',
    ) ?? '';
  }

  Future<void> _editRemarks() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Remarks'),
        content: TextField(
          controller: _remarksController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: 'Enter remarks...',
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
            onPressed: () => Navigator.pop(context, _remarksController.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result != null) {
      _draft.remarks = result;
      await _draftService.updateDraft(_draft);
      setState(() => _hasChanges = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Remarks updated'), backgroundColor: Colors.green),
      );
    }
  }

  Future<void> _convertToQuotation() async {
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot convert empty draft to quotation'), backgroundColor: Colors.orange),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Convert to Quotation'),
        content: const Text('This will add all draft items to cart and open the checkout page. Continue?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Convert', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isConverting = true);

    try {
      // Clear existing cart first
      await _cartService.clearCart();

      // Add all draft items to cart
      for (final item in _items) {
        await _cartService.addToCart(
          companyCode: _draft.companyCode,
          skuNo: item.skuNo,
          pluNo: item.pluNo,
          description: item.description ?? 'SKU ${item.skuNo}',
          uom: item.uom ?? 'PCS',
          unitPrice: item.unitPrice,
          gstPrice: item.unitPrice,
          factor: 1.0,
          quantity: item.quantity.toInt(),
          remarks: item.remark,
        );
      }

      // Get cart items for checkout
      final cartItems = await _cartService.getCartItems();

      setState(() => _isConverting = false);

      if (mounted && cartItems.isNotEmpty) {
        // Navigate to checkout page
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(cartItems: cartItems),
          ),
        );

        // If quotation was created, mark draft as converted and go back
        if (result == true) {
          await _draftService.markDraftAsConverted(_draft.id, 'converted');
          if (mounted) {
            Navigator.pop(context, true);
          }
        }
      }
    } catch (e) {
      setState(() => _isConverting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Recalculate totals from items
    double totalAmount = 0;
    for (final item in _items) {
      totalAmount += item.netAmount;
    }

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
              const Text('Edit Draft', style: TextStyle(fontSize: 16)),
              Text(
                'Draft #${widget.draft.id}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          backgroundColor: Colors.teal,
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
                      // Header info with customer and remarks
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Customer row
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.person_outline, color: Colors.teal.shade700, size: 20),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _draft.customerName ?? 'No customer',
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                      ),
                                      if (_draft.customerCode != null)
                                        Text(
                                          'Code: ${_draft.customerCode}',
                                          style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'RM ${totalAmount.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.teal.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Items count and remarks row
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${_items.length} items',
                                    style: TextStyle(fontSize: 12, color: Colors.blue.shade700),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: _editRemarks,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.orange.shade50,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Colors.orange.shade200),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.note_outlined, size: 14, color: Colors.orange.shade700),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              _draft.remarks?.isNotEmpty == true ? _draft.remarks! : 'Add remarks...',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: _draft.remarks?.isNotEmpty == true 
                                                    ? Colors.orange.shade700 
                                                    : Colors.grey,
                                                fontStyle: _draft.remarks?.isNotEmpty == true 
                                                    ? FontStyle.normal 
                                                    : FontStyle.italic,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(Icons.edit, size: 12, color: Colors.orange.shade400),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                    Icon(Icons.inventory_2_outlined, size: 48, color: Colors.grey[400]),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No items in draft',
                                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Tap + to add items',
                                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 80),
                                itemCount: _items.length,
                                itemBuilder: (context, index) {
                                  return _buildItemCard(_items[index]);
                                },
                              ),
                      ),
                      
                      // Bottom action bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                        child: SafeArea(
                          child: Row(
                            children: [
                              // Add Item Button
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _addNewItem,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: const Icon(Icons.add, size: 18),
                                  label: const Text('Add Item', style: TextStyle(fontWeight: FontWeight.w600)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Convert to Quotation Button
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: (_isConverting || _items.isEmpty) ? null : _convertToQuotation,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor: Colors.grey.shade400,
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  icon: _isConverting
                                      ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          ),
                                        )
                                      : const Icon(Icons.check_circle_outline, size: 18),
                                  label: Text(
                                    _isConverting ? 'Converting...' : 'Create Quote',
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
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

  Widget _buildItemCard(DraftQuotationItem item) {
    final imageUrl = _getItemImageUrl(item);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SKU: ${item.skuNo} • ${item.uom ?? "PCS"}',
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Quantity
                      GestureDetector(
                        onTap: () => _editItemQuantity(item),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Qty: ${item.quantity.toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.edit, size: 12, color: Colors.blue.shade700),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Price
                      GestureDetector(
                        onTap: () => _editItemPrice(item),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.green.shade200),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'RM ${item.unitPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green.shade700,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.edit, size: 12, color: Colors.green.shade700),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Net amount and delete
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'RM ${item.netAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red[400], size: 20),
                  onPressed: () => _deleteItem(item),
                  tooltip: 'Remove item',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Item selector bottom sheet for drafts - same as unsynced quotation
class _DraftItemSelectorBottomSheet extends StatefulWidget {
  final int companyCode;

  const _DraftItemSelectorBottomSheet({required this.companyCode});

  @override
  State<_DraftItemSelectorBottomSheet> createState() => _DraftItemSelectorBottomSheetState();
}

class _DraftItemSelectorBottomSheetState extends State<_DraftItemSelectorBottomSheet> {
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

    await _loadInvoicePrice(item);
  }

  Future<void> _loadInvoicePrice(InventoryItem item) async {
    try {
      final selectedCustomer = CustomerStateService().selectedCustomer;

      if (selectedCustomer == null) {
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

          if (invoices.isNotEmpty) {
            final latestInvoice = invoices.first;
            final latestInvoicePrice = latestInvoice['price'];
            if (latestInvoicePrice != null && latestInvoicePrice > 0) {
              _price = (latestInvoicePrice is int)
                  ? (latestInvoicePrice as int).toDouble()
                  : latestInvoicePrice as double;
              _priceFromInvoice = true;
            }
          }
        });
      }
    } catch (e) {
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

  void _addToDraft() {
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
                        _selectedItem == null ? 'Select Item' : 'Add to Draft',
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

              // Bottom action button
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
                          color: Colors.teal,
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
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
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
                    const Icon(Icons.straighten_outlined, size: 20, color: Colors.teal),
                    const SizedBox(width: 12),
                    const Text('Unit', style: TextStyle(fontSize: 14)),
                    const Spacer(),
                    ChoiceChip(
                      label: Text(_selectedUom),
                      selected: true,
                      selectedColor: Colors.teal.shade100,
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
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          dateStr,
                          style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                        ),
                        const Spacer(),
                        Text('$qty $uom', style: const TextStyle(fontSize: 10)),
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
                            Icon(Icons.touch_app, size: 12, color: Colors.green.shade400),
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
          onPressed: _addToDraft,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
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
