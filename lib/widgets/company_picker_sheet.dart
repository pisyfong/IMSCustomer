import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../company.dart';
import '../main.dart';
import '../services/auth_service.dart';
import '../theme/app_design.dart';

/// Shared "pick a company" flow.
///
/// Rules:
///   - If a company is already saved on the AuthService, return it (no prompt).
///   - Otherwise load companies from local Isar.
///     * 0 companies → returns null (caller should show a fallback).
///     * 1 company  → auto-save and return it.
///     * >1         → show a modal bottom sheet, save + return the pick.
///
/// [force] = true skips the "already saved" short-circuit and always prompts
/// (used by the "Change company" flow on the home page).
class CompanyPickerSheet {
  static Future<Map<String, dynamic>?> ensureSelected(
    BuildContext context, {
    bool force = false,
  }) async {
    final auth = AuthService();

    if (!force) {
      final saved = await auth.getSelectedCompany();
      if (saved != null && saved['companyCode'] != null) return saved;
    }

    final companies = await isar.companys.where().findAll();

    if (companies.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No companies available. Try syncing.'),
          ),
        );
      }
      return null;
    }

    // Auto-pick when the user only belongs to a single company.
    if (companies.length == 1 && !force) {
      final only = companies.first;
      final map = _companyToMap(only);
      await auth.saveSelectedCompany(map);
      return map;
    }

    // Multiple companies (or forced change) → show the picker.
    if (!context.mounted) return null;
    return _showSheet(context, companies);
  }

  static Future<Map<String, dynamic>?> _showSheet(
    BuildContext context,
    List<Company> companies,
  ) async {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _PickerSheet(companies: companies),
    );
  }

  static Map<String, dynamic> _companyToMap(Company c) => {
        'companyCode': c.companyCode,
        'companyName': c.companyName,
      };
}

class _PickerSheet extends StatefulWidget {
  final List<Company> companies;
  const _PickerSheet({required this.companies});

  @override
  State<_PickerSheet> createState() => _PickerSheetState();
}

class _PickerSheetState extends State<_PickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final visible = _query.trim().isEmpty
        ? widget.companies
        : widget.companies.where((c) {
            final q = _query.trim().toLowerCase();
            return (c.companyName?.toLowerCase().contains(q) ?? false) ||
                (c.companyCode?.toLowerCase().contains(q) ?? false);
          }).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: AppDesign.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDesign.space4),
              child: Row(
                children: [
                  Icon(Icons.business, size: 18, color: AppDesign.accent),
                  SizedBox(width: 8),
                  Text('Select Company', style: AppDesign.title),
                ],
              ),
            ),
            const SizedBox(height: AppDesign.space3),
            if (widget.companies.length > 4)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDesign.space4),
                child: TextField(
                  autofocus: false,
                  onChanged: (v) => setState(() => _query = v),
                  decoration: InputDecoration(
                    hintText: 'Search…',
                    prefixIcon: const Icon(Icons.search, size: 18),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: AppDesign.space2),
            Expanded(
              child: visible.isEmpty
                  ? const Center(
                      child: Text('No matches',
                          style: AppDesign.bodyMuted))
                  : ListView.separated(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDesign.space3),
                      itemCount: visible.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                      itemBuilder: (context, i) => _row(context, visible[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, Company c) {
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: () async {
          final map = CompanyPickerSheet._companyToMap(c);
          await AuthService().saveSelectedCompany(map);
          if (!context.mounted) return;
          Navigator.of(context).pop(map);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDesign.space3, vertical: AppDesign.space2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppDesign.accentSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.business,
                    color: AppDesign.accent, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(c.companyName ?? '—',
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppDesign.ink),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 1),
                    Text('Code ${c.companyCode ?? "—"}',
                        style: const TextStyle(
                            fontSize: 10,
                            color: AppDesign.inkMuted,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 16, color: AppDesign.inkSubtle),
            ],
          ),
        ),
      ),
    );
  }
}
