import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/qty.dart';

import '../models/draft_quotation.dart';
import '../services/auth_service.dart';
import '../services/customer_state_service.dart';
import '../services/draft_service.dart';
import '../theme/app_design.dart';
import '../widgets/ui_kit.dart';
import 'edit_draft_page.dart';

/// Saved-but-not-quoted orders for the selected customer.
class DraftListPage extends StatefulWidget {
  const DraftListPage({super.key});

  @override
  State<DraftListPage> createState() => _DraftListPageState();
}

/// How the list is ordered. Drafts are resumed far more often than they're
/// browsed, so recent-first is the default.
enum _Sort { modified, created, amount }

extension _SortLabel on _Sort {
  String get label => switch (this) {
        _Sort.modified => 'Last edited',
        _Sort.created => 'Date created',
        _Sort.amount => 'Amount',
      };
}

class _DraftListPageState extends State<DraftListPage> {
  static const _accent = AppDesign.modCreditNote;
  static final _fmt = DateFormat('dd MMM yy · HH:mm');

  final _draftService = DraftService();
  final _customerState = CustomerStateService();
  final _auth = AuthService();
  final _searchCtrl = TextEditingController();

  List<DraftQuotation> _drafts = [];
  bool _isLoading = true;
  int _companyCode = 0;
  String _query = '';
  _Sort _sort = _Sort.modified;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
        () => setState(() => _query = _searchCtrl.text.trim().toLowerCase()));
    _loadDrafts();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadDrafts() async {
    setState(() => _isLoading = true);
    try {
      final company = await _auth.getSelectedCompany();
      final raw = company?['companyCode'];
      _companyCode = raw is int ? raw : int.tryParse(raw?.toString() ?? '') ?? 0;

      final drafts = await _draftService.getDrafts(
        companyCode: _companyCode,
        customerCode: _customerState.selectedCustomer?.code,
      );
      if (!mounted) return;
      setState(() {
        _drafts = drafts;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading drafts: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  List<DraftQuotation> get _visible {
    var out = _drafts;
    if (_query.isNotEmpty) {
      out = out
          .where((d) =>
              (d.customerName ?? '').toLowerCase().contains(_query) ||
              (d.customerCode ?? '').toLowerCase().contains(_query) ||
              (d.remarks ?? '').toLowerCase().contains(_query) ||
              '${d.id}'.contains(_query))
          .toList();
    }
    // Isar's filter() gives no ordering guarantee — sort explicitly.
    out = [...out];
    out.sort((a, b) => switch (_sort) {
          _Sort.amount => b.netAmount.compareTo(a.netAmount),
          _Sort.created => _date(b.createdDate).compareTo(_date(a.createdDate)),
          _Sort.modified => _date(b.lastModifiedDate ?? b.createdDate)
              .compareTo(_date(a.lastModifiedDate ?? a.createdDate)),
        });
    return out;
  }

  DateTime _date(DateTime? d) => d ?? DateTime.fromMillisecondsSinceEpoch(0);

  Future<void> _createNewDraft() async {
    try {
      final customer = _customerState.selectedCustomer;
      final user = _auth.currentUser;

      final draft = await _draftService.createDraft(
        companyCode: _companyCode,
        customerCode: customer?.code,
        customerName: customer?.name,
        salespersonCode: user?.loginName,
        salespersonName: user?.fullName,
      );
      await _open(draft);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error creating draft: $e'),
        backgroundColor: AppDesign.danger,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  Future<void> _open(DraftQuotation draft) async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => EditDraftPage(draft: draft)),
    );
    if (changed == true) await _loadDrafts();
  }

  Future<void> _deleteDraft(DraftQuotation draft) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete draft?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        content: Text(
          '${draft.customerName ?? 'No customer'} · ${draft.totalItems} '
          'item${draft.totalItems == 1 ? '' : 's'} will be discarded.',
          style: AppDesign.bodyMuted,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete',
                style: TextStyle(color: AppDesign.danger)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await _draftService.deleteDraft(draft.id);
      await _loadDrafts();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Draft deleted'),
        backgroundColor: AppDesign.success,
        behavior: SnackBarBehavior.floating,
      ));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting draft: $e'),
        backgroundColor: AppDesign.danger,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  Future<void> _pickSort() async {
    final picked = await showModalBottomSheet<_Sort>(
      context: context,
      backgroundColor: AppDesign.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Sort by',
                  style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
            ),
          ),
          for (final s in _Sort.values)
            ListTile(
              dense: true,
              leading: Icon(
                  s == _sort
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  size: 18,
                  color: s == _sort ? _accent : AppDesign.inkSubtle),
              title: Text(s.label,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight:
                          s == _sort ? FontWeight.w800 : FontWeight.w600)),
              onTap: () => Navigator.pop(ctx, s),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (picked != null) setState(() => _sort = picked);
  }

  @override
  Widget build(BuildContext context) {
    final rows = _visible;
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: UiKit.appBar(
        'Drafts',
        subtitle: _customerState.selectedCustomer?.name,
        actions: [
          IconButton(
            tooltip: 'Refresh',
            icon: _isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.refresh, size: 20),
            onPressed: _isLoading ? null : _loadDrafts,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createNewDraft,
        backgroundColor: _accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add, size: 20),
        label: const Text('New draft',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
      ),
      body: Column(children: [
        Container(
          color: AppDesign.surface,
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Row(children: [
            Expanded(
              child: UiSearchField(
                controller: _searchCtrl,
                hint: 'Search draft, customer',
              ),
            ),
            const SizedBox(width: 6),
            UiSquareAction(
              icon: Icons.swap_vert,
              accent: _accent,
              accentBg: AppDesign.modCreditNoteBg,
              tooltip: 'Sorted by ${_sort.label}',
              onTap: _pickSort,
            ),
          ]),
        ),
        const Divider(height: 1, color: AppDesign.border),
        Expanded(
          child: _isLoading && _drafts.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : rows.isEmpty
                  ? _empty()
                  : RefreshIndicator(
                      color: _accent,
                      onRefresh: _loadDrafts,
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 90),
                        itemCount: rows.length,
                        itemBuilder: (context, i) => _draftCard(rows[i]),
                      ),
                    ),
        ),
      ]),
    );
  }

  Widget _empty() {
    final searching = _query.isNotEmpty;
    return UiEmptyState(
      icon: searching ? Icons.search_off : Icons.edit_note_outlined,
      title: searching
          ? 'No draft matches "${_searchCtrl.text}"'
          : 'No drafts yet',
      message: searching
          ? null
          : 'Save items as a draft to come back to them before quoting.',
      actionLabel: searching ? 'Clear search' : 'Create draft',
      accent: _accent,
      onAction: searching ? _searchCtrl.clear : _createNewDraft,
    );
  }

  Widget _draftCard(DraftQuotation draft) {
    final edited = draft.lastModifiedDate ?? draft.createdDate;
    final converted = (draft.status ?? '').toLowerCase() == 'converted';

    return UiRailCard(
      rail: converted ? AppDesign.success : _accent,
      onTap: () => _open(draft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Text('DRAFT #${draft.id}',
                style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.ink)),
            const SizedBox(width: 6),
            if (converted)
              UiPill('QUOTED',
                  color: AppDesign.success, icon: Icons.check_circle),
            const Spacer(),
            Text('RM ${draft.netAmount.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: converted ? AppDesign.success : _accent,
                    letterSpacing: -0.3)),
            InkWell(
              onTap: () => _deleteDraft(draft),
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 0, 4),
                child: Icon(Icons.delete_outline,
                    size: 17, color: AppDesign.inkSubtle),
              ),
            ),
          ]),
          Text(draft.customerName ?? 'No customer',
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.info),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(
            [
              if (edited != null) _fmt.format(edited),
              '${draft.totalItems} item${draft.totalItems == 1 ? '' : 's'}',
              if (draft.totalQuantity > 0)
                '${_qty(draft.totalQuantity)} qty',
            ].join('  ·  '),
            style: const TextStyle(fontSize: 11, color: AppDesign.inkMuted),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _qty(double v) => Qty.fmt(v);
}
