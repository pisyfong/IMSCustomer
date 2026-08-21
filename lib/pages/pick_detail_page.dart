import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../models/inventory_item.dart';
import '../models/invoice.dart';
import '../models/in_stock_plu.dart';
import '../models/in_stock_location.dart';
import '../config/app_config.dart';
import '../services/customer_label.dart';
import 'pick_invoice_page.dart';
import '../services/shelf_service.dart';
import '../models/quote.dart';
import '../models/customer.dart';
import '../services/auth_service.dart';
import '../services/plu_service.dart';
import '../services/location_service.dart';
import '../services/offline_first_service.dart';
import '../services/base_transaction_sync_service.dart';
import '../services/pick_service.dart';
import '../services/pick_number_service.dart';
import '../models/receipt_template.dart';
import '../services/receipt_service.dart';
import '../widgets/receipt_preview_dialog.dart';
import '../widgets/save_status_dialog.dart';
import '../theme/app_design.dart';
import '../theme/sq_colors.dart';
import '../widgets/inventory_image_widget.dart';
import '../widgets/link_barcode_sheet.dart';
import 'barcode_scanner_page.dart';
import 'add_pick_items_sheet.dart';
import '../services/user_directory_service.dart';
import '../widgets/user_picker_sheet.dart';

const Color _cellDivider = Color(0xFFD9D9D9);

/// Detail view for a single Pick_List, modelled on the IMS Procurement
/// PD receiving screen:
///
///  * Pending / Picked segmented sub-tabs with a **Fill** flag chip —
///    when ON the pick popup pre-fills with the remaining balance.
///  * Table-style line tiles outlined in their source-SQ colour with a
///    `Pick n/m` progress badge per line.
///  * Tapping a line opens a PD-style bottom-sheet popup: item header +
///    image, tappable PICK / TOTAL value cells, custom number pad, and
///    an over-pick gate.
///
/// Nothing touches Isar until "Save pick" — adds, edits, and removes are
/// buffered in memory exactly like before.
/// One row in the grouped list: either a section header or a SKU card.
class _ListEntry {
  final String? header;
  final int count;
  final double qty;
  final _SkuGroup? group;
  const _ListEntry.header(this.header, this.count, this.qty) : group = null;
  const _ListEntry.card(this.group)
      : header = null,
        count = 0,
        qty = 0;
}

/// How the pick's line list is sectioned.
enum _GroupMode { none, customer, sq }

extension _GroupModeLabel on _GroupMode {
  String get label => switch (this) {
        _GroupMode.none => 'No grouping',
        _GroupMode.customer => 'Customer',
        _GroupMode.sq => 'SQ',
      };
  String get short => switch (this) {
        _GroupMode.none => 'Group',
        _GroupMode.customer => 'Customer',
        _GroupMode.sq => 'SQ',
      };
  IconData get icon => switch (this) {
        _GroupMode.none => Icons.layers_clear_outlined,
        _GroupMode.customer => Icons.person_outline,
        _GroupMode.sq => Icons.description_outlined,
      };
}

class PickDetailPage extends StatefulWidget {
  final PickList pick;

  /// True when [pick] hasn't been persisted to Isar yet (fresh from the
  /// "New pick" button). The header only gets written on Save — cancelling
  /// out of an empty draft leaves nothing behind.
  final bool draft;

  /// If non-null, the Add-items sheet is auto-opened on mount, pre-navigated
  /// to the SQ tab with this quote already selected.
  final String? initialSqPreLabel;

  const PickDetailPage({
    super.key,
    required this.pick,
    this.draft = false,
    this.initialSqPreLabel,
  });

  @override
  State<PickDetailPage> createState() => _PickDetailPageState();
}

class _PickDetailPageState extends State<PickDetailPage> {

  /// Invoices already raised from this pick, newest first.
  ///
  /// The server refuses a second conversion (it looks for an MP_Invoice whose
  /// App_DL_Prelabel is this pick), but a button that opens a whole allocation
  /// flow only to fail at the end is a poor way to say "already done". This
  /// lets the screen say it up front.
  List<String> _invoicedAs = [];

  bool get _alreadyInvoiced => _invoicedAs.isNotEmpty;
  String? _pendingSq; // initial SQ pre-label, consumed once

  /// 0 = Pending, 1 = Picked — PD-style segmented sub-tab.
  int _subTab = 0;

  /// Fill flag — when ON the pick popup opens with the remaining balance
  /// pre-filled; when OFF it starts at 0 (operator types the actual count).
  bool _prefillFromBalance = true;

  /// IDs of items that were originally loaded from Isar. Anything present
  /// here but missing from `_items` at Save time is deleted from the DB.
  final Set<int> _originalItemIds = <int>{};

  /// In-memory additions get unique negative sentinel ids until Save.
  int _memIdCounter = -1;

  /// Multi-select mode for mass receive / remove. Selection is by merged-line
  /// key ('$sku|$uom').
  bool _selectMode = false;
  final Set<String> _selectedKeys = <String>{};

  String _mergeKey(_MergedLine m) => '${m.skuNo}|${m.uom}';

  final _searchCtrl = TextEditingController();
  String _query = '';
  bool _byPlu = true; // true = PLU lookup (default), false = SKU lookup
  List<PickListItem> _items = [];
  final Map<int, TextEditingController> _controllers = {};
  final Map<int, String> _skuDescriptions = {};
  final Map<int, String> _skuPlus = {}; // fallback: first PLU per SKU
  /// Per-(SKU, UOM) PLU — a SKU can carry a different PLU per UOM. Key
  /// '$skuNo|$UOM' (UOM upper-cased).
  final Map<String, String> _skuUomPlu = {};

  String? _pluFor(int? sku, String? uom) {
    if (sku == null) return null;
    final k = '$sku|${(uom ?? '').toUpperCase()}';
    return _skuUomPlu[k] ?? _skuPlus[sku];
  }

  /// SKU -> shelf/bin string from In_Stock_Location, for the site this pick
  /// belongs to. This is what a picker actually walks to.
  final Map<int, String> _shelves = {};

  String? _shelfFor(int? sku) {
    if (sku == null) return null;
    final v = _shelves[sku];
    return (v == null || v.isEmpty) ? null : v;
  }

  /// Sort the working list by shelf position rather than document order.
  /// Implied whenever the shelf panel is open — walking order is the whole
  /// point of having it up.
  bool _sortByShelf = false;

  /// Whether the walk-order strip is showing.
  ///
  /// Deliberately not a dialog: a picker works down the racking one-handed,
  /// and a modal would have to be dismissed and reopened at every bay. The
  /// strip lives in the layout, so it never covers the row being typed into.
  bool _shelfPanelOpen = false;

  /// Active shelf filter — null = show everything.
  String? _shelfFilter;

  /// Distinct BINS on this pick, walking order, with a line count each.
  ///
  /// One item can sit in several bins ('W3-C11-1,W3-C12-1'), and it is
  /// counted under each — whichever bay the picker is standing at, the line
  /// is listed. Unshelved lines collect under a null key and sort last.
  /// (bin, lines still to pick, lines in total).
  ///
  /// The count that matters mid-pick is what is LEFT — a bay showing "4" when
  /// all four are in the trolley sends someone walking for nothing.
  List<({String? bin, int remaining, int total})> _shelfBuckets() {
    final remaining = <String?, int>{};
    final total = <String?, int>{};
    for (final g in _groupItems(_items)) {
      final done = _isMergedPicked(g);
      final bins = ShelfService.bins(_shelfFor(g.skuNo));
      for (final b in bins.isEmpty ? <String?>[null] : bins) {
        total[b] = (total[b] ?? 0) + 1;
        if (!done) remaining[b] = (remaining[b] ?? 0) + 1;
      }
    }
    final keys = total.keys.toList()
      ..sort((a, b) => ShelfService.compare(a, b));
    return [
      for (final k in keys)
        (bin: k, remaining: remaining[k] ?? 0, total: total[k]!)
    ];
  }

  /// Does this SKU sit in the bin currently filtered on?
  bool _inShelfFilter(int? sku) {
    final f = _shelfFilter;
    if (f == null) return true;
    final bins = ShelfService.bins(_shelfFor(sku));
    return bins.isEmpty ? false : bins.contains(f);
  }

  Future<void> _loadPlusForSkus(int cc, List<int> skus) async {
    if (skus.isEmpty) return;
    final pluRows = await isar.inStockPlus
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(skus, (q, sku) => q.skuNoEqualTo(sku))
        .findAll();
    for (final p in pluRows) {
      final sku = p.skuNo;
      final plu = p.pluNo;
      if (sku == null || plu.isEmpty) continue;
      final uom = (p.uom ?? '').toUpperCase();
      _skuUomPlu['$sku|$uom'] = plu;
      _skuPlus.putIfAbsent(sku, () => plu);
    }
  }
  String? _assignedName;

  /// How the line list is sectioned. A merged line can span several SQs, so
  /// those are filed under an explicit "multiple" bucket rather than guessing.
  _GroupMode _groupMode = _GroupMode.none;

