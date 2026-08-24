import 'package:flutter/material.dart';

import '../inventory_page.dart';
import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../services/customer_state_service.dart';
import '../services/draft_service.dart';
import '../services/offline_first_service.dart';
import '../theme/app_design.dart';
import '../widgets/ui_kit.dart';
import 'cart_page.dart';
import 'draft_list_page.dart';
import 'previous_order_page.dart';
import 'scan_mode_page.dart';
import 'credit_note_page.dart';

/// The ordering hub for the selected customer.
///
/// Mirrors the picking/packing hubs: a flat bar, the working context pinned at
/// the top, then the actions. The open cart is promoted out of the grid — it's
/// the one piece of state a rep loses track of, and the one thing they came
/// back to this page for.
class SalesQuotationMenuPage extends StatefulWidget {
  const SalesQuotationMenuPage({super.key});

  @override
  State<SalesQuotationMenuPage> createState() => _SalesQuotationMenuPageState();
}

class _SalesQuotationMenuPageState extends State<SalesQuotationMenuPage> {
  final _customerState = CustomerStateService();
  final _auth = AuthService();

  Map<String, dynamic>? _company;
  Map<String, dynamic>? _customer;
  bool _isOnline = false;

  int _cartCount = 0;
  double _cartTotal = 0;
  int _draftCount = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  /// Reloads whenever we come back from the cart / drafts / inventory, so the
  /// counts on this page are never stale.
  Future<void> _openThen(Widget page) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    if (mounted) _load();
  }

  Future<void> _load() async {
    try {
      final company = await _auth.getSelectedCompany();
      final customer = _customerState.getSelectedCustomerInfo();

      final raw = company?['companyCode'];
      final companyCode =
          raw is int ? raw : int.tryParse(raw?.toString() ?? '') ?? 0;

      // Cart summary — what's staged but not yet quoted. `subtotal` already
      // handles the nullable unit price.
      final cart = await CartService().getCartItems(
          companyCode: companyCode == 0 ? null : companyCode);
      final count = cart.length;
      final total = cart.fold<double>(0, (a, c) => a + c.subtotal);

      var drafts = 0;
      if (companyCode != 0) {
        drafts = (await DraftService().getDrafts(
          companyCode: companyCode,
          customerCode: _customerState.selectedCustomer?.code,
        ))
            .length;
      }

      if (!mounted) return;
      setState(() {
        _company = company;
        _customer = customer;
        _isOnline = OfflineFirstService.isLikelyOnline();
        _cartCount = count;
        _cartTotal = total;
        _draftCount = drafts;
        _loading = false;
      });
    } catch (e) {
      debugPrint('SQ hub load failed: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: UiKit.appBar(
        'Sales quotation',
        subtitle: _company?['companyName']?.toString(),
        actions: [
          Center(
            child: UiPill(
              _isOnline ? 'ONLINE' : 'OFFLINE',
              color: _isOnline ? AppDesign.success : AppDesign.warning,
              icon: _isOnline ? Icons.cloud_done : Icons.cloud_off,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Adding items is the job — make it the one unmissable action.
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openThen(const InventoryPage()),
        backgroundColor: AppDesign.modOrdering,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_shopping_cart, size: 20),
        label: const Text('Add items',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              color: AppDesign.modOrdering,
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
                children: [
                  _customerCard(),
                  const SizedBox(height: 14),
                  if (_cartCount > 0) ...[
                    const UiSectionLabel('IN PROGRESS'),
                    _openCartCard(),
                    const SizedBox(height: 14),
                  ],
                  const UiSectionLabel('ACTIONS'),
                  _actionsGrid(),
                ],
              ),
            ),
    );
  }

  // ─── Working context ─────────────────────────────────────────────────────

  Widget _customerCard() {
    final c = _customer;
    if (c == null) {
      return UiRailCard(
        rail: AppDesign.warning,
        onTap: () => Navigator.pop(context),
        child: Row(children: [
          const Icon(Icons.person_off_outlined,
              size: 18, color: AppDesign.warning),
          const SizedBox(width: 10),
          const Expanded(
            child: Text('No customer selected — tap to choose',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.warning)),
          ),
          const Icon(Icons.chevron_right, size: 18, color: AppDesign.warning),
        ]),
      );
    }

    final name = (c['name'] ?? c['displayName'] ?? '').toString();
    final code = (c['code'] ?? '').toString();
    final tel = (c['telNo'] ?? '').toString();
    final contact = (c['contactName'] ?? '').toString();
    final meta = [
      if (contact.trim().isNotEmpty) contact.trim(),
      if (tel.trim().isNotEmpty) tel.trim(),
    ].join('  ·  ');

    return UiRailCard(
      rail: AppDesign.modOrdering,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      // Tapping the customer goes back to the picker — the only way to change
      // it, and where a rep instinctively taps.
      onTap: () => Navigator.pop(context),
      child: Row(children: [
        UiAvatar(name, size: 40),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name.isEmpty ? 'Customer' : name,
                  style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.ink),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              if (code.isNotEmpty)
                Text(code,
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
            ],
          ),
        ),
        const Text('Change',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: AppDesign.modOrdering)),
        const Icon(Icons.chevron_right,
            size: 16, color: AppDesign.modOrdering),
      ]),
    );
  }

  /// The staged cart, surfaced rather than buried behind an icon.
  Widget _openCartCard() {
    return UiRailCard(
      rail: AppDesign.success,
      padding: const EdgeInsets.fromLTRB(10, 11, 10, 11),
      onTap: () => _openThen(const CartPage()),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppDesign.success.withOpacity(0.10),
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          ),
          child: const Icon(Icons.shopping_cart,
              size: 18, color: AppDesign.success),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$_cartCount item${_cartCount == 1 ? '' : 's'} in cart',
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.ink)),
              const Text('Tap to review and check out',
                  style: TextStyle(fontSize: 10.5, color: AppDesign.inkMuted)),
            ],
          ),
        ),
        Text('RM ${_cartTotal.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: AppDesign.success,
                letterSpacing: -0.3)),
        const SizedBox(width: 2),
        const Icon(Icons.chevron_right, size: 18, color: AppDesign.inkSubtle),
      ]),
    );
  }

  // ─── Actions ─────────────────────────────────────────────────────────────

  Widget _actionsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.45,
      // Read in pairs, top to bottom: the two ways to build an order, then
      // the two ways to revisit one, then the two side doors. Grouping by what
      // the operator is trying to DO beats grouping by how often each is
      // tapped — a grid this small is scanned whole, not hunted through.
      children: [
        _tile(
          icon: Icons.inventory_2_outlined,
          title: 'Browse',
          subtitle: 'Find products',
          color: AppDesign.modOrdering,
          bg: AppDesign.modOrderingBg,
          onTap: () => _openThen(const InventoryPage()),
        ),
        _tile(
          icon: Icons.shopping_cart_outlined,
          title: 'Cart',
          subtitle: _cartCount == 0 ? 'Empty' : 'Review & checkout',
          color: AppDesign.success,
          bg: const Color(0xFFECFDF5),
          badge: _cartCount,
          onTap: () => _openThen(const CartPage()),
        ),
        _tile(
          icon: Icons.edit_note_outlined,
          title: 'Drafts',
          subtitle: 'Saved quotations',
          color: AppDesign.modCreditNote,
          bg: AppDesign.modCreditNoteBg,
          badge: _draftCount,
          onTap: () => _openThen(const DraftListPage()),
        ),
        _tile(
          icon: Icons.history,
          title: 'History',
          subtitle: 'Previous orders',
          color: AppDesign.modPacking,
          bg: AppDesign.modPackingBg,
          onTap: () => _openThen(const PreviousOrderPage()),
        ),
        _tile(
          icon: Icons.qr_code_scanner,
          title: 'Scan mode',
          subtitle: 'Scan straight to cart',
          color: AppDesign.modOrdering,
          bg: AppDesign.modOrderingBg,
          onTap: () => _openThen(const ScanModePage()),
        ),
        _tile(
          icon: Icons.receipt_long_outlined,
          title: 'Credit Note',
          subtitle: 'Return or credit',
          color: AppDesign.modCreditNote,
          bg: AppDesign.modCreditNoteBg,
          onTap: () => _openThen(const CreditNotePage()),
        ),
      ],
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color bg,
    required VoidCallback onTap,
    int badge = 0,
  }) {
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(AppDesign.radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radius),
            border: Border.all(color: color.withOpacity(0.18)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  ),
                  child: Icon(icon, size: 17, color: Colors.white),
                ),
                const Spacer(),
                if (badge > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusPill),
                    ),
                    child: Text('$badge',
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: Colors.white)),
                  ),
              ]),
              const Spacer(),
              Text(title,
                  style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.ink)),
              Text(subtitle,
                  style: const TextStyle(
                      fontSize: 10.5, color: AppDesign.inkMuted),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
