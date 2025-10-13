import 'package:flutter/material.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../online_status_icon.dart';
import 'previous_order_page.dart';
import '../inventory_page.dart';

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
                    padding: const EdgeInsets.fromLTRB(60, 0, 16, 16), // Increased left padding to avoid back button
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Page title
                        const Text(
                          'Sales Quotation',
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
                padding: const EdgeInsets.only(right: 16),
                child: OnlineStatusIcon(isOnline: _isOnline),
              ),
            ],
          ),

          // Customer Details Card
          if (_selectedCustomer != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: _getCustomerColor(_selectedCustomer!['name'] ?? ''),
                              child: Text(
                                _getCustomerInitials(_selectedCustomer!['name'] ?? ''),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedCustomer!['name'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Code: ${_selectedCustomer!['code'] ?? ''}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Status badge
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _selectedCustomer!['status'] == 'Active' 
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.red.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _selectedCustomer!['status'] ?? 'Unknown',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: _selectedCustomer!['status'] == 'Active' 
                                      ? Colors.green[700]
                                      : Colors.red[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_selectedCustomer!['contactName']?.isNotEmpty == true ||
                            _selectedCustomer!['email']?.isNotEmpty == true ||
                            _selectedCustomer!['telNo']?.isNotEmpty == true) ...[
                          const SizedBox(height: 12),
                          const Divider(height: 1),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              if (_selectedCustomer!['contactName']?.isNotEmpty == true) ...[
                                Icon(Icons.contact_page, size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Text(
                                  _selectedCustomer!['contactName'],
                                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                ),
                                const SizedBox(width: 16),
                              ],
                              if (_selectedCustomer!['telNo']?.isNotEmpty == true) ...[
                                Icon(Icons.phone, size: 14, color: Colors.grey[600]),
                                const SizedBox(width: 4),
                                Text(
                                  _selectedCustomer!['telNo'],
                                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // Menu Options Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What would you like to do?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Menu options in 2x2 grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      _buildMenuCard(
                        icon: Icons.inventory_2,
                        title: 'Browse Inventory',
                        subtitle: 'Check stock levels',
                        color: Colors.blue,
                        onTap: () => _navigateToPage('browse_inventory'),
                      ),
                      _buildMenuCard(
                        icon: Icons.local_offer,
                        title: 'Check Promotion',
                        subtitle: 'View current offers',
                        color: Colors.orange,
                        onTap: () => _navigateToPage('check_promotion'),
                      ),
                      _buildMenuCard(
                        icon: Icons.new_releases,
                        title: 'Check New Arrival',
                        subtitle: 'Latest products',
                        color: Colors.green,
                        onTap: () => _navigateToPage('check_new_arrival'),
                      ),
                      _buildMenuCard(
                        icon: Icons.history,
                        title: 'Previous Order',
                        subtitle: 'View order history',
                        color: Colors.purple,
                        onTap: () => _navigateToPage('previous_order'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
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
