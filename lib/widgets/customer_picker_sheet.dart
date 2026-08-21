import 'package:flutter/material.dart';

import '../main.dart';
import '../models/customer.dart';
import '../services/customer_service.dart';
import '../theme/app_design.dart';

/// Searchable customer picker.
///
/// Reads the local cache so it works offline — the same list the ordering flow
/// uses, scoped by the user's role mappings. Returns the chosen [Customer], or
/// null when dismissed.
class CustomerPickerSheet extends StatefulWidget {
  final int companyCode;
  final String? selectedCode;
  final Color accent;

  const CustomerPickerSheet({
    super.key,
    required this.companyCode,
    this.selectedCode,
    this.accent = AppDesign.accent,
  });

  static Future<Customer?> show(
    BuildContext context, {
    required int companyCode,
    String? selectedCode,
    Color accent = AppDesign.accent,
  }) {
    return showModalBottomSheet<Customer>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CustomerPickerSheet(
        companyCode: companyCode,
        selectedCode: selectedCode,
        accent: accent,
      ),
    );
  }

  @override
  State<CustomerPickerSheet> createState() => _CustomerPickerSheetState();
}

class _CustomerPickerSheetState extends State<CustomerPickerSheet> {
  final _searchCtrl = TextEditingController();
  List<Customer> _all = [];
  String _q = '';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final rows = await CustomerService(signalRService)
          .getLocalCustomers(widget.companyCode);
      if (!mounted) return;
      setState(() {
        _all = rows;
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  /// Matches on name OR code. Operators know some customers by one and some by
  /// the other, and a code-only search would fail every time they type a name.
  List<Customer> get _filtered {
    final q = _q.trim().toLowerCase();
    if (q.isEmpty) return _all;
    return _all
        .where((c) =>
            (c.name ?? '').toLowerCase().contains(q) ||
            c.code.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final rows = _filtered;
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, controller) => Container(
        decoration: const BoxDecoration(
          color: AppDesign.bg,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AppDesign.radiusLg)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 8),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppDesign.borderStrong,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      autofocus: true,
                      onChanged: (v) => setState(() => _q = v),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search name or code',
                        prefixIcon: const Icon(Icons.search, size: 18),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppDesign.radiusSm),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.close,
                        size: 20, color: AppDesign.inkMuted),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : rows.isEmpty
                      ? Center(
                          child: Text(
                            _all.isEmpty
                                ? 'No customers cached on this device'
                                : 'Nothing matches "$_q"',
                            style: const TextStyle(
                                fontSize: 12.5, color: AppDesign.inkSubtle),
                          ),
                        )
                      : ListView.separated(
                          controller: controller,
                          padding: const EdgeInsets.all(10),
                          itemCount: rows.length,
                          separatorBuilder: (_, __) => const Divider(
                              height: 8, color: AppDesign.divider),
                          itemBuilder: (context, i) {
                            final c = rows[i];
                            final chosen = c.code == widget.selectedCode;
                            return ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                (c.name ?? '').trim().isEmpty
                                    ? c.code
                                    : c.name!.trim(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w700,
                                    color: chosen
                                        ? widget.accent
                                        : AppDesign.ink),
                              ),
                              subtitle: Text(c.code,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppDesign.inkMuted)),
                              trailing: chosen
                                  ? Icon(Icons.check,
                                      size: 18, color: widget.accent)
                                  : null,
                              onTap: () => Navigator.pop(context, c),
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
