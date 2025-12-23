import 'package:flutter/material.dart';
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
import 'quote_item_details_page.dart';
import 'edit_unsynced_quotation_page.dart';

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

  Widget _buildQuoteCard(Quote quote) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          borderRadius: BorderRadius.circular(8),
          onTap: () => _navigateToQuoteItems(quote),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main row with quote number, date, price, and status
                Row(
                  children: [
                    // Quote PreLabel (most important)
                    Expanded(
                      flex: 3,
                      child: Text(
                        quote.quotePreLabel ?? 'No Quote Number',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Date and Price column
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            quote.formattedQuoteDate,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            quote.formattedNetAmount,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Status badge (compact)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: quote.getStatusColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        quote.statusDisplay,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: quote.getStatusColor(),
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Secondary info row (customer, ref, remark)
                if (quote.customer?.isNotEmpty == true || 
                    quote.ref1?.isNotEmpty == true || 
                    quote.remark1?.isNotEmpty == true) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Customer info
                      if (quote.customer?.isNotEmpty == true)
                        Expanded(
                          child: Text(
                            'Customer: ${quote.customer}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  // Reference and remarks on separate line if available
                  if (quote.ref1?.isNotEmpty == true || quote.remark1?.isNotEmpty == true) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        if (quote.ref1?.isNotEmpty == true)
                          Expanded(
                            child: Text(
                              'Ref: ${quote.ref1}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        if (quote.ref1?.isNotEmpty == true && quote.remark1?.isNotEmpty == true)
                          const SizedBox(width: 8),
                        if (quote.remark1?.isNotEmpty == true)
                          Expanded(
                            child: Text(
                              'Note: ${quote.remark1}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(Invoice invoice) {
    final formattedDate = invoice.invoiceDate != null
        ? '${invoice.invoiceDate!.day}/${invoice.invoiceDate!.month}/${invoice.invoiceDate!.year}'
        : 'No Date';
    final formattedAmount = 'RM ${(invoice.netAmount ?? 0).toStringAsFixed(2)}';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[50]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => _showInvoiceDetails(invoice),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main row with invoice number, date, price, and status
                Row(
                  children: [
                    // Invoice PreLabel (most important)
                    Expanded(
                      flex: 3,
                      child: Text(
                        invoice.invoicePreLabel,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Date and Price column
                    Expanded(
                      flex: 2,
                      child: Column(
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
                    ),
                    const SizedBox(width: 8),
                    // Status badge (compact)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getInvoiceStatusColor(invoice.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        invoice.status ?? 'N/A',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: _getInvoiceStatusColor(invoice.status),
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Secondary info row (customer, ref, remark)
                if (invoice.customer?.isNotEmpty == true || 
                    invoice.ref1?.isNotEmpty == true || 
                    invoice.remark1?.isNotEmpty == true) ...[
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Customer info
                      if (invoice.customer?.isNotEmpty == true)
                        Expanded(
                          child: Text(
                            'Customer: ${invoice.customer}',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  // Reference and remarks on separate line if available
                  if (invoice.ref1?.isNotEmpty == true || invoice.remark1?.isNotEmpty == true) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        if (invoice.ref1?.isNotEmpty == true)
                          Expanded(
                            child: Text(
                              'Ref: ${invoice.ref1}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        if (invoice.ref1?.isNotEmpty == true && invoice.remark1?.isNotEmpty == true)
                          const SizedBox(width: 8),
                        if (invoice.remark1?.isNotEmpty == true)
                          Expanded(
                            child: Text(
                              'Note: ${invoice.remark1}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[500],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getInvoiceStatusColor(String? status) {
    switch (status?.toUpperCase()) {
      case 'P':
      case 'POSTED':
        return Colors.green;
      case 'V':
      case 'VOID':
        return Colors.red;
      case 'D':
      case 'DRAFT':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void _showInvoiceDetails(Invoice invoice) {
    showDialog(
      context: context,
      builder: (context) => _InvoiceDetailsDialog(
        invoice: invoice,
        invoiceService: _invoiceService,
      ),
    );
  }
}

/// Stateful dialog widget for invoice details with lazy-loaded items
class _InvoiceDetailsDialog extends StatefulWidget {
  final Invoice invoice;
  final InvoiceService invoiceService;

  const _InvoiceDetailsDialog({
    required this.invoice,
    required this.invoiceService,
  });

  @override
  State<_InvoiceDetailsDialog> createState() => _InvoiceDetailsDialogState();
}

class _InvoiceDetailsDialogState extends State<_InvoiceDetailsDialog> {
  List<InvoiceItem>? _items;
  bool _isLoadingItems = false;
  String? _itemsError;

  @override
  void initState() {
    super.initState();
    // Load items immediately when dialog opens
    _loadInvoiceItems();
  }

  Future<void> _loadInvoiceItems() async {
    setState(() {
      _isLoadingItems = true;
      _itemsError = null;
    });

    try {
      final companyCodeRaw = widget.invoice.companyCode;
      int? companyCode;
      
      if (companyCodeRaw is String) {
        companyCode = int.tryParse(companyCodeRaw as String);
      } else if (companyCodeRaw is int) {
        companyCode = companyCodeRaw as int;
      }

      if (companyCode == null) {
        throw Exception('Invalid company code');
      }

      final items = await widget.invoiceService.getInvoiceItems(
        companyCode: companyCode,
        invoicePreLabel: widget.invoice.invoicePreLabel,
      );

      setState(() {
        _items = items;
        _isLoadingItems = false;
      });
    } catch (e) {
      print('❌ Error loading invoice items: $e');
      setState(() {
        _itemsError = e.toString();
        _isLoadingItems = false;
      });
    }
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = widget.invoice.invoiceDate != null
        ? '${widget.invoice.invoiceDate!.day}/${widget.invoice.invoiceDate!.month}/${widget.invoice.invoiceDate!.year}'
        : 'No Date';
    final formattedAmount = 'RM ${(widget.invoice.netAmount ?? 0).toStringAsFixed(2)}';

    return AlertDialog(
      title: Text('Invoice: ${widget.invoice.invoicePreLabel}'),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Information
              _buildDetailRow('Date', formattedDate),
              _buildDetailRow('Customer', widget.invoice.customer ?? 'N/A'),
              _buildDetailRow('Status', widget.invoice.status ?? 'N/A'),
              _buildDetailRow('Net Amount', formattedAmount),
              if (widget.invoice.grossAmount != null)
                _buildDetailRow('Gross Amount', 'RM ${widget.invoice.grossAmount!.toStringAsFixed(2)}'),
              if (widget.invoice.currency?.isNotEmpty == true)
                _buildDetailRow('Currency', widget.invoice.currency!),
              if (widget.invoice.ref1?.isNotEmpty == true)
                _buildDetailRow('Reference 1', widget.invoice.ref1!),
              if (widget.invoice.remark1?.isNotEmpty == true)
                _buildDetailRow('Remarks', widget.invoice.remark1!),
              
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              
              // Items Section
              const Text(
                'Invoice Items',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              if (_isLoadingItems)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_itemsError != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Error loading items: $_itemsError',
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              else if (_items == null || _items!.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No items found'),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _items!.length,
                  itemBuilder: (context, index) {
                    final item = _items![index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          'SKU: ${item.skuNo} (${item.uom})',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          'Qty: ${item.quantity?.toStringAsFixed(2) ?? '0'} | '
                          'Price: RM ${item.unitPrice?.toStringAsFixed(2) ?? '0'}',
                        ),
                        trailing: Text(
                          'RM ${item.netAmount?.toStringAsFixed(2) ?? '0'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

// Extension to add methods to _PreviousOrderPageState
extension _PreviousOrderPageStateMethods on _PreviousOrderPageState {
  void _navigateToQuoteItems(Quote quote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuoteItemDetailsPage(quote: quote),
      ),
    );
  }

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
