import 'package:flutter/material.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../services/user_app_settings_service.dart';
import '../services/loose_uom_rule.dart';
import '../services/line_money.dart';
import '../services/qty.dart';
import '../theme/app_design.dart';
import 'inventory_image_widget.dart';
import 'item_history_list.dart';

class InventoryDetailsBottomSheet extends StatefulWidget {
  final InventoryItem item;
  final dynamic inventoryPageState;

  const InventoryDetailsBottomSheet({
    Key? key,
    required this.item,
    required this.inventoryPageState,
  }) : super(key: key);

  @override
  State<InventoryDetailsBottomSheet> createState() => _InventoryDetailsBottomSheetState();
}

class _InventoryDetailsBottomSheetState extends State<InventoryDetailsBottomSheet> {
  late int sku;
  late String selectedUom;
  /// Qty carries decimals like the other three. It was an int, which made a
  /// KG-based item — most of this catalogue's meat and fish — impossible to
  /// order by half a kilo from the field the operator reaches for first.
  late ValueNotifier<double> localQty;
  late ValueNotifier<String> remarkText;
  late ValueNotifier<double> currentPrice;

  /// Free and loose quantities entered up front, so "10 cartons plus one
  /// free" is one action instead of adding the item and then editing the cart.
  final ValueNotifier<double> localFoc = ValueNotifier(0);
  final ValueNotifier<double> localLoose = ValueNotifier(0);
  final ValueNotifier<double> localFocLoose = ValueNotifier(0);

  final TextEditingController _qtyCtrl = TextEditingController();
  final TextEditingController _focCtrl = TextEditingController();
  final TextEditingController _looseCtrl = TextEditingController();
  final TextEditingController _focLooseCtrl = TextEditingController();

  /// Pack size of the selected UOM, needed so the sheet can price loose units
  /// and show the line's true size in base units.
  /// Falls back to 1 both while the UOM list is still loading and when the
  /// selected unit carries no usable factor. Guarding with `(f ?? 1) > 0` and
  /// then returning `f!` is the trap: the test passes when f is null, and the
  /// force-unwrap throws — which it did on every tap, until the async load
  /// filled the list.
  double get _selectedFactor {
    final match = _uomOptions.where((u) => (u.uom ?? '') == selectedUom);
    final f = match.isEmpty ? null : match.first.factor;
    final factor = f ?? 1;
    return factor > 0 ? factor : 1;
  }

  List<InStockUom> _uomOptions = [];
  bool _isLoadingData = true;
  bool _isLoadingHistory = false;
  bool _canEditPrice = false;
  bool _userHasCostPermission = false;
  bool _priceFromInvoice = false; // Track if price is from latest invoice
  
  // Cost analysis toggle state
  int _priceTapCount = 0;
  bool _showCostAnalysis = false;

  // History data
  List<Map<String, dynamic>> _invoicesData = [];
  List<Map<String, dynamic>> _quotationsData = [];

  @override
  void initState() {
    super.initState();
    sku = widget.item.skuNo;
    selectedUom = widget.item.uom ?? '';
    
    localQty =
        ValueNotifier(widget.inventoryPageState.qtySelections[sku] ?? 1.0);
    _qtyCtrl.text = Qty.fmt(localQty.value);
    _focCtrl.text = '0';
    _looseCtrl.text = '0';
    _focLooseCtrl.text = '0';
    remarkText = ValueNotifier('');
    // Initialize with default price, will be updated after invoices load
    currentPrice = ValueNotifier(widget.item.gstPrice ?? widget.item.price ?? 0.0);
    
    _loadBottomSheetData();
  }

