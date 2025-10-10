import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'online_status_icon.dart';
import 'signalr_test_page.dart';
import 'pages/customer_selection_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String _userFullName = '';
  Map<String, dynamic>? _selectedCompany;
  bool _isLoading = true;
  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    _loadUserAndCompanyInfo();
  }

  Future<void> _loadUserAndCompanyInfo() async {
    setState(() {
      _isLoading = true;
      _isOnline = false;
    });

    try {
      final authService = AuthService();
      
      // Load user info
      final user = await authService.loadSavedLogin();
      
      // Load selected company
      final selectedCompany = await authService.getSelectedCompany();
      
      if (mounted) {
        setState(() {
          _userFullName = user?.fullName ?? 'User';
          _selectedCompany = selectedCompany;
          _isLoading = false;
          _isOnline = true; // Assume online if we could load data
        });
      }
    } catch (e) {
      print('Error loading user and company info: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _navigateTo(String route) {
    switch (route) {
      case '/sales_quotation':
        if (_selectedCompany != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerSelectionPage(
                selectedCompany: _selectedCompany!,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a company first'),
              backgroundColor: Colors.red,
            ),
          );
        }
        break;
      default:
        Navigator.of(context).pushNamed(route);
        break;
    }
  }

  void _logout() async {
    try {
      final authService = AuthService();
      await authService.logout();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading menu...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : CustomScrollView(
              slivers: [
                // Header with Background Image (smaller, no red filter)
                SliverAppBar(
                  expandedHeight: 100, // Reduced from 140
                  floating: false,
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent, // Removed red background
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login_bg.jpg'),
                          fit: BoxFit.cover,
                          // Removed opacity filter to eliminate red tint
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Welcome text (smaller, consistent)
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 2),
                              // User name (smaller, consistent)
                              Text(
                                _userFullName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Company info (smaller, consistent with company page)
                              if (_selectedCompany != null) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.business,
                                      size: 12,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigate back to company selection page
                                          Navigator.of(context).pushReplacementNamed('/company');
                                        },
                                        child: Text(
                                          _selectedCompany!['companyName'] ?? '',
                                          style: TextStyle(
                                            color: Colors.blue[200], // Light blue color
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold, // Make it bold
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.tag,
                                      size: 10,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      _selectedCompany!['companyCode'] ?? '',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                    // Logout button
                    IconButton(
                      icon: const Icon(Icons.logout_outlined),
                      onPressed: _logout,
                      tooltip: 'Logout',
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                
                // Menu Grid (smaller padding and spacing)
              SliverPadding(
                padding: const EdgeInsets.all(8.0), // Reduced from 16.0
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 3 : 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8.0, // Reduced from 12.0
                    mainAxisSpacing: 8.0,  // Reduced from 12.0
                  ),
                  delegate: SliverChildListDelegate([
                    _buildModernMenuCard(
                      title: 'Sales Quotation',
                      subtitle: 'Create & manage quotes',
                      icon: Icons.request_quote_outlined,
                      gradient: [Colors.blue.shade400, Colors.blue.shade600],
                      onTap: () => _navigateTo('/sales_quotation'),
                    ),
                    _buildModernMenuCard(
                      title: 'Sales Order',
                      subtitle: 'Process customer orders',
                      icon: Icons.shopping_cart_outlined,
                      gradient: [Colors.green.shade400, Colors.green.shade600],
                      onTap: () => _navigateTo('/sales_order'),
                    ),
                    _buildModernMenuCard(
                      title: 'Sales Invoice',
                      subtitle: 'Generate invoices',
                      icon: Icons.receipt_long_outlined,
                      gradient: [Colors.orange.shade400, Colors.orange.shade600],
                      onTap: () => _navigateTo('/sales_invoice'),
                    ),
                    _buildModernMenuCard(
                      title: 'Inventory',
                      subtitle: 'Stock management',
                      icon: Icons.inventory_2_outlined,
                      gradient: [Colors.purple.shade400, Colors.purple.shade600],
                      onTap: () => _navigateTo('/inventory'),
                    ),
                    _buildModernMenuCard(
                      title: 'Reports',
                      subtitle: 'Analytics & insights',
                      icon: Icons.bar_chart_outlined,
                      gradient: [Colors.teal.shade400, Colors.teal.shade600],
                      onTap: () => _navigateTo('/reports'),
                    ),
                    _buildModernMenuCard(
                      title: 'SignalR Test',
                      subtitle: 'Connection testing',
                      icon: Icons.wifi_outlined,
                      gradient: [Colors.red.shade400, Colors.red.shade600],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignalRTestPage(),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              ],
            ),
    );
  }

  Widget _buildModernMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1, // Reduced from 2
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Reduced from 12
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8), // Reduced from 12
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Reduced from 12
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
          ),
          padding: const EdgeInsets.all(12), // Reduced from 16
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon with white background (smaller)
              Container(
                padding: const EdgeInsets.all(8), // Reduced from 12
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 20, // Reduced from 24
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8), // Reduced from 12
              // Title (smaller)
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
}
