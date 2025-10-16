import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:barcode/barcode.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as path;
import '../models/cart_item.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';
import '../services/cart_service.dart';
import '../services/auth_service.dart';
import '../services/signalr_service.dart';
import '../services/quote_number_service.dart';
import '../services/quotation_service.dart';
import '../services/credit_term_service.dart';
import '../models/credit_term.dart';
import '../models/customer_plu.dart';
import '../main.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CheckoutPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final CustomerService _customerService;
  late final QuotationService _quotationService;
  late final CreditTermService _creditTermService;
  final CartService _cartService = CartService();
  final AuthService _authService = AuthService();
  
  Map<String, dynamic>? _selectedCustomer;
  List<Customer> _customers = [];
  bool _isLoadingCustomers = true;
  final TextEditingController _remarksController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _useCustomerPlu = false; // Toggle for customer-specific PLU
  
  List<CreditTerm> _creditTerms = [];
  CreditTerm? _selectedCreditTerm;
  bool _isLoadingCreditTerms = true;
  
  double _totalAmount = 0.0;
  double _gstAmount = 0.0;
  double _netAmount = 0.0;

  @override
  void initState() {
    super.initState();
    final signalRService = SignalRService();
    _customerService = CustomerService(signalRService);
    _quotationService = QuotationService(signalRService);
    _creditTermService = CreditTermService(signalRService);
    _loadSelectedCustomer();
    _loadCreditTerms();
    _calculateTotals();
  }

  Future<void> _loadSelectedCustomer() async {
    try {
      // Get the currently selected customer from AuthService
      final selectedCustomer = await _authService.getCurrentCustomer();
      setState(() {
        _selectedCustomer = selectedCustomer;
      });
    } catch (e) {
      print('Error loading selected customer: $e');
      setState(() {
        _selectedCustomer = null; // Will be handled gracefully in PDF generation
      });
    }
  }

  Future<void> _loadCreditTerms() async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      
      // OFFLINE FIRST: Load cached terms immediately
      print('📋 CREDIT TERMS: Loading from cache first...');
      final cachedTerms = await _creditTermService.getCreditTerms(companyCode: companyCode);
      
      setState(() {
        _creditTerms = cachedTerms;
        _isLoadingCreditTerms = false;
        // Set default term (first one or find 30 days term)
        if (cachedTerms.isNotEmpty) {
          // Try to find 30-day term by days field
          final index = cachedTerms.indexWhere((term) => term.days == 30);
          _selectedCreditTerm = index >= 0 ? cachedTerms[index] : cachedTerms.first;
          print('✅ CREDIT TERMS: Loaded ${cachedTerms.length} cached terms, selected: ${_selectedCreditTerm?.displayFull}');
        } else {
          _selectedCreditTerm = null;
          print('⚠️ CREDIT TERMS: No cached terms available');
        }
      });
      
      // BACKGROUND SYNC: Fetch from server to update cache (don't wait)
      _creditTermService.fetchCreditTerms(companyCode: companyCode).then((serverTerms) {
        if (serverTerms.isNotEmpty && mounted) {
          print('🔄 CREDIT TERMS: Updated cache with ${serverTerms.length} terms from server');
          setState(() {
            _creditTerms = serverTerms;
            // Re-select default if current selection is null or not in new list
            if (_selectedCreditTerm == null) {
              final index = serverTerms.indexWhere((term) => term.days == 30);
              _selectedCreditTerm = index >= 0 ? serverTerms[index] : serverTerms.first;
            } else {
              // Ensure selected term is from the new list (by finding matching term)
              final matchIndex = serverTerms.indexWhere(
                (term) => term.companyCode == _selectedCreditTerm!.companyCode && 
                         term.term == _selectedCreditTerm!.term
              );
              if (matchIndex >= 0) {
                _selectedCreditTerm = serverTerms[matchIndex];
              }
            }
          });
        }
      }).catchError((e) {
        print('⚠️ CREDIT TERMS: Background sync failed (using cached data): $e');
      });
      
    } catch (e) {
      print('❌ Error loading credit terms: $e');
      setState(() {
        _isLoadingCreditTerms = false;
        _creditTerms = [];
        _selectedCreditTerm = null;
      });
    }
  }

  void _calculateTotals() {
    // GST is INCLUSIVE - prices already include GST
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += item.gstSubtotal;  // Already includes GST
    }
    
    setState(() {
      _totalAmount = total;       // Total (GST inclusive)
      _netAmount = total;         // Same as total since GST is inclusive
      _gstAmount = 0.0;           // No separate GST (it's included)
    });
  }

  Future<List<CartItem>> _fetchCustomerPluForItems() async {
    try {
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      final customerCode = _selectedCustomer!['code'];
      
      print('📦 OFFLINE-FIRST: Loading customer PLU from local database...');
      
      // OFFLINE-FIRST: Load from local database first
      final localPluRecords = await isar.customerPlus
          .filter()
          .companyCodeEqualTo(companyCode)
          .customerCodeEqualTo(customerCode)
          .findAll();
      
      if (localPluRecords.isNotEmpty) {
        print('📱 Found ${localPluRecords.length} customer PLU records in local database');
        
        // Create map for quick lookup
        final pluMap = <String, String>{};
        for (final record in localPluRecords) {
          pluMap[record.skuNo] = record.pluNo;
        }
        
        // Return items with PLU from local database
        return widget.cartItems.map((item) {
          final pluNo = pluMap[item.skuNo] ?? '';
          final updatedItem = CartItem()
            ..id = item.id
            ..companyCode = item.companyCode
            ..skuNo = item.skuNo
            ..pluNo = pluNo
            ..description = item.description
            ..uom = item.uom
            ..unitPrice = item.unitPrice
            ..gstPrice = item.gstPrice
            ..factor = item.factor
            ..quantity = item.quantity
            ..remarks = item.remarks
            ..addedDate = item.addedDate;
          return updatedItem;
        }).toList();
      }
      
      print('📱 No local PLU data, checking if online...');
      
      // No local data, try to fetch from server if online
      final signalRService = SignalRService();
      if (!signalRService.isConnected) {
        print('📱 Offline mode: Using empty PLU');
        return widget.cartItems.map((item) {
          final updatedItem = CartItem()
            ..id = item.id
            ..companyCode = item.companyCode
            ..skuNo = item.skuNo
            ..pluNo = ''
            ..description = item.description
            ..uom = item.uom
            ..unitPrice = item.unitPrice
            ..gstPrice = item.gstPrice
            ..factor = item.factor
            ..quantity = item.quantity
            ..remarks = item.remarks
            ..addedDate = item.addedDate;
          return updatedItem;
        }).toList();
      }
      
      // Get SKU numbers from cart items
      final skuNos = widget.cartItems.map((item) => item.skuNo).toList();
      
      print('🌐 Fetching customer PLU from server...');
      final customerPluData = await signalRService.invoke('getCustomerPlu', [
        companyCode,
        customerCode,
        skuNos,
      ]).timeout(
        const Duration(seconds: 2),
        onTimeout: () {
          print('⏱️ Customer PLU fetch timed out - using empty PLU');
          return [];
        },
      ) as List<dynamic>;
      
      print('📦 Fetched ${customerPluData.length} customer PLU records from server');
      
      // Save to local database for future offline use
      if (customerPluData.isNotEmpty) {
        try {
          await isar.writeTxn(() async {
            final pluRecords = <CustomerPlu>[];
            for (final pluData in customerPluData) {
              if (pluData is Map<String, dynamic>) {
                final plu = CustomerPlu.fromJson(pluData, companyCode, customerCode);
                if (plu.skuNo.isNotEmpty && plu.pluNo.isNotEmpty) {
                  pluRecords.add(plu);
                }
              }
            }
            await isar.customerPlus.putAll(pluRecords);
            print('💾 Saved ${pluRecords.length} PLU records to local database');
          });
        } catch (e) {
          print('❌ Error saving PLU to local database: $e');
        }
      }
      
      // Create new list with updated PLU
      return widget.cartItems.map((item) {
        final customerPlu = customerPluData.firstWhere(
          (plu) => plu['Sku_No'] == item.skuNo,
          orElse: () => null,
        );
        
        final updatedItem = CartItem()
          ..id = item.id
          ..companyCode = item.companyCode
          ..skuNo = item.skuNo
          ..pluNo = customerPlu != null ? customerPlu['Plu_No'] : ''
          ..description = item.description
          ..uom = item.uom
          ..unitPrice = item.unitPrice
          ..gstPrice = item.gstPrice
          ..factor = item.factor
          ..quantity = item.quantity
          ..remarks = item.remarks
          ..addedDate = item.addedDate;
        
        return updatedItem;
      }).toList();
    } catch (e) {
      print('❌ Error fetching customer PLU: $e');
      // Return items with empty PLU on error
      return widget.cartItems.map((item) {
        final updatedItem = CartItem()
          ..id = item.id
          ..companyCode = item.companyCode
          ..skuNo = item.skuNo
          ..pluNo = ''
          ..description = item.description
          ..uom = item.uom
          ..unitPrice = item.unitPrice
          ..gstPrice = item.gstPrice
          ..factor = item.factor
          ..quantity = item.quantity
          ..remarks = item.remarks
          ..addedDate = item.addedDate;
        return updatedItem;
      }).toList();
    }
  }

  Future<void> _generatePdfQuotation() async {
    print('🚀 Starting PDF generation...');
    try {
      print('📋 Step 1: Loading user and company info...');
      final currentUser = await _authService.loadSavedLogin();
      final userId = currentUser?.userId ?? 0;
      final selectedCompany = await _authService.getSelectedCompany();
      final companyCodeRaw = selectedCompany?['companyCode'] ?? 1;
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) ?? 1 : companyCodeRaw as int;
      final companyName = selectedCompany?['companyName'] ?? 'Company';
      print('✅ User ID: $userId, Company: $companyName ($companyCode)');
      
      // Fetch customer PLU if toggle is ON
      List<CartItem> cartItemsWithPlu = widget.cartItems;
      if (_useCustomerPlu && _selectedCustomer != null) {
        cartItemsWithPlu = await _fetchCustomerPluForItems();
      }
      
      // Generate quote number
      final quoteNo = await QuoteNumberService().nextQuoteNumber();
      print('📝 Creating quotation in database: $quoteNo');
      print('💳 Selected credit term: ${_selectedCreditTerm?.displayFull}');
      print('💳 Term code: "${_selectedCreditTerm?.term}", Days: ${_selectedCreditTerm?.days}');
      
      final quotation = await _quotationService.createQuotation(
        companyCode: companyCode,
        quotePreLabel: quoteNo,
        customer: _selectedCustomer!['code'] ?? '',
        quoteDate: DateTime.now(),
        status: 'P', // P = Pending
        term: _selectedCreditTerm?.term ?? '30', // Use selected credit term
        quoteExpiry: DateTime.now().add(Duration(days: _selectedCreditTerm?.days ?? 30)),
        additionalData: {
          'remark1': _remarksController.text,
          'currency': 'RM',
          'rate': 1.0,
          'totalQuoteQuantity': widget.cartItems.fold<double>(0, (sum, item) => sum + item.quantity),
          'totalQuoteItem': widget.cartItems.length,
          'grossAmount': _totalAmount,
          'gstAmount': _gstAmount,
          'totalAmountB4Gst': _totalAmount,
          'netAmount': _netAmount,
          'quotedBy': userId,
          'addedBy': userId,
        },
      );
      
      print('✅ Quotation created: ${quotation.quotePreLabel}, isSynced: ${quotation.isSynced}');
      
      // Save quotation items to database
      print('📝 Saving quotation items to database...');
      final cartItemsData = widget.cartItems.map((item) => {
        'skuNo': item.skuNo,
        'uom': item.uom,
        'quantity': item.quantity.toDouble(),
        'unitPrice': item.unitPrice ?? 0.0,
        'amount': (item.unitPrice ?? 0.0) * item.quantity,
        'pluNo': item.pluNo,
        'remark': item.remarks,
      }).toList();
      
      final itemsSaved = await _quotationService.saveQuotationItems(
        companyCode: companyCode,
        quotePreLabel: quoteNo,
        items: cartItemsData,
      );
      
      if (itemsSaved) {
        print('✅ Quotation items saved successfully');
      } else {
        print('⚠️ Warning: Quotation items may not have been saved to database');
      }
      
      final pdf = pw.Document();
      
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Left: Company Info
                    pw.Expanded(
                      flex: 3,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            companyName.toUpperCase(),
                            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                          ),
                          pw.SizedBox(height: 3),
                          pw.Text('LOT 1422 EASTWOOD VALLEY INDUSTRIAL PARK 1, JALAN MIRI BY-PASS,', style: const pw.TextStyle(fontSize: 8)),
                          pw.Text('96000 MIRI SARAWAK  TEL/FAX: 085-419489, 013-6686555', style: const pw.TextStyle(fontSize: 8)),
                          pw.SizedBox(height: 5),
                          pw.Text('Email: fungseng22@gmail.com', style: const pw.TextStyle(fontSize: 8)),
                        ],
                      ),
                    ),
                    // Right: Title and Quote Number
                    pw.Expanded(
                      flex: 2,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Container(
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(width: 2),
                            ),
                            padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: pw.Text('PICKING LIST', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Text(quoteNo, style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 15),
                
                // Customer and Quote Info Row
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Left: Customer Info
                    pw.Expanded(
                      flex: 3,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('To: ${_selectedCustomer!['code'] ?? ''} - ${_selectedCustomer!['displayName'] ?? 'N/A'}', 
                            style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 3),
                          if (_selectedCustomer!['fullAddress']?.isNotEmpty ?? false)
                            pw.Text(_selectedCustomer!['fullAddress']!, style: const pw.TextStyle(fontSize: 9)),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 20),
                    // Right: Quote Info Box
                    pw.Container(
                      width: 150,
                      padding: const pw.EdgeInsets.all(8),
                      decoration: pw.BoxDecoration(border: pw.Border.all()),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Master Quote', style: const pw.TextStyle(fontSize: 8)),
                              pw.Text(': $quoteNo', style: const pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Quote Date', style: const pw.TextStyle(fontSize: 8)),
                              pw.Text(': ${DateTime.now().toString().split(' ')[0]}', style: const pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Term', style: const pw.TextStyle(fontSize: 8)),
                              pw.Text(': ${_selectedCreditTerm?.displayDescription ?? "30 DAYS"}', style: const pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('Quoted By', style: const pw.TextStyle(fontSize: 8)),
                              pw.Text(': ${currentUser?.loginName ?? "IMS"}', style: const pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text('SalesRep', style: const pw.TextStyle(fontSize: 8)),
                              pw.Text(': ${_selectedCustomer!['code'] ?? "001"}', style: const pw.TextStyle(fontSize: 8)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 15),
                
                // Items Table
                pw.Table(
                  border: pw.TableBorder.all(width: 0.5),
                  columnWidths: {
                    0: const pw.FixedColumnWidth(30),  // No
                    1: const pw.FlexColumnWidth(2),     // Plu/Barcode
                    2: const pw.FlexColumnWidth(4),     // Description
                    3: const pw.FixedColumnWidth(40),   // Qty
                    4: const pw.FixedColumnWidth(35),   // Foc
                    5: const pw.FixedColumnWidth(45),   // Uom/F
                    6: const pw.FixedColumnWidth(55),   // U/Price
                    7: const pw.FixedColumnWidth(45),   // Disc.
                    8: const pw.FixedColumnWidth(60),   // Amount
                  },
                  children: [
                    // Header Row
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(color: PdfColors.grey200),
                      children: [
                        _buildTableHeader('No'),
                        _buildTableHeader('Plu/Barcode'),
                        _buildTableHeader('Description'),
                        _buildTableHeader('Qty'),
                        _buildTableHeader('Foc'),
                        _buildTableHeader('Uom/F'),
                        _buildTableHeader('U/Price'),
                        _buildTableHeader('Disc.'),
                        _buildTableHeader('Amount'),
                      ],
                    ),
                    // Item Rows
                    ...widget.cartItems.asMap().entries.map((entry) {
                      final index = entry.key + 1;
                      final item = entry.value;
                      return pw.TableRow(
                        children: [
                          _buildTableCell('$index', fontSize: 8),
                          _buildBarcodeCell(item.pluNo),
                          _buildTableCell(item.displayDescription, fontSize: 8),
                          _buildTableCell('${item.quantity.toInt()}', fontSize: 8, align: pw.TextAlign.right),
                          _buildTableCell('', fontSize: 8),
                          _buildTableCell(item.displayUom, fontSize: 8),
                          _buildTableCell(item.displayGstPrice, fontSize: 8, align: pw.TextAlign.right),
                          _buildTableCell('', fontSize: 8),
                          _buildTableCell(item.displayGstSubtotal, fontSize: 8, align: pw.TextAlign.right),
                        ],
                      );
                    }).toList(),
                  ],
                ),
                pw.SizedBox(height: 10),
                
                // Remarks
                if (_remarksController.text.isNotEmpty)
                  pw.Text('REMARK 1: ${_remarksController.text}', style: const pw.TextStyle(fontSize: 8)),
                
                pw.Spacer(),
                
                // Footer Section
                pw.Container(
                  decoration: const pw.BoxDecoration(
                    border: pw.Border(top: pw.BorderSide(width: 1)),
                  ),
                  padding: const pw.EdgeInsets.only(top: 10),
                  child: pw.Column(
                    children: [
                      // Amount in words
                      pw.Text('RINGGIT MALAYSIA - TWO AND CENTS FIFTY ONLY', 
                        style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 10),
                      
                      // Signature boxes and totals
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          // Left: Signature boxes
                          pw.Expanded(
                            flex: 3,
                            child: pw.Row(
                              children: [
                                pw.Expanded(child: _buildSignatureBox('Received By')),
                                pw.SizedBox(width: 5),
                                pw.Expanded(child: _buildSignatureBox('Check By')),
                                pw.SizedBox(width: 5),
                                pw.Expanded(child: _buildSignatureBox('Delivered By')),
                                pw.SizedBox(width: 5),
                                pw.Expanded(child: _buildSignatureBox('For Fung Seng Trading SB')),
                              ],
                            ),
                          ),
                          pw.SizedBox(width: 20),
                          // Right: Totals
                          pw.Container(
                            width: 150,
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                              children: [
                                pw.Container(
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(top: pw.BorderSide(width: 1)),
                                  ),
                                  padding: const pw.EdgeInsets.only(top: 4),
                                  child: _buildTotalRow('Total (GST Inc.)', 'RM', _totalAmount.toStringAsFixed(2), isBold: true),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );

      // Generate PDF for mobile platforms
      print('📄 Step 3: Generating PDF bytes...');
      final Uint8List pdfBytes = await pdf.save();
      
      // Sanitize filename - replace slashes and special characters
      final sanitizedQuoteNo = quoteNo.replaceAll('/', '_').replaceAll('\\', '_');
      final sanitizedCustomerCode = (_selectedCustomer?['code'] ?? 'N/A').replaceAll('/', '_').replaceAll('\\', '_');
      final String fileName = 'Quote_${sanitizedCustomerCode}_${DateTime.now().toString().split(' ')[0]}_$sanitizedQuoteNo.pdf';
      print('✅ PDF bytes generated: ${pdfBytes.length} bytes, filename: $fileName');
      
      // Save PDF to device storage
      print('💾 Step 4: Saving PDF to device...');
      final directory = await getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, fileName);
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);
      print('✅ PDF saved to: $filePath');
      
      // Show success message with sync status
      final syncStatus = quotation.isSynced 
          ? '✅ Synced to server' 
          : '📱 Will sync when online';
      
      // Show PDF with built-in zoom and share capabilities
      print('📱 Step 5: Opening PDF viewer...');
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async {
          print('📄 PDF viewer requesting layout...');
          return pdfBytes;
        },
        name: fileName,
      );
      print('✅ PDF viewer closed');
      
      // Show action dialog after PDF viewer closes
      if (mounted) {
        final action = await showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Quotation Created'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quotation: $quoteNo'),
                Text('Status: $syncStatus'),
                const SizedBox(height: 8),
                const Text('PDF has been saved successfully!'),
                const SizedBox(height: 4),
                Text(
                  'Location: ${directory.path}',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'close'),
                child: const Text('Close'),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, 'open'),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Open PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context, 'share'),
                icon: const Icon(Icons.share),
                label: const Text('Share'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
        
        // Handle user action
        if (action == 'share') {
          try {
            print('📤 Attempting to share PDF...');
            await Printing.sharePdf(
              bytes: pdfBytes,
              filename: fileName,
            );
            print('✅ Share dialog opened');
          } catch (e) {
            print('❌ Error sharing PDF: $e');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error sharing PDF: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        } else if (action == 'open') {
          // Open the saved PDF file using Printing package viewer
          try {
            print('📂 Opening PDF from: $filePath');
            await Printing.layoutPdf(
              onLayout: (PdfPageFormat format) async => pdfBytes,
              name: fileName,
            );
          } catch (e) {
            print('❌ Error opening PDF: $e');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error opening PDF: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        }
      }
      
    } catch (e, stackTrace) {
      print('❌ ERROR in PDF generation: $e');
      print('Stack trace: $stackTrace');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating PDF: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 10),
          ),
        );
      }
    }
  }

  Future<void> _completeCheckout() async {
    // If no customer is selected, use a default customer or show error
    if (_selectedCustomer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No customer selected. Using default customer for PDF generation.')),
      );
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Quotation'),
        content: const Text('Create quotation and generate PDF for this order?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Create'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _generatePdfQuotation();
      
      // Clear cart after successful quotation creation
      await _cartService.clearCart();
      
      // Navigate back to previous screen
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Selection
                  _buildCustomerSection(),
                  const SizedBox(height: 20),
                  
                  // Order Summary
                  _buildOrderSummary(),
                  const SizedBox(height: 20),
                  
                  // Credit Term
                  _buildCreditTermSection(),
                  const SizedBox(height: 20),
                  
                  // Remarks
                  _buildRemarksSection(),
                ],
              ),
            ),
          ),
          
          // Bottom Actions
          _buildBottomActions(),
        ],
      ),
    );
  }

  Widget _buildCustomerSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Customer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            
            // Customer selection removed - customer is pre-selected from previous screen
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.blue.shade600, size: 16),
                  const SizedBox(width: 8),
                  const Text(
                    'Customer is pre-selected from previous screen',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            
            // Selected Customer Display
            if (_selectedCustomer != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue.shade600),
                        const SizedBox(width: 8),
                        Text(
                          'Customer: ${_selectedCustomer!['displayName'] ?? 'N/A'}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (_selectedCustomer!['fullAddress']?.isNotEmpty ?? false)
                      Text(_selectedCustomer!['fullAddress']!),
                    Text('Email: ${_selectedCustomer?['email'] ?? 'N/A'}'),
                    Text('Phone: ${_selectedCustomer?['telNo'] ?? 'N/A'}'),
                    const SizedBox(height: 12),
                    // Customer PLU Toggle
                    Row(
                      children: [
                        Icon(Icons.qr_code, color: Colors.blue.shade600, size: 20),
                        const SizedBox(width: 8),
                        const Text('Use Customer PLU:', style: TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(width: 8),
                        Switch(
                          value: _useCustomerPlu,
                          onChanged: (value) {
                            setState(() {
                              _useCustomerPlu = value;
                            });
                          },
                          activeColor: Colors.blue.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _useCustomerPlu ? 'ON' : 'OFF',
                          style: TextStyle(
                            color: _useCustomerPlu ? Colors.blue.shade600 : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange.shade600),
                    const SizedBox(width: 8),
                    const Text('No customer selected'),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            
            ...widget.cartItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.skuNo} - ${item.displayDescription}',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${item.quantity} x ${item.displayGstPrice}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item.displayGstSubtotal,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )).toList(),
            
            const Divider(),
            
            // Grand Total (GST Inclusive)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total (GST Inclusive):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('RM ${_totalAmount.toStringAsFixed(2)}', 
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditTermSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            if (_isLoadingCreditTerms)
              const Center(child: CircularProgressIndicator())
            else if (_creditTerms.isEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Credit terms unavailable offline. Using default: 30 days',
                        style: TextStyle(color: Colors.orange.shade900),
                      ),
                    ),
                  ],
                ),
              )
            else
              DropdownButtonFormField<CreditTerm>(
                value: _selectedCreditTerm,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Payment Term',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                items: _creditTerms.map((term) {
                  return DropdownMenuItem<CreditTerm>(
                    value: term,
                    child: Text(term.displayFull),
                  );
                }).toList(),
                onChanged: (CreditTerm? newValue) {
                  setState(() {
                    _selectedCreditTerm = newValue;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemarksSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Remarks (Optional)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _remarksController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter any additional notes or remarks...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Cart'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: _completeCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Create Quotation'),
            ),
          ),
        ],
      ),
    );
  }

  // PDF Helper Methods
  static pw.Widget _buildTableHeader(String text) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(3),
      child: pw.Text(
        text,
        style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
        textAlign: pw.TextAlign.center,
      ),
    );
  }

  static pw.Widget _buildTableCell(String text, {double fontSize = 8, pw.TextAlign align = pw.TextAlign.left}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(3),
      child: pw.Text(text, style: pw.TextStyle(fontSize: fontSize), textAlign: align),
    );
  }

  static pw.Widget _buildSignatureBox(String label) {
    return pw.Container(
      height: 50,
      decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.end,
        children: [
          pw.Container(
            padding: const pw.EdgeInsets.all(2),
            decoration: const pw.BoxDecoration(
              border: pw.Border(top: pw.BorderSide(width: 0.5)),
            ),
            child: pw.Center(
              child: pw.Text(label, style: const pw.TextStyle(fontSize: 7)),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildTotalRow(String label, String colon, String value, {bool isBold = false}) {
    final textStyle = isBold 
        ? pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)
        : const pw.TextStyle(fontSize: 9);
    
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: textStyle),
          pw.Text(colon, style: textStyle),
          pw.Text(value, style: textStyle),
        ],
      ),
    );
  }

  static pw.Widget _buildBarcodeCell(String? pluNo) {
    if (pluNo == null || pluNo.isEmpty) {
      return _buildTableCell('', fontSize: 8);
    }

    try {
      // Generate barcode - use EAN13 for 13-digit barcodes, Code128 for others
      final barcodeType = pluNo.length == 13 ? Barcode.ean13() : Barcode.code128();
      
      return pw.Padding(
        padding: const pw.EdgeInsets.all(2),
        child: pw.BarcodeWidget(
          barcode: barcodeType,
          data: pluNo,
          width: 80,
          height: 30,
          drawText: true,
          textStyle: const pw.TextStyle(fontSize: 6),
        ),
      );
    } catch (e) {
      // If barcode generation fails, show text instead
      return _buildTableCell(pluNo, fontSize: 7);
    }
  }
}