  /// SQ -> customer code, and customer code -> name (for the section headers).
  final Map<String, String> _sqCustomer = {};
  final Map<String, String> _custName = {};
  bool _loading = true;
  bool _dirty = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _pendingSq = widget.initialSqPreLabel;
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text.trim().toLowerCase());
    });
    _load();
    _loadAssignedName();
    if (_pendingSq != null && _pendingSq!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _openAddSheet();
      });
    }
  }

  Future<void> _load() async {
    final all = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(widget.pick.companyCode)
        .and()
        .pickPreLabelEqualTo(widget.pick.pickPreLabel)
        .sortBySequenceNo()
        .findAll();
    // Hide local tombstones (status='X') — they exist only to carry the
    // removal to the server on the next sync.
    final rows = all.where((r) => r.status != 'X').toList();

    // Which invoices, if any, this pick already produced.
    final label = (widget.pick.pickPreLabel ?? '').trim();
    if (label.isNotEmpty && widget.pick.companyCode != null) {
      final inv = await isar.invoices
          .filter()
          .companyCodeEqualTo(widget.pick.companyCode!)
          .findAll();
      _invoicedAs = inv
          .where((e) => (e.appDLPrelabel ?? '').trim() == label)
          // A CANCELLED invoice (legacy marks it Status 'C' with Voided_By)
          // is not a conversion any more — voiding one is how a mistake gets
          // corrected, and the pick must become invoiceable again. The server
          // applies the same rule; this keeps the button honest rather than
          // refusing something the server would accept.
          .where((e) => (e.status ?? '').trim().toUpperCase() != 'C')
          .map((e) => e.invoicePreLabel)
          .toList()
        ..sort();
    }

    // Preserve controllers for lines we've already rendered.
    final keep = <int>{};
    for (final it in rows) {
      keep.add(it.id);
      _controllers.putIfAbsent(it.id, () => TextEditingController(
            // Blank = nothing picked yet, so tab logic reads it as pending.
            text: (it.pickQty ?? 0) == 0
                ? ''
                : _fmtQty(it.pickQty ?? 0),
          ));
    }
    for (final id in _controllers.keys.where((k) => !keep.contains(k)).toList()) {
      _controllers.remove(id)?.dispose();
    }

    final skus = rows.map((r) => r.skuNo).whereType<int>().toSet().toList();
    final cc = widget.pick.companyCode;
    if (skus.isNotEmpty && cc != null) {
      final invRows = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (q, sku) => q.skuNoEqualTo(sku))
          .findAll();
      for (final inv in invRows) {
        _skuDescriptions[inv.skuNo] = inv.description ?? '';
        final plu = inv.pluNo?.toString() ?? inv.altPlu;
        if (plu != null && plu.isNotEmpty) _skuPlus[inv.skuNo] = plu;
      }
      // Per-UOM PLUs from In_Stock_PLU (overrides the master fallback).
      await _loadPlusForSkus(cc, skus);

      // Each decoration loader is isolated. They run back to back on the same
      // await chain, so one throwing used to take the rest of _load() with it
      // — and the symptom (no shelf AND no customer) looked like two
      // unrelated features breaking at once rather than one failure upstream.
      try {
        final found = await ShelfService.forSkus(
            cc, skus, widget.pick.locationCode);
        _shelves.addAll(found);
        print('📍 PickDetail: ${found.length}/${skus.length} sku(s) have a '
            'shelf at "${widget.pick.locationCode}"');
      } catch (e) {
        print('❌ PickDetail: shelf load failed: $e');
      }
    }

    try {
      await _hydrateCustomers(rows);
      print('👤 PickDetail: ${_sqCustomer.length} sq→customer, '
          '${_custName.length} name(s) resolved');
    } catch (e) {
      print('❌ PickDetail: customer hydrate failed: $e');
    }

    _originalItemIds
      ..clear()
      ..addAll(rows.map((r) => r.id));

    if (!mounted) return;
    setState(() {
      _items = rows;
      _loading = false;
    });
  }


  /// Tappable "Assigned to" row — opens the searchable PI_Users picker.
  Widget _assignedRow() {
    final name = _assignedName ?? 'Unassigned';
    final unassigned = (widget.pick.assignedTo ?? 0) == 0;
    return InkWell(
      onTap: _pickAssignee,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Icon(Icons.person_outline,
                size: 13,
                color: unassigned ? AppDesign.inkSubtle : AppDesign.modPicking),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: unassigned ? AppDesign.inkSubtle : AppDesign.ink,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 16, color: AppDesign.inkSubtle),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAssignee() async {
    final picked = await UserPickerSheet.show(
      context,
      selectedUserId: widget.pick.assignedTo,
      accent: AppDesign.modPicking,
    );
    if (picked == null || !mounted) return;
    setState(() {
      widget.pick.assignedTo = picked.userId == 0 ? null : picked.userId;
      _assignedName = picked.userId == 0 ? 'Unassigned' : picked.displayName;
      _dirty = true;
    });
  }

  Future<void> _loadAssignedName() async {
    final n = await UserDirectoryService().nameFor(widget.pick.assignedTo);
    if (mounted) setState(() => _assignedName = n);
  }


  // ───────────────────────── Lifecycle ─────────────────────────
  // 'A'/null = open, 'C' = completed, 'X' = cancelled. Completion is EXPLICIT:
  // a short pick can be closed off deliberately, which is what unblocks the
  // queue when stock runs out.

  bool get _isCompleted => widget.pick.status == 'C';
  bool get _isCancelled => widget.pick.status == 'X';
  bool get _isClosed => _isCompleted || _isCancelled;

  /// Lines still short of their planned qty.
  int get _shortLines =>
      _groupItems(_items).where((m) => !_isMergedPicked(m)).length;

  /// Status pill in the header — tap to change state.
  Widget _lifecycleChip() {
    final (label, fg, bg, icon) = _isCancelled
        ? ('CANCELLED', AppDesign.danger, const Color(0xFFFEE2E2), Icons.block)
        : _isCompleted
            ? ('COMPLETED', AppDesign.success, const Color(0xFFDCFCE7),
                Icons.check_circle)
            : ('OPEN', AppDesign.modPicking, AppDesign.modPickingBg, Icons.radio_button_unchecked);
    return InkWell(
      onTap: _openLifecycleMenu,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: fg.withOpacity(0.35)),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 12, color: fg),
          const SizedBox(width: 3),
          Text(label,
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w900, color: fg)),
          Icon(Icons.arrow_drop_down, size: 14, color: fg),
        ]),
      ),
    );
  }

  /// Banner shown while the pick is closed — explains why it's read-only.
  Widget _closedBanner() {
    final c = _isCancelled ? AppDesign.danger : AppDesign.success;
    return Container(
      margin: const EdgeInsets.fromLTRB(
          AppDesign.space3, 0, AppDesign.space3, AppDesign.space2),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: c.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: c.withOpacity(0.3)),
      ),
      child: Row(children: [
        Icon(_isCancelled ? Icons.block : Icons.lock_outline, size: 15, color: c),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            _isCancelled
                ? 'This pick was cancelled — it is read-only.'
                : 'This pick is completed — it is read-only.',
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.w600, color: c),
          ),
        ),
        TextButton(
          onPressed: _saving ? null : () => _setLifecycle('A'),
          style: TextButton.styleFrom(
              foregroundColor: c,
              minimumSize: const Size(0, 28),
              padding: const EdgeInsets.symmetric(horizontal: 8)),
          child: const Text('Reopen',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
        ),
      ]),
    );
  }


  /// Packs (not themselves cancelled) that were built from this pick. Cancelling
  /// the pick voids their allocation, so the user is warned first.
  Future<List<String>> _dependentPacks() async {
    final cc = widget.pick.companyCode;
    final label = widget.pick.pickPreLabel;
    if (cc == null || label == null || label.isEmpty) return const [];
    final lines = await isar.packListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .parentPreLabelEqualTo(label)
        .findAll();
    if (lines.isEmpty) return const [];
    final labels = lines
        .where((e) => e.status != 'X')
        .map((e) => e.packPreLabel)
        .whereType<String>()
        .toSet();
    // One query for all candidate headers rather than one per label.
    final headers = await isar.packLists
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels.toList(), (q, l) => q.packPreLabelEqualTo(l))
        .findAll();
    final live = headers
        .where((h) => h.status != 'X')
        .map((h) => h.packPreLabel)
        .whereType<String>()
        .toList()
      ..sort();
    return live;
  }


  String _cancelMessage(List<String> deps) {
    final base = 'It becomes read-only, its allocation returns to the SQ, and '
        'its quantities stop counting as picked. You can reopen it later.';
    if (deps.isEmpty) return base;
    final warn = '${deps.length} pack(s) were built from this pick '
        '(${deps.join(", ")}). They will not be able to upload changes until '
        'this pick is reopened.';
    return '$base\n\n⚠ $warn';
  }

  Future<void> _openLifecycleMenu() async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pick status',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
            ),
          ),
          if (!_isClosed) ...[
            ListTile(
              dense: true,
              leading: const Icon(Icons.check_circle_outline,
                  size: 19, color: AppDesign.success),
              title: const Text('Mark as completed',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: Text(
                  _shortLines > 0
                      ? '$_shortLines item(s) not fully picked — allowed'
                      : 'All items picked',
                  style: const TextStyle(fontSize: 11)),
              onTap: () => Navigator.pop(context, 'C'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.block, size: 19, color: AppDesign.danger),
              title: const Text('Cancel pick',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: const Text('Closes it without picked the rest',
                  style: TextStyle(fontSize: 11)),
              onTap: () => Navigator.pop(context, 'X'),
            ),
          ] else
            ListTile(
              dense: true,
              leading: const Icon(Icons.lock_open_outlined, size: 19),
              title: const Text('Reopen',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: const Text('Make it editable again',
                  style: TextStyle(fontSize: 11)),
              onTap: () => Navigator.pop(context, 'A'),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (choice != null && mounted) await _setLifecycle(choice);
  }

  /// Apply a lifecycle transition: confirm → persist → push to the server.
  Future<void> _setLifecycle(String status) async {
    if (status == 'C' && _shortLines > 0) {
      final go = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Complete anyway?'),
          content: Text('$_shortLines item(s) are not fully picked. '
              'Completing closes the pick with the quantities entered.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: const Text('Cancel')),
            TextButton(
                onPressed: () => Navigator.pop(c, true),
                child: const Text('Complete')),
          ],
        ),
      );
      if (go != true) return;
    }
    if (status == 'X') {
      final deps = await _dependentPacks();
      if (!mounted) return;
      final go = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Cancel this pick?'),
          content: Text(_cancelMessage(deps)),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: const Text('Keep open')),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: AppDesign.danger),
              onPressed: () => Navigator.pop(c, true),
              child: const Text('Cancel pick'),
            ),
          ],
        ),
      );
      if (go != true) return;
    }
    if (!mounted) return;

    setState(() {
      widget.pick.status = status;
      _dirty = true;
    });
    // Persist (this also mints a number on a first-ever save) then upload so
    // the state is not stranded on this device.
    await _save(silent: true);
    if (!mounted) return;

    final label = widget.pick.pickPreLabel;
    if (label != null && label.isNotEmpty) {
      final svc = PickService();
      final r = await svc.syncPicksByPreLabels([label]);
      if (!mounted) return;
      final ok = (r['synced'] ?? 0) > 0;
      final err = svc.lastErrors[label];
      // A successful upload can still have dropped lines that were deleted
      // elsewhere — say so, or they just vanish off the screen.
      final notice = svc.lastNotices[label];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: (ok && notice == null)
            ? AppDesign.success
            : AppDesign.warning,
        content: Text(ok
            ? [
                status == 'C'
                    ? 'Completed $label'
                    : status == 'X'
                        ? 'Cancelled $label'
                        : 'Reopened $label',
                // Lines the server dropped because they were deleted
                // elsewhere — otherwise they'd just vanish off the list.
                if (notice != null) notice,
              ].join(' — ')
            : (err ?? 'Saved locally — will upload on next sync')),
      ));
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  static String _fmtQty(double v) {
    if (v == 0) return '0';
    final s = v.toStringAsFixed(2);
    return s.replaceFirst(RegExp(r'\.?0+$'), '');
  }

  double _entered(PickListItem it) {
    final txt = _controllers[it.id]?.text ?? '';
    return double.tryParse(txt) ?? 0;
  }

  bool _matchesSearch(PickListItem it) {
    if (_query.isEmpty) return true;
    final desc = (_skuDescriptions[it.skuNo ?? -1] ?? '').toLowerCase();
    final sku = (it.skuNo ?? '').toString();
    final plu = (_pluFor(it.skuNo, it.uom) ?? '').toLowerCase();
    final uom = (it.uom ?? '').toLowerCase();
    return desc.contains(_query) ||
        sku.contains(_query) ||
        plu.contains(_query) ||
        uom.contains(_query);
  }

  // ─────────────────────── Merged-line grouping ──────────────────────────
  // The same SKU+UOM can appear on several source SQ rows. We keep those as
  // separate PickListItem records (each maps to one SQ line so the balance
  // split + save stay per-SQ), but DISPLAY them as one merged line: summed
  // planned/picked qty and every source SQ tag together.

  /// Group `_items` (already filtered) by (skuNo, uom), preserving order.
  List<_MergedLine> _groupItems(List<PickListItem> src) {
    final order = <String>[];
    final map = <String, List<PickListItem>>{};
    for (final it in src) {
      final key = '${it.skuNo}|${it.uom}';
      if (!map.containsKey(key)) {
        map[key] = [];
        order.add(key);
      }
      map[key]!.add(it);
    }
    return order.map((k) {
      final items = map[k]!
        ..sort((a, b) => (a.sequenceNo ?? 0).compareTo(b.sequenceNo ?? 0));
      return _MergedLine(items.first.skuNo, items.first.uom, items);
    }).toList();
  }

  double _plannedOf(_MergedLine m) =>
      m.items.fold(0.0, (s, it) => s + (it.qty ?? 0));

  double _pickedOf(_MergedLine m) =>
      m.items.fold(0.0, (s, it) => s + _entered(it));

  bool _isMergedPicked(_MergedLine m) {
    final planned = _plannedOf(m);
    final picked = _pickedOf(m);
    if (planned <= 0) return picked > 0;
    return picked >= planned;
  }

  /// Distinct source SQ pre-labels for the group, in first-seen order.
  /// A null entry means the item has no source SQ (added from inventory).
  List<String?> _sqTagsOf(_MergedLine m) {
    final seen = <String?>[];
    for (final it in m.items) {
      final p = (it.parentPreLabel ?? '').isEmpty ? null : it.parentPreLabel;
      if (!seen.contains(p)) seen.add(p);
    }
    return seen;
  }

  /// The merged line's outline colour: the SQ colour when every constituent
  /// item shares one SQ, else a neutral grey (mixed sources).
  Color _mergedOutline(_MergedLine m) {
    final tags = _sqTagsOf(m);
    if (tags.length == 1) return SqColors.fg(tags.first);
    return AppDesign.borderStrong;
  }

  // ─────────────────────────── Scan / search resolve ─────────────────────

  Future<void> _scanReceive() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || code.isEmpty || !mounted) return;
    await _resolveAndReceive(code);
  }

  Future<void> _resolveAndReceive(String code) async {
    final cc = widget.pick.companyCode;

    // 1) Is this an SQ pre-label? If so, jump straight into the add-items
    //    flow pre-navigated to that SQ so the picker can pull its lines in.
    if (cc != null) {
      final sq = await isar.quotes
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .quotePreLabelEqualTo(code.trim())
          .findFirst();
      if (sq != null) {
        _searchCtrl.clear();
        if (!mounted) return;
        await _openAddSheet(sqPreLabel: sq.quotePreLabel);
        return;
      }
    }

    // 2) Otherwise treat it as a SKU / PLU and match an existing line.
    //    A PLU resolves to BOTH a SKU and a UOM (via In_Stock_PLU), so we can
    //    open the exact (SKU, UOM) line rather than guessing.
    int? targetSku;
    String? targetUom;

    if (_byPlu) {
      if (cc != null) {
        final plu = await isar.inStockPlus
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .pluNoEqualTo(code.trim())
            // A CANCELLED barcode must not resolve: it would scan as whatever
            // it used to mean. Nearly half this table is cancelled.
            .and()
            .not()
            .statusEqualTo('C')
            .findFirst();
        targetSku = plu?.skuNo;
        targetUom = plu?.uom;
        // Fallback: legacy master lookup by numeric PLU (no UOM available).
        if (targetSku == null) {
          final asInt = int.tryParse(code);
          if (asInt != null) {
            final inv = await isar.inventoryItems
                .filter()
                .companyCodeEqualTo(cc)
                .and()
                .pluNoEqualTo(asInt)
                .findFirst();
            targetSku = inv?.skuNo;
          }
        }
      }
    } else {
      targetSku = int.tryParse(code);
    }

    if (!mounted) return;

    // Couldn't resolve to a known SKU → jump into the add flow so the user
    // can search/add it manually (pre-search the raw code).
    if (targetSku == null) {
      // An unknown barcode is usually a KNOWN item wearing a code the system
      // has never seen — a new case code, or a supplier changing packaging.
      // Offer to attach it to a line on this pick rather than dead-ending:
      // the goods are in the picker's hand, so this is the moment when the
      // link can be made correctly and by someone who can see both.
      final linked = await _offerLinkBarcode(code.trim());
      if (linked != null) {
        targetSku = linked.$1;
        targetUom = linked.$2;
      } else {
        if (!AppConfig.enableLooseItems) {
          // Phase 1: no loose items. A code that matches nothing on the pick
          // is a dead end, not a doorway into the inventory.
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('"$code" is not on this pick.')),
            );
          }
          return;
        }
        await _openAddSheet(inventoryCode: code.trim());
        return;
      }
    }

    final groups = _groupItems(_items);
    final skuLines = groups.where((g) => g.skuNo == targetSku).toList();

    // SKU resolved but isn't on this pick → bring the user straight to the
    // add-item popup, pre-searched to this SKU (auto-opens the qty/UOM
    // dialog on a single match), defaulting to the scanned PLU's UOM.
    if (skuLines.isEmpty) {
      if (!AppConfig.enableLooseItems) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('SKU $targetSku is not on this pick.')),
        );
        return;
      }
      await _openAddSheet(inventoryCode: '$targetSku', inventoryUom: targetUom);
      return;
    }

    // Exact (SKU, UOM) match → open it.
    if (targetUom != null && targetUom.isNotEmpty) {
      final exact = skuLines.where(
          (g) => (g.uom ?? '').toUpperCase() == targetUom!.toUpperCase());
      if (exact.isNotEmpty) {
        await _openReceiveSheet(exact.first);
        return;
      }

      // SKU is on the pick but only under other UOM(s) — warn, don't guess.
      final availableUoms =
          skuLines.map((g) => g.uom ?? '?').toSet().join(', ');
      final proceed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded,
                  color: AppDesign.warning, size: 20),
              SizedBox(width: 8),
              Text('UOM mismatch'),
            ],
          ),
          content: Text(
            'You scanned a "$targetUom" barcode for SKU $targetSku, '
            'but this pick only has it as "$availableUoms".\n\n'
            'Open the $availableUoms line anyway?',
            style: const TextStyle(fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.modPicking,
                  foregroundColor: Colors.white),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text('Open $availableUoms'),
            ),
          ],
        ),
      );
      if (proceed == true && mounted) {
        await _openReceiveSheet(skuLines.first);
      }
      return;
    }

    // No UOM info from the code (SKU-mode scan or legacy PLU) → open the
    // single SKU line, or if multiple UOMs exist just open the first.
    await _openReceiveSheet(skuLines.first);
  }

  // ─────────────────────────── PD-style receive popup ────────────────────

  /// PD-receiving-style popup for a MERGED line.
  ///
  /// Layout: header (description + close) → image + info tags → a big
  /// tappable TOTAL cell → a per-SQ grid (one editable row per source SQ) →
  /// custom number pad.
  ///
  /// The active field is either `total` (waterfall: typing distributes
  /// fill-first across the SQ rows) or a specific SQ row (direct edit of
  /// that line). Whichever you touch, the other side re-derives so the grid
  /// and the total always agree. Confirm writes each SQ row's qty back to
  /// its own list controller — the split is preserved on save.
  Future<void> _openReceiveSheet(_MergedLine m) async {
    final double planned = _plannedOf(m);

    // One sheet-local controller per constituent SQ row, seeded from the
    // current picked value (or the row's planned qty when Fill is on).
    final rowCtrls = <int, TextEditingController>{};
    for (final it in m.items) {
      final current = _entered(it);
      final seed = _prefillFromBalance ? (it.qty ?? 0) : current;
      rowCtrls[it.id] = TextEditingController(text: _fmtQty(seed));
    }
    double sumRows() => m.items.fold<double>(
        0, (s, it) => s + (double.tryParse(rowCtrls[it.id]!.text) ?? 0));
    final totalCtrl = TextEditingController(text: _fmtQty(sumRows()));

    final desc = _skuDescriptions[m.skuNo ?? -1] ?? '';
    final plu = _pluFor(m.skuNo, m.uom);
    final headColor = _mergedOutline(m);
    final singleSq = m.items.length == 1;

    // Active field: 'total' or 'row_<itemId>'.
    String activeField = 'total';
    bool freshInput = true;

    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
      ),
      builder: (ctx) => StatefulBuilder(builder: (ctx, setSheet) {
        TextEditingController activeCtrl() {
          if (activeField == 'total') return totalCtrl;
          final id = int.tryParse(activeField.substring(4));
          return rowCtrls[id] ?? totalCtrl;
        }

        // Distribute the TOTAL across the SQ rows, fill-first.
        void waterfall() {
          double remaining = double.tryParse(totalCtrl.text) ?? 0;
          final n = m.items.length;
          for (var i = 0; i < n; i++) {
            final it = m.items[i];
            final rowPlanned = it.qty ?? 0;
            double give;
            if (i == n - 1) {
              give = remaining;
            } else if (rowPlanned <= 0) {
              give = 0;
            } else {
              give = remaining >= rowPlanned ? rowPlanned : remaining;
              if (give < 0) give = 0;
            }
            remaining -= give;
            rowCtrls[it.id]!.text = _fmtQty(give < 0 ? 0 : give);
          }
        }

        // After any keypad write, reconcile the two sides.
        void reconcile() {
          if (activeField == 'total') {
            waterfall();
          } else {
            totalCtrl.text = _fmtQty(sumRows());
          }
        }

        Widget valueCell({
          required String value,
          required String suffix,
          required Color color,
          required bool active,
          required VoidCallback onTap,
          double fontSize = 14,
        }) {
          return InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: active ? color.withOpacity(0.16) : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: active ? color : color.withOpacity(0.35),
                  width: active ? 1.2 : 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      value.isEmpty ? '0' : value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w800,
                        color: color,
                        height: 1.1,
                      ),
                    ),
                  ),
                  if (suffix.isNotEmpty) ...[
                    const SizedBox(width: 4),
                    Text(
                      suffix,
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.inkSubtle,
                        letterSpacing: 0.3,
                        height: 1.0,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }

        // Per-SQ grid row.
        Widget sqRow(PickListItem it) {
          final rowPlanned = it.qty ?? 0;
          final c = SqColors.fg(it.parentPreLabel);
          final key = 'row_${it.id}';
          final entered = double.tryParse(rowCtrls[it.id]!.text) ?? 0;
          final complete = rowPlanned > 0 && entered >= rowPlanned;
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Container(
                  // Bounded: the label now carries the customer name, which is
                  // long enough to crowd out the quantity cells if left free.
                  constraints: const BoxConstraints(maxWidth: 150),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    () {
                      final sq = it.parentPreLabel ?? '';
                      final code = _sqCustomer[sq] ?? '';
                      return CustomerLabel.sqWithCustomer(
                          sq, code, _custName[code]);
                    }(),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: c),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Text(
                  'plan ${_fmtQty(rowPlanned)}',
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 84,
                  child: valueCell(
                    value: rowCtrls[it.id]!.text,
                    suffix: complete ? '✓' : '',
                    color: complete ? AppDesign.success : AppDesign.modPicking,
                    active: activeField == key,
                    fontSize: 13,
                    onTap: () => setSheet(() {
                      activeField = key;
                      freshInput = true;
                    }),
                  ),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header — description + close.
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        desc.isNotEmpty ? desc : 'SKU ${m.skuNo ?? "?"}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.ink,
                          letterSpacing: -0.3,
                          height: 1.15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(ctx, false),
                      borderRadius: BorderRadius.circular(16),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.close_rounded, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Image + info tags.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.pick.companyCode != null && m.skuNo != null)
                      InventoryImageWidget(
                        companyCode: widget.pick.companyCode!,
                        skuNo: m.skuNo!,
                        uom: m.uom,
                        width: 56,
                        height: 56,
                        borderRadius: BorderRadius.circular(8),
                        showLoadingIndicator: false,
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 3,
                        children: [
                          _infoTag(m.uom ?? '?', headColor),
                          if (plu != null) _infoTag('PLU $plu', headColor),
                          _infoTag('SKU ${m.skuNo}', headColor),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // TOTAL cell — tap to type a combined qty (waterfalls).
                Row(
                  children: [
                    const Expanded(
                      child: Text('TOTAL PICK',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppDesign.inkSubtle,
                            letterSpacing: 0.5,
                          )),
                    ),
                    SizedBox(
                      width: 120,
                      child: valueCell(
                        value: totalCtrl.text,
                        suffix: '/ ${_fmtQty(planned)}',
                        color: AppDesign.info,
                        active: activeField == 'total',
                        fontSize: 16,
                        onTap: () => setSheet(() {
                          activeField = 'total';
                          freshInput = true;
                        }),
                      ),
                    ),
                  ],
                ),
                // Per-SQ grid — only meaningful when >1 SQ; still shown for
                // one so the layout is consistent and the row is editable.
                if (!singleSq) ...[
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text('BY SQ',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: AppDesign.inkSubtle,
                            letterSpacing: 0.5,
                          )),
                    ],
                  ),
                  const SizedBox(height: 6),
                  for (final it in m.items) sqRow(it),
                ],
                const SizedBox(height: 8),
                _NumberPad(
                  onDigit: (d) {
                    final c = activeCtrl();
                    final cur = c.text;
                    c.text = (freshInput || cur == '0') ? d : '$cur$d';
                    freshInput = false;
                    reconcile();
                    setSheet(() {});
                  },
                  onDecimal: () {
                    final c = activeCtrl();
                    if (c.text.contains('.')) return;
                    c.text =
                        (freshInput || c.text.isEmpty) ? '0.' : '${c.text}.';
                    freshInput = false;
                    reconcile();
                    setSheet(() {});
                  },
                  onBackspace: () {
                    final c = activeCtrl();
                    final cur = c.text;
                    c.text = cur.length <= 1
                        ? '0'
                        : cur.substring(0, cur.length - 1);
                    freshInput = false;
                    reconcile();
                    setSheet(() {});
                  },
                  onConfirm: () async {
                    final total = double.tryParse(totalCtrl.text) ?? 0;
                    const eps = 0.0001;
                    // Over-picking is allowed — the warehouse legitimately
                    // sends more than the quote asked for. It is confirmed
                    // rather than refused, so it can never happen by a
                    // mis-keyed digit going unnoticed.
                    if (planned > 0 && total > planned + eps) {
                      final over = total - planned;
                      final go = await showDialog<bool>(
                        context: ctx,
                        builder: (c) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: const Text('Over pick'),
                          content: Text(
                              'Picking ${_fmtQty(total)} against a planned '
                              '${_fmtQty(planned)} — ${_fmtQty(over)} more than '
                              'the quote asks for.  '
                              'This is allowed and will be invoiced as picked. '
                              'Continue?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(c, false),
                              child: const Text('Go back'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppDesign.warning,
                                  foregroundColor: Colors.white),
                              onPressed: () => Navigator.pop(c, true),
                              child: const Text('Yes, over pick'),
                            ),
                          ],
                        ),
                      );
                      if (go != true) return;
                    }
                    Navigator.pop(ctx, true);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );

    if (confirmed == true) {
      // Write each SQ row's qty back to its own list controller.
      for (final it in m.items) {
        final v = double.tryParse(rowCtrls[it.id]!.text) ?? 0;
        _controllers[it.id]?.text = _fmtQty(v);
      }
      setState(() => _dirty = true);
    }
    for (final c in rowCtrls.values) {
      c.dispose();
    }
    totalCtrl.dispose();
  }

  Widget _infoTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: color,
          letterSpacing: 0.3,
          height: 1.0,
        ),
      ),
    );
  }

  // ─────────────────────────── Add / save / remove ───────────────────────

  Future<void> _openAddSheet(
      {String? sqPreLabel, String? inventoryCode, String? inventoryUom}) async {
    if (widget.pick.companyCode == null) return;
    // An explicit SQ (from a scan/search hit) takes priority over the
    // one-shot pending SQ carried in from the "scan an SQ on the hub" flow.
    final consumingSq = sqPreLabel ?? _pendingSq;
    if (sqPreLabel == null && _pendingSq != null) _pendingSq = null; // one-shot

    final added = await showModalBottomSheet<List<PickListItem>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddPickItemsSheet(
        pick: widget.pick,
        initialSqPreLabel: consumingSq,
        initialInventoryCode: inventoryCode,
        initialInventoryUom: inventoryUom,
        existingItems: List<PickListItem>.from(_items),
      ),
    );
    if (added == null || added.isEmpty) return;

    final maxSeq = _items
        .map((e) => e.sequenceNo ?? 0)
        .fold<int>(0, (a, b) => a > b ? a : b);
    var seq = maxSeq;
    for (final it in added) {
      it.id = _memIdCounter--;
      seq += 1;
      it.sequenceNo = seq;
      _items.add(it);
      _controllers.putIfAbsent(
          it.id,
          () => TextEditingController(
              text: (it.pickQty ?? 0) == 0 ? '' : _fmtQty(it.pickQty ?? 0)));
      final sku = it.skuNo;
      if (sku != null && !_skuDescriptions.containsKey(sku)) {
        _hydrateLookupsFor(sku);
      }
    }
    setState(() => _dirty = true);

    // Hydrate the DECORATIONS for the lines just added.
    //
    // _load() reads persisted rows, but these live only in the in-memory
    // buffer until Save — so without this the newly added lines showed no
    // shelf and no customer, and grouping by customer filed them all under
    // "No customer". Descriptions were hydrated per-SKU above and looked
    // fine, which is what made the gap look like a shelf/customer bug rather
    // than a "not saved yet" one.
    final cc = widget.pick.companyCode;
    final newSkus =
        added.map((e) => e.skuNo).whereType<int>().toSet().toList();
    if (cc != null && newSkus.isNotEmpty) {
      try {
        final found = await ShelfService.forSkus(
            cc, newSkus, widget.pick.locationCode);
        _shelves.addAll(found);
        print('📍 PickDetail(add): ${found.length}/${newSkus.length} sku(s) '
            'have a shelf at "${widget.pick.locationCode}"');
      } catch (e) {
        print('❌ PickDetail: shelf load (added lines) failed: $e');
      }
    }
    try {
      await _hydrateCustomers(added);
      print('👤 PickDetail(add): ${_sqCustomer.length} sq→customer, '
          '${_custName.length} name(s) resolved');
    } catch (e) {
      print('❌ PickDetail: customer hydrate (added lines) failed: $e');
    }
    if (mounted) setState(() {});
  }


  /// Resolve each line's source SQ -> customer code -> name so the list can be
  /// grouped by customer (several SQs can share one customer).
  Future<void> _hydrateCustomers(List<PickListItem> rows) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    final sqs = rows
        .map((r) => r.parentPreLabel)
        .whereType<String>()
        .where((s) => s.isNotEmpty && !_sqCustomer.containsKey(s))
        .toSet()
        .toList();
    if (sqs.isEmpty) return;
    final quotes = await isar.quotes
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(sqs, (q, s) => q.quotePreLabelEqualTo(s))
        .findAll();
    final codes = <String>{};
    for (final q in quotes) {
      final label = q.quotePreLabel;
      if (label == null) continue;
      final cust = q.customer;
      _sqCustomer[label] = cust ?? '';
      if (cust != null && cust.isNotEmpty && !_custName.containsKey(cust)) {
        codes.add(cust);
      }
    }
    if (codes.isNotEmpty) {
      // Resolved by CODE ALONE, deliberately not scoped to this company.
      //
      // AR_Customer is partitioned by Company_Code, but quote references cross
      // those partitions: a company-1 quote can name a customer filed under
      // company 4. Scoping the lookup found only 31% of them and left the rest
      // showing a bare code. Codes are effectively unique across the master
      // file, so a code-only match resolves 99.9% of references.
      final custs = await isar.customers
          .filter()
          .anyOf(codes.toList(), (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final c in custs) {
        final name = (c.name ?? '').trim();
        if (name.isEmpty) continue;
        // If a code somehow exists under several companies, the row belonging
        // to THIS company wins; otherwise first non-empty name found.
        if (c.companyCode == cc || !_custName.containsKey(c.code)) {
          _custName[c.code] = name;
        }
      }
    }
    if (mounted) setState(() {});
  }

  /// Grouping selector chip.
  /// Opens the floating shelf panel (and with it, walking order).
  Widget _shelfSortChip() {
    final on = _shelfPanelOpen;
    final c = on ? AppDesign.modPicking : AppDesign.inkMuted;
    return InkWell(
      onTap: () => setState(() {
        _shelfPanelOpen = !_shelfPanelOpen;
        // Opening implies walking order; closing drops the filter so the
        // list can never be left silently hiding lines.
        _sortByShelf = _shelfPanelOpen;
        if (!_shelfPanelOpen) _shelfFilter = null;
      }),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: on ? AppDesign.modPicking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on ? AppDesign.modPicking.withOpacity(0.5) : AppDesign.border,
          ),
        ),
        // Icon only — the strip below already names the bays, so a label
        // here would just repeat it and crowd the toolbar. A dot marks an
        // active filter, since a filtered list must never look complete.
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.shelves, size: 16, color: c),
            if (_shelfFilter != null)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppDesign.warning,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _groupChip() {
    final on = _groupMode != _GroupMode.none;
    return InkWell(
      onTap: _pickGroupMode,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: on ? AppDesign.modPicking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on
                ? AppDesign.modPicking.withOpacity(0.5)
                : AppDesign.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(on ? _groupMode.icon : Icons.workspaces_outline,
                size: 14,
                color: on ? AppDesign.modPicking : AppDesign.inkMuted),
            const SizedBox(width: 3),
            Text(_groupMode.short,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: on ? AppDesign.modPicking : AppDesign.inkMuted,
                  letterSpacing: 0.3,
                )),
            Icon(Icons.arrow_drop_down,
                size: 14,
                color: on ? AppDesign.modPicking : AppDesign.inkMuted),
          ],
        ),
      ),
    );
  }

  Future<void> _pickGroupMode() async {
    final chosen = await showModalBottomSheet<_GroupMode>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Group items by',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
          for (final m in _GroupMode.values)
            ListTile(
              dense: true,
              leading: Icon(m.icon, size: 18),
              title: Text(m.label,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
              trailing: _groupMode == m
                  ? const Icon(Icons.check, color: AppDesign.modPicking)
                  : null,
              onTap: () => Navigator.pop(context, m),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (chosen != null && mounted) setState(() => _groupMode = chosen);
  }

  /// Section label for a merged line under the active grouping.
  String _groupLabelFor(_MergedLine m) {
    final sqs = m.items
        .map((e) => e.parentPreLabel)
        .whereType<String>()
        .where((e) => e.isNotEmpty)
        .toSet();
    switch (_groupMode) {
      case _GroupMode.sq:
        if (sqs.isEmpty) return 'No SQ';
        // Grouping BY the SQ still names the customer: the quote number alone
        // tells a picker nothing about whose goods these are.
        if (sqs.length == 1) {
          final sq = sqs.first;
          final code = _sqCustomer[sq] ?? '';
          return CustomerLabel.sqWithCustomer(sq, code, _custName[code]);
        }
        return 'Multiple SQs';
      case _GroupMode.customer:
        final names = sqs
            .map((sq) {
              final code = _sqCustomer[sq] ?? '';
              if (code.isEmpty) return '';
              return CustomerLabel.format(code, _custName[code]);
            })
            .where((e) => e.isNotEmpty)
            .toSet();
        if (names.isEmpty) return CustomerLabel.unknown;
        return names.length == 1 ? names.first : 'Multiple customers';
      case _GroupMode.none:
        return '';
    }
  }

  Widget _sectionHeader(String label, int lines, double qty) {
    const c = AppDesign.modPicking;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: c.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(_groupMode.icon, size: 13, color: c),
            const SizedBox(width: 5),
            Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800, color: c)),
            ),
          ]),
          const SizedBox(height: 1),
          Text('$lines item${lines > 1 ? "s" : ""} · qty ${_fmtQty(qty)}',
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.inkMuted)),
        ],
      ),
    );
  }

  Future<void> _hydrateLookupsFor(int sku) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    final inv = await isar.inventoryItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .skuNoEqualTo(sku)
        .findFirst();
    await _loadPlusForSkus(cc, [sku]);
    if (inv != null && mounted) {
      setState(() {
        _skuDescriptions[sku] = inv.description ?? '';
        final plu = inv.pluNo?.toString() ?? inv.altPlu;
        if (plu != null && plu.isNotEmpty) _skuPlus.putIfAbsent(sku, () => plu);
      });
    } else if (mounted) {
      setState(() {});
    }
  }

  Future<void> _save({bool silent = false}) async {
    if (_saving) return;
    if (_items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add at least one item before saving')),
      );
      return;
    }
    setState(() => _saving = true);

    // Whether this save STARTS a new change-set. Drives the upload
    // token below — see the comment there.
    final wasSynced = widget.pick.isSynced;

    // Status dialog: the operator sees the local write and the upload as two
    // distinct steps, because they fail independently and only the second one
    // depends on coverage. `silent` saves (e.g. save-before-print) skip it.
    final status = silent ? null : SaveStatusController();
    if (status != null) {
      SaveStatusDialog.show(
        context,
        controller: status,
        accent: AppDesign.modPicking,
        onRetry: () => _uploadNow(status),
      );
    }

    double totalQty = 0;
    int totalItems = 0;
    final userId = AuthService().currentUser?.userId;
    final now = DateTime.now();
    final cc = widget.pick.companyCode ?? 0;
    // Mint the pick number HERE (first save) — a draft that's abandoned never
    // consumes one.
    var label = widget.pick.pickPreLabel ?? '';
    if (label.isEmpty) {
      label = await PickNumberService().nextPickNumber();
      widget.pick.pickPreLabel = label;
    }

    // Assign DETERMINISTIC Isar ids (same scheme the download sync uses) so
    // when the server copy syncs back it upserts over these rows instead of
    // creating duplicates.
    for (final it in _items) {
      final v = double.tryParse(_controllers[it.id]?.text ?? '') ?? 0;
      it.pickQty = v;
      it.pickPreLabel = label; // draft items get the number now
      it.lastWriteTimeStamp = now;
      it.lastModifiedBy = userId;
      it.isSynced = false;
      // Count every line; only sum the quantity actually entered. Counting
      // only picked lines under-reported the document (and disagreed with the
      // hub and the receipt, which count all lines).
      totalItems++;
      totalQty += v;
      it.id = BaseTransactionSyncService.pickListItemId(
        it.companyCode ?? cc,
        label,
        it.skuNo ?? 0,
        it.uom ?? '',
        it.parentPreLabel ?? '',
      );
    }

    // Header Location_Code: keep the existing one, else derive from the
    // first item that carries a location (SQ lines bring their location).
    String? headerLoc = widget.pick.locationCode;
    // A new document belongs to the location being worked in; only fall back
    // to a line's location when nothing is selected.
    if (headerLoc == null || headerLoc.isEmpty) {
      headerLoc = await LocationService().selectedCode();
    }
    if (headerLoc == null || headerLoc.isEmpty) {
      for (final it in _items) {
        final l = it.locationCode;
        if (l != null && l.isNotEmpty) {
          headerLoc = l;
          break;
        }
      }
    }

    // Backfill any item missing a location with the resolved header location.
    if (headerLoc != null && headerLoc.isNotEmpty) {
      for (final it in _items) {
        if (it.locationCode == null || it.locationCode!.isEmpty) {
          it.locationCode = headerLoc;
        }
      }
    }

    final oldHeaderId = widget.pick.id;
    final headerId = BaseTransactionSyncService.pickListId(cc, label);
    final header = widget.pick
      ..id = headerId
      ..locationCode = headerLoc
      ..totalPickQty = totalQty
      ..totalPickItem = totalItems
      ..lastWriteTimeStamp = now
      ..lastModifiedBy = userId
      // Idempotency token. Minted only when this save starts a NEW change-set
      // (the document was synced, or has no token yet). A fresh token per save
      // meant that if an upload applied server-side but its response was lost,
      // saving again produced a token the server had never seen — so the same
      // delta applied twice. Holding the token until an upload actually lands
      // lets the server recognise the retry; PickService/PackService then
      // handle the `duplicate` response by re-baselining and sending only what
      // is genuinely left.
      ..uploadToken = (wasSynced || (widget.pick.uploadToken ?? '').isEmpty)
          ? 'pk-${headerId.toRadixString(16)}-${now.microsecondsSinceEpoch}'
          : widget.pick.uploadToken
      ..isSynced = false;

    // Rows to remove: previously-loaded item ids no longer present, plus a
    // stale header row if the header id changed (e.g. first save of a pick
    // that was created with an autoIncrement id).
    final keepIds = _items.map((e) => e.id).toSet();
    final toDelete = _originalItemIds.difference(keepIds).toList();

    // A row the server already knows about must leave a TOMBSTONE, not just
    // vanish locally — a hard delete here would drop the line on this device
    // while it lived on forever on the server. `_removeMerged` gets this right
    // for the normal remove path; this is the safety net for every other way a
    // row can fall out of `_items` (re-key on first save, lines excluded at
    // save time, future callers).
    final orphans = toDelete.isEmpty
        ? <PickListItem>[]
        : await isar.pickListItems.getAll(toDelete);
    final tombstone = <PickListItem>[];
    final hardDelete = <int>[];
    for (var i = 0; i < toDelete.length; i++) {
      final row = i < orphans.length ? orphans[i] : null;
      if (row != null && row.isSynced) {
        // Known to the server: mark it removed so the next upload carries it.
        row
          ..status = 'X'
          ..isSynced = false
          ..pickQty = 0
          ..lastWriteTimeStamp = now
          ..lastModifiedBy = userId;
        tombstone.add(row);
      } else {
        // Never reached the server — nothing to tell it about.
        hardDelete.add(toDelete[i]);
      }
    }

    await isar.writeTxn(() async {
      if (oldHeaderId != headerId) {
        await isar.pickLists.delete(oldHeaderId);
      }
      await isar.pickLists.put(header);
      await isar.pickListItems.putAll(_items);
      if (tombstone.isNotEmpty) await isar.pickListItems.putAll(tombstone);
      if (hardDelete.isNotEmpty) {
        await isar.pickListItems.deleteAll(hardDelete);
      }
    });

    _originalItemIds
      ..clear()
      ..addAll(_items.map((e) => e.id));

    if (!mounted) return;
    setState(() {
      _dirty = false;
      _saving = false;
    });

    if (status == null) return;
    status.to(SaveStage.saved);
    await _uploadNow(status);
  }

  /// Offers to attach an unrecognised barcode to an item on this pick.
  ///
  /// Candidates are limited to items ON THIS PICK deliberately. A barcode
  /// means one item company-wide and gets it wrong forever, so the safe moment
  /// to create one is when the goods are in someone's hand and the list is
  /// short enough to read. Free inventory search would turn a mis-tap into a
  /// permanently mis-scanning barcode.
  ///
  /// The UNIT is chosen separately rather than inferred from the pick line:
  /// over 3,000 of this customer's ~7,000 SKUs carry more than one UOM, and a
  /// case code is a different barcode from a loose-unit code. Inferring it
  /// silently mislabelled every carton scanned against a line picked in kilos.
  ///
  /// Returns (sku, uom) once queued, else null.
  Future<(int, String?)?> _offerLinkBarcode(String code) async {
    final cc = widget.pick.companyCode;
    if (cc == null || code.isEmpty) return null;

    // One candidate per SKU — the unit is the next question, not this one.
    final seen = <int>{};
    final candidates = <BarcodeCandidate>[];
    for (final g in _groupItems(_items)) {
      final sku = g.skuNo;
      if (sku == null || !seen.add(sku)) continue;
      final d = (_skuDescriptions[sku] ?? '').trim();
      candidates.add(BarcodeCandidate(
        skuNo: sku,
        description: d.isEmpty ? 'SKU $sku' : d,
        docUom: (g.uom ?? '').trim(),
      ));
    }
    if (candidates.isEmpty) return null;

    final chosen = await LinkBarcodeSheet.show(
      context,
      code: code,
      companyCode: cc,
      candidates: candidates,
      userId: AuthService().currentUser?.userId ?? 1,
      sourceDoc: widget.pick.pickPreLabel,
    );
    if (chosen == null || !mounted) return null;

    final desc = (_skuDescriptions[chosen.$1] ?? '').trim();
    // Confirm before writing: this barcode resolves to this item on every
    // device and every document from now on.
    final go = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Link barcode?'),
        content: Text(
            '$code will scan as ${desc.isEmpty ? 'SKU ${chosen.$1}' : desc} '
            '(${chosen.$2}).  It works on this device immediately and uploads '
            'with the pick. If another device has already used this barcode '
            'for something else, the sync will stop and tell you.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c, false),
              child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modPicking,
                foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(c, true),
            child: const Text('Link'),
          ),
        ],
      ),
    );
    if (go != true || !mounted) return null;

    // Written locally and queued. The barcode scans on this device straight
    // away — a picker who has just met a new case code carries on down the
    // aisle, signal or not — and it goes up ahead of the pick on the next
    // sync, so the pick never lands referring to a code the server lacks.
    await PluService(isar).addPluOffline(
      companyCode: cc,
      pluNo: code,
      skuNo: chosen.$1,
      uom: chosen.$2,
      userId: AuthService().currentUser?.userId ?? 1,
      sourceDoc: widget.pick.pickPreLabel,
    );
    if (!mounted) return null;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppDesign.success,
      content: Text('$code linked to SKU ${chosen.$1} (${chosen.$2})'),
    ));
    return (chosen.$1, chosen.$2);
  }

  /// Offers to take the server's factor for a unit this device invented with
  /// a different one.
  ///
  /// The item master is the authority — it is what the desktop and every other
  /// device already use. Accepting corrects the cached unit AND the unsent
  /// document lines that captured the old factor, because the server reads
  /// each line's own factor when it checks quantities.
  Future<bool> _offerAdoptFactor(SkuUomConflict c) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Unit factor disagrees'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SKU ${c.skuNo} · ${c.uom}',
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(
              'This device used a factor of ${_fmtQty(c.mine)}, but the item '
              'master says ${_fmtQty(c.theirs)}.',
              style: const TextStyle(fontSize: 12.5, height: 1.4),
            ),
            const SizedBox(height: 8),
            Text(
              'Taking ${_fmtQty(c.theirs)} keeps the quantities you counted — '
              'the number of ${c.uom} does not change — but corrects what one '
              '${c.uom} means. Nothing uploads until this is settled.',
              style: const TextStyle(
                  fontSize: 11.5, color: AppDesign.inkMuted, height: 1.4),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Leave it'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modPicking,
                foregroundColor: Colors.white),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Use ${_fmtQty(c.theirs)}'),
          ),
        ],
      ),
    );
    if (go != true) return false;
    await PluService(isar).adoptServerUomFactor(c);
    if (mounted) await _load();
    return true;
  }

  /// Re-reads the header row onto [widget.pick] after something else has
  /// written it.
  ///
  /// Save sets `isSynced = false` on this object and then uploads; the upload
  /// writes the ROW — `isSynced`, and whatever status and totals the server
  /// came back with — but nothing was copying that back onto the object this
  /// page holds. So the page went on believing the pick was unsynced, and
  /// "Create invoices" refused with "this pick has not been uploaded yet"
  /// until you left the screen and came back, which re-read it from Isar.
  ///
  /// Copying field-by-field rather than swapping the reference keeps every
  /// existing `widget.pick.x` read valid.
  Future<void> _refreshHeader() async {
    final cc = widget.pick.companyCode;
    final label = (widget.pick.pickPreLabel ?? '').trim();
    if (cc == null || label.isEmpty) return;
    final row = await isar.pickLists
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .pickPreLabelEqualTo(widget.pick.pickPreLabel)
        .findFirst();
    if (row == null || !mounted) return;
    setState(() {
      widget.pick
        ..id = row.id
        ..status = row.status
        ..isSynced = row.isSynced
        ..uploadToken = row.uploadToken
        ..locationCode = row.locationCode
        ..remark = row.remark
        ..batchCount = row.batchCount
        ..pickDate = row.pickDate
        ..totalPickQty = row.totalPickQty
        ..totalPickItem = row.totalPickItem
        ..assignedTo = row.assignedTo
        ..lastModifiedBy = row.lastModifiedBy
        ..lastWriteTimeStamp = row.lastWriteTimeStamp
        ..cancelledBy = row.cancelledBy
        ..cancelledDate = row.cancelledDate;
    });
  }

  /// Pushes this document to the server and reports the outcome onto [status].
  ///
  /// Save now uploads rather than only writing locally — "syncing / synced"
  /// would otherwise be a promise the Save button never kept. Offline is a
  /// deferral, not a failure: the work is already safe on the device and the
  /// next sync picks it up.
  Future<void> _uploadNow(SaveStatusController status) async {
    final label = widget.pick.pickPreLabel;
    if (label == null || label.isEmpty) {
      status.to(SaveStage.queued,
          detail: 'No document number yet — it will upload on the next sync.');
      return;
    }

    if (!OfflineFirstService.isLikelyOnline()) {
      status.to(SaveStage.queued,
          detail: 'No connection. Saved on this device and queued for upload.');
      return;
    }

    status.to(SaveStage.syncing);
    final svc = PickService();
    try {
      final r = await svc.syncPicksByPreLabels([label]);
      // The controller outlives this page's State, so always report the
      // outcome — only the setState below needs `mounted`.
      if ((r['synced'] ?? 0) > 0) {
        // A successful upload can still have dropped lines deleted elsewhere.
        final notice = svc.lastNotices[label];
        status.to(SaveStage.synced, detail: notice);
        // Pull the upload's result back onto this page — isSynced above all,
        // plus any status/totals the server settled on.
        await _refreshHeader();
        // Lines too. The service re-baselines each accepted line against what
        // the server now holds, and the page's copies are separate objects
        // that never saw that. Leaving them stale is not cosmetic: the NEXT
        // save sends `qty - baseline`, so an out-of-date baseline re-sends a
        // delta the server already applied.
        if (mounted) await _load();
      } else {
        // A factor disagreement is the one failure the picker can resolve on
        // the spot. Offering it here matters: the queued unit is retried on
        // every sync, so without a way out the device blocks uploads for
        // documents that have nothing to do with it.
        final conflict = svc.lastUomConflict;
        if (conflict != null && mounted) {
          status.to(SaveStage.failed, detail: svc.lastErrors[label]);
          final adopt = await _offerAdoptFactor(conflict);
          if (adopt && mounted) {
            await _uploadNow(status); // retry, now that the unit agrees
            return;
          }
          return;
        }
        status.to(SaveStage.failed,
            detail: svc.lastErrors[label] ??
                'The server did not accept the upload.');
      }
    } catch (_) {
      status.to(SaveStage.queued,
          detail: 'Could not reach the server. Queued for the next sync.');
    }
  }

  // ───────────────────────────── Printing ────────────────────────────────

  bool _printing = false;

  /// Prints the pick receipt on the paired Bluetooth thermal printer.
  ///
  /// Quantities live in the text controllers until Save copies them onto the
  /// items, so a dirty pick would print stale numbers. Rather than paper over
  /// that, we save first — a printed receipt has to match what's stored.
  /// Opens the pick→invoice conversion flow.
  ///
  /// The server converts from ITS copy of the pick, so anything unsaved or
  /// unsynced here would be silently ignored — the guard makes that a
  /// visible refusal instead.
  Future<void> _openInvoicePage() async {
    // Converting twice would raise a second set of invoices for goods that
    // have already been billed and already moved the stock. The server is the
    // real guard — it re-checks under lock, so two devices racing this can't
    // both win — but refusing here means the operator finds out before
    // allocating every line rather than after.
    if (_alreadyInvoiced) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppDesign.warning,
        content: Text('This pick was already invoiced as '
            '${_invoicedAs.join(', ')}.'),
      ));
      return;
    }
    if (_dirty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Save the pick first — invoices are created from the '
            'saved quantities.'),
      ));
      return;
    }
    if (!widget.pick.isSynced) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('This pick has not been uploaded yet — sync it first, '
            'then create the invoices.'),
      ));
      return;
    }
    final done = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => PickInvoicePage(pick: widget.pick)),
    );
    if (done == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: AppDesign.success,
        content: Text('Invoices created'),
      ));
      // The conversion ran on the SERVER: it completed the pick, cancelled the
      // lines nothing was picked against, and created the invoices. None of
      // that exists on this device until it's pulled, so without this the
      // screen still shows an open pick with its original lines and offers to
      // invoice it a second time.
      final cc = widget.pick.companyCode;
      if (cc != null) {
        try {
          await BaseTransactionSyncService().syncAll(companyCode: cc);
        } catch (e) {
          print('⚠️ PickDetail: post-invoice sync failed: $e');
        }
      }
      if (mounted) {
        await _load(); // items + which invoices this pick produced
        await _refreshHeader(); // status now 'C'
      }
    }
  }

  Future<void> _printReceipt() async {
    if (_printing || _saving) return;

    final needsSave = _dirty || (widget.pick.pickPreLabel ?? '').isEmpty;
    if (needsSave) {
      final go = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Save before printing?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          content: const Text(
            'This pick has changes that aren\'t saved yet. It will be saved so '
            'the receipt matches the recorded quantities.',
            style: AppDesign.bodyMuted,
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, true),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.modPicking,
                  foregroundColor: Colors.white),
              child: const Text('Save & print'),
            ),
          ],
        ),
      );
      if (go != true || !mounted) return;
      await _save(silent: true);
      // A rejected save (e.g. no items) leaves the pick dirty — don't print a
      // receipt for something that isn't stored.
      if (!mounted || _dirty || (widget.pick.pickPreLabel ?? '').isEmpty) return;
    }

    // Preview first — the dialog owns template choice, the send, its failures
    // and its retry. It calls back to re-render whenever the template changes.
    final result = await ReceiptPreviewDialog.show(
      context,
      module: ReceiptTemplate.modulePick,
      build: (t) => ReceiptService().buildPick(widget.pick, _items, t),
      accent: AppDesign.modPicking,
    );
    if (!mounted || result == null) return; // dismissed without printing
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: AppDesign.success,
      behavior: SnackBarBehavior.floating,
      content: Text('Receipt sent to printer'),
    ));
  }

  /// Remove every constituent item of a merged line.
  ///
  /// A line that came from the server (was loaded / already synced) is turned
  /// into a local **tombstone** (`status='X'`, `isSynced=false`) and kept in
  /// Isar so the next sync can send it as a removal — the server then hard-
  /// deletes it and logs a REMOVE in MP_Txn_History. A line added this session
  /// and never synced is just hard-deleted locally (the server never had it).
  Future<void> _removeMerged(_MergedLine m) async {
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final tombstones = <PickListItem>[];
    final hardDelete = <int>[];
    for (final it in m.items) {
      if (_originalItemIds.contains(it.id)) {
        it.status = 'X';
        it.isSynced = false;
        it.pickQty = 0;
        it.lastWriteTimeStamp = now;
        it.lastModifiedBy = userId;
        tombstones.add(it);
      } else {
        hardDelete.add(it.id);
      }
    }
    await isar.writeTxn(() async {
      if (tombstones.isNotEmpty) await isar.pickListItems.putAll(tombstones);
      if (hardDelete.isNotEmpty) await isar.pickListItems.deleteAll(hardDelete);
    });
    if (!mounted) return;
    setState(() {
      for (final it in m.items) {
        _items.removeWhere((x) => x.id == it.id);
        _controllers.remove(it.id)?.dispose();
        _originalItemIds.remove(it.id);
      }
      _dirty = true;
    });
  }

  // ─────────────────────── Multi-select mass actions ─────────────────────

  /// Currently-visible merged lines (respects the active sub-tab + search).
  List<_MergedLine> _visibleLines() {
    final isPending = _subTab == 0;
    return _groupItems(_items.where(_matchesSearch).toList())
        .where((g) => isPending ? !_isMergedPicked(g) : _isMergedPicked(g))
        .toList();
  }

  void _toggleSelectMode() {
    setState(() {
      _selectMode = !_selectMode;
      _selectedKeys.clear();
    });
  }

  void _toggleSelected(_MergedLine m) {
    setState(() {
      final k = _mergeKey(m);
      if (!_selectedKeys.remove(k)) _selectedKeys.add(k);
    });
  }

  void _selectAllVisible() {
    setState(() {
      final visible = _visibleLines().map(_mergeKey).toSet();
      if (_selectedKeys.containsAll(visible) && visible.isNotEmpty) {
        _selectedKeys.clear(); // toggle off
      } else {
        _selectedKeys.addAll(visible);
      }
    });
  }

  List<_MergedLine> _selectedLines() =>
      _visibleLines().where((m) => _selectedKeys.contains(_mergeKey(m))).toList();

  /// Mass receive: set every selected line's pick qty to its planned qty
  /// (fill), distributing across its constituent SQ rows.
  void _massFill() {
    final lines = _selectedLines();
    if (lines.isEmpty) return;
    setState(() {
      for (final m in lines) {
        for (final it in m.items) {
          _controllers[it.id]?.text = _fmtQty(it.qty ?? 0);
        }
      }
      _dirty = true;
      _selectMode = false;
      _selectedKeys.clear();
    });
  }

  Future<void> _massRemove() async {
    final lines = _selectedLines();
    if (lines.isEmpty) return;
    final ok = await _confirmRemove('Remove ${lines.length} selected item(s)?');
    if (!ok) return;
    setState(() {
      for (final m in lines) {
        for (final it in m.items) {
          _items.removeWhere((x) => x.id == it.id);
          _controllers.remove(it.id)?.dispose();
        }
      }
      _dirty = true;
      _selectMode = false;
      _selectedKeys.clear();
    });
  }

  // ─────────────────────────────── Build ─────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppBar(
        // Pick number lives in the header card below — keeps the bar free for
        // the Select / Add / Save actions.
        title: const Text('Pick',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, color: AppDesign.ink)),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
        actions: _selectMode
            ? [
                TextButton(
                  onPressed: _selectAllVisible,
                  child: const Text('Select all',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.modPicking)),
                ),
                IconButton(
                  tooltip: 'Done',
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: _toggleSelectMode,
                ),
              ]
            : [
                if (_items.isNotEmpty)
                  IconButton(
                    tooltip: _alreadyInvoiced
                        ? 'Already invoiced: ${_invoicedAs.join(', ')}'
                        : 'Create invoices',
                    // Filled + coloured once invoiced, so the state is legible
                    // at a glance rather than only on tap.
                    icon: Icon(
                      _alreadyInvoiced
                          ? Icons.receipt_long
                          : Icons.receipt_long_outlined,
                      size: 20,
                      color: _alreadyInvoiced ? AppDesign.success : null,
                    ),
                    onPressed: _loading ? null : _openInvoicePage,
                  ),
                if (_items.isNotEmpty)
                  IconButton(
                    tooltip: 'Print receipt',
                    icon: _printing
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: AppDesign.modPicking),
                          )
                        : const Icon(Icons.print_outlined, size: 20),
                    onPressed: (_loading || _printing) ? null : _printReceipt,
                  ),
                if (_items.isNotEmpty)
                  IconButton(
                    tooltip: 'Select',
                    icon: const Icon(Icons.checklist_rounded, size: 20),
                    onPressed: (_loading || _isClosed) ? null : _toggleSelectMode,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  child: ElevatedButton.icon(
                    onPressed: (_loading || _isClosed) ? null : _openAddSheet,
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Add',
                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppDesign.modPicking,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 6, bottom: 6),
                  child: ElevatedButton.icon(
                    onPressed: (_loading || _saving || !_dirty || _isClosed) ? null : _save,
                    icon: _saving
                        ? const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.save, size: 16),
                    label: Text(_saving ? 'Saving…' : 'Save',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppDesign.success,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade300,
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
                    ),
                  ),
                ),
              ],
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _headerCard(),
                  if (_isClosed) _closedBanner(),
                  if (_items.isNotEmpty) _buildSubTabs(),
                  // Walk-order filter strip. Inline rather than floating: it
                  // costs one row of height, never covers the line being
                  // typed into, and scrolls sideways so a pick spanning
                  // thirty bays stays workable.
                  if (_shelfPanelOpen && _items.isNotEmpty) _shelfStrip(),
                  const Divider(height: 1, color: AppDesign.border),
                  Expanded(
                    child: _items.isEmpty ? _emptyItems() : _filteredList(),
                  ),
                ],
              ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _loading
          ? null
          : SafeArea(
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppDesign.surface,
                    border: Border(top: BorderSide(color: AppDesign.border)),
                  ),
                  padding: const EdgeInsets.fromLTRB(AppDesign.space3,
                      AppDesign.space2, AppDesign.space3, AppDesign.space2),
                  // Select mode → mass Fill / Remove actions. Otherwise the
                  // search / scan bar (shown even on an empty pick).
                  child: _selectMode ? _massActionBar() : _segmentedSearchRow(),
                ),
              ),
            ),
    );
  }

  Widget _headerCard() {
    final p = widget.pick;
    return Container(
      margin: const EdgeInsets.fromLTRB(
          AppDesign.space3, AppDesign.space3, AppDesign.space3, AppDesign.space2),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDesign.space3, vertical: AppDesign.space2),
      decoration: BoxDecoration(
        color: AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Pick number — moved here from the app bar.
                Row(
                  children: [
                    const Icon(Icons.shelves,
                        size: 14, color: AppDesign.modPicking),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        (p.pickPreLabel ?? '').isNotEmpty
                            ? p.pickPreLabel!
                            : 'New pick · number on save',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: (p.pickPreLabel ?? '').isNotEmpty
                                ? AppDesign.modPicking
                                : AppDesign.inkMuted),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                _assignedRow(),
                const SizedBox(height: 3),
                Text('LOCATION ${p.locationCode ?? "—"}', style: AppDesign.micro),
                const SizedBox(height: 2),
                Text(
                  '${_items.length} items · qty ${(p.totalPickQty ?? 0).toStringAsFixed(0)}'
                  '${p.batchCount != null ? " · batch ${p.batchCount}" : ""}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.ink),
                ),
                if (p.remark?.isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(p.remark!,
                        style: const TextStyle(
                            fontSize: 11, color: AppDesign.inkMuted),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _lifecycleChip(),
        ],
      ),
    );
  }

  // ─────────────── PD-style sub-tabs + Fill chip ───────────────

  Widget _buildSubTabs() {
    final groups = _groupItems(_items.where(_matchesSearch).toList());
    final pickedCount = groups.where(_isMergedPicked).length;
    final pendingCount = groups.length - pickedCount;
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppDesign.bg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                border: Border.all(color: AppDesign.border),
              ),
              child: Row(
                children: [
                  _subTabBtn('Pending', pendingCount, 0),
                  _subTabBtn('Picked', pickedCount, 1),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          _groupChip(),
          const SizedBox(width: 6),
          _shelfSortChip(),
          const SizedBox(width: 6),
          _fillToggleChip(),
        ],
      ),
    );
  }

  Widget _subTabBtn(String label, int count, int value) {
    final selected = _subTab == value;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _subTab = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: selected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 4,
                        offset: const Offset(0, 1))
                  ]
                : null,
          ),
          child: Text(
            '$label ($count)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              color: selected ? AppDesign.modPicking : AppDesign.inkMuted,
            ),
          ),
        ),
      ),
    );
  }

  /// PD's "Fill" flag chip. On ⇒ the pick popup pre-fills with the
  /// remaining balance. Off ⇒ it starts at 0.
  Widget _fillToggleChip() {
    final on = _prefillFromBalance;
    return InkWell(
      onTap: () => setState(() => _prefillFromBalance = !_prefillFromBalance),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: on ? AppDesign.modPicking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on ? AppDesign.modPicking.withOpacity(0.5) : AppDesign.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              on
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              size: 14,
              color: on ? AppDesign.modPicking : AppDesign.inkMuted,
            ),
            const SizedBox(width: 3),
            Text(
              'Fill',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: on ? AppDesign.modPicking : AppDesign.inkMuted,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────── Filtered list ─────────────────────────────

  Widget _filteredList() {
    final isPending = _subTab == 0;
    // First merge SQs per (SKU, UOM); then group those UOM lines by SKU so
    // different UOMs of the same SKU share one card (but stay separate rows).
    var uomLines = _groupItems(_items.where(_matchesSearch).toList())
        .where((g) => isPending ? !_isMergedPicked(g) : _isMergedPicked(g))
        .toList();

    // Shelf filter from the floating panel. Applied before sorting so the
    // panel's counts and the rows on screen always agree.
    if (_shelfFilter != null) {
      uomLines = uomLines.where((m) => _inShelfFilter(m.skuNo)).toList();
    }

    // Walk order. Sorted BEFORE bucketing so it holds inside groups too — a
    // picker grouping by customer still wants each customer's lines in aisle
    // order. Unshelved items fall to the end (see ShelfService.compare).
    if (_sortByShelf) {
      uomLines.sort((a, b) =>
          ShelfService.compare(_shelves[a.skuNo], _shelves[b.skuNo]));
    }
    if (uomLines.isEmpty) {
      return Center(
        child: Text(
          isPending ? 'Nothing left to pick' : 'No items picked yet',
          style: AppDesign.bodyMuted,
        ),
      );
    }

    if (_groupMode == _GroupMode.none) {
      final skuGroups = _groupBySku(uomLines);
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 6),
        itemCount: skuGroups.length,
        itemBuilder: (context, i) => _skuCard(skuGroups[i], i),
      );
    }

    // Sectioned: bucket lines by the active grouping, then SKU-card within.
    final order = <String>[];
    final buckets = <String, List<_MergedLine>>{};
    for (final m in uomLines) {
      final label = _groupLabelFor(m);
      if (!buckets.containsKey(label)) {
        buckets[label] = [];
        order.add(label);
      }
      buckets[label]!.add(m);
    }
    order.sort();

    final entries = <_ListEntry>[];
    for (final label in order) {
      final lines = buckets[label]!;
      final qty = lines.fold<double>(
          0, (s, m) => s + m.items.fold<double>(0, (a, it) => a + (it.qty ?? 0)));
      entries.add(_ListEntry.header(label, lines.length, qty));
      for (final g in _groupBySku(lines)) {
        entries.add(_ListEntry.card(g));
      }
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 6),
      itemCount: entries.length,
      itemBuilder: (context, i) {
        final e = entries[i];
        if (e.group != null) return _skuCard(e.group!, i);
        return _sectionHeader(e.header!, e.count, e.qty);
      },
    );
  }

  /// Group per-(SKU,UOM) merged lines by SKU, preserving order.
  List<_SkuGroup> _groupBySku(List<_MergedLine> lines) {
    final order = <int?>[];
    final map = <int?, List<_MergedLine>>{};
    for (final m in lines) {
      if (!map.containsKey(m.skuNo)) {
        map[m.skuNo] = [];
        order.add(m.skuNo);
      }
      map[m.skuNo]!.add(m);
    }
    return order.map((s) => _SkuGroup(s, map[s]!)).toList();
  }

  Widget _emptyItems() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.shelves,
              size: 48, color: AppDesign.inkSubtle),
          SizedBox(height: 8),
          Text('Empty pick', style: AppDesign.body),
          SizedBox(height: 2),
          Text('Tap “Add items” to start.', style: AppDesign.caption),
        ],
      ),
    );
  }

  // ───────────── SKU card: header + one sub-row per UOM ──────────────────

  /// A card per SKU. Header (image + description + SKU/PLU) shown once, then
  /// one tappable sub-row per UOM variant. Merging still happens per
  /// (SKU, UOM); different UOMs stay as separate rows inside the same card.
  Widget _skuCard(_SkuGroup g, int index) {
    final desc = _skuDescriptions[g.skuNo ?? -1] ?? '';
    // Distinct PLUs across this SKU's UOM lines. If exactly one, show it
    // next to the SKU in the header and hide the per-row PLU; if they differ
    // per UOM, keep PLU on each row instead.
    final distinctPlus = <String>{};
    for (final m in g.uomLines) {
      final p = _pluFor(m.skuNo, m.uom);
      if (p != null && p.isNotEmpty) distinctPlus.add(p);
    }
    final headerPlu = distinctPlus.length == 1 ? distinctPlus.first : null;
    final showRowPlu = distinctPlus.length > 1;

    return Dismissible(
      key: ValueKey('sku_${g.skuNo}'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppDesign.danger.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 20),
      ),
      confirmDismiss: (_) async =>
          await _confirmRemove(
            'Remove SKU ${g.skuNo ?? "?"}'
            '${g.uomLines.length > 1 ? " (${g.uomLines.length} UOMs)" : ""}?',
          ),
      onDismissed: (_) {
        for (final m in g.uomLines) {
          _removeMerged(m);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppDesign.borderStrong),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header — image + description + SKU · PLU (shown once).
              Container(
                padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F7F8),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(7)),
                ),
                child: Row(
                  children: [
                    if (widget.pick.companyCode != null && g.skuNo != null)
                      InventoryImageWidget(
                        companyCode: widget.pick.companyCode!,
                        skuNo: g.skuNo!,
                        uom: g.uomLines.first.uom,
                        width: 38,
                        height: 38,
                        borderRadius: BorderRadius.circular(6),
                        showLoadingIndicator: false,
                      )
                    else
                      Text('${index + 1}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade700)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            desc.isNotEmpty ? desc : 'SKU ${g.skuNo ?? "?"}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                              color: AppDesign.ink,
                            ),
                            // Two lines: item descriptions here routinely run
                            // past one, and a truncated description is the one
                            // field a picker cannot work around.
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'SKU ${g.skuNo ?? "—"}'
                            '${headerPlu != null ? "  ·  PLU $headerPlu" : ""}',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppDesign.inkMuted),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Shelf position. Given prominence over the SKU/PLU
                          // line because it is the only field that tells the
                          // picker where to walk; it can also hold several
                          // bins, so it gets two lines before eliding.
                          if (_shelfFor(g.skuNo) != null) ...[
                            const SizedBox(height: 3),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.shelves,
                                    size: 12, color: AppDesign.modPicking),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    _shelfFor(g.skuNo)!,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                        color: AppDesign.modPicking),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // One sub-row per UOM.
              for (final m in g.uomLines) ...[
                const Divider(height: 1, thickness: 1, color: _cellDivider),
                _uomSubRow(m, showPlu: showRowPlu),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// A per-UOM row inside a SKU card: [UOM chip] [SQ tags] [Pick n/m badge].
  /// Tap → receive popup for that (SKU, UOM) line. Long-press → remove it.
  Widget _uomSubRow(_MergedLine m, {bool showPlu = true}) {
    final sqTags = _sqTagsOf(m);
    final plu = showPlu ? _pluFor(m.skuNo, m.uom) : null;
    final selected = _selectedKeys.contains(_mergeKey(m));
    return InkWell(
      onTap: _selectMode
          ? () => _toggleSelected(m)
          : () => _openReceiveSheet(m),
      onLongPress: _selectMode
          ? null
          : () async {
              final ok = await _confirmRemove(
                  'Remove ${m.uom ?? ""} line of SKU ${m.skuNo ?? "?"}?');
              if (ok) _removeMerged(m);
            },
      child: Container(
        color: _selectMode && selected ? AppDesign.modPickingBg : null,
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Row(
          children: [
            if (_selectMode) ...[
              Icon(
                selected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                size: 20,
                color: selected ? AppDesign.modPicking : AppDesign.inkSubtle,
              ),
              const SizedBox(width: 8),
            ],
            // UOM chip + its PLU underneath.
            SizedBox(
              width: 58,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppDesign.modPickingBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      m.uom ?? '—',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.modPicking,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  if (plu != null && plu.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'PLU $plu',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.inkSubtle),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // SQ tags.
            Expanded(
              child: Wrap(
                spacing: 3,
                runSpacing: 3,
                children: [for (final t in sqTags) _rowSqTag(t)],
              ),
            ),
            const SizedBox(width: 8),
            _pickBadge(m),
            const SizedBox(width: 2),
            const Icon(Icons.chevron_right, size: 16, color: AppDesign.inkSubtle),
          ],
        ),
      ),
    );
  }

  Future<bool> _confirmRemove(String message) async {
    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Remove?'),
            content: Text('$message\n\nRemoved on Save.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel')),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: AppDesign.danger),
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Remove'),
              ),
            ],
          ),
        ) ??
        false;
  }

  /// Small inline SQ tag for the merged line's qty row.
  Widget _rowSqTag(String? sq) {
    final label = sq ?? 'No SQ';
    final c = SqColors.fg(sq);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: TextStyle(
          fontSize: 9,
          color: c,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  /// Combined `Pick n/m` badge for a merged line. Grey = nothing entered,
  /// amber = short, green = exact/all, blue = over.
  Widget _pickBadge(_MergedLine m) {
    final entered = _pickedOf(m);
    final target = _plannedOf(m);
    Color color;
    if (entered == 0) {
      color = Colors.grey.shade500;
    } else if (target > 0 && entered < target) {
      color = Colors.amber.shade700;
    } else if (target > 0 && entered > target) {
      color = Colors.blue.shade600;
    } else {
      color = Colors.green.shade600;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Pick ${_fmtQty(entered)}/${_fmtQty(target)}',
        style:
            TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w700),
      ),
    );
  }

  // ─────────────── [PLU] [SEARCH] [SCAN] bottom control ──────────────────

  Widget _massActionBar() {
    final n = _selectedKeys.length;
    return Row(
      children: [
        Text('$n selected',
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppDesign.ink)),
        const Spacer(),
        // Mass fill (receive to planned).
        OutlinedButton.icon(
          onPressed: n == 0 ? null : _massFill,
          icon: const Icon(Icons.done_all_rounded, size: 16),
          label: const Text('Fill',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppDesign.success,
            side: BorderSide(
                color: n == 0 ? AppDesign.border : AppDesign.success),
            minimumSize: const Size(0, 38),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          ),
        ),
        const SizedBox(width: 8),
        // Mass remove.
        ElevatedButton.icon(
          onPressed: n == 0 ? null : _massRemove,
          icon: const Icon(Icons.delete_outline, size: 16),
          label: const Text('Remove',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDesign.danger,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.grey.shade300,
            minimumSize: const Size(0, 38),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          ),
        ),
      ],
    );
  }

  Widget _segmentedSearchRow() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.borderStrong),
      ),
      child: Row(
        children: [
          // ── PLU toggle ──
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(AppDesign.radiusSm)),
              onTap: () => setState(() => _byPlu = !_byPlu),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                width: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _byPlu ? AppDesign.modPicking : AppDesign.modPickingBg,
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(AppDesign.radiusSm)),
                ),
                child: Text(
                  // Label reflects the ACTIVE lookup mode — tap to switch.
                  _byPlu ? 'PLU' : 'SKU',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                    color: _byPlu ? Colors.white : AppDesign.modPicking,
                  ),
                ),
              ),
            ),
          ),
          _divider(),
          // ── Search field ──
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              textInputAction: TextInputAction.search,
              onSubmitted: (v) {
                final t = v.trim();
                if (t.isEmpty) return;
                _resolveAndReceive(t);
              },
              decoration: InputDecoration(
                hintText: _byPlu ? 'Scan or type PLU' : 'Scan or type SKU / name',
                hintStyle: const TextStyle(
                    fontSize: 12,
                    color: AppDesign.inkSubtle,
                    fontWeight: FontWeight.w500),
                prefixIcon: const Icon(Icons.search,
                    size: 16, color: AppDesign.inkSubtle),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 30, minHeight: 30),
                suffixIcon: _searchCtrl.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear,
                            size: 14, color: AppDesign.inkSubtle),
                        onPressed: () => _searchCtrl.clear(),
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                      ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppDesign.ink),
            ),
          ),
          _divider(),
          // ── Scan ──
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(AppDesign.radiusSm)),
              onTap: _scanReceive,
              child: Container(
                width: 44,
                alignment: Alignment.center,
                child: const Icon(Icons.qr_code_scanner,
                    size: 18, color: AppDesign.modPicking),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 20, color: AppDesign.border);


  // ─────────────────────── Walk-order filter strip ───────────────────────

  /// Every shelf on this pick as a horizontally scrolling chip row, in
  /// walking order, doubling as a filter.
  ///
  /// A pick can span dozens of bays, so this has to degrade gracefully: chips
  /// scroll sideways rather than wrapping into a wall that eats the screen,
  /// and each carries its line count so the size of a bay's work is visible
  /// before walking to it. "All" leads so clearing a filter is always one tap
  /// away at a predictable place.
  Widget _shelfStrip() {
    final buckets = _shelfBuckets();
    if (buckets.isEmpty) return const SizedBox.shrink();

    // "All" counts LINES, not bin-slots: an item sitting in two bins appears
    // under both chips, so summing the buckets would double-count it.
    final lines = _groupItems(_items);
    final allTotal = lines.length;
    final allDone = lines.where(_isMergedPicked).length;

    Widget chip({
      required String label,
      required int done,
      required int total,
      required bool selected,
      required VoidCallback onTap,
      bool muted = false,
    }) {
      final complete = total > 0 && done >= total;
      final c = complete
          ? AppDesign.success
          : (muted ? AppDesign.inkSubtle : AppDesign.modPicking);
      return Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Material(
          color: selected ? c : AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppDesign.radiusPill),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
                border: Border.all(
                  color: selected ? c : AppDesign.border,
                  width: selected ? 1.4 : 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11.5,
                      fontWeight: selected ? FontWeight.w900 : FontWeight.w700,
                      color: selected ? Colors.white : c,
                      // A cleared bay reads as struck off the list.
                      decoration:
                          complete ? TextDecoration.lineThrough : null,
                      decorationColor: c,
                      decorationThickness: 2,
                    ),
                  ),
                  // done/total while there is work left — '0/4' before
                  // starting, '3/4' part way. A cleared bay drops the badge
                  // entirely: the strike-through and green already say it,
                  // and on a pick spanning many bays the width freed by every
                  // finished chip is what keeps the live ones reachable.
                  if (!complete) ...[
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.white.withOpacity(0.25)
                            : AppDesign.bg,
                        borderRadius:
                            BorderRadius.circular(AppDesign.radiusPill),
                      ),
                      child: Text('$done/$total',
                          style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w900,
                            color:
                                selected ? Colors.white : AppDesign.inkMuted,
                          )),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: AppDesign.surfaceAlt,
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            chip(
              label: 'All',
              done: allDone,
              total: allTotal,
              selected: _shelfFilter == null,
              onTap: () => setState(() => _shelfFilter = null),
            ),
            for (final e in buckets)
              chip(
                label: e.bin ?? 'No shelf',
                done: e.total - e.remaining,
                total: e.total,
                selected: _shelfFilter == e.bin,
                muted: e.bin == null,
                onTap: () => setState(() {
                  _shelfFilter = _shelfFilter == e.bin ? null : e.bin;
                }),
              ),
          ],
        ),
      ),
    );
  }

}

