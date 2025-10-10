import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../services/signalr_service.dart';
import '../online_status_icon.dart';
import '../main.dart';
import 'quote_item_details_page.dart';

class PreviousOrderPage extends StatefulWidget {
  const PreviousOrderPage({Key? key}) : super(key: key);

  @override
  State<PreviousOrderPage> createState() => _PreviousOrderPageState();
}

class _PreviousOrderPageState extends State<PreviousOrderPage> {
  late QuoteService _quoteService;
  final CustomerStateService _customerStateService = CustomerStateService();
  final AuthService _authService = AuthService();
  final TextEditingController _searchController = TextEditingController();

  List<Quote> _quotes = [];
  List<Quote> _filteredQuotes = [];
  bool _isLoading = false;
  bool _isOnline = false;
  String? _error;
  String _searchQuery = '';
  Map<String, dynamic>? _selectedCompany;
  Map<String, dynamic>? _selectedCustomer;

  @override
  void initState() {
    super.initState();
    _quoteService = QuoteService(signalRService);
    _loadSelectedData();
    // Don't load quotes immediately - wait for selected data to load first
  }

  @override
  void dispose() {
    _searchController.dispose();
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
      
      // Now load quotes after selected data is available
      await _loadQuotes();
      
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

  void _filterQuotes(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredQuotes = _quotes;
      } else {
        final searchLower = query.toLowerCase();
        _filteredQuotes = _quotes.where((quote) {
          return (quote.quotePreLabel?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.customer?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.ref1?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.remark1?.toLowerCase().contains(searchLower) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Header with Background Image
          SliverAppBar(
            expandedHeight: 120,
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Page title
                        const Text(
                          'Previous Orders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Company and Customer info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Company info
                            if (_selectedCompany != null) ...[
                              Row(
                                children: [
                                  Icon(
                                    Icons.business,
                                    size: 14,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      _selectedCompany!['companyName'] ?? '',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                            ],
                            // Customer info
                            if (_selectedCustomer != null) ...[
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 14,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      _selectedCustomer!['name'] ?? '',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              // Online status
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: OnlineStatusIcon(isOnline: _isOnline),
              ),
              // Refresh button
              IconButton(
                onPressed: _refreshQuotes,
                icon: const Icon(Icons.refresh, color: Colors.white),
                tooltip: 'Refresh Orders',
              ),
            ],
          ),

          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
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
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterQuotes,
                  decoration: InputDecoration(
                    hintText: 'Search orders by quote number, customer, or reference...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear, color: Colors.grey[400]),
                            onPressed: () {
                              _searchController.clear();
                              _filterQuotes('');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                ),
              ),
            ),
          ),

          // Error message
          if (_error != null)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[700], size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _error!,
                        style: TextStyle(color: Colors.red[700], fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Quote list
          SliverToBoxAdapter(
            child: _buildQuoteList(),
          ),
        ],
      ),
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: _filteredQuotes.map((quote) => _buildQuoteCard(quote)).toList(),
      ),
    );
  }

  Widget _buildQuoteCard(Quote quote) {
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