  // 🎯 LOAD ALL DATA ONCE ON INIT
  Future<void> _loadBottomSheetData() async {
    try {
      // 1. Load UOM options
      final options = await widget.inventoryPageState.loadUomOptions(widget.item);
      
      // 2. Check price permission
      final company = await widget.inventoryPageState.authService.getSelectedCompany();
      final companyCodeRaw = company?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      final settingsService = UserAppSettingsService();
      final canEdit = await settingsService.canChangePrice(companyCode: companyCode);
      
      // 3. Check cost permission
      final userAppSettingsService = UserAppSettingsService();
      final canShowCost = await userAppSettingsService.shouldShowCost(companyCode: companyCode);
      
      // 4. Load history data ONCE
      final filterUom = selectedUom.isEmpty ? null : selectedUom;
      final invoices = await widget.inventoryPageState.loadPreviousInvoicesForItem(widget.item, filterUom: filterUom);
      final quotations = await widget.inventoryPageState.loadPreviousOrdersForItem(widget.item, filterUom: filterUom);
      
      // 5. Set price to latest invoice price if available
      double initialPrice = widget.item.gstPrice ?? widget.item.price ?? 0.0;
      bool fromInvoice = false;
      
      if (invoices.isNotEmpty) {
        // Get the latest invoice (first item, already sorted by date descending)
        final latestInvoice = invoices.first;
        final latestInvoicePrice = latestInvoice['price'];
        if (latestInvoicePrice != null && latestInvoicePrice > 0) {
          initialPrice = (latestInvoicePrice is int) 
              ? (latestInvoicePrice as int).toDouble() 
              : latestInvoicePrice as double;
          fromInvoice = true;
          print('💰 SKU $sku: Set price to latest invoice price: RM ${initialPrice.toStringAsFixed(2)} (from invoice ${latestInvoice['invoiceNo']})');
        } else {
          print('⚠️ SKU $sku: Latest invoice has no valid price, using default: RM ${initialPrice.toStringAsFixed(2)}');
        }
      } else {
        print('ℹ️ SKU $sku: No invoice history, using default price: RM ${initialPrice.toStringAsFixed(2)}');
      }
      
      // 🎯 UPDATE STATE ONCE - NO MORE REBUILDS
      if (mounted) {
        currentPrice.value = initialPrice;
        setState(() {
          _uomOptions = options;
          _canEditPrice = canEdit;
          _userHasCostPermission = canShowCost;
          _invoicesData = invoices;
          _quotationsData = quotations;
          _priceFromInvoice = fromInvoice;
          _isLoadingData = false;
        });
      }
      
      print('✅ SKU $sku: Bottom sheet data loaded ONCE - UOM: ${options.length}, Invoices: ${invoices.length}, Quotations: ${quotations.length}');
    } catch (e) {
      print('❌ SKU $sku: Bottom sheet error: $e');
      if (mounted) {
        setState(() {
          _uomOptions = [
            InStockUom()
              ..companyCode = 1
              ..skuNo = widget.item.skuNo
              ..uom = widget.item.uom ?? 'EA'
              ..factor = 1.0
              ..price = widget.item.price
              ..gstPrice = widget.item.gstPrice
          ];
          _isLoadingData = false;
        });
      }
    }
  }

  // 🔄 RELOAD HISTORY FOR NEW UOM - ONLY WHEN UOM CHANGES
  Future<void> _reloadHistoryForUom(String newUom) async {
    setState(() {
      _isLoadingHistory = true;
    });
    
    try {
      final invoices = await widget.inventoryPageState.loadPreviousInvoicesForItem(widget.item, filterUom: newUom);
      final quotations = await widget.inventoryPageState.loadPreviousOrdersForItem(widget.item, filterUom: newUom);
      
      if (mounted) {
        setState(() {
          _invoicesData = invoices;
          _quotationsData = quotations;
          _isLoadingHistory = false;
        });
      }
      
      print('✅ SKU $sku: History reloaded for UOM $newUom - Invoices: ${invoices.length}, Quotations: ${quotations.length}');
    } catch (e) {
      print('❌ Error reloading history for UOM $newUom: $e');
      if (mounted) {
        setState(() {
          _isLoadingHistory = false;
        });
      }
    }
  }

