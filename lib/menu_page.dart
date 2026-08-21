import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'pages/customer_selection_page.dart';
import 'signalr_test_page.dart';
import 'theme/app_design.dart';

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
      final auth = AuthService();
      final user = await auth.loadSavedLogin();
      final company = await auth.getSelectedCompany();
      if (mounted) {
        setState(() {
          _userFullName = user?.fullName ?? 'User';
          _selectedCompany = company;
          _isLoading = false;
          _isOnline = true;
        });
      }
    } catch (e) {
      print('Error loading user and company info: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _navigateTo(String route) {
    switch (route) {
      case '/sales_quotation':
        if (_selectedCompany != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CustomerSelectionPage(
                selectedCompany: _selectedCompany!,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select a company first')),
          );
        }
        break;
      default:
        Navigator.of(context).pushNamed(route);
    }
  }

  Future<void> _logout() async {
    try {
      await AuthService().logout();
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width >= 720 ? 3 : 2;

    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppDesign.appBar(
        'Menu',
        automaticallyImplyLeading: false,
        actions: [
          _statusPill(),
          IconButton(
            tooltip: 'Log out',
            icon: const Icon(Icons.logout, size: 20),
            onPressed: _logout,
          ),
          const SizedBox(width: AppDesign.space1),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(AppDesign.space4),
                children: [
                  _userCard(context),
                  const SizedBox(height: AppDesign.space4),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: columns,
                    crossAxisSpacing: AppDesign.space3,
                    mainAxisSpacing: AppDesign.space3,
                    childAspectRatio: 1.1,
                    children: [
                      _menuTile(
                        icon: Icons.request_quote_outlined,
                        title: 'Sales Quotation',
                        subtitle: 'Create & manage',
                        onTap: () => _navigateTo('/sales_quotation'),
                      ),
                      _menuTile(
                        icon: Icons.shopping_cart_outlined,
                        title: 'Sales Order',
                        subtitle: 'Customer orders',
                        onTap: () => _navigateTo('/sales_order'),
                      ),
                      _menuTile(
                        icon: Icons.receipt_long_outlined,
                        title: 'Sales Invoice',
                        subtitle: 'Generate invoices',
                        onTap: () => _navigateTo('/sales_invoice'),
                      ),
                      _menuTile(
                        icon: Icons.inventory_2_outlined,
                        title: 'Inventory',
                        subtitle: 'Stock browser',
                        onTap: () => _navigateTo('/inventory'),
                      ),
                      _menuTile(
                        icon: Icons.bar_chart_outlined,
                        title: 'Reports',
                        subtitle: 'Analytics',
                        onTap: () => _navigateTo('/reports'),
                      ),
                      _menuTile(
                        icon: Icons.wifi_outlined,
                        title: 'SignalR Test',
                        subtitle: 'Diagnostics',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignalRTestPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _statusPill() {
    final color = _isOnline ? AppDesign.success : AppDesign.warning;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDesign.space2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
          border: Border.all(color: color.withOpacity(0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
            const SizedBox(width: 5),
            Text(_isOnline ? 'Online' : 'Offline',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _userCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDesign.space4),
      decoration: AppDesign.section(),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppDesign.accentSoft,
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            ),
            child: const Icon(Icons.person, color: AppDesign.accent, size: 22),
          ),
          const SizedBox(width: AppDesign.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('WELCOME', style: AppDesign.micro),
                const SizedBox(height: 2),
                Text(_userFullName, style: AppDesign.title,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                if (_selectedCompany != null)
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacementNamed('/company'),
                    child: Row(
                      children: [
                        const Icon(Icons.business, size: 12, color: AppDesign.inkMuted),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${_selectedCompany!['companyName'] ?? ''} · ${_selectedCompany!['companyCode'] ?? ''}',
                            style: AppDesign.caption.copyWith(color: AppDesign.info, fontWeight: FontWeight.w700),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.swap_horiz, size: 12, color: AppDesign.info),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radius),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppDesign.space3),
          decoration: AppDesign.card(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppDesign.accentSoft,
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                ),
                child: Icon(icon, size: 20, color: AppDesign.accent),
              ),
              const Spacer(),
              Text(title, style: AppDesign.heading,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(subtitle, style: AppDesign.caption,
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
