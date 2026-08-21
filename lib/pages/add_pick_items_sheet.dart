import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
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
import '../services/pick_balance_service.dart';
import '../services/customer_label.dart';
import '../config/app_config.dart';
import '../theme/app_design.dart';
import '../theme/sq_colors.dart';
import '../widgets/inventory_image_widget.dart';
import 'barcode_scanner_page.dart';

/// Bottom sheet to add items to an existing pick list.
///
/// Tab 1 "From SQ": list of open sales quotes with per-line remaining balance
/// (SQ qty minus already-picked-across-all-picks). Pick lines are toggled and
/// the user enters/adjusts qty before adding.
///
/// Tab 2 "From Inventory": search box → inventory hits → tap to add with qty.
/// Parent_PreLabel stays NULL on those rows.
class AddPickItemsSheet extends StatefulWidget {
  final PickList pick;

  /// If non-null, the "From SQ" tab auto-opens this quote's line list on
  /// mount (used by the Picking hub's "scan an SQ" flow).
  final String? initialSqPreLabel;

  /// If non-null, opens on the "From Inventory" tab pre-searched to this
  /// code/SKU (used when a scan doesn't match anything on the pick).
  final String? initialInventoryCode;

  /// The scanned PLU's UOM — the add dialog defaults its UOM selector to it.
  final String? initialInventoryUom;

  /// The current pick's in-memory items (buffered, possibly unsaved). Used to
  /// subtract already-added allocations so re-opening / re-scanning the same
  /// SQ reflects what's already in this pick.
  final List<PickListItem> existingItems;

  const AddPickItemsSheet({
    super.key,
    required this.pick,
    this.initialSqPreLabel,
    this.initialInventoryCode,
    this.initialInventoryUom,
    this.existingItems = const [],
  });

  @override
  State<AddPickItemsSheet> createState() => _AddPickItemsSheetState();
}

