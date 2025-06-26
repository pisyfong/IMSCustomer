import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'online_status_icon.dart';

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
    Navigator.of(context).pushNamed(route);
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
    final Color primaryColor = Colors.redAccent;
    final Color secondaryColor = Colors.grey.shade800;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: 48, // Smaller app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, size: 20),
            onPressed: _logout,
            tooltip: 'Logout',
            iconSize: 20,
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(maxHeight: 32, maxWidth: 32),
          ),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OnlineStatusIcon(isOnline: _isOnline),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // User and company info section
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/login_bg.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.8,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _userFullName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                                            child: Text(
                                              _selectedCompany!['companyName'] ?? '',
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(0.9),
                                                fontSize: 12,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Menu items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: [
                        _buildMenuCard(
                          title: 'Sales Quotation',
                          icon: Icons.request_quote,
                          color: Colors.blue,
                          onTap: () => _navigateTo('/sales_quotation'),
                        ),
                        _buildMenuCard(
                          title: 'Sales Order',
                          icon: Icons.shopping_cart,
                          color: Colors.green,
                          onTap: () => _navigateTo('/sales_order'),
                        ),
                        _buildMenuCard(
                          title: 'Sales Invoice',
                          icon: Icons.receipt_long,
                          color: Colors.orange,
                          onTap: () => _navigateTo('/sales_invoice'),
                        ),
                        _buildMenuCard(
                          title: 'Inventory',
                          icon: Icons.inventory,
                          color: Colors.purple,
                          onTap: () => _navigateTo('/inventory'),
                        ),
                        _buildMenuCard(
                          title: 'Reports',
                          icon: Icons.bar_chart,
                          color: Colors.teal,
                          onTap: () => _navigateTo('/reports'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
