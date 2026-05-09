import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../services/signalr_service.dart';
import '../services/offline_first_service.dart';
import '../online_status_icon.dart';
import '../config/app_config.dart';
import '../main.dart';
import 'sales_quotation_menu_page.dart';

class CustomerSelectionPage extends StatefulWidget {
  final Map<String, dynamic> selectedCompany;

  const CustomerSelectionPage({
    Key? key,
    required this.selectedCompany,
  }) : super(key: key);

  @override
  State<CustomerSelectionPage> createState() => _CustomerSelectionPageState();
}

class _CustomerSelectionPageState extends State<CustomerSelectionPage> {
  late CustomerService _customerService;
  List<Customer> _customers = [];
  List<Customer> _filteredCustomers = [];
  bool _isLoading = false;
  bool _isOnline = false;
  String? _error;
  String? _debugInfo;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _customerService = CustomerService(signalRService);
    _loadCustomers();
    _checkOnlineStatus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Non-blocking online-status probe. Uses the synchronous cached state
  /// (no network) to update the indicator immediately, then optionally
  /// kicks a probe in the background. Never blocks the UI.
  Future<void> _checkOnlineStatus() async {
    // Cached state is synchronous — paint immediately.
    final cached = OfflineFirstService.isLikelyOnline();
    if (mounted) {
      setState(() => _isOnline = cached);
    }
    // Optional background probe to refresh the indicator. Errors swallowed.
    // ignore: unawaited_futures
    () async {
      try {
        final isOnline = await OfflineFirstService.isServerReachable();
        if (mounted) setState(() => _isOnline = isOnline);
      } catch (_) {
        // Cached state already shown — fine.
      }
    }();
  }

  Future<void> _loadCustomers({bool forceSync = false}) async {
    setState(() {
      _isLoading = true;
      _error = null;
      _debugInfo = null;
    });

    try {
      final companyCodeRaw = widget.selectedCompany['companyCode'];
      final companyCode = companyCodeRaw is String
          ? int.parse(companyCodeRaw)
          : companyCodeRaw as int;

      // Read customers (offline-first — returns local cache immediately).
      final customers = await _customerService.getCustomers(companyCode, forceSync: forceSync);

      // Online indicator: use cached connectivity state — no network probe,
      // no waiting. _checkOnlineStatus will refresh it asynchronously.
      final isOnline = OfflineFirstService.isLikelyOnline();

      setState(() {
        _customers = customers;
        _filteredCustomers = customers;
        _isLoading = false;
        _isOnline = isOnline;
        _debugInfo = 'Loaded ${customers.length} customers (${isOnline ? "Online" : "Offline"})';
      });

      if (customers.isEmpty) {
        setState(() {
          // Show different messages based on online/offline status
          if (isOnline) {
            _error = 'No customers found for this company';
          } else {
            _error = 'No cached customers available offline. Connect to internet to sync customer data.';
          }
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Failed to load customers: $e';
        _isOnline = false;
      });
    }
  }

  Future<void> _refreshCustomers() async {
    await _loadCustomers(forceSync: true);
  }

  void _filterCustomers(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredCustomers = _customers;
      } else {
        _filteredCustomers = _customers.where((customer) {
          final name = customer.displayName.toLowerCase();
          final code = customer.code.toLowerCase();
          final searchLower = query.toLowerCase();
          return name.contains(searchLower) || code.contains(searchLower);
        }).toList();
      }
    });
  }

  void _selectCustomer(Customer customer) async {
    // Store selected customer in state service
    CustomerStateService().setSelectedCustomer(customer);
    
    // Store selected customer in AuthService (this will automatically clear cart if customer changed)
    final customerMap = {
      'customerId': customer.id,
      'id': customer.id,
      'displayName': customer.displayName,
      'code': customer.code,
      'status': customer.status,
      'contactName': customer.contactName,
      'telNo': customer.telNo,
      'fullAddress': customer.fullAddress,
    };
    
    await AuthService().setCurrentCustomer(customerMap);
    
    // Navigate to Sales Quotation menu page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SalesQuotationMenuPage(),
      ),
    );
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
            
            // Search bar
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
                  onChanged: _filterCustomers,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search by name or code...',
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              _filterCustomers('');
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

            // Debug information (if enabled)
            if (_debugInfo != null && AppConfig.showDebugInfo)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue.shade600, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _debugInfo!,
                          style: TextStyle(color: Colors.blue.shade700, fontSize: 12),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _debugInfo = null),
                        child: Icon(Icons.close, color: Colors.blue.shade400, size: 16),
                      ),
                    ],
                  ),
                ),
              ),

            // Customer list
            Expanded(
              child: _buildCustomerList(),
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
                  'Select Customer',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  widget.selectedCompany['companyName'] ?? 'Unknown',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          // Online status
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
            onTap: _isLoading ? null : _refreshCustomers,
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

  Widget _buildCustomerList() {
    final primaryColor = Colors.redAccent;
    
    if (_isLoading && _filteredCustomers.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Loading customers...',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ],
        ),
      );
    }

    if (_filteredCustomers.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _searchQuery.isEmpty ? Icons.people_outline : Icons.search_off,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isEmpty 
                  ? 'No customers found'
                  : 'No customers match "$_searchQuery"',
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
                  ? 'Try refreshing or contact support'
                  : 'Try a different search term',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (_searchQuery.isEmpty) {
                  _refreshCustomers();
                } else {
                  _searchController.clear();
                  _filterCustomers('');
                }
              },
              icon: Icon(_searchQuery.isEmpty ? Icons.refresh : Icons.clear),
              label: Text(_searchQuery.isEmpty ? 'Refresh' : 'Clear Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: ListView.builder(
        itemCount: _filteredCustomers.length,
        itemBuilder: (context, index) {
          final customer = _filteredCustomers[index];
          return _buildCustomerCard(customer);
        },
      ),
    );
  }

  Widget _buildCustomerCard(Customer customer) {
    final nameInitial = customer.displayName.isNotEmpty ? customer.displayName[0].toUpperCase() : '?';
    
    // Generate a consistent color based on customer name
    final nameHash = customer.displayName.hashCode;
    final hue = (nameHash % 360).abs().toDouble();
    final avatarColor = HSLColor.fromAHSL(1.0, hue, 0.5, 0.7).toColor();
    
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
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _selectCustomer(customer),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Customer avatar (smaller)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: avatarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      nameInitial,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Customer details (compact)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name row
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              customer.displayName,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (customer.status != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: customer.status == 'A' ? Colors.green.shade50 : Colors.red.shade50,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                customer.status == 'A' ? 'Active' : 'Inactive',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color: customer.status == 'A' ? Colors.green.shade700 : Colors.red.shade700,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Code + Phone row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              customer.code,
                              style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                            ),
                          ),
                          if (customer.telNo?.isNotEmpty == true) ...[
                            const SizedBox(width: 8),
                            Icon(Icons.phone_outlined, size: 12, color: Colors.grey.shade500),
                            const SizedBox(width: 2),
                            Text(
                              customer.telNo!,
                              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                            ),
                          ],
                        ],
                      ),
                      // Address (single line)
                      if (customer.fullAddress.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          customer.fullAddress,
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 20, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
