import 'package:flutter/material.dart';

import '../services/source_document_service.dart';
import '../theme/app_design.dart';

/// Picks the invoice or quotation a credit note is being raised against.
///
/// Both kinds sit behind one sheet with a segmented switch rather than two
/// entry points, because the operator usually knows the number and not which
/// system produced it — and the number is searchable either way.
class SourceDocumentSheet extends StatefulWidget {
  final int companyCode;
  final String customerCode;
  final Color accent;

  const SourceDocumentSheet({
    super.key,
    required this.companyCode,
    required this.customerCode,
    this.accent = AppDesign.modCreditNote,
  });

  static Future<SourceDocument?> show(
    BuildContext context, {
    required int companyCode,
    required String customerCode,
    Color accent = AppDesign.modCreditNote,
  }) {
    return showModalBottomSheet<SourceDocument>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SourceDocumentSheet(
        companyCode: companyCode,
        customerCode: customerCode,
        accent: accent,
      ),
    );
  }

  @override
  State<SourceDocumentSheet> createState() => _SourceDocumentSheetState();
}

class _SourceDocumentSheetState extends State<SourceDocumentSheet> {
  final _service = SourceDocumentService();
  final _searchCtrl = TextEditingController();

  SourceDocKind _kind = SourceDocKind.invoice;
  final Map<SourceDocKind, List<SourceDocument>> _cache = {};
  bool _loading = true;
  String _q = '';

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
    setState(() => _loading = true);
    final rows = await _service.documents(
      companyCode: widget.companyCode,
      customerCode: widget.customerCode,
      kind: _kind,
    );
    if (!mounted) return;
    setState(() {
      _cache[_kind] = rows;
      _loading = false;
    });
  }

  List<SourceDocument> get _visible {
    final rows = _cache[_kind] ?? const <SourceDocument>[];
    if (_q.isEmpty) return rows;
    final q = _q.toLowerCase();
    return rows.where((d) => d.docNo.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Text('Source document',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800)),
                  const Spacer(),
                  Text(widget.customerCode,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.inkMuted)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  for (final k in SourceDocKind.values)
                    Expanded(child: _tab(k)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (v) => setState(() => _q = v.trim()),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search ${_kind.short} number',
                  prefixIcon: const Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusSm)),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _visible.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              'No ${_kind.label.toLowerCase()}s cached for '
                              'this customer.',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppDesign.inkSubtle),
                            ),
                          ),
                        )
                      : ListView.separated(
                          controller: controller,
                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                          itemCount: _visible.length,
                          separatorBuilder: (_, __) => const Divider(
                              height: 9, color: AppDesign.divider),
                          itemBuilder: (context, i) => _row(_visible[i]),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tab(SourceDocKind k) {
    final on = k == _kind;
    return GestureDetector(
      onTap: on
          ? null
          : () {
              setState(() => _kind = k);
              if (_cache.containsKey(k)) {
                setState(() => _loading = false);
              } else {
                _load();
              }
            },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: on ? widget.accent : AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: on ? widget.accent : AppDesign.border),
        ),
        child: Text(
          '${k.label}s',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: on ? Colors.white : AppDesign.inkMuted,
          ),
        ),
      ),
    );
  }

  Widget _row(SourceDocument d) {
    return InkWell(
      onTap: () => Navigator.pop(context, d),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(d.docNo,
                      style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.ink)),
                  const SizedBox(height: 2),
                  Text(_date(d.date),
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted)),
                ],
              ),
            ),
            Text('RM ${d.netAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.accentInk)),
            const Icon(Icons.chevron_right,
                size: 18, color: AppDesign.inkSubtle),
          ],
        ),
      ),
    );
  }

  String _date(DateTime? d) {
    if (d == null) return '—';
    two(int v) => v.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }
}