// ───────────────────── PD-style number pad ─────────────────────

/// Display grouping of PickListItems that share the same SKU + UOM. The
/// underlying records stay per-SQ (for balance split + save); this just
/// merges them into one visual line with summed qty and all SQ tags.
class _MergedLine {
  final int? skuNo;
  final String? uom;
  final List<PickListItem> items;
  const _MergedLine(this.skuNo, this.uom, this.items);
}

/// A SKU and all its UOM-variant merged lines, grouped for display in one card.
class _SkuGroup {
  final int? skuNo;
  final List<_MergedLine> uomLines;
  const _SkuGroup(this.skuNo, this.uomLines);
}

class _NumberPad extends StatelessWidget {
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback onConfirm;
  final VoidCallback onDecimal;

  const _NumberPad({
    required this.onDigit,
    required this.onBackspace,
    required this.onConfirm,
    required this.onDecimal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _row(['1', '2', '3']),
        const SizedBox(height: 3),
        _row(['4', '5', '6']),
        const SizedBox(height: 3),
        _row(['7', '8', '9']),
        const SizedBox(height: 3),
        Row(
          children: [
            Expanded(child: _key('.', onTap: onDecimal, big: true)),
            const SizedBox(width: 3),
            Expanded(child: _key('0', onTap: () => onDigit('0'))),
            const SizedBox(width: 3),
            Expanded(
              child: SizedBox(
                height: 34,
                child: OutlinedButton(
                  onPressed: onBackspace,
                  style: _keyStyle(),
                  child: const Icon(Icons.backspace_outlined,
                      size: 15, color: AppDesign.ink),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        SizedBox(
          width: double.infinity,
          height: 38,
          child: ElevatedButton.icon(
            onPressed: onConfirm,
            icon: const Icon(Icons.check_rounded, size: 16),
            label: const Text(
              'Pick',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppDesign.success,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              ),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }

  ButtonStyle _keyStyle() => OutlinedButton.styleFrom(
        backgroundColor: AppDesign.bg,
        foregroundColor: AppDesign.ink,
        side: const BorderSide(color: AppDesign.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        ),
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  Widget _row(List<String> digits) {
    return Row(
      children: [
        for (var i = 0; i < digits.length; i++) ...[
          Expanded(child: _key(digits[i], onTap: () => onDigit(digits[i]))),
          if (i != digits.length - 1) const SizedBox(width: 3),
        ],
      ],
    );
  }

  Widget _key(String label, {required VoidCallback onTap, bool big = false}) {
    return SizedBox(
      height: 34,
      child: OutlinedButton(
        onPressed: onTap,
        style: _keyStyle(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: big ? 16 : 14,
            fontWeight: big ? FontWeight.w900 : FontWeight.w700,
            height: 1.0,
          ),
        ),
      ),
    );
  }

}
