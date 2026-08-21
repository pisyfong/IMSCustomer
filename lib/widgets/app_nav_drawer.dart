import 'package:flutter/material.dart';
import '../company_selection_page.dart';
import '../pages/credit_note_page.dart';
import '../pages/home_page.dart';
import '../pages/picking_page.dart';
import '../pages/packing_page.dart';
import '../pages/settings_page.dart';
import '../services/auth_service.dart';
import '../services/module_access_service.dart';
import '../theme/app_design.dart';

/// Which module is currently active. Used by [AppNavDrawer] to highlight the
/// row for the section the user is already in (so the same-tap is a no-op).
enum AppSection { home, ordering, picking, packing, creditNote }

/// Shared side drawer for the app shell. Includes the three modules
/// (Ordering / Picking / Credit Note), Settings, and Log out.
///
/// Switching modules uses `pushReplacement` so the navigator stack doesn't
/// grow every time the user hops between sections.
class AppNavDrawer extends StatefulWidget {
  final AppSection current;
  const AppNavDrawer({super.key, required this.current});

  @override
  State<AppNavDrawer> createState() => _AppNavDrawerState();
}

class _AppNavDrawerState extends State<AppNavDrawer> {
  /// Resolved here rather than relying on whichever page happened to load it.
  ///
  /// The drawer opens from several pages, and only the home page used to
  /// trigger a load — so on a cold start into any other page every module
  /// showed enabled. Reading the cache is fast, and the row rebuilds when the
  /// answer lands.
  late ModuleAccess _access = ModuleAccessService().current;

  @override
  void initState() {
    super.initState();
    if (!ModuleAccessService().resolved) _resolve();
  }

  Future<void> _resolve() async {
    final a = await ModuleAccessService().load();
    if (mounted) setState(() => _access = a);
  }

  @override
  Widget build(BuildContext context) {
    final access = _access;
    final current = widget.current;
    return Drawer(
      backgroundColor: AppDesign.surface,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Brand strip ──
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppDesign.space4, AppDesign.space5, AppDesign.space4, AppDesign.space3),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppDesign.accentSoft,
                      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    ),
                    child: const Icon(Icons.storefront_outlined,
                        size: 20, color: AppDesign.accent),
                  ),
                  const SizedBox(width: AppDesign.space3),
                  const Text('IMS Customer', style: AppDesign.title),
                ],
              ),
            ),
            const Divider(height: 1, color: AppDesign.divider),
            const SizedBox(height: AppDesign.space2),

            _sectionLabel('MODULES'),
            _navRow(
              context,
              icon: Icons.home_outlined,
              label: 'Home',
              active: current == AppSection.home,
              onTap: () => _switchTo(context,
                  section: AppSection.home,
                  page: current == AppSection.home ? null : const HomePage()),
            ),
            _navRow(
              context,
              icon: Icons.shopping_cart_outlined,
              iconColor: AppDesign.modOrdering,
              label: 'Ordering',
              enabled: access.ordering,
              active: current == AppSection.ordering,
              onTap: () => _switchTo(context,
                  section: AppSection.ordering,
                  page: current == AppSection.ordering
                      ? null
                      : const CompanySelectionPage()),
            ),
            _navRow(
              context,
              icon: Icons.shelves,
              iconColor: AppDesign.modPicking,
              label: 'Picking',
              enabled: access.picking,
              active: current == AppSection.picking,
              onTap: () => _switchTo(context,
                  section: AppSection.picking,
                  page: current == AppSection.picking
                      ? null
                      : const PickingPage()),
            ),
            _navRow(
              context,
              icon: Icons.inventory_2,
              iconColor: AppDesign.modPacking,
              label: 'Packing',
              enabled: access.packing,
              active: current == AppSection.packing,
              onTap: () => _switchTo(context,
                  section: AppSection.packing,
                  page: current == AppSection.packing
                      ? null
                      : const PackingPage()),
            ),
            _navRow(
              context,
              icon: Icons.receipt_long_outlined,
              iconColor: AppDesign.modCreditNote,
              label: 'Credit Note',
              enabled: access.creditNote,
              active: current == AppSection.creditNote,
              onTap: () => _switchTo(context,
                  section: AppSection.creditNote,
                  page: current == AppSection.creditNote
                      ? null
                      : const CreditNotePage()),
            ),

            const SizedBox(height: AppDesign.space3),
            const Divider(height: 1, color: AppDesign.divider),
            const SizedBox(height: AppDesign.space2),

            _sectionLabel('ACCOUNT'),
            _navRow(
              context,
              icon: Icons.settings_outlined,
              label: 'Settings',
              active: false,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
            ),
            _navRow(
              context,
              icon: Icons.logout,
              label: 'Log out',
              active: false,
              danger: true,
              onTap: () async {
                Navigator.pop(context);
                await AuthService().logout();
                if (!context.mounted) return;
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),

            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(AppDesign.space4),
              child: Text('v1.0', style: AppDesign.micro),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.fromLTRB(
            AppDesign.space4, AppDesign.space2, AppDesign.space4, AppDesign.space1),
        child: Text(text, style: AppDesign.micro),
      );

  Widget _navRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
    bool danger = false,
    Color? iconColor,
    bool enabled = true,
  }) {
    // Greyed and inert, not removed — a row that vanishes reads as a bug,
    // while one that is visibly off reads as a permission.
    if (!enabled) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('$label is not enabled for your login'),
                duration: const Duration(seconds: 2),
              ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDesign.space4, vertical: AppDesign.space3),
            child: Row(
              children: [
                Icon(icon, size: 20, color: AppDesign.inkSubtle),
                const SizedBox(width: AppDesign.space3),
                Expanded(
                  child: Text(label,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkSubtle)),
                ),
                const Icon(Icons.lock_outline,
                    size: 15, color: AppDesign.inkSubtle),
              ],
            ),
          ),
        ),
      );
    }
    final fg = danger
        ? AppDesign.danger
        : (active ? AppDesign.accent : AppDesign.ink);
    // A module's icon keeps its identity colour (same as the Home tile) whether
    // the row is active or not; only the label follows the active state.
    final ic = danger ? AppDesign.danger : (iconColor ?? fg);
    return Material(
      color: active ? AppDesign.accentSoft : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDesign.space4, vertical: AppDesign.space3),
          child: Row(
            children: [
              Icon(icon, size: 20, color: ic),
              const SizedBox(width: AppDesign.space3),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    color: fg,
                  ),
                ),
              ),
              if (active)
                Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppDesign.accent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _switchTo(
    BuildContext context, {
    required AppSection section,
    required Widget? page,
  }) async {
    Navigator.pop(context); // close drawer
    if (page == null) return; // already on this section

    // Every module requires a selected company. If nothing is selected yet,
    // bounce the user to the company picker first so the target module
    // doesn't open in a broken state (empty lists, missing IDs).
    if (section != AppSection.ordering && section != AppSection.home) {
      final selected = await AuthService().getSelectedCompany();
      if (selected == null || selected['companyCode'] == null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Select a company first, then re-open the module.'),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const CompanySelectionPage()),
        );
        return;
      }
    }

    if (!context.mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
