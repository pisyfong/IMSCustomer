import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/company_service.dart';
import '../services/signalr_service.dart';
import '../pages/customer_selection_page.dart';

/// Widget to display companies accessible to the current user
class CompanyListWidget extends StatefulWidget {
  const CompanyListWidget({Key? key}) : super(key: key);

  @override
  State<CompanyListWidget> createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget> {
  final AuthService _authService = AuthService();
  final CompanyService _companyService = CompanyService();
  final SignalRService _signalRService = SignalRService();
  
  List<Map<String, dynamic>> _companies = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCompanies();
  }

  Future<void> _loadCompanies() async {
    final currentUser = _authService.currentUser;
    
    if (currentUser == null) {
      setState(() {
        _error = 'No user logged in';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      List<Map<String, dynamic>>? companies;
      
      // Try SignalR first if connected
      if (_signalRService.isConnected) {
        print('Loading companies via SignalR for user: ${currentUser.userId}');
        companies = await _signalRService.getCompany(currentUser.userId);
      }
      
      // Fallback to HTTP API if SignalR failed or not connected
      if (companies == null) {
        print('Loading companies via HTTP API for user: ${currentUser.userId}');
        companies = await _companyService.getCompaniesForUser(currentUser.userId);
      }

      setState(() {
        _companies = companies ?? [];
        _isLoading = false;
      });
      
      print('Loaded ${_companies.length} companies for user');
    } catch (e) {
      setState(() {
        _error = 'Failed to load companies: $e';
        _isLoading = false;
      });
      print('Error loading companies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Companies',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _isLoading ? null : _loadCompanies,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Center(
                child: Column(
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _loadCompanies,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            else if (_companies.isEmpty)
              const Center(
                child: Column(
                  children: [
                    Icon(Icons.business, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'No companies available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _companies.length,
                itemBuilder: (context, index) {
                  final company = _companies[index];
                  return ListTile(
                    leading: const Icon(Icons.business),
                    title: Text(company['name'] ?? 'Unknown Company'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Code: ${company['code'] ?? 'N/A'}'),
                        if (company['city'] != null)
                          Text('Location: ${company['city']}'),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle company selection
                      _selectCompany(company);
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
  
  void _selectCompany(Map<String, dynamic> company) async {
    // Normalize to expected keys for CustomerSelectionPage and AuthService
    final selectedCompany = <String, dynamic>{
      'companyId': company['id'] ?? company['companyId'] ?? company['code']?.toString(),
      'companyName': company['name'] ?? company['companyName'] ?? 'Unknown',
      'companyCode': company['code']?.toString() ?? company['companyCode']?.toString() ?? '',
      'selectedAt': DateTime.now(),
    };

    try {
      await _authService.saveSelectedCompany(selectedCompany);
    } catch (e) {
      // Non-blocking; proceed with navigation even if save fails
      debugPrint('Failed to persist selected company: $e');
    }

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomerSelectionPage(selectedCompany: selectedCompany),
      ),
    );
  }
}