class _AddPickItemsSheetState extends State<AddPickItemsSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(
        length: AppConfig.enableLooseItems ? 2 : 1, vsync: this);
    // Land on the Inventory tab when a scan brought us here to add a
    // not-on-the-pick item.
    if (AppConfig.enableLooseItems && widget.initialInventoryCode != null) {
      _tabs.index = 1;
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
                  Text((widget.pick.pickPreLabel ?? '').isNotEmpty
                          ? widget.pick.pickPreLabel!
                          : 'new pick',
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700, color: AppDesign.modPicking)),
                ],
              ),
            ),
            TabBar(
              controller: _tabs,
              labelColor: AppDesign.modPicking,
              unselectedLabelColor: AppDesign.inkMuted,
              indicatorColor: AppDesign.modPicking,
              indicatorWeight: 2,
              labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              tabs: [
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
                  _FromSqTab(
                    pick: widget.pick,
                    scrollController: controller,
                    initialSqPreLabel: widget.initialSqPreLabel,
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
  final PickList pick;
  final ScrollController scrollController;
  final String? initialSqPreLabel;
  final List<PickListItem> existingItems;
  const _FromSqTab({
    required this.pick,
    required this.scrollController,
    this.initialSqPreLabel,
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
  Map<int, String> _baseUoms = {};
  final Set<int> _chosen = {}; // sequenceNo of quote items chosen
  final Map<int, TextEditingController> _qtyCtrls = {};
  bool _loadingQuotes = true;
  bool _loadingLines = false;

  /// customer code -> name, for the SQ list.
  final Map<String, String> _custNames = {};

  /// SQ pre-label -> (allocated qty, total qty) so the list can show whether
  /// an SQ has already been picked into other pick lists.
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

  /// 0 = not picked, 1 = partial, 2 = fully picked. Empty = show everything.
  final Set<int> _sqStatusFilter = <int>{};

  /// Where an SQ sits between "nothing allocated" and "fully allocated".
  int _sqStatusOf(String? label) {
    final pr = _sqProgress[label ?? ''];
    if (pr == null) return 0;
    final (done, total) = pr;
    if (done <= 0) return 0;
    if (total > 0 && done + 0.0001 >= total) return 2;
    return 1;
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
        // Match the customer NAME too, not just its code.
        final name = (_custNames[q.customer ?? ''] ?? '').toLowerCase();
        return label.contains(_quoteQuery) ||
            code.contains(_quoteQuery) ||
            name.contains(_quoteQuery);
      }).toList();
    }
    return _sortQuotes(out);
  }

  // ── SQ sorting ──
  /// 0 = quote date, 1 = customer, 2 = SQ number.
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
          final an = (_custNames[a.customer ?? ''] ?? a.customer ?? '')
              .toLowerCase();
          final bn = (_custNames[b.customer ?? ''] ?? b.customer ?? '')
              .toLowerCase();
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
      // Undated / unnamed always sink; otherwise honour the direction.
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
                            ? AppDesign.modPicking
                            : AppDesign.ink)),
                trailing: _qSortBy == o.$2
                    ? const Icon(Icons.check,
                        size: 18, color: AppDesign.modPicking)
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
                  color: AppDesign.modPicking),
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
    // Customer names + picked status are decoration — resolve them after the
    // list is on screen so opening the sheet stays instant.
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


  /// Resolve customer names and how much of each SQ is already allocated to
  /// pick lists. Kept deliberately cheap: totals come off the quote header and
  /// the allocation query rides the Parent_PreLabel index.
  Future<void> _loadQuoteMeta(int cc, List<Quote> rows) async {
    if (rows.isEmpty) return;
    final labels =
        rows.map((q) => q.quotePreLabel).whereType<String>().toList();

    // Customer code -> name (indexed on code).
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
    setState(() {}); // names first — they're the cheap half

    if (labels.isEmpty) return;

    // Ordered qty comes straight off the quote header — no item scan.
    final totals = <String, double>{
      for (final q in rows)
        if (q.quotePreLabel != null)
          q.quotePreLabel!: q.totalQuoteQuantity ?? 0,
    };

    // Cancelled picks release their allocation, so exclude them.
    final cancelled = (await isar.pickLists
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .statusEqualTo('X')
            .findAll())
        .map((e) => e.pickPreLabel)
        .whereType<String>()
        .toSet();

    // Indexed on Parent_PreLabel — only the lines belonging to these SQs.
    final pickItems = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels, (q, l) => q.parentPreLabelEqualTo(l))
        .findAll();

    final allocated = <String, double>{};
    for (final it in pickItems) {
      if (it.status == 'X') continue;
      if (cancelled.contains(it.pickPreLabel)) continue;
      final sq = it.parentPreLabel;
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

  /// "Picked" chip for an SQ row: none / partial / fully allocated.
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
        ? 'PICKED'
        : none
            ? 'NOT PICKED'
            : '${_fmtNum(done)}/${_fmtNum(total)}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 9, fontWeight: FontWeight.w900, color: c)),
    );
  }

  /// "04 AUG 26" — same format as the pick / pack list rows.
  static String _fmtSqDate(DateTime d) {
    const m = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, "0")} ${m[d.month - 1]} $yy';
  }

  static String _fmtNum(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

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
    final picked = await PickBalanceService.allocatedByLine(
      companyCode: cc,
      sqPreLabels: [q.quotePreLabel ?? ''],
      excludePickPreLabel: widget.pick.pickPreLabel,
    );
    PickBalanceService.addBuffer(picked, widget.existingItems);

    final skus = items.map((i) => i.skuNo).toSet().toList();
    final desc = <int, String>{};
    final baseUom = <int, String>{};
    if (skus.isNotEmpty) {
      final invRows = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (qq, sku) => qq.skuNoEqualTo(sku))
          .findAll();
      for (final iv in invRows) {
        desc[iv.skuNo] = iv.description ?? '';
        // Master UOM as the base-unit fallback.
        final u = (iv.uom ?? '').trim();
        if (u.isNotEmpty) baseUom[iv.skuNo] = u;
      }
      // The factor-1 UOM is the true base unit where one is defined.
      final uomRows = await isar.inStockUoms
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (qq, sku) => qq.skuNoEqualTo(sku))
          .findAll();
      for (final u in uomRows) {
        if ((u.factor ?? 0) == 1 && (u.uom ?? '').trim().isNotEmpty) {
          baseUom.putIfAbsent(u.skuNo, () => u.uom!.trim());
        }
      }
    }

    if (!mounted) return;
    setState(() {
      _quoteItems = items;
      _picked = picked;
      _descriptions = desc;
      _baseUoms = baseUom;
      _loadingLines = false;
    });
  }

  /// Whole packs still to pick: quote packs + FOC packs, less what other
  /// picks already claimed. FOC goods are free on the INVOICE but they are
  /// physically picked like anything else.
  double _remainingFor(QuoteItem it) {
    final key = PickBalanceService.keyFor(it.quotePreLabel, it.skuNo, it.uom);
    final already = _picked[key] ?? 0;
    // Floored at zero. Over-picking is allowed, so `already` can exceed what
    // the SQ asked for — and a negative remainder reads as a fault to the
    // picker while also inviting them to pick the difference back.
    final left = (it.quoteQuantity ?? 0) + (it.quoteFoc ?? 0) - already;
    return left <= 0 ? 0 : left;
  }

  /// The SQ line's loose base units become their OWN pick line, in the base
  /// UOM. One quote row can demand "10 CTN + 5 units" — a picker walks for
  /// ten cartons and five singles, so the pick shows exactly that. The line
  /// is tagged remark='LOOSE' and folded back into its pack sibling when the
  /// invoice is generated.
  double _looseRemainingFor(QuoteItem it) {
    final loose = (it.quoteQuantityLoose ?? 0) + (it.quoteFocLoose ?? 0);
    if (loose <= 0) return 0;
    final base = _baseUoms[it.skuNo];
    // No base UOM, or the line already IS base units → nothing to split.
    if (base == null || base.toUpperCase() == (it.uom ?? '').toUpperCase()) {
      return 0;
    }
    final key = PickBalanceService.keyFor(it.quotePreLabel, it.skuNo, base);
    final left = loose - (_picked[key] ?? 0);
    return left <= 0 ? 0 : left;
  }

  void _toggle(QuoteItem it) {
    setState(() {
      if (_chosen.contains(it.sequenceNo)) {
        _chosen.remove(it.sequenceNo);
        _qtyCtrls.remove(it.sequenceNo)?.dispose();
      } else {
        _chosen.add(it.sequenceNo);
        final rem = _remainingFor(it);
        _qtyCtrls[it.sequenceNo] =
            TextEditingController(text: (rem > 0 ? rem : 0).toStringAsFixed(0));
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
        }
      }
    });
  }

  Future<void> _addSelected() async {
    if (_chosen.isEmpty || _selectedQuote == null) return;
    final cc = widget.pick.companyCode;
    if (cc == null) return;

    // Build in memory only. PickDetailPage buffers them and persists on Save.
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final rows = <PickListItem>[];
    for (final it in _quoteItems.where((it) => _chosen.contains(it.sequenceNo))) {
      // Value the user typed on create = the planned pick amount = Qty.
      // Pick_Qty stays 0 until the picker enters actuals on the detail page.
      final planned = double.tryParse(_qtyCtrls[it.sequenceNo]?.text ?? '') ?? 0;
      if (planned <= 0) continue;
      rows.add(PickListItem()
        ..companyCode = cc
        ..pickPreLabel = widget.pick.pickPreLabel
        // sequenceNo assigned by the buffer in PickDetailPage
        ..skuNo = it.skuNo
        ..uom = it.uom
        ..parentPreLabel = it.quotePreLabel
        ..locationCode = it.locationCode ?? widget.pick.locationCode
        ..batch = widget.pick.batchCount ?? 1
        ..status = 'A'
        ..factor = it.factor
        ..qty = planned
        ..pickQty = 0
        ..addedBy = userId
        ..addedDate = now
        ..lastModifiedBy = userId
        ..lastWriteTimeStamp = now
        ..isSynced = false);

      // The line's loose base units ride along as a second pick line in the
      // base UOM, so packs and singles are picked (and counted) separately.
      final looseRem = _looseRemainingFor(it);
      if (looseRem > 0) {
        rows.add(PickListItem()
          ..companyCode = cc
          ..pickPreLabel = widget.pick.pickPreLabel
          ..skuNo = it.skuNo
          ..uom = _baseUoms[it.skuNo]
          ..parentPreLabel = it.quotePreLabel
          ..locationCode = it.locationCode ?? widget.pick.locationCode
          ..batch = widget.pick.batchCount ?? 1
          ..status = 'A'
          ..factor = 1
          ..qty = looseRem
          ..pickQty = 0
          ..remark = 'LOOSE'
          ..addedBy = userId
          ..addedDate = now
          ..lastModifiedBy = userId
          ..lastWriteTimeStamp = now
          ..isSynced = false);
      }
    }
    if (rows.isEmpty) return;
    if (!mounted) return;
    Navigator.of(context).pop(rows);
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
                color: AppDesign.modPickingBg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  onTap: _openQuoteSortSheet,
                  child: const SizedBox(
                    width: 38,
                    height: 38,
                    child: Icon(Icons.swap_vert,
                        size: 19, color: AppDesign.modPicking),
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


  /// Three equal-width status chips — deliberately small so they cost one
  /// thin band above the list.
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
              border: Border.all(
                  color: on ? colour : colour.withOpacity(0.30)),
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
        chip('NOT PICKED', 0, AppDesign.inkMuted),
        chip('PARTIAL', 1, AppDesign.warning),
        chip('PICKED', 2, AppDesign.success),
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
                      color: AppDesign.modPickingBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.description_outlined,
                        size: 16, color: AppDesign.modPicking),
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
                        // Customer name leads; the code is the qualifier.
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
                        ? AppDesign.modPicking
                        : AppDesign.modPickingBg,
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
                        color: _allSelected ? Colors.white : AppDesign.modPicking,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        _allSelected ? 'Clear' : 'All',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color:
                              _allSelected ? Colors.white : AppDesign.modPicking,
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
                  backgroundColor: AppDesign.modPicking,
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
                    size: 18, color: AppDesign.modPicking),
              ),
            ),
          ],
        ),
      ),
    );
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
                                    : 'Remaining ${remaining.toStringAsFixed(0)}/${((it.quoteQuantity ?? 0) + (it.quoteFoc ?? 0)).toStringAsFixed(0)}'
                                        '${_looseRemainingFor(it) > 0 ? "  +${_looseRemainingFor(it).toStringAsFixed(0)} loose" : ""}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: blocked
                                      ? AppDesign.inkSubtle
                                      : AppDesign.success,
                                ),
                              ),
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
  final PickList pick;
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
                                  ? AppDesign.modPicking
                                  : AppDesign.modPickingBg,
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
                                color: sel ? Colors.white : AppDesign.modPicking,
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
                        backgroundColor: AppDesign.modPicking,
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

    // Build in memory only; PickDetailPage buffers + persists on Save.
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;
    final row = PickListItem()
      ..companyCode = cc
      ..pickPreLabel = widget.pick.pickPreLabel
      // sequenceNo assigned by the buffer in PickDetailPage
      ..skuNo = inv.skuNo
      ..uom = selected.uom
      ..parentPreLabel = null
      ..locationCode = widget.pick.locationCode
      ..batch = widget.pick.batchCount ?? 1
      ..status = 'A'
      ..factor = selected.factor
      // Create-time typed value = planned Qty. Pick_Qty stays 0 until
      // the picker enters actuals on the detail page.
      ..qty = qty
      ..pickQty = 0
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
      color: AppDesign.modPickingBg,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          child: Icon(icon, size: 18, color: AppDesign.modPicking),
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
                        size: 18, color: AppDesign.modPicking),
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
                        const Icon(Icons.add_circle, size: 20, color: AppDesign.modPicking),
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
