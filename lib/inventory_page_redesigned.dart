  void _showInventoryDetails(InventoryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final int sku = item.skuNo;
        int localQty = _qtySelections[sku] ?? 1;
        String selectedUom = (item.uom ?? '').trim();
        String remarkText = '';
        
        // Initialize price from map or item's default price
        if (!_priceSelections.containsKey(sku)) {
          _priceSelections[sku] = item.gstPrice ?? 0.0;
        }
        double currentPrice = _priceSelections[sku]!;
        
        // Data storage
        List<InStockUom> uomOptions = [];
        List<Map<String, dynamic>> invoicesData = [];
        List<Map<String, dynamic>> quotationsData = [];
        bool isLoadingUom = true;
        bool canEditPrice = false;
        InStockUom? selectedUomData;
        
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setSheetState) {
                // Load data once
                if (isLoadingUom) {
                  isLoadingUom = false;
                  
                  // Load UOM options
                  _loadUomOptions(item).then((options) {
                    if (context.mounted) {
                      setSheetState(() {
                        uomOptions = options;
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
                  
                  // Check price permission
                  _authService.getSelectedCompany().then((company) async {
                    final companyCodeRaw = company?['companyCode'] ?? 1;
                    final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
                    final settingsService = UserAppSettingsService();
                    final canEdit = await settingsService.canChangePrice(companyCode: companyCode);
                    if (context.mounted) {
                      setSheetState(() {
                        canEditPrice = canEdit;
                      });
                    }
                  });
                  
                  // Load history data
                  _loadPreviousInvoicesForItem(item, filterUom: selectedUom.isEmpty ? null : selectedUom).then((data) {
                    if (context.mounted) {
                      setSheetState(() {
                        invoicesData = data;
                      });
                    }
                  });
                  
                  _loadPreviousOrdersForItem(item, filterUom: selectedUom.isEmpty ? null : selectedUom).then((data) {
                    if (context.mounted) {
                      setSheetState(() {
                        quotationsData = data;
                      });
                    }
                  });
                }
                
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
                      
                      // Header Section with Product Info
                      Container(
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
                            // Product Name and SKU
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.description ?? 'Product',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'SKU: ${item.skuNo}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Close Button
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Price Display
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
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'RM ${currentPrice.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (canEditPrice)
                                    TextButton.icon(
                                      icon: const Icon(Icons.edit, size: 16),
                                      label: const Text('Edit'),
                                      onPressed: () async {
                                        final controller = TextEditingController(text: currentPrice.toStringAsFixed(2));
                                        final result = await showDialog<double>(
                                          context: context,
                                          builder: (dialogContext) => AlertDialog(
                                            title: const Text('Edit Price'),
                                            content: TextField(
                                              controller: controller,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration(
                                                labelText: 'Price (RM)',
                                                border: OutlineInputBorder(),
                                              ),
                                              autofocus: true,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(dialogContext),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  final price = double.tryParse(controller.text);
                                                  if (price != null) {
                                                    Navigator.pop(dialogContext, price);
                                                  }
                                                },
                                                child: const Text('Save'),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (result != null) {
                                          setSheetState(() {
                                            currentPrice = result;
                                            _priceSelections[sku] = result;
                                          });
                                        }
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Scrollable Content
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Order Configuration Section
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Order Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    
                                    // Quantity Selector
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
                                                  if (localQty > 1) {
                                                    setSheetState(() {
                                                      localQty--;
                                                      _qtySelections[sku] = localQty;
                                                    });
                                                  }
                                                },
                                              ),
                                              Container(
                                                constraints: const BoxConstraints(minWidth: 50),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  localQty.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add, size: 18),
                                                onPressed: () {
                                                  if (localQty < 999) {
                                                    setSheetState(() {
                                                      localQty++;
                                                      _qtySelections[sku] = localQty;
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    
                                    const Divider(height: 24),
                                    
                                    // UOM Selector
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.straighten_outlined, size: 20, color: Colors.green),
                                        const SizedBox(width: 12),
                                        const Text('Unit', style: TextStyle(fontSize: 14)),
                                        const Spacer(),
                                        if (uomOptions.isEmpty)
                                          const SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(strokeWidth: 2),
                                          )
                                        else
                                          Wrap(
                                            spacing: 8,
                                            children: uomOptions.map((uom) {
                                              final isSelected = selectedUom == (uom.uom ?? '');
                                              return ChoiceChip(
                                                label: Text(uom.uom ?? ''),
                                                selected: isSelected,
                                                selectedColor: Colors.green.shade100,
                                                onSelected: (_) {
                                                  setSheetState(() {
                                                    selectedUom = uom.uom ?? '';
                                                    selectedUomData = uom;
                                                    final newPrice = uom.gstPrice ?? uom.price ?? 0.0;
                                                    currentPrice = newPrice;
                                                    _priceSelections[sku] = newPrice;
                                                  });
                                                  
                                                  // Reload history for new UOM
                                                  _loadPreviousInvoicesForItem(item, filterUom: selectedUom).then((data) {
                                                    if (context.mounted) {
                                                      setSheetState(() {
                                                        invoicesData = data;
                                                      });
                                                    }
                                                  });
                                                  
                                                  _loadPreviousOrdersForItem(item, filterUom: selectedUom).then((data) {
                                                    if (context.mounted) {
                                                      setSheetState(() {
                                                        quotationsData = data;
                                                      });
                                                    }
                                                  });
                                                },
                                              );
                                            }).toList(),
                                          ),
                                      ],
                                    ),
                                    
                                    const Divider(height: 24),
                                    
                                    // Remark
                                    InkWell(
                                      onTap: () async {
                                        final controller = TextEditingController(text: remarkText);
                                        final result = await showDialog<String>(
                                          context: context,
                                          builder: (dialogContext) => AlertDialog(
                                            title: const Text('Add Remark'),
                                            content: TextField(
                                              controller: controller,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter remark...',
                                                border: OutlineInputBorder(),
                                              ),
                                              maxLines: 3,
                                              autofocus: true,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(dialogContext),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(dialogContext, controller.text),
                                                child: const Text('Save'),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (result != null) {
                                          setSheetState(() {
                                            remarkText = result;
                                          });
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.note_outlined, size: 20, color: Colors.orange),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text('Remark', style: TextStyle(fontSize: 14)),
                                                if (remarkText.isNotEmpty) ...[
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    remarkText,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.edit_outlined,
                                            size: 16,
                                            color: Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              const SizedBox(height: 20),
                              
                              // Purchase History Section
                              if (invoicesData.isNotEmpty || quotationsData.isNotEmpty) ...[
                                const Text(
                                  'Purchase History',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                
                                // History Tabs
                                DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: TabBar(
                                          labelColor: Colors.blue,
                                          unselectedLabelColor: Colors.grey,
                                          indicatorColor: Colors.blue,
                                          tabs: [
                                            Tab(text: 'Invoices (${invoicesData.length})'),
                                            Tab(text: 'Quotations (${quotationsData.length})'),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.vertical(
                                            bottom: Radius.circular(12),
                                          ),
                                        ),
                                        child: TabBarView(
                                          children: [
                                            // Invoices Tab
                                            _buildHistoryList(invoicesData, 'invoice'),
                                            // Quotations Tab
                                            _buildHistoryList(quotationsData, 'quote'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      
                      // Bottom Action Button
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: SafeArea(
                          child: ElevatedButton(
                            onPressed: () {
                              _addToCart(
                                item,
                                remark: remarkText,
                                uom: selectedUom.isEmpty ? null : selectedUom,
                                customGstPrice: currentPrice,
                              );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add_shopping_cart, color: Colors.white),
                                const SizedBox(width: 8),
                                Text(
                                  'Add to Cart (${localQty} × RM ${currentPrice.toStringAsFixed(2)})',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
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
