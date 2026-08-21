import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/inventory_item.dart';
import '../models/invoice.dart';
import '../models/in_stock_plu.dart';
import '../models/quote.dart';
import '../models/customer.dart';
import '../services/auth_service.dart';
import '../services/location_service.dart';
import '../services/offline_first_service.dart';
import '../services/base_transaction_sync_service.dart';
import '../services/pack_service.dart';
import '../services/pack_number_service.dart';
import '../models/receipt_template.dart';
import '../services/receipt_service.dart';
import '../widgets/receipt_preview_dialog.dart';
import '../widgets/save_status_dialog.dart';
import '../config/app_config.dart';
import '../services/customer_label.dart';
import '../theme/app_design.dart';
import '../theme/sq_colors.dart';
import '../widgets/inventory_image_widget.dart';
import 'barcode_scanner_page.dart';
import 'add_pack_from_si_tab.dart' show isInvoiceVoided;
import 'add_pack_items_sheet.dart';
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
class PackDetailPage extends StatefulWidget {
  final PackList pick;

  /// True when [pick] hasn't been persisted to Isar yet (fresh from the
  /// "New pick" button). The header only gets written on Save — cancelling
  /// out of an empty draft leaves nothing behind.
  final bool draft;

  /// If non-null, the Add-items sheet is auto-opened on mount, pre-navigated
  /// to the SQ tab with this quote already selected.
  final String? initialSqPreLabel;

  /// If non-null (scanned a pick), the SQ tab defaults its per-line pick source
  /// to this pick and pre-selects the lines it covers.
  final String? initialFocusPick;

  /// Pack lines to pre-load into the buffer on open (e.g. when a pick was
  /// scanned — every one of its items, across all source SQs). Persisted on Save.
  final List<PackListItem>? initialItems;

  const PackDetailPage({
    super.key,
    required this.pick,
    this.draft = false,
    this.initialSqPreLabel,
    this.initialFocusPick,
    this.initialItems,
  });

  @override
  State<PackDetailPage> createState() => _PackDetailPageState();
}

/// One row in the grouped list: either a section header or a SKU card.
class _ListEntry {
  final String? header;
  final int count;
  final double qty;
  final bool existing; // header belongs to an already-created pack
  final _SkuGroup? group;
  const _ListEntry.header(this.header, this.count, this.qty, this.existing)
      : group = null;
  const _ListEntry.card(this.group)
      : header = null,
        count = 0,
        qty = 0,
        existing = false;
}

/// How the pack's line list is sectioned.
enum _GroupMode { none, existingPack, customer, sq, pick, si }

extension _GroupModeLabel on _GroupMode {
  String get label => switch (this) {
        _GroupMode.none => 'No grouping',
        _GroupMode.existingPack => 'Original pack',
        _GroupMode.customer => 'Customer',
        _GroupMode.sq => 'SQ',
        _GroupMode.pick => 'Pick',
        _GroupMode.si => 'Invoice',
      };
  String get short => switch (this) {
        _GroupMode.none => 'Group',
        _GroupMode.existingPack => 'Pack',
        _GroupMode.customer => 'Customer',
        _GroupMode.sq => 'SQ',
        _GroupMode.pick => 'Pick',
        _GroupMode.si => 'SI',
      };
  IconData get icon => switch (this) {
        _GroupMode.none => Icons.layers_clear_outlined,
        _GroupMode.existingPack => Icons.inventory_2,
        _GroupMode.customer => Icons.person_outline,
        _GroupMode.sq => Icons.description_outlined,
        _GroupMode.pick => Icons.shelves,
        _GroupMode.si => Icons.receipt_long,
      };
}

class _PackDetailPageState extends State<PackDetailPage> {
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

  /// How the line list is sectioned. Lines from different SQs can share a
  /// customer, so customer grouping deliberately spans SQs.
  _GroupMode _groupMode = _GroupMode.none;

  /// sourceSq → customer code, and customer code → name (for group headers).
  final Map<String, String> _sqCustomer = {};
  final Map<String, String> _custName = {};

  /// Line identity → the Pack_PreLabel it ALREADY belongs to (another pack).
  /// This wins over the active grouping mode: an already-packed item is always
  /// shown under its original pack.
  final Map<String, String> _existingPack = {};

  /// Stable identity of a single pack line (matches the server's line key).
  String _itemKey(PackListItem it) =>
      '${it.parentPreLabel ?? ''}|${it.sourceSq ?? ''}|'
      '${it.sourceSi ?? ''}|${it.skuNo}|${it.uom}';

  // Includes the line's source so same-SKU lines from different SQs — or for
  // different invoices — don't collide in multi-select.
  String _mergeKey(_MergedLine m) {
    final f = m.items.isNotEmpty ? m.items.first : null;
    return '${m.skuNo}|${m.uom}|${f?.parentPreLabel ?? ''}|'
        '${f?.sourceSq ?? ''}|${f?.sourceSi ?? ''}';
  }

  final _searchCtrl = TextEditingController();
  String _query = '';
  bool _byPlu = true; // true = PLU lookup (default), false = SKU lookup
  List<PackListItem> _items = [];
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
    final all = await isar.packListItems
        .filter()
        .companyCodeEqualTo(widget.pick.companyCode)
        .and()
        .packPreLabelEqualTo(widget.pick.packPreLabel)
        .sortBySequenceNo()
        .findAll();
    // Hide local tombstones (status='X') — they exist only to carry the
    // removal to the server on the next sync.
    final rows = all.where((r) => r.status != 'X').toList();

    // Preserve controllers for lines we've already rendered.
    final keep = <int>{};
    for (final it in rows) {
      keep.add(it.id);
      _controllers.putIfAbsent(it.id, () => TextEditingController(
            // Blank = nothing picked yet, so tab logic reads it as pending.
            text: (it.packQty ?? 0) == 0
                ? ''
                : _fmtQty(it.packQty ?? 0),
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
    }

    // Which invoice each line belongs to. Isolated — see PickDetailPage._load.
    try {
      if (cc != null) await _loadInvoiceLinks(cc);
    } catch (e) {
      print('❌ PackDetail: invoice link load failed: $e');
    }

    await _hydrateCustomers(rows);
    await _hydrateExistingPacks(rows);

    _originalItemIds
      ..clear()
      ..addAll(rows.map((r) => r.id));

    if (!mounted) return;
    setState(() {
      _items = rows;
      _loading = false;
    });

    // Seed pre-loaded lines once (e.g. from a scanned pick) — after _items is
    // set so their temp sequence numbers don't collide with loaded rows.
    if (!_seededInitial && (widget.initialItems?.isNotEmpty ?? false)) {
      _seededInitial = true;
      _bufferItems(List<PackListItem>.from(widget.initialItems!));
    }
  }

  bool _seededInitial = false;
  String? _assignedName;


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
                color: unassigned ? AppDesign.inkSubtle : AppDesign.modPacking),
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
      accent: AppDesign.modPacking,
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
  // a short pack can be closed off deliberately, which is what unblocks the
  // queue when stock runs out.

  bool get _isCompleted => widget.pick.status == 'C';
  bool get _isCancelled => widget.pick.status == 'X';
  bool get _isClosed => _isCompleted || _isCancelled;

  /// Lines still short of their planned qty.
  int get _shortLines =>
      _groupItems(_items).where((m) => !_isMergedPacked(m)).length;