  void _showImageDialog(BuildContext context) async {
    final company = await widget.inventoryPageState.authService.getSelectedCompany();
    final companyCodeRaw = company?['companyCode'] ?? 1;
    final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
    
    if (!mounted) return;
    
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            // Large Image
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 40,
                    maxHeight: MediaQuery.of(context).size.height - 100,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InventoryImageWidget(
                      companyCode: companyCode,
                      skuNo: widget.item.skuNo,
                      uom: selectedUom,
                      fit: BoxFit.contain,
                      borderRadius: BorderRadius.zero,
                      showLoadingIndicator: true,
                    ),
                  ),
                ),
              ),
            ),
            // Close button
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 24),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Product info overlay
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.item.description ?? 'Product',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SKU: ${widget.item.skuNo} • UOM: $selectedUom',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
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

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppDesign.bg,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppDesign.radiusLg)),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 2),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppDesign.borderStrong,
                  borderRadius: BorderRadius.circular(AppDesign.radiusPill),
                ),
              ),
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderConfiguration(),
                      const SizedBox(height: 10),
                      _buildPurchaseHistory(),
                    ],
                  ),
                ),
              ),
              _buildActionButton(),
            ],
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------- header

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 6, 10),
      color: AppDesign.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image — tap to zoom
              GestureDetector(
                onTap: () => _showImageDialog(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDesign.radius),
                  child: FutureBuilder<dynamic>(
                    future:
                        widget.inventoryPageState.authService.getSelectedCompany(),
                    builder: (context, snapshot) {
                      final company = snapshot.data;
                      final companyCodeRaw = company?['companyCode'] ?? 1;
                      final companyCode = companyCodeRaw is String
                          ? int.tryParse(companyCodeRaw) ?? 1
                          : companyCodeRaw as int;

                      return Stack(
                        children: [
                          InventoryImageWidget(
                            companyCode: companyCode,
                            skuNo: widget.item.skuNo,
                            uom: selectedUom,
                            width: 58,
                            height: 58,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.zero,
                            showLoadingIndicator: true,
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                    BorderRadius.circular(AppDesign.radiusSm),
                              ),
                              child: const Icon(Icons.zoom_in,
                                  size: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.description ?? 'Product',
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          height: 1.25,
                          color: AppDesign.ink),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    // SKU and brand on one line — they were stacked, which
                    // pushed the price panel below the fold on a short screen.
                    Row(
                      children: [
                        Text('SKU ${widget.item.skuNo}',
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppDesign.inkMuted)),
                        if ((widget.item.brand ?? '').isNotEmpty) ...[
                          const Text('  ·  ',
                              style: TextStyle(
                                  fontSize: 11, color: AppDesign.inkSubtle)),
                          Flexible(
                            child: Text(
                              widget.item.brand!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppDesign.modPacking),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.close,
                    size: 20, color: AppDesign.inkMuted),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildPriceBar(),
        ],
      ),
    );
  }

  /// Price, its provenance, and the edit affordance.
  ///
  /// Five taps on the number still toggles the cost breakdown for users who
  /// have the permission — an existing hidden gesture, kept as-is.
  Widget _buildPriceBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppDesign.modOrderingBg,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        border: Border.all(color: AppDesign.modOrdering.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _priceTapCount++;
                if (_priceTapCount >= 5) {
                  _showCostAnalysis = !_showCostAnalysis;
                  _priceTapCount = 0;
                }
              });
            },
            // Labelled, because the footer now carries a second large money
            // figure. Two unlabelled bold numbers on one screen is the kind of
            // ambiguity that gets a price read as a total.
            child: ValueListenableBuilder<double>(
              valueListenable: currentPrice,
              builder: (context, price, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('UNIT PRICE',
                      style: TextStyle(
                          fontSize: 8.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.6,
                          color: AppDesign.inkSubtle)),
                  Text(
                    'RM ${price.toStringAsFixed(2)}'
                    '${selectedUom.trim().isEmpty ? '' : ' / ${selectedUom.trim()}'}',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.4,
                        height: 1.1,
                        color: AppDesign.accentInk),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (_priceFromInvoice)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppDesign.modPickingBg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.receipt_long,
                      size: 11, color: AppDesign.modPicking),
                  SizedBox(width: 3),
                  Text('Last invoice',
                      style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.modPicking)),
                ],
              ),
            ),
          const Spacer(),
          if (_canEditPrice)
            TextButton.icon(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                foregroundColor: AppDesign.accentInk,
              ),
              icon: const Icon(Icons.edit, size: 14),
              label: const Text('Edit',
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              onPressed: _editPrice,
            ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------- order block

  Widget _buildOrderConfiguration() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppDesign.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionLabel('UNIT'),
          const SizedBox(height: 6),
          _buildUomSelector(),
          const SizedBox(height: 12),
          _sectionLabel('QUANTITY'),
          const SizedBox(height: 6),
          _buildQuantitySelector(),
          const SizedBox(height: 12),
          _sectionLabel('REMARK'),
          const SizedBox(height: 6),
          _buildRemarkSection(),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Text(
        text,
        style: const TextStyle(
            fontSize: 9.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.6,
            color: AppDesign.inkSubtle),
      );

  /// Qty / FOC — and Loose / FOC loose when the chosen UOM is a pack.
  ///
  /// Same four fields, same order, as the cart line and the picking screen,
  /// so a quantity means the same thing everywhere it is typed. The loose pair
  /// follows the procurement PD rule (see [LooseUomRule]): ordering in the base
  /// unit hides it, because a loose base unit is just a base unit.
  Widget _buildQuantitySelector() {
    final showLoose = LooseUomRule.applies(
      uom: selectedUom,
      baseUom: widget.item.uom,
      factor: _selectedFactor,
      existingLoose: localLoose.value,
      existingFocLoose: localFocLoose.value,
    );
    // Qty is what nearly every order sets and the other three are exceptions,
    // so Qty gets its own full-width row at a size that can be read and hit
    // without looking. Four equal boxes gave the rare fields the same weight
    // as the common one, which is how a quantity ends up typed into FOC.
    return Column(
      children: [
        _numField(
          label: 'Qty',
          ctrl: _qtyCtrl,
          accent: AppDesign.modOrdering,
          primary: true,
          expand: false,
          onChanged: (t) {
            final v = Qty.tryParse(t);
            if (v == null || v > 999) return;
            localQty.value = v;
            widget.inventoryPageState.qtySelections[sku] = v;
          },
          // Stepper affordance kept — it is faster than the keyboard for
          // the one-or-two-more case, which is most of them.
          //
          // Steps by whole units even on a decimal quantity: 2.5 + 1 is 3.5,
          // not a jump to 3. The operator who wants 2.50 → 2.75 types it.
          onStep: (delta) {
            final next = Qty.round((localQty.value + delta).clamp(0, 999));
            localQty.value = next;
            widget.inventoryPageState.qtySelections[sku] = next;
            _qtyCtrl.text = Qty.fmt(next);
          },
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (showLoose) ...[
              _numField(
                label: 'Qty Basic',
                ctrl: _looseCtrl,
                accent: AppDesign.modOrdering,
                onChanged: (t) => _setNotifier(localLoose, t),
              ),
              const SizedBox(width: 6),
            ],
            _numField(
              label: 'FOC',
              ctrl: _focCtrl,
              accent: AppDesign.warning,
              onChanged: (t) => _setNotifier(localFoc, t),
            ),
            if (showLoose) ...[
              const SizedBox(width: 6),
              _numField(
                label: 'FOC Basic',
                ctrl: _focLooseCtrl,
                accent: AppDesign.warning,
                onChanged: (t) => _setNotifier(localFocLoose, t),
              ),
            ],
            // Without the loose pair there is only FOC to place. Letting it
            // stretch the full width would make the exception look like the
            // main field, which is the thing this layout is fixing.
            if (!showLoose) const Spacer(flex: 2),
          ],
        ),
        const SizedBox(height: 6),
        // Live restatement of the line in base units, so a pack size that the
        // operator cannot see still shows its effect before they commit.
        AnimatedBuilder(
          animation: Listenable.merge(
              [localQty, localFoc, localLoose, localFocLoose]),
          builder: (context, _) {
            final f = _selectedFactor;
            final base = (localQty.value + localFoc.value) * f +
                localLoose.value +
                localFocLoose.value;
            final extras = localFoc.value > 0 ||
                localLoose.value > 0 ||
                localFocLoose.value > 0;
            if (!extras && f == 1) return const SizedBox.shrink();
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${_fmt(base)} base units'
                '${f != 1 ? '  ·  ×${_factorFmt(f)} per $selectedUom' : ''}'
                '${localFoc.value > 0 || localFocLoose.value > 0 ? '  ·  FOC not charged' : ''}',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.inkMuted),
              ),
            );
          },
        ),
      ],
    );
  }

  void _setNotifier(ValueNotifier<double> n, String text) {
    final v = Qty.tryParse(text);
    if (v == null) return; // partial input — leave the last good value alone
    n.value = v;
  }

  /// Quantities are always 2dp. Pack factors are not — see [_factorFmt].
  static String _fmt(double v) => Qty.fmt(v);

  /// A pack size, which is a property of the item rather than something the
  /// operator types, so it keeps its natural form: ×12, not ×12.00.
  static String _factorFmt(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  /// A labelled numeric box, optionally with −/+ steppers.
  ///
  /// [primary] makes it the field the eye lands on: bigger type, a taller
  /// touch target and a tinted border. [expand] is false for a field that
  /// stands outside a Row and so must not wrap itself in Expanded.
  Widget _numField({
    required String label,
    required TextEditingController ctrl,
    required Color accent,
    required ValueChanged<String> onChanged,
    void Function(int delta)? onStep,
    bool primary = false,
    bool expand = true,
  }) {
    OutlineInputBorder border(Color c, double w) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          borderSide: BorderSide(color: c, width: w),
        );

    final field = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: primary ? 10.5 : 9,
                fontWeight: FontWeight.w800,
                letterSpacing: primary ? 0.5 : 0.3,
                color: accent)),
        SizedBox(height: primary ? 4 : 2),
        Row(
          children: [
            if (onStep != null)
              _stepButton(Icons.remove, () => onStep(-1), accent,
                  primary: primary),
            Expanded(
              child: TextField(
                controller: ctrl,
                onChanged: onChanged,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: primary ? 22 : 13,
                    fontWeight: primary ? FontWeight.w900 : FontWeight.w700,
                    letterSpacing: primary ? -0.5 : 0),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: primary ? 11 : 8, horizontal: 2),
                  border: border(AppDesign.border, 1),
                  enabledBorder: border(
                      primary ? accent.withOpacity(0.45) : AppDesign.border,
                      primary ? 1.4 : 1),
                  focusedBorder: border(accent, primary ? 1.8 : 1.4),
                ),
              ),
            ),
            if (onStep != null)
              _stepButton(Icons.add, () => onStep(1), accent,
                  primary: primary),
          ],
        ),
      ],
    );

    return expand ? Expanded(child: field) : field;
  }

  Widget _stepButton(IconData icon, VoidCallback onTap, Color accent,
          {bool primary = false}) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: primary ? 10 : 3, vertical: primary ? 10 : 7),
          child: Icon(icon, size: primary ? 22 : 15, color: accent),
        ),
      );

  Widget _buildUomSelector() {
    if (_isLoadingData) {
      return const SizedBox(
          height: 30,
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2)),
          ));
    }

    final active = _uomOptions
        .where((uom) => uom.status == 'A' || uom.status == null)
        .toList();

    if (active.isEmpty) {
      return const Text('No units configured',
          style: TextStyle(fontSize: 11.5, color: AppDesign.inkSubtle));
    }

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: active.map((uom) {
        final code = uom.uom ?? '';
        final isSelected = selectedUom == code;
        final factor = uom.factor ?? 1;
        return GestureDetector(
          onTap: () => _selectUom(uom),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppDesign.modOrdering
                  : AppDesign.surfaceAlt,
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              border: Border.all(
                  color: isSelected
                      ? AppDesign.modOrdering
                      : AppDesign.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(code,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: isSelected
                            ? Colors.white
                            : AppDesign.ink)),
                // Pack size on the chip: the difference between CTN and PCS
                // is the whole reason a wrong pick costs money.
                if (factor != 1) ...[
                  const SizedBox(width: 4),
                  Text('×${_factorFmt(factor.toDouble())}',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.white70
                              : AppDesign.inkSubtle)),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRemarkSection() {
    return ValueListenableBuilder<String>(
      valueListenable: remarkText,
      builder: (context, remark, child) {
        final empty = remark.trim().isEmpty;
        return InkWell(
          onTap: _editRemark,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              color: empty ? AppDesign.surfaceAlt : AppDesign.surface,
              border: Border.all(color: AppDesign.border),
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            ),
            child: Row(
              children: [
                Icon(Icons.note_outlined,
                    size: 14,
                    color: empty
                        ? AppDesign.inkSubtle
                        : AppDesign.modOrdering),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    empty ? 'Tap to add a remark' : remark,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: empty ? AppDesign.inkSubtle : AppDesign.ink,
                    ),
                  ),
                ),
                if (!empty)
                  const Icon(Icons.edit,
                      size: 13, color: AppDesign.inkSubtle),
              ],
            ),
          ),
        );
      },
    );
  }

  // --------------------------------------------------------------- history

  Widget _buildPurchaseHistory() {
    if (_isLoadingData) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cost breakdown — five taps on the price, and only for users whose
        // settings allow cost visibility.
        if (_showCostAnalysis && _userHasCostPermission) ...[
          _buildCostAndProfitSection(),
          const SizedBox(height: 10),
        ],

        if (_invoicesData.isNotEmpty || _quotationsData.isNotEmpty)
          Container(
            decoration: AppDesign.card(),
            clipBehavior: Clip.antiAlias,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TabBar(
                          labelColor: AppDesign.modOrdering,
                          unselectedLabelColor: AppDesign.inkSubtle,
                          indicatorColor: AppDesign.modOrdering,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: const TextStyle(
                              fontSize: 11.5, fontWeight: FontWeight.w800),
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 11.5, fontWeight: FontWeight.w600),
                          tabs: [
                            Tab(
                                height: 38,
                                text: 'Invoices (${_invoicesData.length})'),
                            Tab(
                                height: 38,
                                text:
                                    'Quotations (${_quotationsData.length})'),
                          ],
                        ),
                      ),
                      if (_isLoadingHistory)
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                              width: 14,
                              height: 14,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2)),
                        ),
                    ],
                  ),
                  const Divider(height: 1, color: AppDesign.divider),
                  SizedBox(
                    height: 168,
                    child: TabBarView(
                      children: [
                        ItemHistoryList(
                          entries: [
                            for (final m in _invoicesData)
                              ItemHistoryEntry.fromMap(m)
                          ],
                          isInvoice: true,
                          onAdd: _addHistoryLineToCart,
                        ),
                        ItemHistoryList(
                          entries: [
                            for (final m in _quotationsData)
                              ItemHistoryEntry.fromMap(m)
                          ],
                          isInvoice: false,
                          onAdd: _addHistoryLineToCart,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // ---------------------------------------------------------------- action

  /// The footer: the line's arithmetic, then the button.
  ///
  /// The total used to live only on the button face. That told the operator
  /// *what* they would be charged but never *why* — to check a price they had
  /// to read the unit price out of the header, multiply it themselves, and
  /// compare. Loose units and free goods each break that sum in a different
  /// way, so each gets its own line instead of being folded silently into one
  /// number.
  ///
  /// The pricing is unchanged, and deliberately identical to the cart and the
  /// quotation: packs at the UOM price, loose at the base-unit price, FOC at
  /// nothing. A footer that computed its own total would eventually disagree
  /// with the order it creates.
  Widget _buildActionButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: SafeArea(
        top: false,
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [localQty, localFoc, localLoose, localFocLoose, currentPrice]),
          builder: (context, _) {
            final price = currentPrice.value;
            final f = _selectedFactor;
            final packs = localQty.value.toDouble();
            final loose = localLoose.value;
            final m = LineMoney(
                unitPrice: price, factor: f, packs: packs, loose: loose);

            final uomLabel = selectedUom.trim().isEmpty ? 'unit' : selectedUom.trim();
            final baseLabel = (widget.item.uom ?? '').trim().isEmpty
                ? 'base'
                : widget.item.uom!.trim();
            final freeUnits = localFoc.value * f + localFocLoose.value;
            final anything =
                packs + loose + localFoc.value + localFocLoose.value > 0;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Unit price — restated here, next to the multiplication it
                // feeds, so the total can be checked without scrolling back up
                // to the header.
                _sumRow('Unit price', 'RM ${LineMoney.money(price)} / $uomLabel'),
                if (packs > 0)
                  _sumRow('${_fmt(packs)} × $uomLabel',
                      'RM ${LineMoney.money(m.packTotal)}'),
                if (loose > 0) ...[
                  _sumRow('Basic price',
                      'RM ${LineMoney.money(m.basePrice, exact: true)} / $baseLabel'),
                  _sumRow('${_fmt(loose)} × $baseLabel',
                      'RM ${LineMoney.money(m.looseTotal)}'),
                ],
                if (freeUnits > 0)
                  _sumRow(
                    '${_fmt(freeUnits)} $baseLabel free',
                    'no charge',
                    color: AppDesign.warning,
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Divider(height: 1, color: AppDesign.border),
                ),
                _sumRow('Total', 'RM ${LineMoney.money(m.total)}', strong: true),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: anything ? _addToCart : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppDesign.modOrdering,
                      disabledBackgroundColor: AppDesign.borderStrong,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDesign.radius)),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_shopping_cart, size: 17),
                        SizedBox(width: 8),
                        Text(
                          'Add to cart',
                          style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// One line of the footer arithmetic: label left, money right.
  Widget _sumRow(String label, String value,
      {bool strong = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: strong ? 12.5 : 11,
                fontWeight: strong ? FontWeight.w800 : FontWeight.w600,
                color: color ?? (strong ? AppDesign.ink : AppDesign.inkMuted),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: strong ? 17 : 11.5,
              fontWeight: strong ? FontWeight.w900 : FontWeight.w700,
              letterSpacing: strong ? -0.4 : 0,
              color: color ?? (strong ? AppDesign.accentInk : AppDesign.ink),
            ),
          ),
        ],
      ),
    );
  }



  // Build cost and profit information section
  Widget _buildCostAndProfitSection() {
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
          const Text('Cost & Profit Analysis', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ValueListenableBuilder<double>(
            valueListenable: currentPrice,
            builder: (context, price, child) {
              final cost = _getItemCost();
              final profit = price - cost;
              final profitMargin = cost > 0 ? (profit / cost) * 100 : 0.0;
              
              return Column(
                children: [
                  // Cost Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.inventory, size: 16, color: Colors.red),
                          const SizedBox(width: 8),
                          const Text('Cost', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Text(
                        'RM ${cost.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.attach_money, size: 16, color: Colors.green),
                          const SizedBox(width: 8),
                          const Text('Price', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Text(
                        'RM ${price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Profit Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.trending_up, size: 16, color: Colors.blue),
                          const SizedBox(width: 8),
                          const Text('Profit', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Text(
                        'RM ${profit.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.w600, 
                          color: profit >= 0 ? Colors.blue : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Profit Margin Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.percent, size: 16, color: Colors.purple),
                          const SizedBox(width: 8),
                          const Text('Margin', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Text(
                        '${profitMargin.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.w600, 
                          color: profitMargin >= 0 ? Colors.purple : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // Get the appropriate cost value from inventory item
  double _getItemCost() {
    // Base cost from inventory item (this is the cost for the base UOM from in_stock)
    final baseCost = widget.item.standardCost ?? widget.item.averageCost ?? widget.item.lastCost ?? widget.item.price ?? 0.0;

    // The base UOM is from in_stock.uom (e.g., "CTN")
    final baseUom = widget.item.uom?.trim();
    double baseFactor = 1.0;
    
    // Find the factor for the base UOM from in_stock_uom
    if (baseUom != null && baseUom.isNotEmpty && _uomOptions.isNotEmpty) {
      try {
        final target = baseUom.toUpperCase();
        final baseUomOption = _uomOptions.firstWhere((u) => (u.uom ?? '').trim().toUpperCase() == target);
        baseFactor = baseUomOption?.factor ?? 1.0;
      } catch (e) {
        // Base UOM not found in in_stock_uom, default to 1.0
        baseFactor = 1.0;
      }
    }

    // Find the selected UOM's factor from in_stock_uom
    double selectedFactor = 1.0;
    if (selectedUom.isNotEmpty && _uomOptions.isNotEmpty) {
      try {
        final targetSel = selectedUom.trim().toUpperCase();
        final selectedUomOption = _uomOptions.firstWhere((u) => (u.uom ?? '').trim().toUpperCase() == targetSel);
        selectedFactor = selectedUomOption?.factor ?? 1.0;
      } catch (e) {
        selectedFactor = 1.0;
      }
    }

    // Guard against division by zero
    if (baseFactor <= 0) baseFactor = 1.0;
    if (selectedFactor <= 0) selectedFactor = 1.0;

    // Calculate: cost = (baseCost / baseFactor) * selectedFactor
    print('💰 COST CALC SKU ${widget.item.skuNo}: baseCost=$baseCost, baseUom=$baseUom, baseFactor=$baseFactor, selectedUom=$selectedUom, selectedFactor=$selectedFactor');
    final double unitCost = baseCost / baseFactor;
    final double result = unitCost * selectedFactor;
    print('💰 COST CALC RESULT: unitCost=$unitCost, finalCost=$result');
    return result;
  }

  void _selectUom(InStockUom uom) {
    setState(() {
      selectedUom = uom.uom ?? '';
    });

    // Switching to a UOM that has no loose concept has to clear the loose
    // values too. Leaving them set would submit quantities the operator can no
    // longer see, and at the new UOM they would mean something else anyway.
    if (!LooseUomRule.applies(
      uom: selectedUom,
      baseUom: widget.item.uom,
      factor: _selectedFactor,
    )) {
      localLoose.value = 0;
      localFocLoose.value = 0;
      _looseCtrl.text = '0';
      _focLooseCtrl.text = '0';
    }


    final newPrice = uom.gstPrice ?? uom.price ?? 0.0;
    currentPrice.value = newPrice;
    widget.inventoryPageState.priceSelections[sku] = newPrice;
    
    // Only reload history when UOM actually changes
    _reloadHistoryForUom(selectedUom);
  }

  void _editPrice() async {
    final controller = TextEditingController(text: currentPrice.value.toStringAsFixed(2));
    final result = await showDialog<double>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Price'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Price (RM)', border: OutlineInputBorder()),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              final price = double.tryParse(controller.text);
              if (price != null) Navigator.pop(dialogContext, price);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (result != null) {
      currentPrice.value = result;
      widget.inventoryPageState.priceSelections[sku] = result;
    }
  }

  void _editRemark() async {
    final controller = TextEditingController(text: remarkText.value);
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Remark'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Remark', border: OutlineInputBorder()),
          maxLines: 3,
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(dialogContext, controller.text), child: const Text('Save')),
        ],
      ),
    );
    if (result != null) remarkText.value = result;
  }

  /// Puts a previous invoice or quotation line back into the cart, as it was.
  ///
  /// Quantity, UOM, price, FOC and the basic quantities all come from the
  /// document rather than from the fields above — the operator asked for "that
  /// one again", not for the sheet's current state.
  ///
  /// The sheet deliberately stays open. Adding is a persisted write, so the
  /// line is in the cart the moment this returns; closing would just cost a
  /// re-open for the common case of ordering two of the last three deliveries.
  /// Re-adding the same SKU and UOM accumulates onto the existing cart line
  /// rather than creating a second one, which is the same rule the Add button
  /// below follows.
  Future<void> _addHistoryLineToCart(ItemHistoryEntry entry) async {
    await widget.inventoryPageState.addToCart(
      widget.item,
      uom: entry.uom.isEmpty ? null : entry.uom,
      customGstPrice: entry.price,
      quantity: entry.qty,
      foc: entry.foc,
      quantityLoose: entry.quantityLoose,
      focLoose: entry.focLoose,
      // Null is fine: addToCart resolves the pack size from In_Stock_Uom when
      // the document did not carry one.
      factor: entry.factor,
      remark: entry.docNo.isEmpty ? null : 'Re-order ${entry.docNo}',
    );
  }

  void _addToCart() {
    widget.inventoryPageState.addToCart(
      widget.item,
      remark: remarkText.value,
      uom: selectedUom.isEmpty ? null : selectedUom,
      customGstPrice: currentPrice.value,
      foc: localFoc.value,
      quantityLoose: localLoose.value,
      focLoose: localFocLoose.value,
      // The sheet already knows which UOM was chosen, so it can hand over the
      // pack size rather than making the caller look it up again.
      factor: _selectedFactor,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    localQty.dispose();
    remarkText.dispose();
    currentPrice.dispose();
    localFoc.dispose();
    localLoose.dispose();
    localFocLoose.dispose();
    _qtyCtrl.dispose();
    _focCtrl.dispose();
    _looseCtrl.dispose();
    _focLooseCtrl.dispose();
    super.dispose();
  }
}
