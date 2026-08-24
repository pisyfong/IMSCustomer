import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:barcode/barcode.dart' as bc;
import '../models/cart_item.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../services/cart_service.dart';
import '../services/auth_service.dart';
import '../services/user_app_settings_service.dart';
import '../services/plu_service.dart';
import '../services/inventory_service.dart';
import '../services/loose_uom_rule.dart';
import '../services/qty.dart';
import '../services/customer_state_service.dart';
import '../widgets/inventory_image_widget.dart';
import '../widgets/ui_kit.dart';
import '../theme/app_design.dart';
import 'checkout_page.dart';
import '../main.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartService _cartService = CartService();
  final AuthService _authService = AuthService();
  final UserAppSettingsService _settingsService = UserAppSettingsService();
  final CustomerStateService _customerStateService = CustomerStateService();
  late final PluService _pluService;
  final InventoryService _inventoryService = InventoryService();

  List<CartItem> _cartItems = [];
  bool _isLoading = true;
  Map<String, dynamic> _cartSummary = {};

  /// Four controllers per cart line — Qty, Loose, FOC, FOC loose — in the same
  /// order the picking screen uses, so the two screens read alike.
  final Map<int, List<TextEditingController>> _qtyControllers = {};
  MobileScannerController? _scannerController;

  static const int _fQty = 0;
  static const int _fLoose = 1;
  static const int _fFoc = 2;
  static const int _fFocLoose = 3;

  @override
  void initState() {
    super.initState();
    _pluService = PluService(isar);
    _loadCart();
  }

  @override
  void dispose() {
    for (final ctrls in _qtyControllers.values) {
      for (final ctrl in ctrls) {
        ctrl.dispose();
      }
    }
    _qtyControllers.clear();
    _scannerController?.dispose();
    super.dispose();
  }

  Future<void> _loadCart() async {
    setState(() => _isLoading = true);

    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String
          ? int.tryParse(companyCodeRaw) ?? 1
          : companyCodeRaw as int;

      final summary =
          await _cartService.getCartSummary(companyCode: companyCode);

      setState(() {
        _cartItems = summary['items'] as List<CartItem>;
        _cartSummary = summary;
        _isLoading = false;
      });

      // Sync controllers with loaded quantities.
      //
      // Only ever written here, on a full reload. Typing updates the model and
      // the totals directly — pushing text back into a controller the operator
      // is inside would reset the cursor to the start of the field.
      for (final item in _cartItems) {
        final ctrls = _qtyControllers[item.id] ??
            List.generate(4, (_) => TextEditingController());
        _setIfChanged(ctrls[_fQty], Qty.fmt(item.quantity));
        _setIfChanged(ctrls[_fLoose], Qty.fmt(item.looseQty));
        _setIfChanged(ctrls[_fFoc], Qty.fmt(item.focQty));
        _setIfChanged(ctrls[_fFocLoose], Qty.fmt(item.focLooseQty));
        _qtyControllers[item.id] = ctrls;
      }
      // Dispose controllers for items no longer in cart
      final existingKeys = _qtyControllers.keys.toList();
      for (final key in existingKeys) {
        if (_cartItems.indexWhere((e) => e.id == key) == -1) {
          for (final c
              in _qtyControllers[key] ?? const <TextEditingController>[]) {
            c.dispose();
          }
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

  static void _setIfChanged(TextEditingController c, String v) {
    if (c.text != v) c.text = v;
  }

  /// Applies a typed value to one of the four quantity fields.
  ///
  /// The model is updated in place and the row is persisted without a reload,
  /// so the field the operator is in keeps its cursor. An empty or unparseable
  /// field reads as zero rather than reverting, which is what lets a value be
  /// cleared and retyped.
  void _applyField(CartItem item, int field, String text) {
    final value = Qty.tryParse(text);
    if (value == null) return; // mid-typing junk like "-" or "1.2.3" — ignore

    setState(() {
      switch (field) {
        case _fQty:
          // Was `value.round()`, which turned a typed 2.5 into 3 without
          // saying so — while the very next box kept 2.5 exactly. Quantities
          // are 2dp everywhere now, from this field to decimal(18,4) in RMS.
          item.quantity = value;
          break;
        case _fLoose:
          item.quantityLoose = value;
          break;
        case _fFoc:
          item.foc = value;
          break;
        case _fFocLoose:
          item.focLoose = value;
          break;
      }
      _recomputeTotals();
    });

    // Persist without deleting: a line cleared to zero while typing must stay
    // on screen. Removal is the trash button's job.
    _cartService
        .updateLineQuantities(
      item.id,
      quantity: field == _fQty ? item.quantity : null,
      quantityLoose: field == _fLoose ? item.looseQty : null,
      foc: field == _fFoc ? item.focQty : null,
      focLoose: field == _fFocLoose ? item.focLooseQty : null,
      removeWhenEmpty: false,
    )
        .catchError((e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save quantity: $e')),
        );
      }
    });
  }

  /// Recomputes the footer totals from the in-memory lines, so the bottom bar
  /// tracks typing without a database round trip.
  void _recomputeTotals() {
    double amount = 0;
    double gst = 0;
    double qty = 0;
    double foc = 0;
    double loose = 0;
    for (final i in _cartItems) {
      amount += i.subtotal;
      gst += i.gstSubtotal;
      qty += i.quantity;
      foc += i.focQty;
      loose += i.looseQty + i.focLooseQty;
    }
    _cartSummary = {
      ..._cartSummary,
      'totalItems': _cartItems.length,
      'totalQuantity': Qty.round(qty),
      'totalFoc': foc,
      'totalLoose': loose,
      'totalAmount': amount,
      'totalGstAmount': gst,
      'items': _cartItems,
    };
  }

  static String _trimZeros(double v) {
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
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
      final companyCode = companyCodeRaw is String
          ? int.tryParse(companyCodeRaw) ?? 1
          : companyCodeRaw as int;

      // Check permission
      final canEdit =
          await _settingsService.canChangePrice(companyCode: companyCode);

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

  Future<void> _showEditRemarksDialog(CartItem item) async {
    final controller = TextEditingController(text: item.remarks ?? '');

    final newRemarks = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Remarks'),
        content: TextField(
          controller: controller,
          maxLines: 3,
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
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (newRemarks != null) {
      try {
        await _cartService.updateRemarks(item.id, newRemarks);
        await _loadCart();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('✅ Remarks updated'),
                backgroundColor: Colors.green),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<String?> _getCustomerPluBarcode(int companyCode, int skuNo) async {
    try {
      final customerInfo = _customerStateService.getSelectedCustomerInfo();
      final customerCode = customerInfo?['code'] as String?;

      if (customerCode == null || customerCode.isEmpty) {
        return null;
      }

      final customerPlu = await _pluService.getCachedCustomerPlu(
        companyCode: companyCode,
        customerCode: customerCode,
        skuNo: skuNo,
      );

      return customerPlu?.pluNo;
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearCart() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text(
            'Are you sure you want to remove all items from the cart?'),
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
        final companyCode = companyCodeRaw is String
            ? int.tryParse(companyCodeRaw) ?? 1
            : companyCodeRaw as int;
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

  // Barcode scanner methods temporarily disabled due to Isar query API issues
  // Future<void> _openBarcodeScanner() async { ... }
  // Future<void> _addScannedItemToCart(...) async { ... }

  void _showBarcodePopup(
      BuildContext context, String barcodeData, String productName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.qr_code_2, color: Colors.blue.shade600, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Scan Barcode',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.close,
                          size: 18, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Product name
              Text(
                productName,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              // Large barcode display
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 220,
                      child: _BarcodeDisplay(data: barcodeData),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      barcodeData,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Point scanner at barcode',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final count = _cartItems.length;
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: UiKit.appBar(
        'Cart',
        subtitle:
            count == 0 ? null : '$count item${count == 1 ? '' : 's'} staged',
        actions: [
          if (count > 0)
            IconButton(
              tooltip: 'Empty cart',
              icon: const Icon(Icons.delete_sweep_outlined, size: 20),
              onPressed: _clearCart,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _cartItems.isEmpty
              ? _buildEmptyCart()
              : _buildCartList(),
      bottomNavigationBar:
          (_isLoading || _cartItems.isEmpty) ? null : _buildModernBottomBar(),
    );
  }

  /// The grab area: the line's number above a grip.
  ///
  /// The number is not decoration — it is the `Sequence_No` this line will
  /// carry on the quotation, which is the whole reason the order is worth
  /// arranging. Showing it makes the effect of a drag visible before the
  /// document is created rather than after it is printed.
  Widget _buildDragHandle(int index) {
    return ReorderableDragStartListener(
      index: index,
      child: SizedBox(
        width: 22,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${index + 1}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppDesign.modOrdering),
            ),
            const SizedBox(height: 2),
            Icon(Icons.drag_indicator,
                size: 18, color: AppDesign.inkSubtle.withOpacity(0.8)),
          ],
        ),
      ),
    );
  }

  /// Commits a drag.
  ///
  /// The list is reordered in memory first so the row lands where it was
  /// dropped without waiting for a database round trip, then persisted. If the
  /// write fails the cart is reloaded, which puts the stored order back on
  /// screen rather than leaving the operator looking at an arrangement that
  /// was never saved.
  Future<void> _onReorder(int oldIndex, int newIndex) async {
    // Flutter reports the insertion point in the pre-removal list, so a
    // downward move is one too far.
    if (newIndex > oldIndex) newIndex -= 1;
    if (newIndex == oldIndex) return;

    setState(() {
      final moved = _cartItems.removeAt(oldIndex);
      _cartItems.insert(newIndex, moved);
    });

    try {
      await _cartService.reorderCart([for (final i in _cartItems) i.id]);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not save the new order: $e')),
      );
      await _loadCart();
    }
  }

  Widget _buildEmptyCart() {
    return UiEmptyState(
      icon: Icons.shopping_cart_outlined,
      title: 'Your cart is empty',
      message: 'Add products and they\'ll stage here until you check out.',
      actionLabel: 'Browse products',
      accent: AppDesign.modOrdering,
      onAction: () => Navigator.pop(context),
    );
  }

  /// The cart list, reorderable by dragging the handle on each line.
  ///
  /// Drag handles are explicit rather than the default long-press-anywhere.
  /// Every line carries four text fields and a delete button, and a long press
  /// inside a field is how text is selected — leaving the whole row draggable
  /// would make editing a quantity start a drag as often as it opened the
  /// keyboard.
  Widget _buildCartList() {
    return ReorderableListView.builder(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 14),
      itemCount: _cartItems.length,
      buildDefaultDragHandles: false,
      onReorder: _onReorder,
      // The default proxy wraps the dragged row in its own Material, which
      // paints a grey rectangle over the card. This keeps the card and just
      // lifts it.
      proxyDecorator: (child, index, animation) => Material(
        color: Colors.transparent,
        elevation: 6,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        child: child,
      ),
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        // Normally seeded by _loadCart; created here as a fallback so a line
        // that appears without a reload still renders its fields.
        _qtyControllers.putIfAbsent(
            item.id,
            () => [
                  TextEditingController(text: Qty.fmt(item.quantity)),
                  TextEditingController(text: Qty.fmt(item.looseQty)),
                  TextEditingController(text: Qty.fmt(item.focQty)),
                  TextEditingController(text: Qty.fmt(item.focLooseQty)),
                ]);

        return Container(
          // Keyed by the row id, not the index: the controllers are keyed the
          // same way, so a dragged line keeps the text being typed into it.
          key: ValueKey(item.id),
          margin: const EdgeInsets.only(bottom: 6),
          decoration: AppDesign.card(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 4, 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDragHandle(index),
                const SizedBox(width: 4),
                // 40px, not 60. The thumbnail confirms an identification the
                // operator has already made; it does not need to be legible
                // from across a warehouse, and at 60 it set the row height on
                // its own.
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: InventoryImageWidget(
                    companyCode: item.companyCode,
                    skuNo: item.skuNo,
                    uom: item.uom,
                    width: 40,
                    height: 40,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.displayDescription,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.15,
                                  color: AppDesign.ink),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Icon-only actions. The barcode used to be RENDERED
                          // inline at 60x24 beside two pill chips — three
                          // decorated boxes to say what one line of text says,
                          // and the barcode was unreadable at that size anyway,
                          // so it existed only to be tapped.
                          _iconAction(
                            icon: Icons.close,
                            color: AppDesign.inkSubtle,
                            onTap: () => _removeItem(item),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // One metadata line: what it is, at what each, worth
                      // what. Scaled down rather than wrapped so the row keeps
                      // a predictable height.
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${item.skuNo}', style: _metaStyle),
                                  _metaSep,
                                  Text(item.displayUom, style: _metaStyle),
                                  _metaSep,
                                  GestureDetector(
                                    onTap: () => _showEditPriceDialog(item),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(item.displayGstPrice,
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w800,
                                                color: AppDesign.accentInk,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    AppDesign.accentInk)),
                                        const SizedBox(width: 2),
                                        const Icon(Icons.edit,
                                            size: 9.5,
                                            color: AppDesign.accentInk),
                                      ],
                                    ),
                                  ),
                                  _metaSep,
                                  Text(item.displayGstSubtotal,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: AppDesign.success,
                                          letterSpacing: -0.2)),
                                ],
                              ),
                            ),
                          ),
                          // The customer's own barcode, rendered inline.
                          //
                          // It shares the metadata line rather than taking one
                          // of its own, so it costs the few pixels by which a
                          // scannable strip is taller than a line of text
                          // instead of a whole row. Still tappable: the popup
                          // renders it at 220x80 with the digits spelled out,
                          // which is the version you can read aloud or scan
                          // off the screen.
                          FutureBuilder<String?>(
                            future: _getCustomerPluBarcode(
                                item.companyCode, item.skuNo),
                            builder: (context, snapshot) {
                              final code = snapshot.data;
                              if (code == null || code.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return GestureDetector(
                                onTap: () => _showBarcodePopup(
                                    context, code, item.displayDescription),
                                behavior: HitTestBehavior.opaque,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: SizedBox(
                                    height: 22,
                                    width: 72,
                                    child: _BarcodeDisplay(data: code),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      // Remarks, always visible — an empty one has to invite
                      // the tap, or nobody discovers a line can carry a note.
                      // Kept to a single 16px strip: same information as the
                      // old bordered box, without the border, the padding and
                      // the row of its own.
                      _remarksBar(item),
                      _buildQuantityFields(item),
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

  /// The remarks strip for one line.
  ///
  /// Shown whether or not a remark exists: the placeholder is the only thing
  /// that tells an operator the field is there at all. Muted when empty so it
  /// reads as an invitation rather than content.
  Widget _remarksBar(CartItem item) {
    final has = item.remarks?.isNotEmpty == true;
    return GestureDetector(
      onTap: () => _showEditRemarksDialog(item),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          children: [
            Icon(Icons.note_outlined,
                size: 11,
                color: has ? AppDesign.warning : AppDesign.inkSubtle),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                has ? item.remarks! : 'Add remarks…',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: has ? FontWeight.w700 : FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: has ? AppDesign.warning : AppDesign.inkSubtle,
                ),
              ),
            ),
            Icon(Icons.edit,
                size: 9.5,
                color: has ? AppDesign.warning : AppDesign.inkSubtle),
          ],
        ),
      ),
    );
  }

  static const TextStyle _metaStyle = TextStyle(
      fontSize: 10.5, fontWeight: FontWeight.w700, color: AppDesign.inkMuted);

  static const Widget _metaSep = Text('  |  ',
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w600, color: AppDesign.border));

  /// A bare tap target. Deliberately not an IconButton: that enforces a 48dp
  /// box, and three of them across the top of a row takes 144dp from the
  /// description to show three glyphs.
  Widget _iconAction({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }

  /// The quantity row: Qty, Qty Basic, FOC and FOC Basic — the same four
  /// values, under the same names, as the ordering sheet and the picking
  /// screen. "Basic" is the term procurement uses for base-unit quantities;
  /// this used to say "Loose"/"FOC ls", which named the same number twice.
  ///
  /// Loose entry follows [LooseUomRule] — the same per-line test procurement's
  /// PD receive dialog uses — so a line ordered in the base unit shows only Qty
  /// and FOC. A line that already carries loose values always keeps its fields,
  /// so nothing the operator typed can be hidden away.
  Widget _buildQuantityFields(CartItem item) {
    final ctrls = _qtyControllers[item.id];
    if (ctrls == null) return const SizedBox.shrink();

    final factor = (item.factor ?? 1).toDouble();
    final showLoose = LooseUomRule.applies(
      uom: item.uom,
      factor: factor,
      existingLoose: item.looseQty,
      existingFocLoose: item.focLooseQty,
    );
    final hasExtras =
        item.focQty > 0 || item.looseQty > 0 || item.focLooseQty > 0;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _field('Qty', ctrls[_fQty], (t) => _applyField(item, _fQty, t),
                  accent: AppDesign.modOrdering),
              if (showLoose) ...[
                const SizedBox(width: 6),
                _field('Qty Basic', ctrls[_fLoose],
                    (t) => _applyField(item, _fLoose, t),
                    accent: AppDesign.modOrdering),
              ],
              const SizedBox(width: 6),
              _field('FOC', ctrls[_fFoc], (t) => _applyField(item, _fFoc, t),
                  accent: AppDesign.warning),
              if (showLoose) ...[
                const SizedBox(width: 6),
                _field('FOC Basic', ctrls[_fFocLoose],
                    (t) => _applyField(item, _fFocLoose, t),
                    accent: AppDesign.warning),
              ],
            ],
          ),
          // Base units, so a line mixing packs, loose and free goods states one
          // number that the picker can be held to.
          if (hasExtras)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '${Qty.fmt(item.totalBaseUnits)} base units'
                // The factor is a pack size, not a quantity — "×12" reads
                // better than "×12.00" and is never typed into.
                '${factor != 1 ? '  ·  ×${_trimZeros(factor)}' : ''}'
                '${item.focQty > 0 || item.focLooseQty > 0 ? '  ·  FOC not charged' : ''}',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.inkMuted),
              ),
            ),
        ],
      ),
    );
  }

  /// A labelled numeric box. Same shape as the picking screen's field so the
  /// two quantity rows are visually interchangeable.
  Widget _field(
      String label, TextEditingController ctrl, ValueChanged<String> onChanged,
      {Color accent = AppDesign.modOrdering}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                  color: accent)),
          const SizedBox(height: 1),
          TextField(
            controller: ctrl,
            onChanged: onChanged,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  borderSide: const BorderSide(color: AppDesign.border)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  borderSide: const BorderSide(color: AppDesign.border)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  borderSide: BorderSide(color: accent, width: 1.4)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernBottomBar() {
    final totalItems = _cartSummary['totalItems'] ?? 0;
    final totalQuantity = _cartSummary['totalQuantity'] ?? 0;
    final totalGstAmount = _cartSummary['totalGstAmount'] ?? 0.0;

    return UiSummaryBar(
      accent: AppDesign.success,
      rows: [
        ('Items', '$totalItems · $totalQuantity qty'),
        ('Total', 'RM ${totalGstAmount.toStringAsFixed(2)}'),
      ],
      actionLabel: 'Checkout',
      actionIcon: Icons.shopping_cart_checkout,
      onAction: _proceedToCheckout,
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
    _controller =
        TextEditingController(text: widget.initialPrice.toStringAsFixed(2));
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
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

// Custom Barcode Display Widget
class _BarcodeDisplay extends StatelessWidget {
  final String data;

  const _BarcodeDisplay({required this.data});

  @override
  Widget build(BuildContext context) {
    try {
      final barcode = bc.Barcode.code128();
      return CustomPaint(
        size: Size.infinite,
        painter: _BarcodePainter(
          barcode: barcode,
          data: data,
        ),
      );
    } catch (e) {
      // If barcode generation fails, show text fallback
      return Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 10),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
  }
}

class _BarcodePainter extends CustomPainter {
  final bc.Barcode barcode;
  final String data;

  _BarcodePainter({required this.barcode, required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    try {
      barcode
          .make(
        data,
        width: size.width,
        height: size.height,
        drawText: false,
      )
          .forEach((element) {
        if (element is bc.BarcodeBar) {
          final paint = Paint()
            ..color = element.black ? Colors.black : Colors.white
            ..style = PaintingStyle.fill;
          canvas.drawRect(
            Rect.fromLTWH(
              element.left,
              element.top,
              element.width,
              element.height,
            ),
            paint,
          );
        }
      });
    } catch (e) {
      // Silent fail - will show text fallback
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Barcode Scanner Page temporarily disabled
/*
class _BarcodeScannerPage extends StatefulWidget {
  final int companyCode;
  final String customerCode;
  final Function(int skuNo, String? uom, double? price) onBarcodeScanned;

  const _BarcodeScannerPage({
    required this.companyCode,
    required this.customerCode,
    required this.onBarcodeScanned,
  });

  @override
  State<_BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<_BarcodeScannerPage> {
  late final PluService _pluService;
  MobileScannerController? _controller;
  bool _isProcessing = false;
  String? _lastScannedCode;

  @override
  void initState() {
    super.initState();
    _pluService = PluService(isar);
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _handleBarcode(BarcodeCapture capture) async {
    if (_isProcessing) return;

    final barcode = capture.barcodes.firstOrNull;
    if (barcode == null || barcode.rawValue == null) return;

    final code = barcode.rawValue!;
    
    // Prevent duplicate scans
    if (code == _lastScannedCode) return;
    _lastScannedCode = code;

    setState(() => _isProcessing = true);

    try {
      print('🔍 Scanned barcode: $code');
      
      // Look up customer PLU by barcode
      final customerPlu = await _pluService.getCachedCustomerPluByBarcode(
        companyCode: widget.companyCode,
        customerCode: widget.customerCode,
        pluNo: code,
      );

      if (customerPlu != null) {
        print('✅ Found customer PLU: SKU ${customerPlu.skuNo}, UOM: ${customerPlu.uom}');
        
        // Call callback with found item (price will be looked up from inventory/in_stock_uom)
        await widget.onBarcodeScanned(
          customerPlu.skuNo,
          customerPlu.uom,
          null, // Price will be determined from inventory item
        );

        if (!mounted) return;
        
        // Show success and go back
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Found item: ${customerPlu.pluNo}'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
          ),
        );
        
        // Go back after short delay
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          Navigator.pop(context);
        }
      } else {
        print('⚠️ Customer PLU not found for barcode: $code');
        
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ PLU code not found: $code'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      print('❌ Error processing barcode: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
      // Reset last scanned after delay to allow re-scanning
      Future.delayed(const Duration(seconds: 2), () {
        _lastScannedCode = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Customer PLU'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _handleBarcode,
          ),
          // Overlay with instructions
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Scan Customer PLU Barcode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Customer: ${widget.customerCode}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Processing indicator
          if (_isProcessing)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
*/