  /// Status pill in the header — tap to change state.
  Widget _lifecycleChip() {
    final (label, fg, bg, icon) = _isCancelled
        ? ('CANCELLED', AppDesign.danger, const Color(0xFFFEE2E2), Icons.block)
        : _isCompleted
            ? ('COMPLETED', AppDesign.success, const Color(0xFFDCFCE7),
                Icons.check_circle)
            : ('OPEN', AppDesign.modPacking, AppDesign.modPackingBg, Icons.radio_button_unchecked);
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

  /// Banner shown while the pack is closed — explains why it's read-only.
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
                ? 'This pack was cancelled — it is read-only.'
                : 'This pack is completed — it is read-only.',
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

  Future<void> _openLifecycleMenu() async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pack status',
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
                      ? '$_shortLines item(s) not fully packed — allowed'
                      : 'All items packed',
                  style: const TextStyle(fontSize: 11)),
              onTap: () => Navigator.pop(context, 'C'),
            ),
            ListTile(
              dense: true,
              leading: const Icon(Icons.block, size: 19, color: AppDesign.danger),
              title: const Text('Cancel pack',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: const Text('Closes it without packed the rest',
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
          content: Text('$_shortLines item(s) are not fully packed. '
              'Completing closes the pack with the quantities entered.'),
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
      final go = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Cancel this pack?'),
          content: const Text(
              'It becomes read-only, its claim on the pick is released, and its '
              'quantities stop counting as packed. You can reopen it later.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: const Text('Keep open')),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: AppDesign.danger),
              onPressed: () => Navigator.pop(c, true),
              child: const Text('Cancel pack'),
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

    final label = widget.pick.packPreLabel;
    if (label != null && label.isNotEmpty) {
      final svc = PackService();
      final r = await svc.syncPacksByPreLabels([label]);
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

  double _entered(PackListItem it) {
    final txt = _controllers[it.id]?.text ?? '';
    return double.tryParse(txt) ?? 0;
  }

  bool _matchesSearch(PackListItem it) {
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
  // separate PackListItem records (each maps to one SQ line so the balance
  // split + save stay per-SQ), but DISPLAY them as one merged line: summed
  // planned/picked qty and every source SQ tag together.

  /// Group `_items` (already filtered) by (skuNo, uom), preserving order.
  List<_MergedLine> _groupItems(List<PackListItem> src) {
    final order = <String>[];
    final map = <String, List<PackListItem>>{};
    for (final it in src) {
      // Include parent pick + source SQ + source SI so the same SKU from two
      // SQs — or packed for two invoices — stays as two distinct lines.
      //
      // Keeping the invoice in the key also keeps SI-sourced lines out of the
      // same group as pick-sourced ones, which matters beyond display: the
      // "packed more than picked" check reads a group's parent pick, and a
      // group blending both sources would compare an invoice's quantity
      // against a pick that never contained it.
      final key = '${it.skuNo}|${it.uom}|${it.parentPreLabel ?? ''}|'
          '${it.sourceSq ?? ''}|${it.sourceSi ?? ''}';
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

  /// Total qty actually picked on the source pick(s) for this line's (sku,uom).
  /// Returns -1 when the line has no source pick (ad-hoc) so no warning fires.
  Future<double> _pickedForMerged(_MergedLine m) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return -1;
    final hasParent =
        m.items.any((e) => (e.parentPreLabel ?? '').isNotEmpty);
    if (!hasParent) return -1;
    double picked = 0;
    for (final it in m.items) {
      final parent = it.parentPreLabel;
      if (parent == null || parent.isEmpty) continue;
      // A cancelled pick counts as nothing picked.
      final hdr = await isar.pickLists
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .pickPreLabelEqualTo(parent)
          .findFirst();
      if (hdr?.status == 'X') continue;
      // Match the exact pick line: pick + its source SQ + sku + uom.
      final candidates = await isar.pickListItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .pickPreLabelEqualTo(parent)
          .and()
          .skuNoEqualTo(it.skuNo ?? 0)
          .and()
          .uomEqualTo(it.uom ?? '')
          .findAll();
      final src = it.sourceSq;
      final pl = candidates.firstWhere(
        (p) => (src == null || src.isEmpty)
            ? (p.parentPreLabel == null || p.parentPreLabel!.isEmpty)
            : p.parentPreLabel == src,
        orElse: () => candidates.isNotEmpty ? candidates.first : PickListItem(),
      );
      picked += pl.pickQty ?? 0;
    }
    return picked;
  }

  double _pickedOf(_MergedLine m) =>
      m.items.fold(0.0, (s, it) => s + _entered(it));

  bool _isMergedPacked(_MergedLine m) {
    final planned = _plannedOf(m);
    final picked = _pickedOf(m);
    if (planned <= 0) return picked > 0;
    return picked >= planned;
  }

  /// What this line traces back to, for the provenance chip: its SQ, else the
  /// invoice it was packed for, else nothing.
  static String _sourceLabel(PackListItem it) {
    final sq = (it.parentPreLabel ?? '').trim();
    if (sq.isNotEmpty) return sq;
    final si = (it.sourceSi ?? '').trim();
    if (si.isNotEmpty) return si;
    return 'No SQ';
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
      if (!AppConfig.enableLooseItems) {
        // Phase 1: no loose items. A code that matches nothing on the pack
        // is a dead end, not a doorway into the inventory.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('"$code" is not on this pack.')),
        );
        return;
      }
      await _openAddSheet(inventoryCode: code.trim());
      return;
    }

    final groups = _groupItems(_items);
    final skuLines = groups.where((g) => g.skuNo == targetSku).toList();

    // SKU resolved but isn't on this pick → bring the user straight to the
    // add-item popup, pre-searched to this SKU (auto-opens the qty/UOM
    // dialog on a single match), defaulting to the scanned PLU's UOM.
    if (skuLines.isEmpty) {
      if (!AppConfig.enableLooseItems) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('SKU $targetSku is not on this pack.')),
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
                  backgroundColor: AppDesign.modPacking,
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
        Widget sqRow(PackListItem it) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    // An invoice-sourced line has no pick and no SQ, so name
                    // the invoice — labelling it "No SQ" would read as a line
                    // with no provenance at all, which is the opposite of the
                    // truth.
                    _sourceLabel(it),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: c),
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
                    color: complete ? AppDesign.success : AppDesign.modPacking,
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
                    if (planned > 0 && total > planned + eps) {
                      await showDialog<void>(
                        context: ctx,
                        builder: (c) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: const Text('Over pack'),
                          content: const Text(
                              'Total packed qty cannot exceed the target qty.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(c),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    // Soft warning: packing more than was actually picked on
                    // the source pick(s). Hard cap is the planned qty above;
                    // this only nudges, it doesn't block.
                    final picked = await _pickedForMerged(m);
                    if (picked >= 0 && total > picked + eps && ctx.mounted) {
                      final go = await showDialog<bool>(
                        context: ctx,
                        builder: (c) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          title: const Text('More than picked'),
                          content: Text(
                              'Packing ${_fmtQty(total)} but only ${_fmtQty(picked)} was picked on the source pick. Continue?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(c, false),
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () => Navigator.pop(c, true),
                                child: const Text('Pack anyway')),
                          ],
                        ),
                      );
                      if (go != true) return;
                    }
                    if (ctx.mounted) Navigator.pop(ctx, true);
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

    final added = await showModalBottomSheet<List<PackListItem>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddPackItemsSheet(
        pick: widget.pick,
        initialSqPreLabel: consumingSq,
        initialFocusPick: widget.initialFocusPick,
        initialInventoryCode: inventoryCode,
        initialInventoryUom: inventoryUom,
        existingItems: List<PackListItem>.from(_items),
      ),
    );
    if (added == null || added.isEmpty) return;
    _bufferItems(added);
  }

  /// Buffer newly-added items into the in-memory list (temp ids/seq,
  /// controllers, lookups). Persisted on Save.
  void _bufferItems(List<PackListItem> added) {
    if (added.isEmpty) return;
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
              text: (it.packQty ?? 0) == 0 ? '' : _fmtQty(it.packQty ?? 0)));
      final sku = it.skuNo;
      if (sku != null && !_skuDescriptions.containsKey(sku)) {
        _hydrateLookupsFor(sku);
      }
    }
    _hydrateCustomers(added);
    _hydrateExistingPacks(added);
    setState(() => _dirty = true);

    // Invoice links for the lines just added. They live in the in-memory
    // buffer until Save, so _load()'s pass never sees them. Fire-and-forget
    // like the sibling hydrators above: the rows are already on screen and
    // the invoice tag fills in a frame later.
    final ccAdd = widget.pick.companyCode;
    if (ccAdd != null) {
      _loadInvoiceLinks(ccAdd).catchError((e) {
        print('❌ PackDetail: invoice link load (added lines) failed: $e');
      });
    }
  }

  /// Resolve each line's source SQ → customer code → customer name, so the
  /// list can be grouped by customer (lines from different SQs can share one).
  Future<void> _hydrateCustomers(List<PackListItem> rows) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    final sqs = rows
        .map((r) => r.sourceSq)
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
      final cust = q.customer;
      if (label == null) continue;
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
        // If a code exists under several companies, THIS company's row wins.
        if (c.companyCode == cc || !_custName.containsKey(c.code)) {
          _custName[c.code] = name;
        }
      }
    }
    if (mounted) setState(() {});
  }

  /// Lines that already live in another pack are never written into THIS pack,
  /// but an edit made here still has to land somewhere — so push the changed
  /// quantity back to the pack the line actually belongs to, and refresh that
  /// pack's header totals + unsynced flag so it re-uploads.
  Future<({int updated, Set<String> packs})> _applyEditsToOriginalPacks(
      List<PackListItem> staged) async {
    final cc = widget.pick.companyCode;
    if (cc == null || staged.isEmpty) {
      return (updated: 0, packs: <String>{});
    }
    final userId = AuthService().currentUser?.userId;
    final now = DateTime.now();
    final touched = <String>{};
    final rows = <PackListItem>[];

    for (final it in staged) {
      final label = _existingPack[_itemKey(it)];
      if (label == null || label.isEmpty) continue;
      final id = BaseTransactionSyncService.packListItemId(
        cc,
        label,
        it.skuNo ?? 0,
        it.uom ?? '',
        it.parentPreLabel ?? '',
        it.sourceSq ?? '',
        it.sourceSi ?? '',
      );
      final orig = await isar.packListItems.get(id);
      if (orig == null) continue;
      final v = _entered(it);
      if ((orig.packQty ?? 0) == v) continue; // untouched
      orig
        ..packQty = v
        ..lastWriteTimeStamp = now
        ..lastModifiedBy = userId
        ..isSynced = false;
      rows.add(orig);
      touched.add(label);
    }
    if (rows.isEmpty) return (updated: 0, packs: <String>{});

    // Recompute each affected pack's header from its (edited) lines.
    final edited = {for (final r in rows) r.id: r};
    final headers = <PackList>[];
    for (final label in touched) {
      final hdr = await isar.packLists
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .packPreLabelEqualTo(label)
          .findFirst();
      if (hdr == null) continue;
      final lines = await isar.packListItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .packPreLabelEqualTo(label)
          .findAll();
      double q = 0;
      int n = 0;
      for (final r in lines) {
        final eff = edited[r.id] ?? r;
        if (eff.status == 'X') continue;
        final v = eff.packQty ?? 0;
        if (v > 0) {
          n++;
          q += v;
        }
      }
      headers.add(hdr
        ..totalPackQty = q
        ..totalPackItem = n
        ..lastModifiedBy = userId
        ..lastWriteTimeStamp = now
        ..uploadToken =
            'pa-${hdr.id.toRadixString(16)}-${now.microsecondsSinceEpoch}'
        ..isSynced = false);
    }

    await isar.writeTxn(() async {
      await isar.packListItems.putAll(rows);
      if (headers.isNotEmpty) await isar.packLists.putAll(headers);
    });
    return (updated: rows.length, packs: touched);
  }

  /// Fresh, SAVE-TIME check of which lines already belong to another pack.
  /// The load-time `_existingPack` map can be stale (a sync or another pack may
  /// have landed since), so we re-query before writing anything. Returns the
  /// offending line keys and refreshes the map as a side effect.
  Future<Set<String>> _packedElsewhere(List<PackListItem> items) async {
    final cc = widget.pick.companyCode;
    final self = widget.pick.packPreLabel;
    if (cc == null || items.isEmpty) return {};
    final parents = items
        .map((e) => e.parentPreLabel)
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .toSet()
        .toList();
    if (parents.isEmpty) return {};
    final rows = await isar.packListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(parents, (q, p) => q.parentPreLabelEqualTo(p))
        .findAll();
    final wanted = {for (final it in items) _itemKey(it)};
    final out = <String>{};
    for (final r in rows) {
      if (r.status == 'X') continue;
      final label = r.packPreLabel;
      if (label == null || label.isEmpty || label == self) continue;
      final k = _itemKey(r);
      if (wanted.contains(k)) {
        out.add(k);
        _existingPack[k] = label;
      }
    }
    return out;
  }

  /// Find which of these lines are ALREADY packed (in another pack), so they
  /// can be shown under their original pack — highest-priority grouping.
  Future<void> _hydrateExistingPacks(List<PackListItem> rows) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    final parents = rows
        .map((r) => r.parentPreLabel)
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .toSet()
        .toList();
    if (parents.isEmpty) return;
    final existing = await isar.packListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(parents, (q, p) => q.parentPreLabelEqualTo(p))
        .findAll();
    var found = false;
    final byKey = <String, PackListItem>{};
    for (final e in existing) {
      if (e.status == 'X') continue;
      final label = e.packPreLabel;
      if (label == null || label.isEmpty) continue;
      if (label == widget.pick.packPreLabel) continue; // this pack
      final k = _itemKey(e);
      _existingPack[k] = label;
      byKey[k] = e;
      found = true;
    }
    if (!found || !mounted) return;

    setState(() {
      // Surface the original packs straight away.
      if (_groupMode == _GroupMode.none) _groupMode = _GroupMode.existingPack;

      // Show the CURRENT packed quantity for a line that's already in a pack.
      // Staged lines built from a pick start at 0, which would otherwise
      // display a stale figure next to a line that is in fact already packed.
      for (final it in rows) {
        final e = byKey[_itemKey(it)];
        if (e == null) continue;
        it.packQty = e.packQty ?? 0;
        it.baselinePackQty = e.baselinePackQty ?? 0;
        final ctrl = _controllers[it.id];
        if (ctrl != null) {
          final v = it.packQty ?? 0;
          ctrl.text = v == 0 ? '' : _fmtQty(v);
        }
      }
    });
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

  // ───────────────────────────── Printing ────────────────────────────────

  bool _printing = false;

  /// Prints the pack receipt on the paired Bluetooth thermal printer.
  ///
  /// Quantities live in the text controllers until Save copies them onto the
  /// items, and a draft has no pack number until then — so an unsaved pack is
  /// saved first rather than printing numbers that aren't stored anywhere.
  Future<void> _printReceipt() async {
    if (_printing || _saving) return;

    final needsSave = _dirty || (widget.pick.packPreLabel ?? '').isEmpty;
    if (needsSave) {
      final go = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Save before printing?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          content: const Text(
            'This pack has changes that aren\'t saved yet. It will be saved so '
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
                  backgroundColor: AppDesign.modPacking,
                  foregroundColor: Colors.white),
              child: const Text('Save & print'),
            ),
          ],
        ),
      );
      if (go != true || !mounted) return;
      await _save(silent: true);
      // A rejected save (no items, or every line already packed elsewhere)
      // leaves nothing to print a receipt for.
      if (!mounted ||
          _dirty ||
          _items.isEmpty ||
          (widget.pick.packPreLabel ?? '').isEmpty) return;
    }

    // A pack can cover several invoices, and the goods for each leave on a
    // different document. Offer one slip per invoice so each carton travels
    // with a list that matches the invoice it is billed under.
    final invoices = _invoicesOnPack;
    var perInvoice = false;
    if (invoices.length > 1) {
      final choice = await _askPrintMode(invoices.length);
      if (choice == null || !mounted) return; // backed out
      perInvoice = choice;
    }

    // Preview first — the dialog owns template choice, the send, its failures
    // and its retry. It calls back to re-render whenever the template changes.
    final result = await ReceiptPreviewDialog.show(
      context,
      module: ReceiptTemplate.modulePack,
      build: (t) => perInvoice
          ? ReceiptService().buildPack(
              widget.pick, _linesForInvoice(invoices.first), t,
              invoiceNo: invoices.first,
              partLabel: '1 of ${invoices.length}')
          : ReceiptService().buildPack(widget.pick, _items, t),
      // Slips 2..N go out on the template the operator just previewed.
      buildRest: !perInvoice
          ? null
          : (t) async => [
                for (var i = 1; i < invoices.length; i++)
                  await ReceiptService().buildPack(
                      widget.pick, _linesForInvoice(invoices[i]), t,
                      invoiceNo: invoices[i],
                      partLabel: '${i + 1} of ${invoices.length}'),
              ],
      accent: AppDesign.modPacking,
    );
    if (!mounted || result == null) return; // dismissed without printing
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppDesign.success,
      behavior: SnackBarBehavior.floating,
      content: Text(perInvoice
          ? '${invoices.length} slips sent to printer'
          : 'Receipt sent to printer'),
    ));
  }

  /// The pack's live lines for one invoice.
  List<PackListItem> _linesForInvoice(String si) =>
      _items.where((it) => it.status != 'X' && _siFor(it) == si).toList();

  /// Whole pack, or one slip per invoice? Returns null if backed out.
  ///
  /// Only asked when the pack actually spans more than one invoice — a
  /// single-invoice pack has one sensible answer and shouldn't cost a tap.
  Future<bool?> _askPrintMode(int count) async {
    // Lines that belong to no invoice yet would silently vanish from
    // per-invoice slips, so say how many up front rather than letting someone
    // discover it at the packing bench.
    final orphans =
        _items.where((it) => it.status != 'X' && _siFor(it) == null).length;
    return showModalBottomSheet<bool>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Print pack list',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long, color: AppDesign.modPacking),
            title: const Text('One slip per invoice',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            subtitle: Text(
              '$count slips, split by invoice'
              '${orphans > 0 ? ' · $orphans line(s) have no invoice and will be left off' : ''}',
              style: const TextStyle(fontSize: 11.5),
            ),
            onTap: () => Navigator.pop(ctx, true),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined,
                color: AppDesign.inkMuted),
            title: const Text('Whole pack on one slip',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            subtitle: const Text('Every line, in the order shown',
                style: TextStyle(fontSize: 11.5)),
            onTap: () => Navigator.pop(ctx, false),
          ),
          const SizedBox(height: 8),
        ]),
      ),
    );
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
        accent: AppDesign.modPacking,
        onRetry: () => _uploadNow(status),
      );
    }

    // Never write a line that already belongs to another pack — it stays in
    // its original pack (highest priority). Re-checked here, at save time.
    final packed = await _packedElsewhere(_items);
    if (packed.isNotEmpty) {
      final drop = _items.where((it) => packed.contains(_itemKey(it))).toList();
      // Their edits still count — write them back to their own pack.
      final res = await _applyEditsToOriginalPacks(drop);
      if (!mounted) {
        // Page gone, but the dialog route may still be up — give it a terminal
        // state so it isn't left spinning.
        status?.to(SaveStage.queued,
            detail: 'Saved. Upload will run on the next sync.');
        return;
      }
      setState(() {
        for (final it in drop) {
          _items.remove(it);
          _controllers.remove(it.id)?.dispose();
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Excluded ${drop.length} already-packed item(s)'
            '${res.updated > 0 ? " — updated ${res.updated} in ${res.packs.join(", ")}" : ""}',
          ),
        ),
      );
      if (_items.isEmpty) {
        setState(() {
          _saving = false;
          _dirty = false;
        });
        // Everything belonged to another pack; their edits were written back
        // to those packs, which now upload on the next sync.
        status?.to(SaveStage.queued,
            detail: res.updated > 0
                ? 'All items belong to other packs. ${res.updated} line(s) '
                    'updated in ${res.packs.join(", ")} — queued for upload.'
                : 'All items already belong to other packs — nothing to save '
                    'here.');
        return;
      }
    }

    double totalQty = 0;
    int totalItems = 0;
    final userId = AuthService().currentUser?.userId;
    final now = DateTime.now();
    final cc = widget.pick.companyCode ?? 0;
    // Mint the pack number HERE (first save) — a draft that's abandoned never
    // consumes one.
    var label = widget.pick.packPreLabel ?? '';
    if (label.isEmpty) {
      label = await PackNumberService().nextPackNumber();
      widget.pick.packPreLabel = label;
    }

    // Assign DETERMINISTIC Isar ids (same scheme the download sync uses) so
    // when the server copy syncs back it upserts over these rows instead of
    // creating duplicates.
    for (final it in _items) {
      final v = double.tryParse(_controllers[it.id]?.text ?? '') ?? 0;
      it.packQty = v;
      it.packPreLabel = label; // draft items get the number now
      it.lastWriteTimeStamp = now;
      it.lastModifiedBy = userId;
      it.isSynced = false;
      // Count every line; only sum the quantity actually entered. Counting
      // only picked lines under-reported the document (and disagreed with the
      // hub and the receipt, which count all lines).
      totalItems++;
      totalQty += v;
      it.id = BaseTransactionSyncService.packListItemId(
        it.companyCode ?? cc,
        label,
        it.skuNo ?? 0,
        it.uom ?? '',
        it.parentPreLabel ?? '',
        it.sourceSq ?? '',
        it.sourceSi ?? '',
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
    final headerId = BaseTransactionSyncService.packListId(cc, label);
    final header = widget.pick
      ..id = headerId
      ..locationCode = headerLoc
      ..totalPackQty = totalQty
      ..totalPackItem = totalItems
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
        ? <PackListItem>[]
        : await isar.packListItems.getAll(toDelete);
    final tombstone = <PackListItem>[];
    final hardDelete = <int>[];
    for (var i = 0; i < toDelete.length; i++) {
      final row = i < orphans.length ? orphans[i] : null;
      if (row != null && row.isSynced) {
        // Known to the server: mark it removed so the next upload carries it.
        row
          ..status = 'X'
          ..isSynced = false
          ..packQty = 0
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
        await isar.packLists.delete(oldHeaderId);
      }
      await isar.packLists.put(header);
      await isar.packListItems.putAll(_items);
      if (tombstone.isNotEmpty) await isar.packListItems.putAll(tombstone);
      if (hardDelete.isNotEmpty) {
        await isar.packListItems.deleteAll(hardDelete);
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

  /// Pushes this document to the server and reports the outcome onto [status].
  ///
  /// Save now uploads rather than only writing locally — "syncing / synced"
  /// would otherwise be a promise the Save button never kept. Offline is a
  /// deferral, not a failure: the work is already safe on the device and the
  /// next sync picks it up.
  /// Re-reads the header row onto [widget.pick] after something else has
  /// written it.
  ///
  /// Save sets `isSynced = false` on this object and then uploads; the upload
  /// writes the ROW, and nothing was copying that back onto the object this
  /// page holds — so the page went on believing the document was unsynced
  /// until you left the screen and came back.
  ///
  /// Copying field-by-field rather than swapping the reference keeps every
  /// existing `widget.pick.x` read valid.
  Future<void> _refreshHeader() async {
    final cc = widget.pick.companyCode;
    final label = (widget.pick.packPreLabel ?? '').trim();
    if (cc == null || label.isEmpty) return;
    final row = await isar.packLists
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .packPreLabelEqualTo(widget.pick.packPreLabel)
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
        ..totalPackQty = row.totalPackQty
        ..totalPackItem = row.totalPackItem
        ..assignedTo = row.assignedTo
        ..lastModifiedBy = row.lastModifiedBy
        ..lastWriteTimeStamp = row.lastWriteTimeStamp
        ..cancelledBy = row.cancelledBy
        ..cancelledDate = row.cancelledDate;
    });
  }

  Future<void> _uploadNow(SaveStatusController status) async {
    final label = widget.pick.packPreLabel;
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
    final svc = PackService();
    try {
      final r = await svc.syncPacksByPreLabels([label]);
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
        status.to(SaveStage.failed,
            detail: svc.lastErrors[label] ??
                'The server did not accept the upload.');
      }
    } catch (_) {
      status.to(SaveStage.queued,
          detail: 'Could not reach the server. Queued for the next sync.');
    }
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
    final tombstones = <PackListItem>[];
    final hardDelete = <int>[];
    for (final it in m.items) {
      if (_originalItemIds.contains(it.id)) {
        it.status = 'X';
        it.isSynced = false;
        it.packQty = 0;
        it.lastWriteTimeStamp = now;
        it.lastModifiedBy = userId;
        tombstones.add(it);
      } else {
        hardDelete.add(it.id);
      }
    }
    await isar.writeTxn(() async {
      if (tombstones.isNotEmpty) await isar.packListItems.putAll(tombstones);
      if (hardDelete.isNotEmpty) await isar.packListItems.deleteAll(hardDelete);
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
        .where((g) => isPending ? !_isMergedPacked(g) : _isMergedPacked(g))
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
        // Pack number lives in the header card below — keeps the bar free for
        // the Select / Add / Save actions.
        title: const Text('Pack',
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
                          color: AppDesign.modPacking)),
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
                    tooltip: 'Print receipt',
                    icon: _printing
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: AppDesign.modPacking),
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
                      backgroundColor: AppDesign.modPacking,
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
                  if (_items.isNotEmpty && widget.draft && !_isClosed)
                    _newPackBar(),
                  if (_siPanelOpen && _items.isNotEmpty) _siStrip(),
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
                // Pack number — moved here from the app bar.
                Row(
                  children: [
                    const Icon(Icons.inventory_2,
                        size: 14, color: AppDesign.modPacking),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        (p.packPreLabel ?? '').isNotEmpty
                            ? p.packPreLabel!
                            : 'New pack · number on save',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: (p.packPreLabel ?? '').isNotEmpty
                                ? AppDesign.modPacking
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
                  '${_items.length} items · qty ${(p.totalPackQty ?? 0).toStringAsFixed(0)}',
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
    final pickedCount = groups.where(_isMergedPacked).length;
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
                  _subTabBtn('Packed', pickedCount, 1),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          _siFilterChip(),
          const SizedBox(width: 6),
          _groupChip(),
          const SizedBox(width: 6),
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
              color: selected ? AppDesign.modPacking : AppDesign.inkMuted,
            ),
          ),
        ),
      ),
    );
  }

  Set<String> get _existingPackLabels => _existingPack.values.toSet();

  /// Lines still free to go into a new pack — anything already belonging to a
  /// pack stays in its original pack (highest priority) and is excluded.
  List<_MergedLine> _packableLines() => _groupItems(_items).where((m) {
        final f = m.items.isNotEmpty ? m.items.first : null;
        if (f == null) return false;
        final ep = _existingPack[_itemKey(f)];
        return ep == null || ep.isEmpty;
      }).toList();

  /// "Create new pack" — opens a picker to choose which of the current lines
  /// go into the new pack. Whatever is left stays staged for the next one.
  Widget _newPackBar() {
    final pool = _packableLines();
    if (pool.isEmpty) return const SizedBox.shrink();
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
      child: SizedBox(
        height: 34,
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _saving ? null : _createNewPack,
          icon: const Icon(Icons.add_box_outlined, size: 16),
          label: Text(
            'Create new pack (${pool.length} item${pool.length > 1 ? "s" : ""} available)',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDesign.modPacking,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          ),
        ),
      ),
    );
  }

  /// Popup: choose which lines go into the new pack. Sectioned by the active
  /// grouping (so e.g. a whole customer can be taken in one tap). Everything
  /// starts selected; returns null on cancel.
  Future<List<_MergedLine>?> _choosePackLines() async {
    final pool = _packableLines();
    if (pool.isEmpty) return null;
    final chosen = <String>{...pool.map(_mergeKey)};

    // Bucket by the active grouping for the section headers.
    final buckets = <String, List<_MergedLine>>{};
    for (final m in pool) {
      buckets.putIfAbsent(_groupLabelFor(m), () => []).add(m);
    }

    return showModalBottomSheet<List<_MergedLine>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) {
          final selectedLines =
              pool.where((m) => chosen.contains(_mergeKey(m))).toList();
          return DraggableScrollableSheet(
            initialChildSize: 0.75,
            minChildSize: 0.4,
            maxChildSize: 0.95,
            expand: false,
            builder: (context, controller) => Container(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 8, 6),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text('Items for the new pack',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800)),
                        ),
                        TextButton(
                          onPressed: () => setSheet(() {
                            if (chosen.length == pool.length) {
                              chosen.clear();
                            } else {
                              chosen
                                ..clear()
                                ..addAll(pool.map(_mergeKey));
                            }
                          }),
                          child: Text(
                              chosen.length == pool.length ? 'Clear' : 'All',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppDesign.modPacking)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: AppDesign.border),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                      children: [
                        for (final entry in buckets.entries) ...[
                          if (entry.key.isNotEmpty)
                            _sheetSectionRow(entry, chosen, setSheet),
                          for (final m in entry.value)
                            _sheetLineRow(m, chosen, setSheet),
                        ],
                      ],
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 42,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: selectedLines.isEmpty
                              ? null
                              : () => Navigator.pop(ctx, selectedLines),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppDesign.modPacking,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDesign.radiusSm)),
                          ),
                          child: Text(
                            selectedLines.isEmpty
                                ? 'Select at least one item'
                                : 'Create pack with ${selectedLines.length} item(s)',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section header inside the picker, with a whole-group toggle.
  Widget _sheetSectionRow(MapEntry<String, List<_MergedLine>> entry,
      Set<String> chosen, void Function(void Function()) setSheet) {
    final keys = entry.value.map(_mergeKey).toList();
    final allIn = keys.every(chosen.contains);
    return InkWell(
      onTap: () => setSheet(() {
        if (allIn) {
          chosen.removeAll(keys);
        } else {
          chosen.addAll(keys);
        }
      }),
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: AppDesign.modPacking.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        ),
        child: Row(
          children: [
            Icon(allIn ? Icons.check_box_rounded : Icons.check_box_outline_blank,
                size: 15, color: AppDesign.modPacking),
            const SizedBox(width: 6),
            Expanded(
              child: Text(entry.key,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.modPacking)),
            ),
            Text('${entry.value.length}',
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.inkMuted)),
          ],
        ),
      ),
    );
  }

  /// One selectable line inside the picker.
  Widget _sheetLineRow(_MergedLine m, Set<String> chosen,
      void Function(void Function()) setSheet) {
    final k = _mergeKey(m);
    final sel = chosen.contains(k);
    final desc = _skuDescriptions[m.skuNo ?? -1] ?? '';
    final f = m.items.isNotEmpty ? m.items.first : null;
    final entered = m.items.fold<double>(0, (s, it) => s + _entered(it));
    final planned = _plannedOf(m);
    return InkWell(
      onTap: () => setSheet(() {
        if (!chosen.remove(k)) chosen.add(k);
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: sel ? AppDesign.modPacking.withOpacity(0.06) : AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
              color: sel ? AppDesign.modPacking.withOpacity(0.5) : AppDesign.border),
        ),
        child: Row(
          children: [
            Icon(sel ? Icons.check_box_rounded : Icons.check_box_outline_blank,
                size: 18, color: sel ? AppDesign.modPacking : AppDesign.inkSubtle),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(desc.isNotEmpty ? desc : 'SKU ${m.skuNo}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.ink),
                      // Two lines — a truncated description is the one field
                      // a packer cannot work around.
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    '${m.uom ?? ""} · SKU ${m.skuNo}',
                    style: const TextStyle(
                        fontSize: 10, color: AppDesign.inkMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Whose goods these are. Its own line, in the module accent,
                  // rather than trailing the UOM/SKU run — on a mixed pack this
                  // is what stops two customers' stock ending up in one carton,
                  // so it should not have to compete for attention.
                  if ((f?.sourceSq ?? '').isNotEmpty) ...[
                    const SizedBox(height: 1),
                    Text(
                      () {
                        final sq = f!.sourceSq ?? '';
                        final code = _sqCustomer[sq] ?? '';
                        return CustomerLabel.sqWithCustomer(
                            sq, code, _custName[code]);
                      }(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.modPacking),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            Text('${_fmtQty(entered)}/${_fmtQty(planned)}',
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.ink)),
          ],
        ),
      ),
    );
  }

  /// Create ONE new pack from the selected lines (or every free line when
  /// nothing is selected). Those lines leave the staging list; whatever is left
  /// stays so the next pack can be created immediately.
  Future<void> _createNewPack() async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    // Let the user choose exactly which lines go into this pack.
    final picked = await _choosePackLines();
    if (picked == null || picked.isEmpty || !mounted) return;

    // Re-check at save time: drop anything that already belongs to a pack.
    final packedKeys =
        await _packedElsewhere(picked.expand((m) => m.items).toList());
    final pool = packedKeys.isEmpty
        ? picked
        : picked
            .where((m) =>
                m.items.isEmpty || !packedKeys.contains(_itemKey(m.items.first)))
            .toList();
    if (pool.length != picked.length) {
      // Excluded from the new pack, but any qty change they carry is written
      // back to the pack they already belong to.
      final excluded = picked
          .where((m) =>
              m.items.isNotEmpty && packedKeys.contains(_itemKey(m.items.first)))
          .expand((m) => m.items)
          .toList();
      final res = await _applyEditsToOriginalPacks(excluded);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Excluded ${picked.length - pool.length} already-packed item(s)'
            '${res.updated > 0 ? " — updated ${res.updated} in ${res.packs.join(", ")}" : ""}',
          ),
        ),
      );
    }
    if (!mounted) return;
    if (pool.isEmpty) {
      setState(() {}); // refresh so the packed lines show their original pack
      return;
    }

    setState(() => _saving = true);
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final label = await PackNumberService().nextPackNumber();
    final headerId = BaseTransactionSyncService.packListId(cc, label);

    final rows = <PackListItem>[];
    final consumed = <int>{}; // staging ids moved into the new pack
    double totalQty = 0;
    int totalItems = 0;
    String? loc;
    for (final m in pool) {
      for (final it in m.items) {
        final v = _entered(it);
        if (v > 0) {
          totalItems++;
          totalQty += v;
        }
        loc ??= it.locationCode;
        consumed.add(it.id);
        rows.add(PackListItem()
          ..id = BaseTransactionSyncService.packListItemId(
              cc, label, it.skuNo ?? 0, it.uom ?? '',
              it.parentPreLabel ?? '', it.sourceSq ?? '', it.sourceSi ?? '')
          ..companyCode = cc
          ..packPreLabel = label
          ..sequenceNo = rows.length + 1
          ..skuNo = it.skuNo
          ..uom = it.uom
          ..parentPreLabel = it.parentPreLabel
          ..sourceSq = it.sourceSq
          ..sourceSi = it.sourceSi
          ..locationCode = it.locationCode
          ..status = 'A'
          ..factor = it.factor
          ..qty = it.qty
          ..packQty = v
          ..baselinePackQty = 0
          ..addedBy = userId
          ..addedDate = now
          ..lastModifiedBy = userId
          ..lastWriteTimeStamp = now
          ..isSynced = false);
      }
    }

    final header = PackList()
      ..id = headerId
      ..companyCode = cc
      ..packPreLabel = label
      ..locationCode = loc ?? widget.pick.locationCode
      ..status = 'A'
      ..totalPackQty = totalQty
      ..totalPackItem = totalItems
      ..addedBy = userId
      ..addedDate = now
      ..lastModifiedBy = userId
      ..lastWriteTimeStamp = now
      // Split packs inherit the staging pack's assignee.
      ..assignedTo = widget.pick.assignedTo ?? userId
      ..uploadToken =
          'pa-${headerId.toRadixString(16)}-${now.microsecondsSinceEpoch}'
      ..isSynced = false;

    await isar.writeTxn(() async {
      await isar.packLists.put(header);
      await isar.packListItems.putAll(rows);
    });

    if (!mounted) return;
    // Drop the packed lines from staging; keep the rest for the next pack.
    setState(() {
      _items.removeWhere((x) => consumed.contains(x.id));
      for (final id in consumed) {
        _controllers.remove(id)?.dispose();
      }
      _selectMode = false;
      _selectedKeys.clear();
      _saving = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppDesign.success,
        content: Text('Created pack $label (${rows.length} item(s))'),
      ),
    );
    if (_items.isEmpty && mounted) Navigator.of(context).pop();
  }

  /// Grouping selector. Sections the line list by customer / SQ / pick.
  Widget _groupChip() {
    final on = _groupMode != _GroupMode.none;
    return InkWell(
      onTap: _pickGroupMode,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: on ? AppDesign.modPacking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on ? AppDesign.modPacking.withOpacity(0.5) : AppDesign.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(on ? _groupMode.icon : Icons.workspaces_outline,
                size: 14, color: on ? AppDesign.modPacking : AppDesign.inkMuted),
            const SizedBox(width: 3),
            Text(
              _groupMode.short,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: on ? AppDesign.modPacking : AppDesign.inkMuted,
                letterSpacing: 0.3,
              ),
            ),
            Icon(Icons.arrow_drop_down,
                size: 14, color: on ? AppDesign.modPacking : AppDesign.inkMuted),
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
              child: Text('Group lines by',
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
                  ? const Icon(Icons.check, color: AppDesign.modPacking)
                  : null,
              onTap: () => Navigator.pop(context, m),
            ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (chosen != null && mounted) setState(() => _groupMode = chosen);
  }

  /// Section label for a line under the active grouping mode.
  ///
  /// In "Original pack" mode an already-packed line is filed under its pack
  /// (that mode's whole point). In the other modes the selected dimension
  /// wins — the line still shows its pack number inline via [_rowPackTag], so
  /// nothing is lost by grouping it with its customer / SQ / pick.
  String _groupLabelFor(_MergedLine m) {
    final f = m.items.isNotEmpty ? m.items.first : null;
    if (_groupMode == _GroupMode.existingPack) {
      final ep = f == null ? null : _existingPack[_itemKey(f)];
      if (ep != null && ep.isNotEmpty) return ep;
      // A line saved in THIS pack is packed too — file it under this pack's
      // own number rather than "Not packed yet". (Draft lines have no number
      // until the first save, so they correctly fall through.)
      final own = f?.packPreLabel ?? '';
      if (own.isNotEmpty) return own;
      return 'Not packed yet';
    }
    switch (_groupMode) {
      case _GroupMode.existingPack:
        return 'Not packed yet';
      case _GroupMode.customer:
        final sq = f?.sourceSq ?? '';
        final code = _sqCustomer[sq] ?? '';
        if (code.isEmpty) return CustomerLabel.unknown;
        return CustomerLabel.format(code, _custName[code]);
      case _GroupMode.sq:
        // Grouping BY the SQ still names the customer — see the pick page.
        final sq = f?.sourceSq ?? '';
        final code = _sqCustomer[sq] ?? '';
        return CustomerLabel.sqWithCustomer(sq, code, _custName[code]);
      case _GroupMode.pick:
        final p = f?.parentPreLabel ?? '';
        return p.isEmpty ? 'No pick' : p;
      case _GroupMode.si:
        return _siFor(f) ?? 'No invoice';
      case _GroupMode.none:
        return '';
    }
  }

  // ─────────────────────── Which invoice covers a line ──────────────────

  /// `pick|sq` -> invoice number, for lines that came from a pick.
  ///
  /// A line added straight off an invoice carries [PackListItem.sourceSi]. A
  /// line added from a PICK does not — the invoice for those goods is raised
  /// later, from the pick, and links back through
  /// `MP_Invoice.App_DL_Prelabel` (the pick) and `Web_Link_Prelabel` (the SQ).
  /// Without walking that link, grouping by invoice put every pick-sourced
  /// line under "No invoice" even when its invoice plainly existed.
  final Map<String, String> _siOfSource = {};

  /// The invoice this line belongs to, or null if there isn't one yet.
  String? _siFor(PackListItem? it) {
    if (it == null) return null;
    final direct = (it.sourceSi ?? '').trim();
    if (direct.isNotEmpty) return direct;
    final pick = (it.parentPreLabel ?? '').trim();
    final sq = (it.sourceSq ?? '').trim();
    if (pick.isEmpty && sq.isEmpty) return null;
    // Prefer the exact (pick, SQ) pair. Fall back to the SQ alone, which
    // covers a pack built against a pick this device hasn't seen invoiced
    // but whose SQ was invoiced elsewhere.
    return _siOfSource['$pick|$sq'] ?? _siOfSource['|$sq'];
  }

  /// Whether the invoice strip is showing.
  ///
  /// The packing counterpart to the pick page's shelf strip. A picker walks
  /// by BAY, so picking groups by shelf; a packer boxes by DOCUMENT, because
  /// each invoice leaves on its own pallet with its own slip. Same control,
  /// the axis that matters for the job.
  bool _siPanelOpen = false;

  /// Active invoice filter — null = show everything.
  String? _siFilter;

  /// Invoices on this pack with a line count each: (si, still to pack, total).
  ///
  /// Lines with no invoice yet collect under a null key and sort last, the
  /// way unshelved lines do on the pick page — they are real work and must
  /// not vanish just because they can't be attributed.
  List<({String? si, int remaining, int total})> _siBuckets() {
    final remaining = <String?, int>{};
    final total = <String?, int>{};
    for (final g in _groupItems(_items)) {
      final done = _isMergedPacked(g);
      final si = g.items.isEmpty ? null : _siFor(g.items.first);
      total[si] = (total[si] ?? 0) + 1;
      if (!done) remaining[si] = (remaining[si] ?? 0) + 1;
    }
    final keys = total.keys.toList()
      ..sort((a, b) {
        if (a == null && b == null) return 0;
        if (a == null) return 1; // unattributed last
        if (b == null) return -1;
        return a.compareTo(b);
      });
    return [
      for (final k in keys)
        (si: k, remaining: remaining[k] ?? 0, total: total[k]!)
    ];
  }

  /// Does this line belong to the invoice currently filtered on?
  bool _inSiFilter(_MergedLine m) {
    final f = _siFilter;
    if (f == null) return true;
    final si = m.items.isEmpty ? null : _siFor(m.items.first);
    return si == f;
  }

  /// Distinct invoices across the pack's live lines, in label order.
  List<String> get _invoicesOnPack {
    final out = <String>{};
    for (final it in _items) {
      if (it.status == 'X') continue;
      final si = _siFor(it);
      if (si != null) out.add(si);
    }
    return out.toList()..sort();
  }

  Future<void> _loadInvoiceLinks(int cc) async {
    final picks = _items
        .map((e) => (e.parentPreLabel ?? '').trim())
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
    final sqs = _items
        .map((e) => (e.sourceSq ?? '').trim())
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
    if (picks.isEmpty && sqs.isEmpty) return;

    final found = <String, String>{};
    if (picks.isNotEmpty) {
      final rows = await isar.invoices
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(picks, (q, p) => q.appDLPrelabelEqualTo(p))
          .findAll();
      for (final inv in rows) {
        // A VOIDED invoice must not tag a line. Grouping by invoice and the
        // per-invoice pack slip both read this, so a cancelled document would
        // otherwise head a printed slip that leaves the building with the
        // goods — naming an invoice that no longer exists.
        if (isInvoiceVoided(inv.status)) continue;
        final dl = (inv.appDLPrelabel ?? '').trim();
        final wl = (inv.webLinkPrelabel ?? '').trim();
        found['$dl|$wl'] = inv.invoicePreLabel;
      }
    }
    if (sqs.isNotEmpty) {
      final rows = await isar.invoices
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(sqs, (q, l) => q.webLinkPrelabelEqualTo(l))
          .findAll();
      for (final inv in rows) {
        if (isInvoiceVoided(inv.status)) continue;
        final wl = (inv.webLinkPrelabel ?? '').trim();
        if (wl.isEmpty) continue;
        found.putIfAbsent('|$wl', () => inv.invoicePreLabel);
      }
    }
    if (!mounted) return;
    setState(() {
      _siOfSource
        ..clear()
        ..addAll(found);
    });
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
          color: on ? AppDesign.modPacking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on ? AppDesign.modPacking.withOpacity(0.5) : AppDesign.border,
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
              color: on ? AppDesign.modPacking : AppDesign.inkMuted,
            ),
            const SizedBox(width: 3),
            Text(
              'Fill',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: on ? AppDesign.modPacking : AppDesign.inkMuted,
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
        .where((g) => isPending ? !_isMergedPacked(g) : _isMergedPacked(g))
        .toList();
    if (_siFilter != null) {
      uomLines = uomLines.where(_inSiFilter).toList();
    }

    if (uomLines.isEmpty) {
      return Center(
        child: Text(
          isPending ? 'Nothing left to pack' : 'No items packed yet',
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

    // Flatten to a header/card entry list so one ListView renders it all.
    final entries = <_ListEntry>[];
    for (final label in order) {
      final lines = buckets[label]!;
      final qty = lines.fold<double>(
          0, (s, m) => s + m.items.fold<double>(0, (a, it) => a + (it.qty ?? 0)));
      final isPacked = _existingPackLabels.contains(label) ||
          (label.isNotEmpty && label == widget.pick.packPreLabel);
      entries.add(_ListEntry.header(label, lines.length, qty, isPacked));
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
        return _sectionHeader(e.header!, e.count, e.qty, e.existing);
      },
    );
  }

  Widget _sectionHeader(String label, int lines, double qty, bool existing) {
    // An already-packed section is tinted differently so the "original pack
    // wins" behaviour is obvious at a glance.
    final c = existing ? AppDesign.modPacking : AppDesign.inkMuted;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: c.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      // Label wraps instead of ellipsising so a full pack number is always
      // readable; the counts sit underneath.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(existing ? Icons.inventory_2 : _groupMode.icon,
                  size: 13, color: c),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800, color: c),
                ),
              ),
              if (existing) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                      color: c, borderRadius: BorderRadius.circular(3)),
                  child: const Text('PACKED',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 1),
          Text(
            '$lines item${lines > 1 ? "s" : ""} · qty ${_fmtQty(qty)}',
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppDesign.inkMuted),
          ),
        ],
      ),
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
          Icon(Icons.inventory_2,
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
                            maxLines: 1,
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
        color: _selectMode && selected ? AppDesign.modPackingBg : null,
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Row(
          children: [
            if (_selectMode) ...[
              Icon(
                selected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank_rounded,
                size: 20,
                color: selected ? AppDesign.modPacking : AppDesign.inkSubtle,
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
                      color: AppDesign.modPackingBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      m.uom ?? '—',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.modPacking,
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
            // Pack tag (when this line already belongs to a pack) + SQ tags.
            // Wrap lets a long pack number take its own line rather than being
            // clipped, so the number is always readable in full.
            Expanded(
              child: Wrap(
                spacing: 3,
                runSpacing: 3,
                children: [
                  if (_packLabelOf(m) != null) _rowPackTag(_packLabelOf(m)!),
                  for (final t in sqTags) _rowSqTag(t),
                ],
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

  /// The pack this line already belongs to, if any.
  String? _packLabelOf(_MergedLine m) {
    if (m.items.isEmpty) return null;
    final l = _existingPack[_itemKey(m.items.first)];
    return (l == null || l.isEmpty) ? null : l;
  }

  /// Inline tag showing the line's existing pack number IN FULL (never
  /// ellipsised — the Wrap gives it a fresh line if space runs out).
  Widget _rowPackTag(String label) {
    const c = AppDesign.modPacking;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: c.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.inventory_2, size: 9, color: c),
          const SizedBox(width: 2),
          Text(
            label,
            softWrap: false,
            style: const TextStyle(
                fontSize: 9, color: c, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
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
        'Pack ${_fmtQty(entered)}/${_fmtQty(target)}',
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
                  color: _byPlu ? AppDesign.modPacking : AppDesign.modPackingBg,
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
                    color: _byPlu ? Colors.white : AppDesign.modPacking,
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
                    size: 18, color: AppDesign.modPacking),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 20, color: AppDesign.border);

  // ───────────────────────── Invoice filter strip ────────────────────────

  Widget _siFilterChip() {
    final on = _siPanelOpen;
    final c = on ? AppDesign.modPacking : AppDesign.inkMuted;
    return InkWell(
      onTap: () => setState(() {
        _siPanelOpen = !_siPanelOpen;
        // Closing drops the filter, so the list can never be left silently
        // hiding lines with no visible sign that it is.
        if (!_siPanelOpen) _siFilter = null;
      }),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: on ? AppDesign.modPacking.withOpacity(0.10) : AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
            color: on ? AppDesign.modPacking.withOpacity(0.5) : AppDesign.border,
          ),
        ),
        // Icon only — the strip below names the invoices, so a label here
        // would repeat it. The dot marks an active filter, because a filtered
        // list must never look complete.
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.receipt_long, size: 16, color: c),
            if (_siFilter != null)
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

  /// Every invoice on this pack as a horizontally scrolling chip row,
  /// doubling as a filter — one tap boxes a single invoice at a time.
  Widget _siStrip() {
    final buckets = _siBuckets();
    if (buckets.isEmpty) return const SizedBox.shrink();

    final lines = _groupItems(_items);
    final allTotal = lines.length;
    final allDone = lines.where(_isMergedPacked).length;

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
          : (muted ? AppDesign.inkSubtle : AppDesign.modPacking);
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
                      // A finished invoice reads as struck off the list.
                      decoration:
                          complete ? TextDecoration.lineThrough : null,
                      decorationColor: c,
                      decorationThickness: 2,
                    ),
                  ),
                  // done/total while work remains. A finished invoice drops
                  // the badge: the strike-through and green already say it,
                  // and the width freed keeps the live ones reachable on a
                  // pack spanning several documents.
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
              selected: _siFilter == null,
              onTap: () => setState(() => _siFilter = null),
            ),
            for (final e in buckets)
              chip(
                label: e.si ?? 'No invoice',
                done: e.total - e.remaining,
                total: e.total,
                selected: _siFilter == e.si,
                muted: e.si == null,
                onTap: () => setState(() {
                  _siFilter = _siFilter == e.si ? null : e.si;
                }),
              ),
          ],
        ),
      ),
    );
  }

}

// ───────────────────── PD-style number pad ─────────────────────

/// Display grouping of PackListItems that share the same SKU + UOM. The
/// underlying records stay per-SQ (for balance split + save); this just
/// merges them into one visual line with summed qty and all SQ tags.
class _MergedLine {
  final int? skuNo;
  final String? uom;
  final List<PackListItem> items;
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
