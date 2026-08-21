import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/quote.dart';
import '../models/invoice.dart';
import '../models/quotation.dart';
import '../services/quote_service.dart';
import '../services/invoice_service.dart';
import '../services/quotation_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../services/signalr_service.dart';
import '../online_status_icon.dart';
import '../main.dart';
import 'edit_unsynced_quotation_page.dart';
import '../widgets/reorder_document_sheet.dart';
import '../theme/app_design.dart';
import '../models/quote_item.dart';

class PreviousOrderPage extends StatefulWidget {
  const PreviousOrderPage({Key? key}) : super(key: key);

  @override
  State<PreviousOrderPage> createState() => _PreviousOrderPageState();
}

class _PreviousOrderPageState extends State<PreviousOrderPage> with SingleTickerProviderStateMixin {
  late QuoteService _quoteService;
  late InvoiceService _invoiceService;
  late QuotationService _quotationService;
  final CustomerStateService _customerStateService = CustomerStateService();
  final AuthService _authService = AuthService();
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  List<Quote> _quotes = [];
  List<Quote> _filteredQuotes = [];
  List<Invoice> _invoices = [];
  List<Invoice> _filteredInvoices = [];
  List<Quotation> _unsyncedQuotations = [];
  List<Quotation> _filteredUnsyncedQuotations = [];
  bool _isLoading = false;
  bool _isSyncing = false;
  bool _isOnline = false;
  String? _error;
  String _searchQuery = '';
  Map<String, dynamic>? _selectedCompany;
  Map<String, dynamic>? _selectedCustomer;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _quoteService = QuoteService(signalRService);
    _invoiceService = InvoiceService(signalRService);
    _quotationService = QuotationService(signalRService);
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentTabIndex = _tabController.index;
        });
        _loadDataForCurrentTab();
      }
    });
    _loadSelectedData();
    // Don't load quotes immediately - wait for selected data to load first
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadSelectedData() async {
    try {
      print('🔄 PREVIOUS ORDER: Loading selected data...');
      
      // Load selected company
      final company = await _authService.getSelectedCompany();
      
      // Load selected customer
      final customer = _customerStateService.getSelectedCustomerInfo();
      
      print('✅ PREVIOUS ORDER: Selected data loaded:');
      print('   Company: ${company?['companyName']} (${company?['companyCode']})');
      print('   Customer: ${customer?['name']} (${customer?['code']})');
      
      setState(() {
        _selectedCompany = company;
        _selectedCustomer = customer;
        _isOnline = true; // You can implement proper online status check
      });
      
      // Now load data for current tab after selected data is available
      await _loadDataForCurrentTab();
      
    } catch (e) {
      print('❌ PREVIOUS ORDER: Error loading selected data: $e');
      setState(() {
        _isOnline = false;
        _error = 'Failed to load selected data: $e';
      });
    }
  }

  Future<void> _loadQuotes() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      final customerCode = _selectedCustomer?['code'];

      print('🔍 PREVIOUS ORDER: Loading quotes with filters:');
      print('   Company Code: $companyCode (from: $companyCodeRaw)');
      print('   Customer Code: $customerCode');
      print('   Search Query: ${_searchQuery.isEmpty ? 'none' : _searchQuery}');

      if (companyCode == null) {
        throw Exception('Company code is required but not available');
      }

      if (customerCode == null || customerCode.isEmpty) {
        throw Exception('Customer code is required but not available');
      }

      final quotes = await _quoteService.getQuotes(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      print('📋 PREVIOUS ORDER: Loaded ${quotes.length} quotes for customer $customerCode in company $companyCode');

      // Remove duplicates based on quote pre-label and date combination
      final uniqueQuotes = <Quote>[];
      final seenQuotes = <String>{};
      
      for (final quote in quotes) {
        final uniqueKey = '${quote.quotePreLabel}_${quote.quoteDate?.millisecondsSinceEpoch}';
        if (!seenQuotes.contains(uniqueKey)) {
          seenQuotes.add(uniqueKey);
          uniqueQuotes.add(quote);
        }
      }
      
      if (uniqueQuotes.length != quotes.length) {
        print('🔍 PREVIOUS ORDER: Removed ${quotes.length - uniqueQuotes.length} duplicate quotes');
      }

      setState(() {
        _quotes = uniqueQuotes;
        _filteredQuotes = uniqueQuotes;
        _isOnline = true;
      });
    } catch (e) {
      print('❌ PREVIOUS ORDER ERROR: $e');
      setState(() {
        _error = 'Failed to load quotes: $e';
        _isOnline = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshQuotes() async {
    print('🔄 PREVIOUS ORDER: Refresh button pressed - reloading selected data and quotes');
    
    // Reload selected data first, then quotes
    await _loadSelectedData();
  }

  Future<void> _loadDataForCurrentTab() async {
    switch (_currentTabIndex) {
      case 0: // Quotation
        await _loadQuotes();
        break;
      case 1: // Delivery Order
        // TODO: Implement delivery order loading
        print('📦 PREVIOUS ORDER: Delivery Order tab - Coming soon');
        break;
      case 2: // Invoice
        await _loadInvoices();
        break;
      case 3: // Unsynced
        await _loadUnsyncedQuotations();
        break;
    }
  }

  Future<void> _loadUnsyncedQuotations() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('🔍 PREVIOUS ORDER: Loading unsynced quotations...');
      
      final unsyncedQuotations = await _quotationService.getUnsyncedQuotations();
      
      print('📋 PREVIOUS ORDER: Found ${unsyncedQuotations.length} unsynced quotations');

      setState(() {
        _unsyncedQuotations = unsyncedQuotations;
        _filteredUnsyncedQuotations = unsyncedQuotations;
      });
    } catch (e) {
      print('❌ PREVIOUS ORDER ERROR: $e');
      setState(() {
        _error = 'Failed to load unsynced quotations: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _syncQuotation(Quotation quotation) async {
    setState(() {
      _isSyncing = true;
    });

    try {
      print('🔄 Syncing quotation: ${quotation.quotePreLabel}');
      await _quotationService.syncUnsyncedQuotations();
      
      // Reload unsynced quotations
      await _loadUnsyncedQuotations();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Synced ${quotation.quotePreLabel}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('❌ Sync error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }

  Future<void> _syncAllUnsyncedQuotations() async {
    if (_unsyncedQuotations.isEmpty) return;
    
    setState(() {
      _isSyncing = true;
    });

    try {
      print('🔄 Syncing all ${_unsyncedQuotations.length} unsynced quotations...');
      await _quotationService.syncUnsyncedQuotations();
      
      // Reload unsynced quotations
      await _loadUnsyncedQuotations();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ All quotations synced'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('❌ Sync all error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Sync failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isSyncing = false;
      });
    }
  }

  Future<void> _loadInvoices() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final companyCodeRaw = _selectedCompany?['companyCode'];
      final companyCode = companyCodeRaw is String ? int.tryParse(companyCodeRaw) : companyCodeRaw as int?;
      final customerCode = _selectedCustomer?['code'];

      print('🔍 PREVIOUS ORDER: Loading invoices with filters:');
      print('   Company Code: $companyCode (from: $companyCodeRaw)');
      print('   Customer Code: $customerCode');
      print('   Search Query: ${_searchQuery.isEmpty ? 'none' : _searchQuery}');

      if (companyCode == null) {
        throw Exception('Company code is required but not available');
      }

      if (customerCode == null || customerCode.isEmpty) {
        throw Exception('Customer code is required but not available');
      }

      final invoices = await _invoiceService.getInvoices(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
      );

      print('📋 PREVIOUS ORDER: Loaded ${invoices.length} invoices for customer $customerCode in company $companyCode');

      setState(() {
        _invoices = invoices;
        _filteredInvoices = invoices;
        _isOnline = true;
      });
    } catch (e) {
      print('❌ PREVIOUS ORDER ERROR: $e');
      setState(() {
        _error = 'Failed to load invoices: $e';
        _isOnline = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterQuotes(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredQuotes = _quotes;
        _filteredInvoices = _invoices;
      } else {
        final searchLower = query.toLowerCase();
        _filteredQuotes = _quotes.where((quote) {
          return (quote.quotePreLabel?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.customer?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.ref1?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.remark1?.toLowerCase().contains(searchLower) ?? false);
        }).toList();
        
        _filteredInvoices = _invoices.where((invoice) {
          return (invoice.invoicePreLabel.toLowerCase().contains(searchLower)) ||
                 (invoice.customer?.toLowerCase().contains(searchLower) ?? false) ||
                 (invoice.ref1?.toLowerCase().contains(searchLower) ?? false) ||
                 (invoice.remark1?.toLowerCase().contains(searchLower) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // Compact Header
            _buildCompactHeader(),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterQuotes,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search orders...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              _filterQuotes('');
                            },
                            child: Icon(Icons.close, color: Colors.grey.shade400, size: 18),
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
            ),

            // Compact Tab Bar
            Container(
              margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.blue.shade700,
                unselectedLabelColor: Colors.grey.shade500,
                indicatorColor: Colors.blue.shade600,
                indicatorWeight: 2,
                labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                unselectedLabelStyle: const TextStyle(fontSize: 12),
                tabs: [
                  const Tab(text: 'Quotation', height: 36),
                  const Tab(text: 'D.O.', height: 36),
                  const Tab(text: 'Invoice', height: 36),
                  Tab(
                    height: 36,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Unsynced'),
                        if (_unsyncedQuotations.isNotEmpty) ...[
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${_unsyncedQuotations.length}',
                              style: const TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Error message
            if (_error != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red.shade600, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _error!,
                          style: TextStyle(color: Colors.red.shade700, fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _error = null),
                        child: Icon(Icons.close, color: Colors.red.shade400, size: 16),
                      ),
                    ],
                  ),
                ),
              ),

            // Tab Content
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Previous Orders',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                if (_selectedCustomer != null)
                  Text(
                    _selectedCustomer!['name'] ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          // Online status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _isOnline ? Colors.green.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _isOnline ? Colors.green : Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  _isOnline ? 'Online' : 'Offline',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: _isOnline ? Colors.green.shade700 : Colors.orange.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Refresh button
          GestureDetector(
            onTap: _isLoading ? null : _refreshQuotes,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _isLoading
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
                      ),
                    )
                  : Icon(Icons.refresh, size: 18, color: Colors.blue.shade600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_currentTabIndex) {
      case 0: // Quotation
        return _buildQuoteList();
      case 1: // Delivery Order
        return _buildDeliveryOrderPlaceholder();
      case 2: // Invoice
        return _buildInvoiceList();
      case 3: // Unsynced
        return _buildUnsyncedList();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildUnsyncedList() {
    if (_isLoading && _filteredUnsyncedQuotations.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Loading unsynced quotations...',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredUnsyncedQuotations.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_done,
                size: 48,
                color: Colors.green[400],
              ),
              const SizedBox(height: 16),
              Text(
                'All quotations are synced!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'No pending quotations to sync',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // Sync All button
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${_filteredUnsyncedQuotations.length} unsynced quotation(s)',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: _isSyncing ? null : _syncAllUnsyncedQuotations,
                icon: _isSyncing
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.cloud_upload, size: 18),
                label: Text(_isSyncing ? 'Syncing...' : 'Sync All'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
        ),
        // List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            itemCount: _filteredUnsyncedQuotations.length,
            itemBuilder: (context, index) => _buildUnsyncedQuotationCard(_filteredUnsyncedQuotations[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildUnsyncedQuotationCard(Quotation quotation) {
    final formattedDate = quotation.quoteDate != null
        ? '${quotation.quoteDate!.day}/${quotation.quoteDate!.month}/${quotation.quoteDate!.year}'
        : 'No Date';
    final formattedAmount = 'RM ${(quotation.netAmount ?? 0).toStringAsFixed(2)}';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _editUnsyncedQuotation(quotation),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main row
                Row(
                  children: [
                    // Unsynced indicator
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.cloud_off,
                        size: 18,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Quote info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quotation.quotePreLabel,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            quotation.customer ?? 'No Customer',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Date and Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          formattedAmount,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Sync error if any
                if (quotation.syncError != null && quotation.syncError!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, size: 14, color: Colors.red.shade700),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            quotation.syncError!,
                            style: TextStyle(fontSize: 11, color: Colors.red.shade700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                // Sync button
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: _isSyncing ? null : () => _syncQuotation(quotation),
                      icon: _isSyncing
                          ? const SizedBox(
                              width: 14,
                              height: 14,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.sync, size: 16),
                      label: const Text('Sync Now'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.orange.shade700,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _editUnsyncedQuotation(Quotation quotation) async {
    final hasChanges = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => EditUnsyncedQuotationPage(quotation: quotation),
      ),
    );
    
    // Reload if changes were made
    if (hasChanges == true) {
      await _loadUnsyncedQuotations();
    }
  }

  Widget _buildUnsyncedDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOrderPlaceholder() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_shipping, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Delivery Order',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceList() {
    if (_isLoading && _filteredInvoices.isEmpty) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }

    if (_filteredInvoices.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _searchQuery.isEmpty ? Icons.receipt_long_outlined : Icons.search_off,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty 
                  ? 'No invoices found'
                  : 'No invoices match "$_searchQuery"',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _searchQuery.isEmpty 
                  ? 'Try refreshing or check with a different customer'
                  : 'Try a different search term',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (_searchQuery.isEmpty) {
                  _refreshQuotes();
                } else {
                  _searchController.clear();
                  _filterQuotes('');
                }
              },
              icon: Icon(_searchQuery.isEmpty ? Icons.refresh : Icons.clear),
              label: Text(_searchQuery.isEmpty ? 'Refresh' : 'Clear Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      itemCount: _filteredInvoices.length,
      itemBuilder: (context, index) => _buildInvoiceCard(_filteredInvoices[index]),
    );
  }

  Widget _buildQuoteList() {
    if (_isLoading && _filteredQuotes.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Loading orders...',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    if (_filteredQuotes.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _searchQuery.isEmpty ? Icons.receipt_long_outlined : Icons.search_off,
                size: 48,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                _searchQuery.isEmpty 
                    ? 'No previous orders found'
                    : 'No orders match "$_searchQuery"',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _searchQuery.isEmpty 
                    ? 'Try refreshing or check with a different customer'
                    : 'Try a different search term',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (_searchQuery.isEmpty) {
                    _refreshQuotes();
                  } else {
                    _searchController.clear();
                    _filterQuotes('');
                  }
                },
                icon: Icon(_searchQuery.isEmpty ? Icons.refresh : Icons.clear),
                label: Text(_searchQuery.isEmpty ? 'Refresh' : 'Clear Search'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      itemCount: _filteredQuotes.length,
      itemBuilder: (context, index) => _buildQuoteCard(_filteredQuotes[index]),
    );
  }

  /// One document in the list.
  ///
  /// Quotations and invoices were two near-identical 150-line builders drawn
  /// in raw `Colors.blue`/`Colors.grey`, while the rest of the app had moved
  /// to the design tokens. They are one builder now, differing only in accent
  /// and in what tapping them does — which is what they actually differ in.
  ///
  /// The re-order button is the point of the page: on a handheld a past order
  /// is looked at mostly in order to place it again.
  Widget _documentCard({
    required Color accent,
    required String docNo,
    required String date,
    required String amount,
    String? status,
    Color? statusColor,
    String? customer,
    String? meta,
    required VoidCallback onOpen,
    required VoidCallback onReorder,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: AppDesign.card(),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onOpen,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              docNo.isEmpty ? 'No number' : docNo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.2,
                                  color: accent),
                            ),
                          ),
                          if ((status ?? '').isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: (statusColor ?? AppDesign.inkMuted)
                                    .withOpacity(0.12),
                                borderRadius:
                                    BorderRadius.circular(AppDesign.radiusSm),
                              ),
                              child: Text(status!,
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w800,
                                      color: statusColor ??
                                          AppDesign.inkMuted)),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(date,
                              style: const TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w600,
                                  color: AppDesign.inkSubtle)),
                          const Text('   ·   ',
                              style: TextStyle(
                                  fontSize: 10.5,
                                  color: AppDesign.inkSubtle)),
                          Text(amount,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: AppDesign.accentInk)),
                        ],
                      ),
                      if ((customer ?? '').trim().isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(customer!.trim(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                color: AppDesign.inkMuted)),
                      ],
                      if ((meta ?? '').trim().isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(meta!.trim(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 10, color: AppDesign.inkSubtle)),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      tooltip: 'Order these items again',
                      onPressed: onReorder,
                      icon: Icon(Icons.add_shopping_cart,
                          size: 19, color: accent),
                    ),
                    const Icon(Icons.chevron_right,
                        size: 18, color: AppDesign.inkSubtle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuoteCard(Quote quote) {
    final meta = [
      if ((quote.ref1 ?? '').trim().isNotEmpty) 'Ref ${quote.ref1!.trim()}',
      if ((quote.remark1 ?? '').trim().isNotEmpty) quote.remark1!.trim(),
    ].join('   ·   ');
    return _documentCard(
      accent: AppDesign.modOrdering,
      docNo: quote.quotePreLabel ?? '',
      date: quote.formattedQuoteDate,
      amount: quote.formattedNetAmount,
      status: quote.statusDisplay,
      statusColor: quote.getStatusColor(),
      customer: quote.customer,
      meta: meta,
      // Both actions open the same sheet, exactly as an invoice card does.
      // Quotations used to open a separate 1,261-line page whose "add to
      // cart" never wrote a row.
      onOpen: () => _showQuoteReorder(quote),
      onReorder: () => _showQuoteReorder(quote),
    );
  }

  Widget _buildInvoiceCard(Invoice invoice) {
    final meta = [
      if ((invoice.ref1 ?? '').trim().isNotEmpty) 'Ref ${invoice.ref1!.trim()}',
      if ((invoice.remark1 ?? '').trim().isNotEmpty) invoice.remark1!.trim(),
    ].join('   ·   ');
    // A cancelled invoice still has history worth reading, so it is listed —
    // but it is coloured as the exception it is, and its lines are filtered
    // out of the re-order sheet.
    final cancelled =
        (invoice.status ?? '').trim().toUpperCase().startsWith('C');
    return _documentCard(
      accent: AppDesign.modPicking,
      docNo: invoice.invoicePreLabel,
      date: _fmtDate(invoice.invoiceDate),
      amount: 'RM ${(invoice.netAmount ?? 0).toStringAsFixed(2)}',
      status: (invoice.status ?? '').trim().isEmpty
          ? null
          : (cancelled ? 'Cancelled' : invoice.status!.trim()),
      statusColor: cancelled ? AppDesign.danger : AppDesign.success,
      customer: invoice.customer,
      meta: meta,
      onOpen: () => _showInvoiceDetails(invoice),
      onReorder: () => _showInvoiceDetails(invoice),
    );
  }



  /// Opens a past invoice as something that can be ordered again.
  ///
  /// It used to open a read-only AlertDialog whose only action was Close.
  /// Reading an old invoice is rarely the point on a handheld — repeating it
  /// is — so the lines now go straight into the cart, one at a time or all at
  /// once.
  void _showInvoiceDetails(Invoice invoice) {
    final companyCode = _companyCodeOf(invoice.companyCode);
    if (companyCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This invoice has no usable company code')),
      );
      return;
    }
    ReorderDocumentSheet.show(
      context,
      title: 'INVOICE',
      docNo: invoice.invoicePreLabel,
      subtitle: [
        if ((invoice.customer ?? '').trim().isNotEmpty) invoice.customer!.trim(),
        if (invoice.invoiceDate != null) _fmtDate(invoice.invoiceDate),
        'RM ${(invoice.netAmount ?? 0).toStringAsFixed(2)}',
      ].join('  ·  '),
      companyCode: companyCode,
      accent: AppDesign.modPicking,
      alternateCompany: invoice.alternateCompany,
      alternateDoc: invoice.alternateDoc,
      loadLines: () async {
        final items = await _invoiceService.getInvoiceItems(
          companyCode: companyCode,
          invoicePreLabel: invoice.invoicePreLabel,
        );
        return [
          for (final it in items)
            // Cancelled lines are not demand — the same rule the SI packing
            // path applies. Re-ordering one would put goods in the cart that
            // the original document explicitly took back out.
            if ((it.status ?? 'A').trim().toUpperCase() != 'C' &&
                (it.status ?? 'A').trim().toUpperCase() != 'X')
              ReorderLine(
                skuNo: it.skuNo,
                uom: it.uom,
                qty: it.quantity ?? 0,
                price: it.unitPrice ?? 0,
                foc: it.foc ?? 0,
                quantityLoose: it.quantityLoose ?? 0,
                focLoose: it.focLoose ?? 0,
                factor: it.factor,
                pluNo: it.pluNo,
                remark: it.remark,
              ),
        ];
      },
    );
  }

  /// Opens a past quotation the same way.
  void _showQuoteReorder(Quote quote) {
    final companyCode = _companyCodeOf(quote.companyCode);
    final preLabel = quote.quotePreLabel;
    if (companyCode == null || preLabel == null || preLabel.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This quotation cannot be re-ordered')),
      );
      return;
    }
    ReorderDocumentSheet.show(
      context,
      title: 'QUOTATION',
      docNo: preLabel,
      subtitle: [
        if ((quote.customer ?? '').trim().isNotEmpty) quote.customer!.trim(),
        quote.formattedQuoteDate,
        quote.formattedNetAmount,
      ].join('  ·  '),
      companyCode: companyCode,
      accent: AppDesign.modOrdering,
      alternateCompany: quote.alternateCompany,
      alternateDoc: quote.alternateDoc,
      loadLines: () async {
        // Sequence order, because that is the order the operator saw when the
        // quotation was created and the order it prints in.
        //
        // Copied into plain non-nullable locals: type promotion does not
        // survive into this closure, and the Isar query builder's errors when
        // handed a nullable are not obviously about nullability.
        final int cc = companyCode;
        final String label = preLabel;
        // Narrowed to the company in Dart. A quote pre-label already belongs
        // to one company, so this reads a handful of rows either way.
        final QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> q =
            isar.quoteItems.filter().quotePreLabelEqualTo(label);
        final all = await q.findAll();
        final items = all.where((e) => e.companyCode == cc).toList()
          ..sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
        return [
          for (final it in items)
            if ((it.status ?? 'A').trim().toUpperCase() != 'C' &&
                (it.status ?? 'A').trim().toUpperCase() != 'X')
              ReorderLine(
                skuNo: it.skuNo,
                uom: it.uom ?? '',
                qty: it.quoteQuantity ?? 0,
                price: it.unitPrice ?? 0,
                foc: it.quoteFoc ?? 0,
                quantityLoose: it.quoteQuantityLoose ?? 0,
                focLoose: it.quoteFocLoose ?? 0,
                factor: it.factor,
                pluNo: it.pluNo,
                remark: it.remark,
              ),
        ];
      },
    );
  }

  /// Company code arrives as an int on some rows and a String on others.
  static int? _companyCodeOf(dynamic raw) {
    if (raw is int) return raw;
    if (raw is String) return int.tryParse(raw);
    return null;
  }

  static String _fmtDate(DateTime? d) {
    if (d == null) return '—';
    String two(int v) => v.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }
}



// Extension to add methods to _PreviousOrderPageState
extension _PreviousOrderPageStateMethods on _PreviousOrderPageState {

  void _showQuoteDetails(Quote quote) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quote Details: ${quote.displayQuoteNumber}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Date', quote.formattedQuoteDate),
              _buildDetailRow('Customer', quote.displayCustomer),
              _buildDetailRow('Status', quote.statusDisplay),
              _buildDetailRow('Amount', quote.formattedNetAmount),
              if (quote.currency?.isNotEmpty == true)
                _buildDetailRow('Currency', quote.currency!),
              if (quote.ref1?.isNotEmpty == true)
                _buildDetailRow('Reference 1', quote.ref1!),
              if (quote.remark1?.isNotEmpty == true)
                _buildDetailRow('Remarks', quote.remark1!),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
