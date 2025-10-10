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

  Future<void> _checkOnlineStatus() async {
    try {
      final isOnline = await OfflineFirstService.isServerReachable();
      if (mounted) {
        setState(() {
          _isOnline = isOnline;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isOnline = false;
        });
      }
    }
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

      final customers = await _customerService.getCustomers(companyCode, forceSync: forceSync);
      
      // Check online status
      final isOnline = await OfflineFirstService.isServerReachable();
      
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
    final theme = Theme.of(context);
    final primaryColor = Colors.redAccent;
    final secondaryColor = Colors.redAccent.shade100;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Select Customer',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
        ),
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
        actions: [
          OnlineStatusIcon(
            isOnline: _isOnline,
            onTap: _checkOnlineStatus,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _refreshCustomers,
            tooltip: 'Refresh Customers',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Welcome message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
            color: Colors.white,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Company: ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: widget.selectedCompany['companyName'] ?? 'Unknown',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search bar
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
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
              onChanged: _filterCustomers,
              decoration: InputDecoration(
                hintText: 'Search customers by name or code...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.grey[400]),
                        onPressed: () {
                          _searchController.clear();
                          _filterCustomers('');
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),

          // Error message
          if (_error != null)
            Container(
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
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red[700], size: 16),
                    onPressed: () => setState(() => _error = null),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

          // Debug information (if enabled)
          if (_debugInfo != null && AppConfig.showDebugInfo)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.blue[700], size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _debugInfo!,
                      style: TextStyle(color: Colors.blue[700], fontSize: 12),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.blue[700], size: 16),
                    onPressed: () => setState(() => _debugInfo = null),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

          // Customer list
          Expanded(
            child: _buildCustomerList(),
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
    final hasLocation = customer.fullAddress.isNotEmpty;
    
    // Generate a consistent color based on customer name
    final nameHash = customer.displayName.hashCode;
    final hue = (nameHash % 360).abs().toDouble();
    final avatarColor = HSLColor.fromAHSL(1.0, hue, 0.6, 0.8).toColor();
    
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _selectCustomer(customer),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Customer avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: avatarColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Center(
                    child: Text(
                      nameInitial,
                      style: const TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Customer details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Customer name and status
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              customer.displayName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (customer.status != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: customer.status == 'A' ? Colors.green.shade50 : Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: customer.status == 'A' ? Colors.green.shade200 : Colors.red.shade200,
                                ),
                              ),
                              child: Text(
                                customer.status == 'A' ? 'Active' : 'Inactive',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: customer.status == 'A' ? Colors.green.shade700 : Colors.red.shade700,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      
                      const SizedBox(height: 2),
                      
                      // Customer code
                      Text(
                        'Code: ${customer.code}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      
                      // Location (if available)
                      if (hasLocation) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                customer.fullAddress,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                      
                      // Contact info (if available)
                      if (customer.contactName?.isNotEmpty == true || 
                          customer.telNo?.isNotEmpty == true) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (customer.contactName?.isNotEmpty == true) ...[
                              Icon(
                                Icons.person_outline,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  customer.contactName!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                            if (customer.contactName?.isNotEmpty == true && 
                                customer.telNo?.isNotEmpty == true) ...[
                              const SizedBox(width: 12),
                            ],
                            if (customer.telNo?.isNotEmpty == true) ...[
                              Icon(
                                Icons.phone_outlined,
                                size: 14,
                                color: Colors.grey[500],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                customer.telNo!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                
                // Arrow indicator
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
