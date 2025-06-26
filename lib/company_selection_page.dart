import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:isar/isar.dart';
import 'company.dart';
import 'online_status_icon.dart';
import 'main.dart'; // Import main.dart to access the global Isar instance
import 'services/auth_service.dart';
import 'dart:math' as math;

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({Key? key}) : super(key: key);

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage> {
  bool _isOnline = false;
  bool _loading = false;
  String _searchQuery = '';
  String _userFullName = '';
  String? _error;
  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();
    _initIsarAndMaybeFetch();
    _loadUserInfo();
    _clearSelectedCompany();
  }
  
  Future<void> _loadUserInfo() async {
    try {
      // Use the AuthService to get the current user's name
      final authService = AuthService();
      final user = await authService.loadSavedLogin();
      
      if (user != null && mounted) {
        setState(() {
          _userFullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error loading user info: $e');
    }
  }
  
  // Clear any previously selected company
  Future<void> _clearSelectedCompany() async {
    try {
      final authService = AuthService();
      await authService.clearSelectedCompany();
    } catch (e) {
      print('Error clearing selected company: $e');
    }
  }

  Future<void> _initIsarAndMaybeFetch() async {
    // Load companies from global Isar instance
    _companies = await isar.companys.where().findAll();
    setState(() {});
    
    if (_companies.isEmpty) {
      _fetchAndStoreCompanies();
    } else {
      checkOnlineStatus();
    }
  }

  Future<void> checkOnlineStatus() async {
    setState(() { _loading = true; });
    const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=1';
    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 3));
      setState(() {
        _isOnline = response.statusCode == 200;
        _loading = false;
      });
    } catch (_) {
      setState(() {
        _isOnline = false;
        _loading = false;
      });
    }
  }

  Future<void> _fetchAndStoreCompanies() async {
    setState(() { _loading = true; _error = null; });
    const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/company';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        List<Company> companies = [];
        if (decoded is List) {
          companies = decoded.map((e) => Company.fromJson(e)).toList();
        } else if (decoded is Map<String, dynamic> && decoded['data'] is List) {
          companies = (decoded['data'] as List).map((e) => Company.fromJson(e)).toList();
        } else if (decoded is Map<String, dynamic>) {
          companies = [Company.fromJson(decoded)];
        }
        await isar.writeTxn(() async {
          await isar.companys.clear();
          await isar.companys.putAll(companies);
        });
        
        // Update online status
        setState(() {
          _isOnline = true;
        });
      } else {
        setState(() { 
          _error = 'Failed to fetch companies: ${response.statusCode}'; 
          _isOnline = false;
        });
      }
    } catch (e) {
      setState(() { 
        _error = 'Error: $e'; 
        _isOnline = false;
      });
    } finally {
      setState(() { _loading = false; });
    }
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
          'Company',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.3),
        ),
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            // Clear login data from Isar
            final authService = AuthService();
            await authService.logout();
            
            // Navigate to login screen
            if (mounted) {
              Navigator.of(context).pushReplacementNamed('/login');
            }
          },
          tooltip: 'Logout',
        ),
        actions: [
          OnlineStatusIcon(
            isOnline: _isOnline,
            onTap: checkOnlineStatus,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loading ? null : _fetchAndStoreCompanies,
            tooltip: 'Refresh Companies',
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
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  TextSpan(
                    text: _userFullName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Please select company message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
            color: Colors.white,
            child: Text(
              'Please select company',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          // Header section with search and info
          Container(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 16),
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search companies...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 18),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                    // TODO: Implement search functionality
                  ),
                ),
              ],
            ),
          ),
          
          // Error message if any
          if (_error != null)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red[700], size: 18),
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
          
          // Company list
          Expanded(
            child: StreamBuilder<List<Company>>(
                stream: isar.companys.where().watch(fireImmediately: true),
                    builder: (context, snapshot) {
                      if (_loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
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
                                'Loading companies...',
                                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      final companies = snapshot.data ?? [];
                      
                      if (companies.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.business_center, size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 12),
                              Text(
                                'No companies found',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton.icon(
                                onPressed: _fetchAndStoreCompanies,
                                icon: const Icon(Icons.refresh),
                                label: const Text('Refresh'),
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
                          itemCount: companies.length,
                          itemBuilder: (context, index) {
                            final company = companies[index];
                            final hasLogo = company.companyLogo != null && company.companyLogo!.isNotEmpty;
                            final nameInitial = company.companyName.isNotEmpty ? company.companyName[0].toUpperCase() : '?';
                            final hasLocation = [company.city, company.state, company.country].any((e) => e != null && e.isNotEmpty);
                            
                            // Generate a consistent color based on company name
                            final nameHash = company.companyName.hashCode;
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
                                  onTap: () async {
                                    // Save selected company to Isar
                                    try {
                                      final authService = AuthService();
                                      await authService.saveSelectedCompany({
                                        'companyId': company.companyCode,
                                        'companyName': company.companyName,
                                        'companyCode': company.companyCode,
                                      });
                                    } catch (e) {
                                      print('Error saving selected company: $e');
                                    }
                                    
                                    // Navigate to menu page
                                    Navigator.of(context).pushReplacementNamed('/menu');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        // Company logo or avatar
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: hasLogo ? Colors.transparent : avatarColor,
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: Colors.grey.shade200),
                                          ),
                                          child: hasLogo
                                              ? ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: Image.network(
                                                    company.companyLogo!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (_, __, ___) => Center(
                                                      child: Text(
                                                        nameInitial,
                                                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Text(
                                                    nameInitial,
                                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                ),
                                        ),
                                        const SizedBox(width: 12),
                                        
                                        // Company information
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                company.companyName,
                                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                                softWrap: true,
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius: BorderRadius.circular(4),
                                                      border: Border.all(color: Colors.grey.shade300),
                                                    ),
                                                    child: Text(
                                                      company.companyCode,
                                                      style: TextStyle(fontSize: 10, color: Colors.grey[800]),
                                                    ),
                                                  ),
                                                  if (company.registrationNo != null && company.registrationNo!.isNotEmpty) ...[  
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      'Reg: ${company.registrationNo}',
                                                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                              if (hasLocation) ...[  
                                                const SizedBox(height: 2),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                                                    const SizedBox(width: 4),
                                                    Expanded(
                                                      child: Text(
                                                        [company.city, company.state, company.country]
                                                            .where((e) => e != null && e.isNotEmpty)
                                                            .join(', '),
                                                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        
                                        // Selection indicator
                                        Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
          
          // Footer with version info
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.white,
            child: Center(
              child: Text(
                'IMS Customer Portal v1.0.0',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

