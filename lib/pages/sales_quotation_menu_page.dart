import 'package:flutter/material.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../online_status_icon.dart';
import 'previous_order_page.dart';
import '../inventory_page.dart';
import 'draft_list_page.dart';

class SalesQuotationMenuPage extends StatefulWidget {
  const SalesQuotationMenuPage({Key? key}) : super(key: key);

  @override
  State<SalesQuotationMenuPage> createState() => _SalesQuotationMenuPageState();
}

class _SalesQuotationMenuPageState extends State<SalesQuotationMenuPage> {
  final CustomerStateService _customerStateService = CustomerStateService();
  final AuthService _authService = AuthService();
  
  bool _isOnline = false;
  Map<String, dynamic>? _selectedCompany;
  Map<String, dynamic>? _selectedCustomer;

  @override
  void initState() {
    super.initState();
    _loadSelectedData();
  }

  Future<void> _loadSelectedData() async {
    try {
      // Load selected company
      final company = await _authService.getSelectedCompany();
      
      // Load selected customer
      final customer = _customerStateService.getSelectedCustomerInfo();
      
      setState(() {
        _selectedCompany = company;
        _selectedCustomer = customer;
        _isOnline = true; // You can implement proper online status check
      });
    } catch (e) {
      print('Error loading selected data: $e');
      setState(() {
        _isOnline = false;
      });
    }
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
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Customer Card (Compact)
                    if (_selectedCustomer != null) _buildCustomerCard(),
                    const SizedBox(height: 12),
                    
                    // Menu Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    
                    // Menu Grid (2x2)
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.3,
                      children: [
                        _buildMenuCard(
                          icon: Icons.inventory_2_outlined,
                          title: 'Inventory',
                          subtitle: 'Browse products',
                          color: Colors.blue,
                          onTap: () => _navigateToPage('browse_inventory'),
                        ),
                        _buildMenuCard(
                          icon: Icons.local_offer_outlined,
                          title: 'Promotions',
                          subtitle: 'Current offers',
                          color: Colors.orange,
                          onTap: () => _navigateToPage('check_promotion'),
                        ),
                        _buildMenuCard(
                          icon: Icons.drafts_outlined,
                          title: 'Drafts',
                          subtitle: 'Saved quotations',
                          color: Colors.teal,
                          onTap: () => _navigateToPage('drafts'),
                        ),
                        _buildMenuCard(
                          icon: Icons.history,
                          title: 'Orders',
                          subtitle: 'View history',
                          color: Colors.purple,
                          onTap: () => _navigateToPage('previous_order'),
                        ),
                      ],
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
                  'Sales Quotation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                if (_selectedCompany != null)
                  Text(
                    _selectedCompany!['companyName'] ?? '',
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
        ],
      ),
    );
  }

  Widget _buildCustomerCard() {
    final customerName = _selectedCustomer!['name'] ?? '';
    final customerCode = _selectedCustomer!['code'] ?? '';
    final customerStatus = _selectedCustomer!['status'];
    final contactName = _selectedCustomer!['contactName'];
    final telNo = _selectedCustomer!['telNo'];
    
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getCustomerColor(customerName),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _getCustomerInitials(customerName),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        customerName,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (customerStatus != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: customerStatus == 'Active' ? Colors.green.shade50 : Colors.red.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          customerStatus,
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: customerStatus == 'Active' ? Colors.green.shade700 : Colors.red.shade700,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        customerCode,
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                      ),
                    ),
                    if (telNo?.isNotEmpty == true) ...[
                      const SizedBox(width: 8),
                      Icon(Icons.phone_outlined, size: 12, color: Colors.grey.shade500),
                      const SizedBox(width: 2),
                      Text(telNo, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
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
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 24, color: color),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(String pageType) {
    print('Navigate to: $pageType');
    
    switch (pageType) {
      case 'browse_inventory':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InventoryPage(),
          ),
        );
        break;
      case 'previous_order':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PreviousOrderPage(),
          ),
        );
        break;
      case 'drafts':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DraftListPage(),
          ),
        );
        break;
      default:
        // Show coming soon dialog for other features
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('$pageType'.replaceAll('_', ' ').toUpperCase()),
            content: const Text('This feature is coming soon!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        break;
    }
  }

  Color _getCustomerColor(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
    ];
    return colors[name.hashCode % colors.length];
  }

  String _getCustomerInitials(String name) {
    if (name.isEmpty) return '?';
    final words = name.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
