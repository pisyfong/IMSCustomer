import 'package:flutter/material.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../inventory_page.dart';
import '../services/user_app_settings_service.dart';
import 'inventory_image_widget.dart';

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
  late ValueNotifier<int> localQty;
  late ValueNotifier<String> remarkText;
  late ValueNotifier<double> currentPrice;

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
    
    localQty = ValueNotifier(widget.inventoryPageState.qtySelections[sku] ?? 1);
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
              
              // Header Section
              _buildHeader(),
              
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderConfiguration(),
                      const SizedBox(height: 20),
                      _buildPurchaseHistory(),
                    ],
                  ),
                ),
              ),
              
              // Bottom Action Button
              _buildActionButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Product Image (clickable)
              GestureDetector(
                onTap: () => _showImageDialog(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FutureBuilder<dynamic>(
                    future: widget.inventoryPageState.authService.getSelectedCompany(),
                    builder: (context, snapshot) {
                      final company = snapshot.data;
                      final companyCodeRaw = company?['companyCode'] ?? 1;
                      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
                      
                      return Stack(
                        children: [
                          InventoryImageWidget(
                            companyCode: companyCode,
                            skuNo: widget.item.skuNo,
                            uom: selectedUom,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.zero,
                            showLoadingIndicator: true,
                          ),
                          // Zoom indicator overlay
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.zoom_in,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.description ?? 'Product',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SKU: ${widget.item.skuNo}',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    if (widget.item.brand != null && widget.item.brand!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.purple.shade200),
                        ),
                        child: Text(
                          widget.item.brand!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.purple.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _priceTapCount++;
                              if (_priceTapCount >= 5) {
                                _showCostAnalysis = !_showCostAnalysis;
                                _priceTapCount = 0; // Reset counter
                              }
                            });
                          },
                          child: ValueListenableBuilder<double>(
                            valueListenable: currentPrice,
                            builder: (context, price, child) {
                              return Text(
                                'RM ${price.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
                              );
                            },
                          ),
                        ),
                        if (_priceFromInvoice) ...[
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
                if (_canEditPrice)
                  TextButton.icon(
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Edit'),
                    onPressed: _editPrice,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderConfiguration() {
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
          const Text('Order Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildQuantitySelector(),
          const Divider(height: 24),
          _buildUomSelector(),
          const Divider(height: 24),
          _buildRemarkSection(),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
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
                  if (localQty.value > 1) {
                    localQty.value--;
                    widget.inventoryPageState.qtySelections[sku] = localQty.value;
                  }
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: localQty,
                builder: (context, qty, child) {
                  return Container(
                    constraints: const BoxConstraints(minWidth: 50),
                    alignment: Alignment.center,
                    child: Text(qty.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 18),
                onPressed: () {
                  if (localQty.value < 999) {
                    localQty.value++;
                    widget.inventoryPageState.qtySelections[sku] = localQty.value;
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUomSelector() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.straighten_outlined, size: 20, color: Colors.green),
        const SizedBox(width: 12),
        const Text('Unit', style: TextStyle(fontSize: 14)),
        const Spacer(),
        if (_isLoadingData)
          const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
        else
          Wrap(
            spacing: 8,
            children: _uomOptions
                .where((uom) => uom.status == 'A' || uom.status == null) // Only show active UOMs
                .map((uom) {
              final isSelected = selectedUom == (uom.uom ?? '');
              return ChoiceChip(
                label: Text(uom.uom ?? ''),
                selected: isSelected,
                selectedColor: Colors.green.shade100,
                onSelected: (_) => _selectUom(uom),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildRemarkSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.note_outlined, size: 20, color: Colors.orange),
        const SizedBox(width: 12),
        const Text('Remark', style: TextStyle(fontSize: 14)),
        const Spacer(),
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: remarkText,
            builder: (context, remark, child) {
              return InkWell(
                onTap: _editRemark,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    remark.isEmpty ? 'Tap to add remark' : remark,
                    style: TextStyle(
                      color: remark.isEmpty ? Colors.grey.shade500 : Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPurchaseHistory() {
    if (_isLoadingData) return const Center(child: CircularProgressIndicator());
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🤑 COST & PROFIT SECTION - Show only when tapped 5 times AND user has permission
        if (_showCostAnalysis && _userHasCostPermission) _buildCostAndProfitSection(),
        if (_showCostAnalysis && _userHasCostPermission) const SizedBox(height: 20),

        // Purchase History Section - Only show if there's data
        if (_invoicesData.isNotEmpty || _quotationsData.isNotEmpty) ...[
          Row(
            children: [
              const Text('Purchase History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              if (_isLoadingHistory) ...[
                const SizedBox(width: 8),
                const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
              ],
            ],
          ),
          const SizedBox(height: 12),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: [
                      Tab(text: 'Invoices (${_invoicesData.length})'),
                      Tab(text: 'Quotations (${_quotationsData.length})'),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                  ),
                  child: TabBarView(
                    children: [
                      widget.inventoryPageState.buildHistoryList(_invoicesData, 'invoice'),
                      widget.inventoryPageState.buildHistoryList(_quotationsData, 'quote'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActionButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: _addToCart,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_shopping_cart, color: Colors.white),
              const SizedBox(width: 8),
              ValueListenableBuilder<int>(
                valueListenable: localQty,
                builder: (context, qty, child) {
                  return ValueListenableBuilder<double>(
                    valueListenable: currentPrice,
                    builder: (context, price, child) {
                      return Text(
                        'Add $qty × RM ${price.toStringAsFixed(2)} = RM ${(qty * price).toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
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
          const Text('Cost & Profit Analysis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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

  void _addToCart() {
    widget.inventoryPageState.addToCart(
      widget.item,
      remark: remarkText.value,
      uom: selectedUom.isEmpty ? null : selectedUom,
      customGstPrice: currentPrice.value,
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    localQty.dispose();
    remarkText.dispose();
    currentPrice.dispose();
    super.dispose();
  }
}
