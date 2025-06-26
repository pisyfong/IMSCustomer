import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'company.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'online_status_icon.dart';

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({Key? key}) : super(key: key);

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage> {
  late Isar _isar;
  bool _isarReady = false;
  bool _loading = false;
  String? _error;
  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    _initIsarAndMaybeFetch();
    checkOnlineStatus();
  }

  Future<void> checkOnlineStatus() async {
    const apiUrl = 'http://plusintralinkapps.dyndns.org:1194/api/customers?page=1&limit=1';
    try {
      final response = await http.get(Uri.parse(apiUrl)).timeout(const Duration(seconds: 3));
      setState(() {
        _isOnline = response.statusCode == 200;
      });
    } catch (_) {
      setState(() {
        _isOnline = false;
      });
    }
  }

  Future<void> _initIsarAndMaybeFetch() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.getInstance() ?? await Isar.open([CompanySchema], directory: dir.path);
    final count = await _isar.companys.count();
    setState(() { _isarReady = true; });
    if (count == 0) {
      await _fetchAndStoreCompanies();
    } else {
      setState(() {}); // trigger UI update
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
        await _isar.writeTxn(() async {
          await _isar.companys.clear();
          await _isar.companys.putAll(companies);
        });
        setState(() {});
      } else {
        setState(() { _error = 'Failed to fetch companies: ${response.statusCode}'; });
      }
    } catch (e) {
      setState(() { _error = 'Error: $e'; });
    } finally {
      setState(() { _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Company'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.redAccent,
        elevation: 1,
        actions: [
          OnlineStatusIcon(
            isOnline: _isOnline,
            onTap: checkOnlineStatus,
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.redAccent),
            onPressed: _loading ? null : _fetchAndStoreCompanies,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(_error!, style: const TextStyle(color: Colors.red)),
              ),
            Expanded(
              child: !_isarReady
                  ? const Center(child: CircularProgressIndicator())
                  : StreamBuilder<List<Company>>(
                      stream: _isar.companys.where().watch(fireImmediately: true),
                      builder: (context, snapshot) {
                        if (_loading && (!snapshot.hasData || snapshot.data!.isEmpty)) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        final companies = snapshot.data ?? [];
                        if (companies.isEmpty) {
                          return const Center(child: Text('No companies found.'));
                        }
                        return ListView.separated(
                          itemCount: companies.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 14),
                          itemBuilder: (context, index) {
                            final c = companies[index];
                            return Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // TODO: Handle company selection and proceed
                                  Navigator.of(context).pushReplacementNamed('/home');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.business, color: Colors.redAccent.shade200, size: 36),
                                          const SizedBox(width: 14),
                                          Expanded(
                                            child: Text(
                                              c.companyName,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text('Code: ${c.companyCode}', style: TextStyle(color: Colors.grey[700])),
                                      if (c.registrationNo != null && c.registrationNo!.isNotEmpty)
                                        Text('Reg. No: ${c.registrationNo}', style: TextStyle(color: Colors.grey[700])),
                                      const SizedBox(height: 6),
                                      Text(
                                        [c.city, c.state, c.country].where((e) => e != null && e.isNotEmpty).join(', '),
                                        style: TextStyle(color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

