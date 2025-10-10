import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/cart_item.dart';
import '../services/cart_service.dart';
import '../services/auth_service.dart';
import '../services/user_app_settings_service.dart';
import '../widgets/inventory_image_widget.dart';
import 'checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartService _cartService = CartService();
  final AuthService _authService = AuthService();
  final UserAppSettingsService _settingsService = UserAppSettingsService();
  
  List<CartItem> _cartItems = [];
  bool _isLoading = true;
  Map<String, dynamic> _cartSummary = {};
  final Map<int, TextEditingController> _qtyControllers = {};

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  @override
  void dispose() {
    for (final ctrl in _qtyControllers.values) {
      ctrl.dispose();
    }
    _qtyControllers.clear();
    super.dispose();
  }

  Future<void> _loadCart() async {
    setState(() => _isLoading = true);
    
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      final summary = await _cartService.getCartSummary(companyCode: companyCode);
      
      setState(() {
        _cartItems = summary['items'] as List<CartItem>;
        _cartSummary = summary;
        _isLoading = false;
      });

      // Sync controllers with loaded quantities
      for (final item in _cartItems) {
        final ctrl = _qtyControllers[item.id] ?? TextEditingController();
        ctrl.text = item.quantity.toString();
        _qtyControllers[item.id] = ctrl;
      }
      // Dispose controllers for items no longer in cart
      final existingKeys = _qtyControllers.keys.toList();
      for (final key in existingKeys) {
        if (_cartItems.indexWhere((e) => e.id == key) == -1) {
          _qtyControllers[key]?.dispose();
          _qtyControllers.remove(key);
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading cart: $e')),
      );
    }
  }

  Future<void> _updateQuantity(CartItem item, int newQuantity) async {
    try {
      await _cartService.updateQuantity(item.id, newQuantity);
      await _loadCart(); // Refresh cart
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating quantity: $e')),
      );
    }
  }

  Future<void> _removeItem(CartItem item) async {
    try {
      await _cartService.removeFromCart(item.id);
      await _loadCart(); // Refresh cart
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing item: $e')),
      );
    }
  }

  Future<void> _showEditPriceDialog(CartItem item) async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      // Check permission
      final canEdit = await _settingsService.canChangePrice(companyCode: companyCode);
      
      if (!canEdit) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ You do not have permission to edit prices'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }
      
      // Show edit dialog
      if (!mounted) return;
      final newPrice = await showDialog<double>(
        context: context,
        builder: (context) => _PriceEditDialog(
          itemDescription: item.displayDescription,
          initialPrice: item.gstPrice ?? 0.0,
        ),
      );
      
      if (!mounted) return;
      
      // User cancelled
      if (newPrice == null) {
        return;
      }
      
      // Only update if price actually changed
      final currentPrice = item.gstPrice ?? 0.0;
      if ((newPrice - currentPrice).abs() > 0.001) {
        try {
          await _updatePrice(item, newPrice);
        } catch (e) {
          if (mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: $e')),
                );
              }
            });
          }
        }
      } // else unchanged: do nothing
      
      // Do not dispose controller explicitly to avoid race during route pop
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _updatePrice(CartItem item, double newPrice) async {
    try {
      await _cartService.updatePrice(item.id, newPrice);
      
      // Use addPostFrameCallback to reload cart after the current frame
      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _loadCart(); // Refresh cart
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('✅ Price updated successfully')),
          );
        }
      });
    } catch (e) {
      if (!mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error updating price: $e')),
          );
        }
      });
    }
  }

  Future<void> _clearCart() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text('Are you sure you want to remove all items from the cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        final selectedCompany = await _authService.getSelectedCompany();
        final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
        final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
        await _cartService.clearCart(companyCode: companyCode);
        await _loadCart();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cart cleared')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error clearing cart: $e')),
        );
      }
    }
  }

  void _proceedToCheckout() {
    if (_cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cart is empty')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(cartItems: _cartItems),
      ),
    ).then((_) => _loadCart()); // Refresh cart when returning
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart (${_cartItems.length})'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          if (_cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _clearCart,
              tooltip: 'Clear Cart',
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _cartItems.isEmpty
              ? _buildEmptyCart()
              : Column(
                  children: [
                    Expanded(child: _buildCartList()),
                    _buildCartSummary(),
                  ],
                ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items from inventory to get started',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.inventory),
            label: const Text('Browse Inventory'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        final qtyController = _qtyControllers[item.id] ?? TextEditingController(text: item.quantity.toString());
        _qtyControllers[item.id] = qtyController;
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                InventoryImageWidget(
                  companyCode: item.companyCode,
                  skuNo: item.skuNo,
                  uom: item.uom,
                  width: 80,
                  height: 80,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(width: 12),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${item.skuNo}',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeItem(item),
                            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.displayDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        item.displayUom,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _showEditPriceDialog(item),
                      child: Row(
                        children: [
                          Text(
                            item.displayGstPrice,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: item.quantity > 1
                              ? () => _updateQuantity(item, item.quantity - 1)
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                        ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            key: ValueKey('qty_${item.id}'),
                            controller: qtyController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                              border: const OutlineInputBorder(),
                              suffixText: ' ${item.displayUom}',
                              suffixStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onSubmitted: (value) {
                              final parsed = int.tryParse(qtyController.text) ?? item.quantity;
                              final clamped = parsed.clamp(1, 999);
                              if (clamped != item.quantity) {
                                _updateQuantity(item, clamped);
                              } else {
                                setState(() {}); // refresh to ensure controller text normalization
                              }
                            },
                            onEditingComplete: () {
                              final parsed = int.tryParse(qtyController.text) ?? item.quantity;
                              final clamped = parsed.clamp(1, 999);
                              if (clamped != item.quantity) {
                                _updateQuantity(item, clamped);
                              } else {
                                setState(() {});
                              }
                            },
                            onTapOutside: (_) {
                              final parsed = int.tryParse(qtyController.text) ?? item.quantity;
                              final clamped = parsed.clamp(1, 999);
                              if (clamped != item.quantity) {
                                _updateQuantity(item, clamped);
                              }
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () => _updateQuantity(item, item.quantity + 1),
                          icon: const Icon(Icons.add_circle_outline),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                        ),
                      ],
                    ),
                  ],
                ),
                if (item.remarks != null && item.remarks!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    'Note: ${item.remarks}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      item.displayGstSubtotal,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
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
      },
    );
  }

  Widget _buildCartSummary() {
    final totalItems = _cartSummary['totalItems'] ?? 0;
    final totalQuantity = _cartSummary['totalQuantity'] ?? 0;
    final totalGstAmount = _cartSummary['totalGstAmount'] ?? 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items: $totalItems',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Quantity: $totalQuantity',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'RM ${totalGstAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Checkout button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _proceedToCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stable price edit dialog that prevents text field reset
class _PriceEditDialog extends StatefulWidget {
  final String itemDescription;
  final double initialPrice;

  const _PriceEditDialog({
    required this.itemDescription,
    required this.initialPrice,
  });

  @override
  State<_PriceEditDialog> createState() => _PriceEditDialogState();
}

class _PriceEditDialogState extends State<_PriceEditDialog> {
  late TextEditingController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialPrice.toStringAsFixed(2));
    _isInitialized = true;
    print('💰 Price dialog initialized with ${widget.initialPrice}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    if (!_isInitialized) {
      return const SizedBox.shrink();
    }

    return WillPopScope(
      onWillPop: () async => false, // Prevent accidental dismissal
      child: AlertDialog(
        title: const Text('Edit Price'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.itemDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'GST Price (RM)',
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
