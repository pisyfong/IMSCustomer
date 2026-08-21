import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/quote.dart';
import '../models/customer.dart';
import '../models/quote_item.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../models/in_stock_plu.dart';
import '../services/auth_service.dart';
import '../services/location_service.dart';
import '../services/pack_balance_service.dart';
import '../services/base_transaction_sync_service.dart';
import '../services/pick_number_service.dart';
import '../services/pick_service.dart';
import '../config/app_config.dart';
import '../services/customer_label.dart';
import '../theme/app_design.dart';
import '../theme/sq_colors.dart';
import '../widgets/inventory_image_widget.dart';
import 'add_pack_from_si_tab.dart';
import 'barcode_scanner_page.dart';

/// A pick list that already contains an SQ line's SKU (used to attach a pack
/// line to a real pick — every pack line must trace to one).
class _PickOpt {
  final String pickPreLabel;
  final double pickedQty; // Pick_Qty (actuals)
  final double plannedQty; // Qty (planned)
  _PickOpt(this.pickPreLabel, this.pickedQty, this.plannedQty);
}

const String _kAutoPick = ' auto';

/// Bottom sheet to add items to an existing pick list.
///
/// Tab 1 "From SQ": list of open sales quotes with per-line remaining balance
/// (SQ qty minus already-picked-across-all-picks). Pick lines are toggled and
/// the user enters/adjusts qty before adding.
///
/// Tab 2 "From Inventory": search box → inventory hits → tap to add with qty.
/// Parent_PreLabel stays NULL on those rows.
class AddPackItemsSheet extends StatefulWidget {
  final PackList pick;

  /// If non-null, the "From SQ" tab auto-opens this quote's line list on
  /// mount (used by the Picking hub's "scan an SQ" flow).
  final String? initialSqPreLabel;

  /// If non-null (scanned a pick), the SQ tab pre-selects the lines that pick
  /// covers and defaults their source to it.
  final String? initialFocusPick;

  /// If non-null, opens on the "From Inventory" tab pre-searched to this
  /// code/SKU (used when a scan doesn't match anything on the pick).
  final String? initialInventoryCode;

  /// The scanned PLU's UOM — the add dialog defaults its UOM selector to it.
  final String? initialInventoryUom;

  /// The current pick's in-memory items (buffered, possibly unsaved). Used to
  /// subtract already-added allocations so re-opening / re-scanning the same
  /// SQ reflects what's already in this pick.
  final List<PackListItem> existingItems;

  const AddPackItemsSheet({
    super.key,
    required this.pick,
    this.initialSqPreLabel,
    this.initialFocusPick,
    this.initialInventoryCode,
    this.initialInventoryUom,
    this.existingItems = const [],
  });

  @override
  State<AddPackItemsSheet> createState() => _AddPackItemsSheetState();
}

