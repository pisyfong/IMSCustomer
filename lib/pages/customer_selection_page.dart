import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import '../services/offline_first_service.dart';
import '../theme/app_design.dart';
import '../widgets/ui_kit.dart';
import '../main.dart';
import 'sales_quotation_menu_page.dart';

/// Step one of ordering: choose whose quotation this is.
///
/// Offline-first — the list comes from the local cache immediately and the
/// online indicator catches up in the background, so a rep in a basement
/// warehouse can still start an order.
class CustomerSelectionPage extends StatefulWidget {
  final Map<String, dynamic> selectedCompany;

  const CustomerSelectionPage({
    super.key,
    required this.selectedCompany,
  });

  @override
  State<CustomerSelectionPage> createState() => _CustomerSelectionPageState();
}

/// Which slice of the customer list is showing.
enum _Tab { all, active }

class _CustomerSelectionPageState extends State<CustomerSelectionPage> {
  late final CustomerService _customerService = CustomerService(signalRService);
  final _searchCtrl = TextEditingController();

  List<Customer> _customers = [];
  bool _isLoading = false;
  bool _isOnline = false;
  String? _error;
  String _query = '';
  _Tab _tab = _Tab.all;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
        () => setState(() => _query = _searchCtrl.text.trim().toLowerCase()));
    _loadCustomers();
    _checkOnlineStatus();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  /// Non-blocking online-status probe. Uses the synchronous cached state
  /// (no network) to update the indicator immediately, then optionally
  /// kicks a probe in the background. Never blocks the UI.
  Future<void> _checkOnlineStatus() async {
    final cached = OfflineFirstService.isLikelyOnline();
    if (mounted) setState(() => _isOnline = cached);
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
    });

    try {
      final raw = widget.selectedCompany['companyCode'];
      final companyCode = raw is String ? int.parse(raw) : raw as int;

      final customers =
          await _customerService.getCustomers(companyCode, forceSync: forceSync);
      final isOnline = OfflineFirstService.isLikelyOnline();

      if (!mounted) return;
      setState(() {
        _customers = customers;
        _isLoading = false;
        _isOnline = isOnline;
        _error = customers.isNotEmpty
            ? null
            : isOnline
                ? 'No customers found for this company'
                : 'No cached customers. Connect once to sync the directory.';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Failed to load customers: $e';
        _isOnline = false;
      });
    }
  }

  bool _isActive(Customer c) => (c.status ?? 'A').toUpperCase() == 'A';

  List<Customer> get _visible {
    var out = _customers;
    if (_tab == _Tab.active) out = out.where(_isActive).toList();
    if (_query.isNotEmpty) {
      out = out.where((c) {
        return c.displayName.toLowerCase().contains(_query) ||
            c.code.toLowerCase().contains(_query) ||
            (c.telNo ?? '').toLowerCase().contains(_query) ||
            (c.contactName ?? '').toLowerCase().contains(_query);
      }).toList();
    }
    return out;
  }

  Future<void> _selectCustomer(Customer customer) async {
    CustomerStateService().setSelectedCustomer(customer);

    // AuthService clears the cart when the customer changes — keep both in
    // step by always going through it.
    await AuthService().setCurrentCustomer({
      'customerId': customer.id,
      'id': customer.id,
      'displayName': customer.displayName,
      'code': customer.code,
      'status': customer.status,
      'contactName': customer.contactName,
      'telNo': customer.telNo,
      'fullAddress': customer.fullAddress,
    });

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SalesQuotationMenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rows = _visible;
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: UiKit.appBar(
        'Select customer',
        subtitle: widget.selectedCompany['companyName']?.toString(),
        actions: [
          _onlineDot(),
          IconButton(
            tooltip: 'Sync customers',
            icon: _isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.refresh, size: 20),
            onPressed: _isLoading ? null : () => _loadCustomers(forceSync: true),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppDesign.surface,
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Column(children: [
              UiSearchField(
                controller: _searchCtrl,
                hint: 'Search name, code, phone',
              ),
              const SizedBox(height: 8),
              UiSegmented(
                segments: [
                  ('All', _customers.length),
                  ('Active', _customers.where(_isActive).length),
                ],
                index: _tab.index,
                onChanged: (i) => setState(() => _tab = _Tab.values[i]),
                accent: AppDesign.modOrdering,
              ),
            ]),
          ),
          const Divider(height: 1, color: AppDesign.border),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: UiBanner(
                message: _error!,
                onDismiss: () => setState(() => _error = null),
              ),
            ),
          Expanded(child: _list(rows)),
        ],
      ),
    );
  }

  Widget _onlineDot() => Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Center(
          child: UiPill(
            _isOnline ? 'ONLINE' : 'OFFLINE',
            color: _isOnline ? AppDesign.success : AppDesign.warning,
            icon: _isOnline ? Icons.cloud_done : Icons.cloud_off,
          ),
        ),
      );

  Widget _list(List<Customer> rows) {
    if (_isLoading && _customers.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (rows.isEmpty) {
      final searching = _query.isNotEmpty;
      return UiEmptyState(
        icon: searching ? Icons.search_off : Icons.people_outline,
        title: searching
            ? 'No customer matches "${_searchCtrl.text}"'
            : 'No customers',
        message: searching
            ? 'Try the code instead of the name.'
            : 'Sync to pull the customer directory for this company.',
        actionLabel: searching ? 'Clear search' : 'Sync now',
        accent: AppDesign.modOrdering,
        onAction: searching
            ? _searchCtrl.clear
            : () => _loadCustomers(forceSync: true),
      );
    }

    return RefreshIndicator(
      color: AppDesign.modOrdering,
      onRefresh: () => _loadCustomers(forceSync: true),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 24),
        itemCount: rows.length,
        itemBuilder: (context, i) => _customerCard(rows[i]),
      ),
    );
  }

  Widget _customerCard(Customer c) {
    final active = _isActive(c);
    // An inactive customer still shows — a rep may need to look one up — but
    // the rail goes grey so it can't be picked by accident.
    final rail = active ? AppDesign.modOrdering : AppDesign.inkSubtle;

    final meta = [
      if ((c.contactName ?? '').trim().isNotEmpty) c.contactName!.trim(),
      if ((c.telNo ?? '').trim().isNotEmpty) c.telNo!.trim(),
    ].join('  ·  ');

    return UiRailCard(
      rail: rail,
      onTap: () => _selectCustomer(c),
      child: Row(children: [
        UiAvatar(c.displayName),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [
                Expanded(
                  child: Text(c.displayName,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.ink),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ),
                if (!active) ...[
                  const SizedBox(width: 6),
                  const UiPill('INACTIVE', color: AppDesign.danger),
                ],
              ]),
              const SizedBox(height: 1),
              Text(c.code,
                  style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.info)),
              if (meta.isNotEmpty)
                Text(meta,
                    style: const TextStyle(
                        fontSize: 10.5, color: AppDesign.inkMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              if (c.fullAddress.trim().isNotEmpty)
                Text(c.fullAddress.trim(),
                    style: const TextStyle(
                        fontSize: 10.5, color: AppDesign.inkSubtle),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, size: 18, color: AppDesign.inkSubtle),
      ]),
    );
  }
}