class _AddPackItemsSheetState extends State<AddPackItemsSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(
        length: AppConfig.enableLooseItems ? 4 : 3, vsync: this);
    // Land on the Inventory tab when a scan brought us here to add a
    // not-on-the-pick item.
    if (AppConfig.enableLooseItems && widget.initialInventoryCode != null) {
      _tabs.index = 3;
    }
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
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
              width: 36, height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDesign.space3),
              child: Row(
                children: [
                  const Text('Add to ',
                      style: TextStyle(fontSize: 13, color: AppDesign.inkMuted)),
                  Text((widget.pick.packPreLabel ?? '').isNotEmpty
                          ? widget.pick.packPreLabel!
                          : 'new pack',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700, color: AppDesign.modPacking)),
                ],
              ),
            ),
            TabBar(
              controller: _tabs,
              labelColor: AppDesign.modPacking,
              unselectedLabelColor: AppDesign.inkMuted,
              indicatorColor: AppDesign.modPacking,
              indicatorWeight: 2,
              labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              tabs: [
                const Tab(text: 'From Pick'),
                const Tab(text: 'From SI'),
                const Tab(text: 'From SQ'),
                if (AppConfig.enableLooseItems)
                  const Tab(text: 'From Inventory'),
              ],
            ),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(
              child: TabBarView(
                controller: _tabs,
                children: [
                  _FromPickTab(
                    pack: widget.pick,
                    scrollController: controller,
                    existingItems: widget.existingItems,
                  ),
                  FromSiTab(
                    pack: widget.pick,
                    scrollController: controller,
                    existingItems: widget.existingItems,
                  ),
                  _FromSqTab(
                    pick: widget.pick,
                    scrollController: controller,
                    initialSqPreLabel: widget.initialSqPreLabel,
                    initialFocusPick: widget.initialFocusPick,
                    existingItems: widget.existingItems,
                  ),
                  if (AppConfig.enableLooseItems)
                    _FromInventoryTab(
                      pick: widget.pick,
                      scrollController: controller,
                      initialQuery: widget.initialInventoryCode,
                      initialUom: widget.initialInventoryUom,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────── From SQ tab ────────────────────────────────

class _FromSqTab extends StatefulWidget {
  final PackList pick;
  final ScrollController scrollController;
  final String? initialSqPreLabel;
  final String? initialFocusPick;
  final List<PackListItem> existingItems;
  const _FromSqTab({
    required this.pick,
    required this.scrollController,
    this.initialSqPreLabel,
    this.initialFocusPick,
    this.existingItems = const [],
  });

  @override
  State<_FromSqTab> createState() => _FromSqTabState();
}

class _FromSqTabState extends State<_FromSqTab> {
  List<Quote> _quotes = [];
  Quote? _selectedQuote;
  List<QuoteItem> _quoteItems = [];
  Map<String, double> _picked = {}; // key → total picked so far
  Map<int, String> _descriptions = {};
  Map<int, List<_PickOpt>> _picksForSeq = {}; // quote item seqNo → its picks
  final Map<int, String> _pickChoice = {}; // seqNo → chosen pickPreLabel / _kAutoPick
  final Set<int> _chosen = {}; // sequenceNo of quote items chosen
  final Map<int, TextEditingController> _qtyCtrls = {};
  bool _loadingQuotes = true;
  bool _loadingLines = false;

  /// customer code -> name, for the SQ list.
  final Map<String, String> _custNames = {};

  /// SQ pre-label -> (packed qty, total qty).
  final Map<String, (double, double)> _sqProgress = {};

  final _quoteSearchCtrl = TextEditingController();
  final _lineSearchCtrl = TextEditingController();
  String _quoteQuery = '';
  String _lineQuery = '';

  @override
  void initState() {
    super.initState();
    _quoteSearchCtrl.addListener(() {
      setState(() => _quoteQuery = _quoteSearchCtrl.text.trim().toLowerCase());
    });
    _lineSearchCtrl.addListener(() {
      setState(() => _lineQuery = _lineSearchCtrl.text.trim().toLowerCase());
    });
    _loadQuotes();
  }

  @override
  void dispose() {
    _quoteSearchCtrl.dispose();
    _lineSearchCtrl.dispose();
    for (final c in _qtyCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _scanForQuote() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || code.isEmpty || !mounted) return;
    // Try exact match first, else fall back to a substring find.
    final exact = _quotes.firstWhere(
      (q) => (q.quotePreLabel ?? '').toLowerCase() == code.toLowerCase(),
      orElse: () => Quote(),
    );
    if (exact.quotePreLabel != null) {
      _openQuote(exact);
    } else {
      _quoteSearchCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No SQ matches "$code"')),
      );
    }
  }

  Future<void> _scanForLine() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || code.isEmpty || !mounted) return;

    // Match by PLU (barcode field) or SKU number.
    final match = _quoteItems.firstWhere(
      (it) =>
          (it.pluNo?.toLowerCase() == code.toLowerCase()) ||
          it.skuNo.toString() == code,
      orElse: () => QuoteItem(),
    );
    if (match.sequenceNo != 0) {
      if (!_chosen.contains(match.sequenceNo)) {
        _toggle(match);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected SKU ${match.skuNo}')),
      );
    } else {
      _lineSearchCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No line matches "$code"')),
      );
    }
  }

  List<Quote> get _visibleQuotes {
    var out = _quotes;
    if (_sqStatusFilter.isNotEmpty) {
      out = out
          .where((q) => _sqStatusFilter.contains(_sqStatusOf(q.quotePreLabel)))
          .toList();
    }
    if (_quoteQuery.isNotEmpty) {
      out = out.where((q) {
        final label = (q.quotePreLabel ?? '').toLowerCase();
        final code = (q.customer ?? '').toLowerCase();
        final name = (_custNames[q.customer ?? ''] ?? '').toLowerCase();
        return label.contains(_quoteQuery) ||
            code.contains(_quoteQuery) ||
            name.contains(_quoteQuery);
      }).toList();
    }
    return _sortQuotes(out);
  }

  // ── SQ sorting ──
  int _qSortBy = 0;
  bool _qSortDesc = true;

  static const List<(String, int)> _qSortOptions = [
    ('Quote date', 0),
    ('Customer', 1),
    ('SQ number', 2),
    ('Added date', 3),
    ('Last modified', 4),
  ];

  String get _qSortLabel => _qSortOptions
      .firstWhere((o) => o.$2 == _qSortBy, orElse: () => _qSortOptions.first)
      .$1;

  List<Quote> _sortQuotes(List<Quote> rows) {
    final out = [...rows];
    int cmp(Quote a, Quote b) {
      switch (_qSortBy) {
        case 1:
          final an =
              (_custNames[a.customer ?? ''] ?? a.customer ?? '').toLowerCase();
          final bn =
              (_custNames[b.customer ?? ''] ?? b.customer ?? '').toLowerCase();
          return an.compareTo(bn);
        case 2:
          return (a.quotePreLabel ?? '').compareTo(b.quotePreLabel ?? '');
        default:
          final DateTime? ad, bd;
          switch (_qSortBy) {
            case 3:
              ad = a.addedDate;
              bd = b.addedDate;
            case 4:
              ad = a.lastWriteTimeStamp;
              bd = b.lastWriteTimeStamp;
            default:
              ad = a.quoteDate;
              bd = b.quoteDate;
          }
          if (ad == null && bd == null) return 0;
          if (ad == null) return 1;
          if (bd == null) return -1;
          return ad.compareTo(bd);
      }
    }

    out.sort((a, b) {
      final r = cmp(a, b);
      return _qSortDesc ? -r : r;
    });
    return out;
  }

  Future<void> _openQuoteSortSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Sort SQs by',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ),
            ),
            for (final o in _qSortOptions)
              ListTile(
                dense: true,
                onTap: () {
                  setState(() => _qSortBy = o.$2);
                  setSheet(() {});
                },
                title: Text(o.$1,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: _qSortBy == o.$2
                            ? FontWeight.w800
                            : FontWeight.w600,
                        color: _qSortBy == o.$2
                            ? AppDesign.modPacking
                            : AppDesign.ink)),
                trailing: _qSortBy == o.$2
                    ? const Icon(Icons.check,
                        size: 18, color: AppDesign.modPacking)
                    : null,
              ),
            const Divider(height: 1),
            ListTile(
              dense: true,
              onTap: () {
                setState(() => _qSortDesc = !_qSortDesc);
                setSheet(() {});
              },
              leading: Icon(
                  _qSortDesc ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 18,
                  color: AppDesign.modPacking),
              title: Text(
                  _qSortBy == 1
                      ? (_qSortDesc ? 'Z → A' : 'A → Z')
                      : _qSortBy == 2
                          ? (_qSortDesc ? 'Highest first' : 'Lowest first')
                          : (_qSortDesc ? 'Newest first' : 'Oldest first'),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  List<QuoteItem> get _visibleLines {
    if (_lineQuery.isEmpty) return _quoteItems;
    return _quoteItems.where((it) {
      final sku = it.skuNo.toString();
      final desc = (_descriptions[it.skuNo] ?? '').toLowerCase();
      final plu = (it.pluNo ?? '').toLowerCase();
      return sku.contains(_lineQuery) ||
          desc.contains(_lineQuery) ||
          plu.contains(_lineQuery);
    }).toList();
  }

  /// The location being worked in. Documents belonging to another location are
  /// hidden, so a picker at one site can't pull a different site's SQs into
  /// their pick — the hubs already scope this way, and the add sheets were the
  /// hole in it.
  String? _locationCode;

  bool _inScope(String? docLocation) =>
      LocationService.inScope(docLocation, _locationCode);

  Future<void> _loadQuotes() async {
    final cc = widget.pick.companyCode;
    if (cc == null) {
      setState(() => _loadingQuotes = false);
      return;
    }
    // Prefer the document's own location: a pick already tied to a site keeps
    // showing that site's SQs even if the operator switches the global scope
    // mid-edit, which would otherwise empty the list under them.
    final docLoc = (widget.pick.locationCode ?? '').trim();
    _locationCode =
        docLoc.isNotEmpty ? docLoc : await LocationService().selectedCode();

    final all = await isar.quotes
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .statusEqualTo('A')
        .sortByQuoteDateDesc()
        .findAll();
    final rows = all.where((q) => _inScope(q.locationCode)).toList();
    if (!mounted) return;
    setState(() {
      _quotes = rows;
      _loadingQuotes = false;
    });
    // Decoration — resolve after the list is on screen.
    _loadQuoteMeta(cc, rows);

    // Deep-link into a specific SQ if we were told to (e.g. user scanned an
    // SQ code on the Picking hub). One-shot — reset after honoring it.
    final target = widget.initialSqPreLabel;
    if (target != null && target.isNotEmpty) {
      final match = rows.firstWhere(
        (q) => (q.quotePreLabel ?? '') == target,
        orElse: Quote.new,
      );
      if (match.quotePreLabel != null) {
        // Fire on next frame so the tab is fully built before we push
        // into the line-list state.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _openQuote(match);
        });
      }
    }
  }

  Future<void> _openQuote(Quote q) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    setState(() {
      _selectedQuote = q;
      _loadingLines = true;
      _chosen.clear();
      _qtyCtrls.clear();
    });
    final items = await isar.quoteItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .quotePreLabelEqualTo(q.quotePreLabel ?? '')
        .sortBySequenceNo()
        .findAll();

    // Allocated across OTHER picks (saved) + the current pick's in-memory
    // buffer. Excluding the current pick from the saved tally and adding its
    // buffer avoids double-counting whether or not it's been saved yet.
    final picked = await PackBalanceService.allocatedByLine(
      companyCode: cc,
      sqPreLabels: [q.quotePreLabel ?? ''],
      excludePickPreLabel: widget.pick.packPreLabel,
    );
    PackBalanceService.addBuffer(picked, widget.existingItems);

    final skus = items.map((i) => i.skuNo).toSet().toList();
    final desc = <int, String>{};
    if (skus.isNotEmpty) {
      final invRows = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (qq, sku) => qq.skuNoEqualTo(sku))
          .findAll();
      for (final iv in invRows) {
        desc[iv.skuNo] = iv.description ?? '';
      }
    }

    // Every pack line must trace to a pick. Find the pick lists that already
    // contain this SQ's SKUs (Parent_PreLabel = the SQ), grouped by sku|uom.
    // One SKU can appear on multiple picks.
    final pickLines = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .parentPreLabelEqualTo(q.quotePreLabel ?? '')
        .findAll();
    final bySku = <String, List<_PickOpt>>{};
    for (final pl in pickLines) {
      if (pl.status == 'X') continue;
      final label = pl.pickPreLabel;
      if (label == null || label.isEmpty) continue;
      final k = '${pl.skuNo}|${pl.uom}';
      bySku.putIfAbsent(k, () => []).add(
          _PickOpt(label, pl.pickQty ?? 0, pl.qty ?? 0));
    }
    final picksForSeq = <int, List<_PickOpt>>{};
    for (final it in items) {
      picksForSeq[it.sequenceNo] = bySku['${it.skuNo}|${it.uom}'] ?? const [];
    }

    if (!mounted) return;
    setState(() {
      _quoteItems = items;
      _picked = picked;
      _descriptions = desc;
      _picksForSeq = picksForSeq;
      _loadingLines = false;

      // If we arrived by scanning a pick, pre-select the lines it covers and
      // default their source to that pick.
      final focus = widget.initialFocusPick;
      if (focus != null && focus.isNotEmpty) {
        for (final it in items) {
          final opts = picksForSeq[it.sequenceNo] ?? const [];
          if (!opts.any((o) => o.pickPreLabel == focus)) continue;
          if (_remainingFor(it) <= 0) continue;
          if (_chosen.add(it.sequenceNo)) {
            final rem = _remainingFor(it);
            _qtyCtrls[it.sequenceNo] =
                TextEditingController(text: rem.toStringAsFixed(0));
          }
          _pickChoice[it.sequenceNo] = focus;
        }
      }
    });
  }

  double _remainingFor(QuoteItem it) {
    final key = PackBalanceService.keyFor(it.quotePreLabel, it.skuNo, it.uom);
    final already = _picked[key] ?? 0;
    final left = (it.quoteQuantity ?? 0) - already;
    return left <= 0 ? 0 : left;
  }

  void _toggle(QuoteItem it) {
    setState(() {
      if (_chosen.contains(it.sequenceNo)) {
        _chosen.remove(it.sequenceNo);
        _qtyCtrls.remove(it.sequenceNo)?.dispose();
        _pickChoice.remove(it.sequenceNo);
      } else {
        _chosen.add(it.sequenceNo);
        final rem = _remainingFor(it);
        _qtyCtrls[it.sequenceNo] =
            TextEditingController(text: (rem > 0 ? rem : 0).toStringAsFixed(0));
        // Default the source pick: first existing pick, else auto-create.
        final picks = _picksForSeq[it.sequenceNo] ?? const [];
        _pickChoice[it.sequenceNo] =
            picks.isNotEmpty ? picks.first.pickPreLabel : _kAutoPick;
      }
    });
  }

  /// True when every pickable line (remaining > 0) is already selected.
  bool get _allSelected {
    final pickable =
        _quoteItems.where((it) => _remainingFor(it) > 0).toList();
    if (pickable.isEmpty) return false;
    return pickable.every((it) => _chosen.contains(it.sequenceNo));
  }

  /// Select every line that still has remaining balance, filling each qty to
  /// its remaining. Toggles off (clears) when everything is already selected.
  void _toggleSelectAll() {
    setState(() {
      if (_allSelected) {
        _chosen.clear();
        for (final c in _qtyCtrls.values) {
          c.dispose();
        }
        _qtyCtrls.clear();
        return;
      }
      for (final it in _quoteItems) {
        final rem = _remainingFor(it);
        if (rem <= 0) continue;
        if (_chosen.add(it.sequenceNo)) {
          _qtyCtrls[it.sequenceNo] =
              TextEditingController(text: rem.toStringAsFixed(0));
          final picks = _picksForSeq[it.sequenceNo] ?? const [];
          _pickChoice[it.sequenceNo] =
              picks.isNotEmpty ? picks.first.pickPreLabel : _kAutoPick;
        }
      }
    });
  }

  Future<void> _addSelected() async {
    if (_chosen.isEmpty || _selectedQuote == null) return;
    final cc = widget.pick.companyCode;
    if (cc == null) return;

    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final chosenItems =
        _quoteItems.where((it) => _chosen.contains(it.sequenceNo)).toList();

    // Lines with no pick chosen (or explicitly "auto") → one auto pick list.
    final autoItems = chosenItems
        .where((it) => (_pickChoice[it.sequenceNo] ?? _kAutoPick) == _kAutoPick)
        .toList();
    String? autoPickLabel;
    if (autoItems.isNotEmpty) {
      autoPickLabel = await _createAutoPick(cc, autoItems, userId, now);
      if (autoPickLabel == null) return; // creation failed; abort
    }

    // Build pack lines in memory; PackDetailPage buffers + persists on Save.
    final rows = <PackListItem>[];
    for (final it in chosenItems) {
      final planned = double.tryParse(_qtyCtrls[it.sequenceNo]?.text ?? '') ?? 0;
      if (planned <= 0) continue;
      final choice = _pickChoice[it.sequenceNo] ?? _kAutoPick;
      final parentPick = choice == _kAutoPick ? autoPickLabel : choice;
      if (parentPick == null || parentPick.isEmpty) continue;
      rows.add(PackListItem()
        ..companyCode = cc
        ..packPreLabel = widget.pick.packPreLabel
        // sequenceNo assigned by the buffer in PackDetailPage
        ..skuNo = it.skuNo
        ..uom = it.uom
        ..parentPreLabel = parentPick // ← a PICK, not the SQ
        ..sourceSq = it.quotePreLabel // the source SQ (keeps multi-SQ distinct)
        ..locationCode = it.locationCode ?? widget.pick.locationCode
        ..status = 'A'
        ..factor = it.factor
        ..qty = planned
        ..packQty = 0
        ..addedBy = userId
        ..addedDate = now
        ..lastModifiedBy = userId
        ..lastWriteTimeStamp = now
        ..isSynced = false);
    }
    if (rows.isEmpty) return;
    if (!mounted) return;
    Navigator.of(context).pop(rows);
  }

  /// Create ONE pick list (0 picked) holding [autoItems], save it locally, and
  /// best-effort upload it so the pack that references it can validate on the
  /// server. Returns the new Pick_PreLabel, or null on failure.
  Future<String?> _createAutoPick(
      int cc, List<QuoteItem> autoItems, int? userId, DateTime now) async {
    try {
      final label = await PickNumberService().nextPickNumber();
      final headerId = BaseTransactionSyncService.pickListId(cc, label);
      final header = PickList()
        ..id = headerId
        ..companyCode = cc
        ..pickPreLabel = label
        ..locationCode = widget.pick.locationCode
        ..status = 'A'
        ..pickDate = now
        ..batchCount = 1
        ..totalPickQty = 0
        ..totalPickItem = 0
        ..addedBy = userId
        ..addedDate = now
        ..lastModifiedBy = userId
        ..lastWriteTimeStamp = now
        ..assignedTo = userId
        ..uploadToken =
            'pk-${headerId.toRadixString(16)}-${now.microsecondsSinceEpoch}'
        ..isSynced = false;

      final lines = <PickListItem>[];
      var seq = 0;
      for (final it in autoItems) {
        final planned = double.tryParse(_qtyCtrls[it.sequenceNo]?.text ?? '') ?? 0;
        seq += 1;
        lines.add(PickListItem()
          ..id = BaseTransactionSyncService.pickListItemId(
              cc, label, it.skuNo, it.uom, it.quotePreLabel ?? '')
          ..companyCode = cc
          ..pickPreLabel = label
          ..sequenceNo = seq
          ..skuNo = it.skuNo
          ..uom = it.uom
          ..parentPreLabel = it.quotePreLabel // the pick's own source = the SQ
          ..locationCode = it.locationCode ?? widget.pick.locationCode
          ..status = 'A'
          ..factor = it.factor
          ..qty = planned > 0 ? planned : (it.quoteQuantity ?? 0)
          ..pickQty = 0 // 0 picked, per spec
          ..baselinePickQty = 0
          ..addedBy = userId
          ..addedDate = now
          ..lastModifiedBy = userId
          ..lastWriteTimeStamp = now
          ..isSynced = false);
      }

      await isar.writeTxn(() async {
        await isar.pickLists.put(header);
        await isar.pickListItems.putAll(lines);
      });
      // Push the pick first so the server can validate the pack's parent. If
      // it doesn't land, the pack will later be rejected with "exceeds planned
      // pick qty 0" — an error that names the PACK and gives no hint that an
      // unuploaded pick is the real cause. Offline is the normal state here,
      // so say so plainly instead of swallowing it.
      try {
        final svc = PickService();
        final r = await svc.syncPicksByPreLabels([label]);
        if ((r['synced'] ?? 0) == 0 && mounted) {
          final why = svc.lastErrors[label];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppDesign.warning,
            duration: const Duration(seconds: 6),
            content: Text(
              'Pick $label saved on this device but not uploaded'
              '${why == null ? ' (no connection)' : ' — $why'}. '
              'This pack can only upload after it does.',
            ),
          ));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppDesign.warning,
            duration: const Duration(seconds: 6),
            content: Text('Pick $label saved locally but not uploaded — '
                'this pack can only upload after it does.'),
          ));
        }
      }
      return label;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not auto-create pick: $e')),
        );
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedQuote == null) {
      return _quoteList();
    }
    return _lineList();
  }

  Widget _quoteList() {
    if (_loadingQuotes) return const Center(child: CircularProgressIndicator());
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: _searchBar(
              controller: _quoteSearchCtrl,
              hint: 'Search SQ or customer',
              onScan: _scanForQuote,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppDesign.space3),
            child: Tooltip(
              message:
                  'Sorted by $_qSortLabel (${_qSortDesc ? "desc" : "asc"})',
              child: Material(
                color: AppDesign.modPackingBg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  onTap: _openQuoteSortSheet,
                  child: const SizedBox(
                    width: 38,
                    height: 38,
                    child: Icon(Icons.swap_vert,
                        size: 19, color: AppDesign.modPacking),
                  ),
                ),
              ),
            ),
          ),
        ]),
        _sqStatusFilterBar(),
        Expanded(child: _quoteListBody()),
      ],
    );
  }

  /// Customer names + how much of each SQ is already PACKED. Cheap by design:
  /// totals come off the quote header, allocation rides the Source_SQ scan of
  /// this company's pack lines.
  Future<void> _loadQuoteMeta(int cc, List<Quote> rows) async {
    if (rows.isEmpty) return;
    final labels =
        rows.map((q) => q.quotePreLabel).whereType<String>().toList();

    final codes =
        rows.map((q) => q.customer).whereType<String>().toSet().toList();
    if (codes.isNotEmpty) {
      // Code-only: AR_Customer is partitioned by Company_Code but quote
      // references cross those partitions, so scoping the lookup hides
      // most customer names behind a bare code.
      final custs = await isar.customers
          .filter()
          .anyOf(codes, (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final c in custs) {
        _custNames[c.code] = (c.name ?? '').trim();
      }
    }
    if (!mounted) return;
    setState(() {});

    if (labels.isEmpty) return;

    final totals = <String, double>{
      for (final q in rows)
        if (q.quotePreLabel != null)
          q.quotePreLabel!: q.totalQuoteQuantity ?? 0,
    };

    // Cancelled packs release their claim.
    final cancelled = (await isar.packLists
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .statusEqualTo('X')
            .findAll())
        .map((e) => e.packPreLabel)
        .whereType<String>()
        .toSet();

    final packItems = await isar.packListItems
        .filter()
        .companyCodeEqualTo(cc)
        .findAll();
    final allocated = <String, double>{};
    for (final it in packItems) {
      if (it.status == 'X') continue;
      if (cancelled.contains(it.packPreLabel)) continue;
      final sq = it.sourceSq;
      if (sq == null || sq.isEmpty) continue;
      allocated[sq] = (allocated[sq] ?? 0) + (it.qty ?? 0);
    }

    if (!mounted) return;
    setState(() {
      _sqProgress
        ..clear()
        ..addEntries(labels
            .map((l) => MapEntry(l, (allocated[l] ?? 0, totals[l] ?? 0))));
    });
  }

  /// "Packed" chip for an SQ row.
  Widget _sqStatusChip(String? sqLabel) {
    final pr = _sqProgress[sqLabel ?? ''];
    if (pr == null || pr.$2 <= 0) return const SizedBox.shrink();
    final (done, total) = pr;
    final full = done + 0.0001 >= total;
    final none = done <= 0;
    final c = full
        ? AppDesign.success
        : none
            ? AppDesign.inkSubtle
            : AppDesign.warning;
    final text = full
        ? 'PACKED'
        : none
            ? 'NOT PACKED'
            : '${_fmtNum(done)}/${_fmtNum(total)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(text,
          style:
              TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: c)),
    );
  }

  static String _fmtNum(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

  /// "04 AUG 26"
  static String _fmtSqDate(DateTime d) {
    const m = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, "0")} ${m[d.month - 1]} $yy';
  }

  /// 0 = not packed, 1 = partial, 2 = fully packed. Empty = show everything.
  final Set<int> _sqStatusFilter = <int>{};

  int _sqStatusOf(String? label) {
    final pr = _sqProgress[label ?? ''];
    if (pr == null) return 0;
    final (done, total) = pr;
    if (done <= 0) return 0;
    if (total > 0 && done + 0.0001 >= total) return 2;
    return 1;
  }

  Widget _sqStatusFilterBar() {
    Widget chip(String label, int value, Color colour) {
      final on = _sqStatusFilter.contains(value);
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() {
            if (!_sqStatusFilter.remove(value)) _sqStatusFilter.add(value);
          }),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: on ? colour : colour.withOpacity(0.08),
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: on ? colour : colour.withOpacity(0.30)),
            ),
            child: Text(label,
                style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                    color: on ? Colors.white : colour),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDesign.space3 - 2, 0, AppDesign.space3 - 2, AppDesign.space2),
      child: Row(children: [
        chip('NOT PACKED', 0, AppDesign.inkMuted),
        chip('PARTIAL', 1, AppDesign.warning),
        chip('PACKED', 2, AppDesign.success),
      ]),
    );
  }

  Widget _quoteListBody() {
    final list = _visibleQuotes;
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.description_outlined,
                size: 40, color: AppDesign.inkSubtle),
            const SizedBox(height: 6),
            Text(_quoteQuery.isEmpty ? 'No active SQs' : 'No matches',
                style: AppDesign.body),
          ],
        ),
      );
    }
    return ListView.separated(
      controller: widget.scrollController,
      padding: const EdgeInsets.fromLTRB(
          AppDesign.space3, 0, AppDesign.space3, AppDesign.space3),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (context, i) {
        final q = list[i];
        return Material(
          color: AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            onTap: () => _openQuote(q),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                border: Border.all(color: AppDesign.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 30, height: 30,
                    decoration: BoxDecoration(
                      color: AppDesign.modPackingBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.description_outlined,
                        size: 16, color: AppDesign.modPacking),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(q.quotePreLabel ?? '—',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppDesign.ink),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          _sqStatusChip(q.quotePreLabel),
                        ]),
                        Text(
                          CustomerLabel.format(
                              q.customer, _custNames[q.customer ?? '']),
                          style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                              color: AppDesign.info),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          [
                            if (q.quoteDate != null) _fmtSqDate(q.quoteDate!),
                            '${q.totalQuoteItem ?? 0} items',
                          ].join('  ·  '),
                          style: const TextStyle(
                              fontSize: 10, color: AppDesign.inkMuted),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 16, color: AppDesign.inkSubtle),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _lineList() {
    final q = _selectedQuote!;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          color: AppDesign.surfaceAlt,
          child: Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                icon: const Icon(Icons.arrow_back, size: 18),
                onPressed: () => setState(() {
                  _selectedQuote = null;
                  _chosen.clear();
                  for (final c in _qtyCtrls.values) {
                    c.dispose();
                  }
                  _qtyCtrls.clear();
                }),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(q.quotePreLabel ?? '—',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppDesign.ink),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    // Whose order this is. The browse list shows it, and
                    // losing it on drill-in made the SQ read as having no
                    // customer at the exact moment lines are being taken.
                    Text(
                        CustomerLabel.format(
                            q.customer, _custNames[q.customer ?? '']),
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.info),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              if (_chosen.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Text('${_chosen.length} sel',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted)),
                ),
              // Select-all / clear toggle.
              InkWell(
                onTap: _toggleSelectAll,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _allSelected
                        ? AppDesign.modPacking
                        : AppDesign.modPackingBg,
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _allSelected
                            ? Icons.check_box_rounded
                            : Icons.done_all_rounded,
                        size: 13,
                        color: _allSelected ? Colors.white : AppDesign.modPacking,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        _allSelected ? 'Clear' : 'All',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color:
                              _allSelected ? Colors.white : AppDesign.modPacking,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _searchBar(
          controller: _lineSearchCtrl,
          hint: 'Search SKU / name / PLU…',
          onScan: _scanForLine,
        ),
        Expanded(
          child: _loadingLines
              ? const Center(child: CircularProgressIndicator())
              : _visibleLines.isEmpty
                  ? Center(
                      child: Text(
                        _lineQuery.isEmpty ? 'No lines' : 'No matches',
                        style: AppDesign.body,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                          AppDesign.space3, 0, AppDesign.space3, AppDesign.space3),
                      itemCount: _visibleLines.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 4),
                      itemBuilder: (context, i) => _lineTile(_visibleLines[i]),
                    ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(AppDesign.space3),
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: _chosen.isEmpty ? null : _addSelected,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.modPacking,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
                ),
                child: Text('Add ${_chosen.length} to pick',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchBar({
    required TextEditingController controller,
    required String hint,
    required VoidCallback onScan,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDesign.space3, AppDesign.space2, AppDesign.space3, AppDesign.space2),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.borderStrong),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            const Icon(Icons.search, size: 16, color: AppDesign.inkSubtle),
            const SizedBox(width: 4),
            Expanded(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppDesign.ink),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: AppDesign.inkSubtle,
                      fontWeight: FontWeight.w500),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
            if (controller.text.isNotEmpty)
              InkWell(
                onTap: () => controller.clear(),
                borderRadius: BorderRadius.circular(12),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.clear, size: 14, color: AppDesign.inkSubtle),
                ),
              ),
            Container(width: 1, height: 20, color: AppDesign.border),
            InkWell(
              borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(AppDesign.radiusSm)),
              onTap: onScan,
              child: Container(
                width: 42,
                height: 38,
                alignment: Alignment.center,
                child: const Icon(Icons.qr_code_scanner,
                    size: 18, color: AppDesign.modPacking),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Pick-source indicator/chooser chip. Amber "No pick · auto" when the SQ
  /// line has no pick list; otherwise shows the chosen pick (tap to change
  /// when the line is selected and has options).
  Widget _pickChip(QuoteItem it) {
    final picks = _picksForSeq[it.sequenceNo] ?? const [];
    final selected = _chosen.contains(it.sequenceNo);
    final choice = _pickChoice[it.sequenceNo];
    final noPick = picks.isEmpty;
    final isAuto = choice == _kAutoPick;
    // A pick reference keeps the PICKING identity colour even inside the pack
    // flow; amber flags "no pick yet / will be auto-created".
    final Color c = noPick || isAuto
        ? AppDesign.warning
        : AppDesign.modPicking;
    final Color bg = noPick || isAuto
        ? const Color(0xFFFEF3C7)
        : AppDesign.modPickingBg;
    String text;
    if (noPick) {
      text = 'No pick · auto';
    } else if (!selected) {
      text = '${picks.length} pick${picks.length > 1 ? "s" : ""}';
    } else if (isAuto) {
      text = 'New pick';
    } else {
      text = choice ?? picks.first.pickPreLabel;
    }
    final tappable = selected && !noPick;
    return GestureDetector(
      onTap: tappable ? () => _choosePick(it) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(noPick ? Icons.error_outline : Icons.inventory_2_outlined,
              size: 11, color: c),
          const SizedBox(width: 3),
          Text(text,
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w700, color: c)),
          if (tappable) Icon(Icons.arrow_drop_down, size: 12, color: c),
        ]),
      ),
    );
  }

  Future<void> _choosePick(QuoteItem it) async {
    final picks = _picksForSeq[it.sequenceNo] ?? const [];
    final current = _pickChoice[it.sequenceNo];
    final chosen = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pack from which pick?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
          for (final p in picks)
            ListTile(
              dense: true,
              leading: const Icon(Icons.inventory_2_outlined, size: 18),
              title: Text(p.pickPreLabel,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: Text(
                  'picked ${p.pickedQty.toStringAsFixed(0)} · planned ${p.plannedQty.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 11)),
              trailing: current == p.pickPreLabel
                  ? const Icon(Icons.check, color: AppDesign.modPicking)
                  : null,
              onTap: () => Navigator.pop(context, p.pickPreLabel),
            ),
          ListTile(
            dense: true,
            leading: const Icon(Icons.add_box_outlined,
                size: 18, color: AppDesign.warning),
            title: const Text('Auto-create new pick (0 picked)',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
            trailing: current == _kAutoPick ? const Icon(Icons.check) : null,
            onTap: () => Navigator.pop(context, _kAutoPick),
          ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (chosen != null && mounted) {
      setState(() => _pickChoice[it.sequenceNo] = chosen);
    }
  }

  Widget _lineTile(QuoteItem it) {
    final selected = _chosen.contains(it.sequenceNo);
    final remaining = _remainingFor(it);
    final blocked = remaining <= 0;
    final desc = _descriptions[it.skuNo] ?? '';
    final sqParent = it.quotePreLabel;

    return Opacity(
      // A line with nothing left to take is faded as a whole — the fastest
      // signal when thumbing down a long quote is the row that stops
      // competing for attention.
      opacity: blocked ? 0.55 : 1,
      child: Container(
      decoration: BoxDecoration(
        color: blocked
            ? AppDesign.bg
            : (selected ? SqColors.bg(sqParent) : AppDesign.surface),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(
          color: selected ? SqColors.fg(sqParent) : AppDesign.border,
          width: selected ? 1.3 : 1,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: SqColors.fg(sqParent),
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(AppDesign.radiusSm)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 4, 6, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: selected,
                      onChanged: blocked ? null : (_) => _toggle(it),
                      activeColor: SqColors.fg(sqParent),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    if (widget.pick.companyCode != null)
                      InventoryImageWidget(
                        companyCode: widget.pick.companyCode!,
                        skuNo: it.skuNo,
                        uom: it.uom,
                        width: 34, height: 34,
                        borderRadius: BorderRadius.circular(6),
                        showLoadingIndicator: false,
                      ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(children: [
                            Expanded(
                              child: Text(
                                desc.isNotEmpty ? desc : 'SKU ${it.skuNo}',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: blocked
                                      ? AppDesign.inkSubtle
                                      : AppDesign.ink,
                                  height: 1.2,
                                  decoration: blocked
                                      ? TextDecoration.lineThrough
                                      : null,
                                  decorationColor: AppDesign.inkSubtle,
                                  decorationThickness: 2,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (blocked) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppDesign.success.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(
                                      AppDesign.radiusPill),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle,
                                        size: 11, color: AppDesign.success),
                                    SizedBox(width: 3),
                                    Text('ADDED',
                                        style: TextStyle(
                                            fontSize: 8.5,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.4,
                                            color: AppDesign.success)),
                                  ],
                                ),
                              ),
                            ],
                          ]),
                          const SizedBox(height: 3),
                          Wrap(
                            spacing: 6,
                            runSpacing: 2,
                            children: [
                              Text(it.uom,
                                  style: const TextStyle(
                                      fontSize: 10, color: AppDesign.inkMuted,
                                      fontWeight: FontWeight.w500)),
                              Text('SKU ${it.skuNo}',
                                  style: const TextStyle(
                                      fontSize: 10, color: AppDesign.inkMuted,
                                      fontWeight: FontWeight.w500)),
                              if ((it.pluNo ?? '').isNotEmpty)
                                Text('PLU ${it.pluNo}',
                                    style: const TextStyle(
                                        fontSize: 10, color: AppDesign.inkMuted,
                                        fontWeight: FontWeight.w500)),
                              Text(
                                blocked
                                    ? 'Fully added — nothing left'
                                    : 'Remaining ${remaining.toStringAsFixed(0)}/${(it.quoteQuantity ?? 0).toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: blocked
                                      ? AppDesign.inkSubtle
                                      : AppDesign.success,
                                ),
                              ),
                              _pickChip(it),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (selected)
                      SizedBox(
                        width: 58,
                        child: TextField(
                          controller: _qtyCtrls[it.sequenceNo],
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

// ─────────────────────────── From Inventory tab ─────────────────────────

class _FromInventoryTab extends StatefulWidget {
  final PackList pick;
  final ScrollController scrollController;
  final String? initialQuery;
  final String? initialUom;
  const _FromInventoryTab({
    required this.pick,
    required this.scrollController,
    this.initialQuery,
    this.initialUom,
  });

  @override
  State<_FromInventoryTab> createState() => _FromInventoryTabState();
}

class _FromInventoryTabState extends State<_FromInventoryTab> {
  final _searchCtrl = TextEditingController();
  List<InventoryItem> _results = [];
  bool _searching = false;

  @override
  void initState() {
    super.initState();
    final q = widget.initialQuery;
    if (q != null && q.trim().isNotEmpty) {
      _searchCtrl.text = q.trim();
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _search(q.trim());
        // Auto-open the qty/UOM dialog when the scan resolved to exactly one
        // inventory item — the "scan → add" fast path.
        if (mounted && _results.length == 1) {
          _add(_results.first, preferUom: widget.initialUom);
        }
      });
    }
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _search(String q) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;
    setState(() => _searching = true);

    final trimmed = q.trim();
    if (trimmed.isEmpty) {
      setState(() {
        _results = [];
        _searching = false;
      });
      return;
    }

    // PLU is resolved FIRST, and for typed input as well as scanned.
    //
    // The EDA52's scan trigger injects the barcode as keystrokes into whatever
    // field has focus — so a scan usually arrives here, not through the camera
    // button. Matching only SKU meant scanning a shelf label found nothing,
    // while the identical code worked through the camera icon a few pixels
    // away. A barcode is a PLU, not a SKU number.
    final pluSkus = (await isar.inStockPlus
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .pluNoEqualTo(trimmed, caseSensitive: false)
            .findAll())
        .map((p) => p.skuNo)
        .whereType<int>()
        .toSet();

    // De-duplicated by SKU: one item can carry several PLUs (one per UOM) and
    // would otherwise appear once per barcode.
    final rows = <InventoryItem>[];
    final seen = <int>{};
    void collect(List<InventoryItem> items) {
      for (final it in items) {
        if (seen.add(it.skuNo)) rows.add(it);
      }
    }

    if (pluSkus.isNotEmpty) {
      collect(await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(pluSkus, (q, sku) => q.skuNoEqualTo(sku))
          .findAll());
    }

    final asInt = int.tryParse(trimmed);
    if (asInt != null) {
      collect(await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .skuNoEqualTo(asInt)
          .findAll());
    } else {
      collect(await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .descriptionContains(trimmed, caseSensitive: false)
          .limit(50)
          .findAll());
    }

    if (!mounted) return;
    setState(() {
      _results = rows;
      _searching = false;
    });
  }

  Future<void> _add(InventoryItem inv, {String? preferUom}) async {
    final cc = widget.pick.companyCode;
    if (cc == null) return;

    // Load the SKU's UOM options (with factor). If none are stored, fall
    // back to the master item's own UOM.
    final uomRows = await isar.inStockUoms
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .skuNoEqualTo(inv.skuNo)
        .findAll();
    final uoms = <_UomOption>[];
    for (final u in uomRows) {
      final code = (u.uom ?? '').trim();
      if (code.isEmpty) continue;
      if (uoms.any((e) => e.uom.toUpperCase() == code.toUpperCase())) continue;
      uoms.add(_UomOption(code, u.factor ?? 1));
    }
    if (uoms.isEmpty) {
      uoms.add(_UomOption(inv.uom ?? 'EA', 1));
    }

    if (!mounted) return;
    final ctrl = TextEditingController(text: '1');
    // Default to the scanned PLU's UOM when it's one of this SKU's options.
    _UomOption selected = uoms.firstWhere(
      (u) => preferUom != null &&
          u.uom.toUpperCase() == preferUom.toUpperCase(),
      orElse: () => uoms.first,
    );

    final ok = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) {
          void bump(double delta) {
            final cur = double.tryParse(ctrl.text) ?? 0;
            final next = (cur + delta).clamp(0, double.infinity).toDouble();
            ctrl.text = _fmtFactor(next);
            setSheet(() {});
          }

          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Grab handle.
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  // Header — image + description + sku.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InventoryImageWidget(
                        companyCode: cc,
                        skuNo: inv.skuNo,
                        uom: selected.uom,
                        width: 56,
                        height: 56,
                        borderRadius: BorderRadius.circular(8),
                        showLoadingIndicator: false,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              (inv.description ?? '').isNotEmpty
                                  ? inv.description!
                                  : 'SKU ${inv.skuNo}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppDesign.ink,
                                  height: 1.2),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text('SKU ${inv.skuNo}',
                                style: const TextStyle(
                                    fontSize: 11, color: AppDesign.inkMuted)),
                          ],
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
                  const SizedBox(height: 16),
                  // UOM selector — pill chips when multiple.
                  if (uoms.length > 1) ...[
                    const Text('UOM', style: AppDesign.micro),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: uoms.map((u) {
                        final sel = u.uom == selected.uom;
                        return GestureDetector(
                          onTap: () => setSheet(() => selected = u),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
                            decoration: BoxDecoration(
                              color: sel
                                  ? AppDesign.modPacking
                                  : AppDesign.modPackingBg,
                              borderRadius:
                                  BorderRadius.circular(AppDesign.radiusSm),
                            ),
                            child: Text(
                              u.factor != 1
                                  ? '${u.uom}  ×${_fmtFactor(u.factor)}'
                                  : u.uom,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: sel ? Colors.white : AppDesign.modPacking,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                  // Qty stepper row.
                  const Text('PLANNED QTY', style: AppDesign.micro),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _stepBtn(Icons.remove, () => bump(-1)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: ctrl,
                          textAlign: TextAlign.center,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppDesign.ink),
                          decoration: InputDecoration(
                            isDense: true,
                            suffixText: uoms.length == 1 ? selected.uom : null,
                            suffixStyle: const TextStyle(
                                fontSize: 11, color: AppDesign.inkMuted),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDesign.radiusSm)),
                          ),
                          onChanged: (_) => setSheet(() {}),
                        ),
                      ),
                      const SizedBox(width: 8),
                      _stepBtn(Icons.add, () => bump(1)),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Add button.
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(ctx, true),
                      icon: const Icon(Icons.add, size: 16),
                      label: Text(
                        'Add ${ctrl.text.isEmpty ? "0" : ctrl.text} ${selected.uom}',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppDesign.modPacking,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppDesign.radiusSm)),
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
    if (ok != true) return;
    final qty = double.tryParse(ctrl.text) ?? 0;
    if (qty <= 0) return;

    // Build in memory only; PackDetailPage buffers + persists on Save.
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final row = PackListItem()
      ..companyCode = cc
      ..packPreLabel = widget.pick.packPreLabel
      // sequenceNo assigned by the buffer in PackDetailPage
      ..skuNo = inv.skuNo
      ..uom = selected.uom
      ..parentPreLabel = null
      ..locationCode = widget.pick.locationCode
      ..status = 'A'
      ..factor = selected.factor
      // Create-time typed value = planned Qty. Pack_Qty stays 0 until
      // the picker enters actuals on the detail page.
      ..qty = qty
      ..packQty = 0
      ..addedBy = userId
      ..addedDate = now
      ..lastModifiedBy = userId
      ..lastWriteTimeStamp = now
      ..isSynced = false;

    if (!mounted) return;
    Navigator.of(context).pop([row]);
  }

  static String _fmtFactor(double f) =>
      f == f.roundToDouble() ? f.toStringAsFixed(0) : f.toStringAsFixed(2);

  Widget _stepBtn(IconData icon, VoidCallback onTap) {
    return Material(
      color: AppDesign.modPackingBg,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          child: Icon(icon, size: 18, color: AppDesign.modPacking),
        ),
      ),
    );
  }

  Future<void> _scan() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || code.isEmpty || !mounted) return;
    final cc = widget.pick.companyCode;
    if (cc == null) return;

    // Resolve to a SKU (and its scanned UOM) via In_Stock_PLU first, then a
    // direct SKU-number match. Auto-open the add dialog on a hit.
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
    int? sku = plu?.skuNo;
    final String? uom = plu?.uom;
    sku ??= int.tryParse(code.trim());

    if (sku != null) {
      final inv = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .skuNoEqualTo(sku)
          .findFirst();
      if (inv != null && mounted) {
        _searchCtrl.text = '$sku';
        await _search('$sku');
        await _add(inv, preferUom: uom);
        return;
      }
    }
    // No resolution — clear the box (a scan shouldn't linger as a filter).
    if (mounted) {
      _searchCtrl.clear();
      _search('');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No item matches "$code"')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDesign.space3),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: AppDesign.surface,
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              border: Border.all(color: AppDesign.borderStrong),
            ),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Icon(Icons.search, size: 16, color: AppDesign.inkSubtle),
                const SizedBox(width: 4),
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    autofocus: true,
                    onChanged: _search,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppDesign.ink),
                    decoration: const InputDecoration(
                      hintText: 'Scan or search SKU / PLU / name…',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: AppDesign.inkSubtle,
                          fontWeight: FontWeight.w500),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                if (_searchCtrl.text.isNotEmpty)
                  InkWell(
                    onTap: () {
                      _searchCtrl.clear();
                      _search('');
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.clear,
                          size: 14, color: AppDesign.inkSubtle),
                    ),
                  ),
                Container(width: 1, height: 20, color: AppDesign.border),
                InkWell(
                  borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(AppDesign.radiusSm)),
                  onTap: _scan,
                  child: Container(
                    width: 42,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Icon(Icons.qr_code_scanner,
                        size: 18, color: AppDesign.modPacking),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: _searching
              ? const Center(child: CircularProgressIndicator())
              : _results.isEmpty
                  ? Center(
                      child: Text(
                        _searchCtrl.text.isEmpty
                            ? 'Type to search inventory'
                            : 'No matches',
                        style: AppDesign.caption,
                      ),
                    )
                  : ListView.separated(
                      controller: widget.scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: AppDesign.space3),
                      itemCount: _results.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 4),
                      itemBuilder: (context, i) => _resultRow(_results[i]),
                    ),
        ),
      ],
    );
  }

  Widget _resultRow(InventoryItem inv) {
    final desc = inv.description ?? '';
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: () => _add(inv),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: SqColors.fg(null),
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(AppDesign.radiusSm)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
                    child: Row(
                      children: [
                        InventoryImageWidget(
                          companyCode: widget.pick.companyCode ?? 0,
                          skuNo: inv.skuNo,
                          uom: inv.uom,
                          width: 34, height: 34,
                          borderRadius: BorderRadius.circular(6),
                          showLoadingIndicator: false,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                desc.isNotEmpty ? desc : 'SKU ${inv.skuNo}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppDesign.ink,
                                    height: 1.2),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 3),
                              Wrap(
                                spacing: 6,
                                runSpacing: 2,
                                children: [
                                  Text(inv.uom ?? '?',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: AppDesign.inkMuted,
                                          fontWeight: FontWeight.w500)),
                                  Text('SKU ${inv.skuNo}',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: AppDesign.inkMuted,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.add_circle, size: 20, color: AppDesign.modPacking),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One selectable UOM option (code + pack factor) for the add-item dialog.
class _UomOption {
  final String uom;
  final double factor;
  const _UomOption(this.uom, this.factor);
}

// ─────────────────────────── From Pick tab ──────────────────────────────
// Packs are built FROM picks, so this is the primary source: choose a pick,
// then choose which of its lines go into this pack.
class _FromPickTab extends StatefulWidget {
  final PackList pack;
  final ScrollController scrollController;
  final List<PackListItem> existingItems;
  const _FromPickTab({
    required this.pack,
    required this.scrollController,
    this.existingItems = const [],
  });

  @override
  State<_FromPickTab> createState() => _FromPickTabState();
}

class _FromPickTabState extends State<_FromPickTab> {
  /// Location being worked in — the pack's own if it has one, else the global
  /// selection. Without this the "From Pick" tab offered picks from every
  /// site, which is exactly how a pack ends up spanning two warehouses.
  String? _locationCode;

  List<PickList> _picks = [];
  PickList? _selected;
  List<PickListItem> _lines = [];
  Map<int, String> _desc = {};

  /// pick label -> (already packed qty, total picked qty)
  final Map<String, (double, double)> _progress = {};

  /// pick label -> customer names (via each line's source SQ)
  final Map<String, List<String>> _customers = {};

  final Set<int> _chosen = {}; // pick line ids
  final Map<int, TextEditingController> _qtyCtrls = {};

  bool _loading = true;
  bool _loadingLines = false;

  final _searchCtrl = TextEditingController();
  final _lineSearchCtrl = TextEditingController();
  String _query = '';
  String _lineQuery = '';

  int _sortBy = 0; // 0 = pick date, 1 = customer, 2 = pick no
  bool _sortDesc = true;
  final Set<int> _statusFilter = <int>{}; // 0 none, 1 partial, 2 full

  @override
  void initState() {
    super.initState();
    _searchCtrl
        .addListener(() => setState(() => _query = _searchCtrl.text.trim().toLowerCase()));
    _lineSearchCtrl.addListener(
        () => setState(() => _lineQuery = _lineSearchCtrl.text.trim().toLowerCase()));
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _lineSearchCtrl.dispose();
    for (final c in _qtyCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final cc = widget.pack.companyCode;
    if (cc == null) {
      setState(() => _loading = false);
      return;
    }
    // Prefer the pack's own location so switching the global scope mid-edit
    // doesn't empty the list under the operator.
    final docLoc = (widget.pack.locationCode ?? '').trim();
    _locationCode =
        docLoc.isNotEmpty ? docLoc : await LocationService().selectedCode();

    // Open picks only — a cancelled pick has released its stock.
    final rows = (await isar.pickLists
            .filter()
            .companyCodeEqualTo(cc)
            .findAll())
        .where((p) => p.status != 'X')
        // Same location scoping as the SQ tab and the hubs.
        .where((p) => LocationService.inScope(p.locationCode, _locationCode))
        .toList();
    rows.sort((a, b) => (b.pickDate ?? b.addedDate ?? DateTime(0))
        .compareTo(a.pickDate ?? a.addedDate ?? DateTime(0)));
    if (!mounted) return;
    setState(() {
      _picks = rows;
      _loading = false;
    });
    _loadMeta(cc, rows);
  }

  /// Packed progress + customers per pick. Runs after the list is visible.
  Future<void> _loadMeta(int cc, List<PickList> rows) async {
    final labels = rows.map((e) => e.pickPreLabel).whereType<String>().toList();
    if (labels.isEmpty) return;

    final pickItems = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels, (q, l) => q.pickPreLabelEqualTo(l))
        .findAll();

    // total picked per pick + the SQs behind it
    final totals = <String, double>{};
    final sqOf = <String, Set<String>>{};
    for (final it in pickItems) {
      if (it.status == 'X') continue;
      final l = it.pickPreLabel;
      if (l == null) continue;
      totals[l] = (totals[l] ?? 0) + (it.pickQty ?? 0);
      final sq = it.parentPreLabel;
      if (sq != null && sq.isNotEmpty) {
        sqOf.putIfAbsent(l, () => <String>{}).add(sq);
      }
    }

    // already packed against each pick (cancelled packs excluded)
    final cancelled = (await isar.packLists
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .statusEqualTo('X')
            .findAll())
        .map((e) => e.packPreLabel)
        .whereType<String>()
        .toSet();
    final packItems = await isar.packListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels, (q, l) => q.parentPreLabelEqualTo(l))
        .findAll();
    final packed = <String, double>{};
    for (final it in packItems) {
      if (it.status == 'X') continue;
      if (cancelled.contains(it.packPreLabel)) continue;
      final l = it.parentPreLabel;
      if (l == null) continue;
      packed[l] = (packed[l] ?? 0) + (it.qty ?? 0);
    }

    // customer names via the SQs
    final allSqs = sqOf.values.expand((e) => e).toSet().toList();
    final custOfSq = <String, String>{};
    if (allSqs.isNotEmpty) {
      final quotes = await isar.quotes
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(allSqs, (q, l) => q.quotePreLabelEqualTo(l))
          .findAll();
      for (final q in quotes) {
        final l = q.quotePreLabel;
        final c = q.customer;
        if (l != null && c != null && c.isNotEmpty) custOfSq[l] = c;
      }
    }
    final names = <String, String>{};
    final codes = custOfSq.values.toSet().toList();
    if (codes.isNotEmpty) {
      // Code-only: AR_Customer is partitioned by Company_Code but quote
      // references cross those partitions, so scoping the lookup hides
      // most customer names behind a bare code.
      final custs = await isar.customers
          .filter()
          .anyOf(codes, (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final c in custs) {
        names[c.code] = (c.name ?? '').trim();
      }
    }

    if (!mounted) return;
    setState(() {
      _progress
        ..clear()
        ..addEntries(labels
            .map((l) => MapEntry(l, (packed[l] ?? 0, totals[l] ?? 0))));
      _customers.clear();
      sqOf.forEach((pick, sqs) {
        final out = <String>{};
        for (final sq in sqs) {
          final code = custOfSq[sq];
          if (code == null) continue;
          final n = names[code] ?? '';
          out.add(n.isEmpty ? code : n);
        }
        if (out.isNotEmpty) _customers[pick] = out.toList()..sort();
      });
    });
  }

  int _statusOf(String? label) {
    final pr = _progress[label ?? ''];
    if (pr == null) return 0;
    final (done, total) = pr;
    if (done <= 0) return 0;
    if (total > 0 && done + 0.0001 >= total) return 2;
    return 1;
  }

  List<PickList> get _visible {
    var out = _picks;
    if (_statusFilter.isNotEmpty) {
      out = out
          .where((p) => _statusFilter.contains(_statusOf(p.pickPreLabel)))
          .toList();
    }
    if (_query.isNotEmpty) {
      out = out.where((p) {
        final l = (p.pickPreLabel ?? '').toLowerCase();
        final cust =
            (_customers[p.pickPreLabel ?? ''] ?? const <String>[])
                .join(' ')
                .toLowerCase();
        return l.contains(_query) || cust.contains(_query);
      }).toList();
    }
    final sorted = [...out];
    sorted.sort((a, b) {
      int r;
      switch (_sortBy) {
        case 1:
          r = (_customers[a.pickPreLabel ?? '']?.first ?? '')
              .toLowerCase()
              .compareTo(
                  (_customers[b.pickPreLabel ?? '']?.first ?? '').toLowerCase());
        case 2:
          r = (a.pickPreLabel ?? '').compareTo(b.pickPreLabel ?? '');
        default:
          final ad = a.pickDate ?? a.addedDate;
          final bd = b.pickDate ?? b.addedDate;
          r = ad == null
              ? (bd == null ? 0 : 1)
              : bd == null
                  ? -1
                  : ad.compareTo(bd);
      }
      return _sortDesc ? -r : r;
    });
    return sorted;
  }

  Future<void> _openPick(PickList p) async {
    final cc = widget.pack.companyCode;
    if (cc == null) return;
    setState(() {
      _selected = p;
      _loadingLines = true;
      _chosen.clear();
      _qtyCtrls.clear();
    });
    final lines = (await isar.pickListItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .pickPreLabelEqualTo(p.pickPreLabel)
            .sortBySequenceNo()
            .findAll())
        .where((e) => e.status != 'X')
        .toList();

    final skus = lines.map((e) => e.skuNo).whereType<int>().toSet().toList();
    final desc = <int, String>{};
    if (skus.isNotEmpty) {
      final inv = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
          .findAll();
      for (final i in inv) {
        desc[i.skuNo] = i.description ?? '';
      }
    }
    if (!mounted) return;
    setState(() {
      _lines = lines;
      _desc = desc;
      _loadingLines = false;
    });
  }

  /// Already staged in this pack (so we don't offer the same line twice).
  bool _alreadyStaged(PickListItem it) => widget.existingItems.any((e) =>
      e.skuNo == it.skuNo &&
      e.uom == it.uom &&
      e.parentPreLabel == it.pickPreLabel &&
      (e.sourceSq ?? '') == (it.parentPreLabel ?? ''));

  List<PickListItem> get _visibleLines {
    if (_lineQuery.isEmpty) return _lines;
    return _lines.where((it) {
      final sku = (it.skuNo ?? 0).toString();
      final d = (_desc[it.skuNo ?? -1] ?? '').toLowerCase();
      return sku.contains(_lineQuery) || d.contains(_lineQuery);
    }).toList();
  }

  void _toggle(PickListItem it) {
    setState(() {
      if (_chosen.contains(it.id)) {
        _chosen.remove(it.id);
        _qtyCtrls.remove(it.id)?.dispose();
      } else {
        _chosen.add(it.id);
        // Default to what was actually picked — that's what can be packed.
        final v = it.pickQty ?? 0;
        _qtyCtrls[it.id] =
            TextEditingController(text: v.toStringAsFixed(0));
      }
    });
  }

  void _toggleAll() {
    setState(() {
      final avail = _visibleLines.where((e) => !_alreadyStaged(e)).toList();
      if (avail.every((e) => _chosen.contains(e.id))) {
        for (final e in avail) {
          _chosen.remove(e.id);
          _qtyCtrls.remove(e.id)?.dispose();
        }
      } else {
        for (final e in avail) {
          if (_chosen.add(e.id)) {
            _qtyCtrls[e.id] = TextEditingController(
                text: (e.pickQty ?? 0).toStringAsFixed(0));
          }
        }
      }
    });
  }

  Future<void> _addSelected() async {
    final cc = widget.pack.companyCode;
    final pickLabel = _selected?.pickPreLabel;
    if (cc == null || pickLabel == null || _chosen.isEmpty) return;
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final rows = <PackListItem>[];
    for (final it in _lines.where((e) => _chosen.contains(e.id))) {
      final qty = double.tryParse(_qtyCtrls[it.id]?.text ?? '') ?? 0;
      if (qty <= 0) continue;
      rows.add(PackListItem()
        ..companyCode = cc
        ..packPreLabel = widget.pack.packPreLabel
        ..skuNo = it.skuNo
        ..uom = it.uom
        ..parentPreLabel = pickLabel // parent = the pick
        ..sourceSq = it.parentPreLabel // keep the SQ split
        ..locationCode = it.locationCode ?? widget.pack.locationCode
        ..status = 'A'
        ..factor = it.factor
        ..qty = qty
        ..packQty = 0
        ..addedBy = userId
        ..addedDate = now
        ..lastModifiedBy = userId
        ..lastWriteTimeStamp = now
        ..isSynced = false);
    }
    if (rows.isEmpty || !mounted) return;
    Navigator.of(context).pop(rows);
  }

  @override
  Widget build(BuildContext context) =>
      _selected == null ? _pickList() : _lineList();

  // ── pick list ──
  Widget _pickList() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    return Column(children: [
      Row(children: [
        Expanded(child: _searchField(_searchCtrl, 'Search pick or customer')),
        Padding(
          padding: const EdgeInsets.only(right: AppDesign.space3),
          child: Material(
            color: AppDesign.modPackingBg,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              onTap: _openSortSheet,
              child: const SizedBox(
                width: 38,
                height: 38,
                child: Icon(Icons.swap_vert,
                    size: 19, color: AppDesign.modPacking),
              ),
            ),
          ),
        ),
      ]),
      _statusFilterBar(),
      Expanded(
        child: _visible.isEmpty
            ? Center(
                child: Text(_picks.isEmpty ? 'No picks yet' : 'No matches',
                    style: AppDesign.body))
            : ListView.separated(
                controller: widget.scrollController,
                padding: const EdgeInsets.fromLTRB(
                    AppDesign.space3, 0, AppDesign.space3, AppDesign.space3),
                itemCount: _visible.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemBuilder: (context, i) => _pickTile(_visible[i]),
              ),
      ),
    ]);
  }

  Widget _pickTile(PickList p) {
    final custs = _customers[p.pickPreLabel ?? ''] ?? const <String>[];
    final when = p.pickDate ?? p.addedDate;
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: () => _openPick(p),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: Row(children: [
            const Icon(Icons.shelves, size: 16, color: AppDesign.modPicking),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    Expanded(
                      child: Text(p.pickPreLabel ?? '—',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppDesign.ink),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    _statusChip(p.pickPreLabel),
                  ]),
                  if (custs.isNotEmpty)
                    Text(custs.join(' · '),
                        style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.info),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  Text(
                    when == null ? '' : _fmtDate(when),
                    style: const TextStyle(
                        fontSize: 10, color: AppDesign.inkMuted),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                size: 16, color: AppDesign.inkSubtle),
          ]),
        ),
      ),
    );
  }

  Widget _statusChip(String? label) {
    final pr = _progress[label ?? ''];
    if (pr == null || pr.$2 <= 0) return const SizedBox.shrink();
    final (done, total) = pr;
    final full = done + 0.0001 >= total;
    final none = done <= 0;
    final c = full
        ? AppDesign.success
        : none
            ? AppDesign.inkSubtle
            : AppDesign.warning;
    final text = full
        ? 'PACKED'
        : none
            ? 'NOT PACKED'
            : '${done.toStringAsFixed(0)}/${total.toStringAsFixed(0)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          color: c.withOpacity(0.10), borderRadius: BorderRadius.circular(3)),
      child: Text(text,
          style:
              TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: c)),
    );
  }

  Widget _statusFilterBar() {
    Widget chip(String label, int value, Color colour) {
      final on = _statusFilter.contains(value);
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => setState(() {
            if (!_statusFilter.remove(value)) _statusFilter.add(value);
          }),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: on ? colour : colour.withOpacity(0.08),
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: on ? colour : colour.withOpacity(0.30)),
            ),
            child: Text(label,
                style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                    color: on ? Colors.white : colour),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDesign.space3 - 2, 0, AppDesign.space3 - 2, AppDesign.space2),
      child: Row(children: [
        chip('NOT PACKED', 0, AppDesign.inkMuted),
        chip('PARTIAL', 1, AppDesign.warning),
        chip('PACKED', 2, AppDesign.success),
      ]),
    );
  }

  Future<void> _openSortSheet() async {
    const opts = [('Pick date', 0), ('Customer', 1), ('Pick number', 2)];
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Sort picks by',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ),
            ),
            for (final o in opts)
              ListTile(
                dense: true,
                onTap: () {
                  setState(() => _sortBy = o.$2);
                  setSheet(() {});
                },
                title: Text(o.$1,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: _sortBy == o.$2
                            ? FontWeight.w800
                            : FontWeight.w600,
                        color: _sortBy == o.$2
                            ? AppDesign.modPacking
                            : AppDesign.ink)),
                trailing: _sortBy == o.$2
                    ? const Icon(Icons.check,
                        size: 18, color: AppDesign.modPacking)
                    : null,
              ),
            const Divider(height: 1),
            ListTile(
              dense: true,
              onTap: () {
                setState(() => _sortDesc = !_sortDesc);
                setSheet(() {});
              },
              leading: Icon(
                  _sortDesc ? Icons.arrow_downward : Icons.arrow_upward,
                  size: 18,
                  color: AppDesign.modPacking),
              title: Text(
                  _sortBy == 1
                      ? (_sortDesc ? 'Z → A' : 'A → Z')
                      : (_sortDesc ? 'Newest first' : 'Oldest first'),
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  // ── line list for the chosen pick ──
  Widget _lineList() {
    final p = _selected!;
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        color: AppDesign.surfaceAlt,
        child: Row(children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            icon: const Icon(Icons.arrow_back, size: 18),
            onPressed: () => setState(() {
              _selected = null;
              _chosen.clear();
              for (final c in _qtyCtrls.values) {
                c.dispose();
              }
              _qtyCtrls.clear();
            }),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(p.pickPreLabel ?? '—',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.ink),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          if (_chosen.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text('${_chosen.length} sel',
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted)),
            ),
          InkWell(
            onTap: _toggleAll,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppDesign.modPackingBg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              ),
              child: const Text('All',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.modPacking)),
            ),
          ),
        ]),
      ),
      _searchField(_lineSearchCtrl, 'Search SKU or name'),
      Expanded(
        child: _loadingLines
            ? const Center(child: CircularProgressIndicator())
            : _visibleLines.isEmpty
                ? const Center(child: Text('No items', style: AppDesign.body))
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                        AppDesign.space3, 0, AppDesign.space3, AppDesign.space3),
                    itemCount: _visibleLines.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemBuilder: (context, i) => _lineTile(_visibleLines[i]),
                  ),
      ),
      SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(AppDesign.space3),
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: _chosen.isEmpty ? null : _addSelected,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modPacking,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
              child: Text('Add ${_chosen.length} to pack',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700)),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _lineTile(PickListItem it) {
    final staged = _alreadyStaged(it);
    final selected = _chosen.contains(it.id);
    final d = _desc[it.skuNo ?? -1] ?? '';
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppDesign.modPackingBg : AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(
            color: selected ? AppDesign.modPacking : AppDesign.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(children: [
        Checkbox(
          value: selected,
          onChanged: staged ? null : (_) => _toggle(it),
          activeColor: AppDesign.modPacking,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(d.isNotEmpty ? d : 'SKU ${it.skuNo}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.ink),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(
                [
                  it.uom ?? '',
                  'SKU ${it.skuNo}',
                  if ((it.parentPreLabel ?? '').isNotEmpty) it.parentPreLabel!,
                  staged
                      ? 'Already added'
                      : 'picked ${(it.pickQty ?? 0).toStringAsFixed(0)}'
                          '/${(it.qty ?? 0).toStringAsFixed(0)}',
                ].where((e) => e.isNotEmpty).join('  ·  '),
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: staged ? AppDesign.inkSubtle : AppDesign.inkMuted),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (selected)
          SizedBox(
            width: 58,
            child: TextField(
              controller: _qtyCtrls[it.id],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        const SizedBox(width: 4),
      ]),
    );
  }

  /// "04 AUG 26"
  static String _fmtDate(DateTime d) {
    const m = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, "0")} ${m[d.month - 1]} $yy';
  }

  Widget _searchField(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDesign.space3, AppDesign.space2, AppDesign.space3, AppDesign.space2),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.borderStrong),
        ),
        child: Row(children: [
          const SizedBox(width: 8),
          const Icon(Icons.search, size: 16, color: AppDesign.inkSubtle),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              controller: c,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppDesign.ink),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    fontSize: 12,
                    color: AppDesign.inkSubtle,
                    fontWeight: FontWeight.w500),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          if (c.text.isNotEmpty)
            InkWell(
              onTap: c.clear,
              borderRadius: BorderRadius.circular(12),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child:
                    Icon(Icons.clear, size: 14, color: AppDesign.inkSubtle),
              ),
            ),
          const SizedBox(width: 4),
        ]),
      ),
    );
  }
}
