import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/invoice.dart';
import '../models/inventory_item.dart';
import '../models/customer.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../services/auth_service.dart';
import '../services/base_transaction_sync_service.dart';
import '../services/customer_label.dart';
import '../services/location_service.dart';
import '../services/si_pack_balance_service.dart';
import '../theme/app_design.dart';

/// "From SI" — build a pack straight off a sales invoice.
///
/// This is not a view onto the pick flow. An invoice raised in the back office
/// has no pick behind it: in this database only 37 of 270,285 invoices carry
/// any pick reference at all, and none in recent history. Lines added here are
/// therefore parented to the invoice alone ([PackListItem.sourceSi]) with a
/// null parent pick, and their ceiling is the invoiced quantity rather than a
/// picked one.
/// Whether a sales invoice has been voided in the legacy desktop app.
///
/// Legacy marks a void as `Status='C'` with `Voided_By`/`Voided_Date` set —
/// 21 of 270,393 invoices on the live server. Everything else (A open,
/// F settled, P part-settled) is packable: those describe PAYMENT, not
/// whether the goods have shipped.
bool isInvoiceVoided(String? status) =>
    (status ?? '').trim().toUpperCase() == 'C';

class FromSiTab extends StatefulWidget {
  final PackList pack;
  final ScrollController scrollController;

  /// The pack's in-memory lines, including ones not yet saved. Counted against
  /// each invoice so re-opening this sheet reflects what is already staged.
  final List<PackListItem> existingItems;

  const FromSiTab({
    super.key,
    required this.pack,
    required this.scrollController,
    this.existingItems = const [],
  });

  @override
  State<FromSiTab> createState() => _FromSiTabState();
}

class _FromSiTabState extends State<FromSiTab> {
  /// Site being worked in — the pack's own if it has one, else the global
  /// selection. Without it the list offers invoices from every warehouse,
  /// which is how a pack ends up spanning two of them.
  String? _locationCode;

  List<Invoice> _invoices = [];
  Invoice? _selected;
  List<InvoiceItem> _lines = [];
  Map<int, String> _desc = {};

  final Map<String, String> _custNames = {};

  /// `si|sku|uom` -> qty already claimed by other packs (plus this pack's
  /// staged buffer).
  Map<String, double> _allocated = {};

  /// si -> (packed, invoiced), for the progress chip.
  final Map<String, (double, double)> _progress = {};

  final Set<int> _chosen = {}; // invoice item sequenceNo
  final Map<int, TextEditingController> _qtyCtrls = {};

  bool _loading = true;
  bool _loadingLines = false;

  /// A delta pull is running. Invoices are created elsewhere — the back
  /// office, or another device converting a pick — so this screen has no
  /// local event telling it something new exists.
  bool _syncing = false;

  final _searchCtrl = TextEditingController();
  final _lineSearchCtrl = TextEditingController();
  String _query = '';
  String _lineQuery = '';

  final int _sortBy = 0; // 0 = invoice date, 1 = customer, 2 = invoice no
  final bool _sortDesc = true;

  /// Packed-state filter. Fully-packed invoices are hidden by default: this
  /// list is a work queue, and at ~100 invoices a day anything already done is
  /// noise that pushes the real work off screen. "Full" brings them back when
  /// someone needs to look one up.
  final Set<int> _statusFilter = <int>{0, 1}; // 0 none, 1 partial, 2 full

  /// How far back to look. Bounds both the list and the per-invoice totals
  /// behind it — the difference between one screenful of work and every
  /// invoice inside the whole sync history window.
  int _days = 30;
  static const List<(String, int)> _dayOptions = [
    ('7d', 7),
    ('30d', 30),
    ('90d', 90),
    ('All', 0),
  ];

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
        () => setState(() => _query = _searchCtrl.text.trim().toLowerCase()));
    _lineSearchCtrl.addListener(() =>
        setState(() => _lineQuery = _lineSearchCtrl.text.trim().toLowerCase()));
    // Show the cached list immediately, then quietly go and find out what has
    // been invoiced since. Opening this tab IS the request for current data;
    // making someone back out and pull the hub down first is a worse answer
    // than a second of spinner on a list that is already usable.
    _load().then((_) => _refresh());
  }

  /// Pull invoices from the server, then re-read. Never throws: offline is
  /// normal on the floor, and the cached list is still the right thing to
  /// show.
  Future<void> _refresh() async {
    final cc = widget.pack.companyCode;
    if (cc == null || _syncing) return;
    setState(() => _syncing = true);
    try {
      await BaseTransactionSyncService().syncInvoices(companyCode: cc);
      if (mounted) await _load(showSpinner: false);
    } catch (e) {
      print('⚠️ FromSiTab: invoice refresh failed: $e');
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
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

  Future<void> _load({bool showSpinner = true}) async {
    final cc = widget.pack.companyCode;
    if (cc == null) {
      setState(() => _loading = false);
      return;
    }
    // A background refresh must not blank the list out from under someone
    // mid-scroll.
    if (showSpinner) setState(() => _loading = true);

    final docLoc = (widget.pack.locationCode ?? '').trim();
    _locationCode =
        docLoc.isNotEmpty ? docLoc : await LocationService().selectedCode();

    final cutoff =
        _days == 0 ? null : DateTime.now().subtract(Duration(days: _days));

    final rows =
        (await isar.invoices.filter().companyCodeEqualTo(cc).findAll())
            .where((i) => LocationService.inScope(i.locationCode, _locationCode))
            // Settlement status does NOT gate packing: A (open), F (settled)
            // and P (part-settled) all describe payment, not whether the goods
            // have left. Only a VOIDED invoice is excluded — there is nothing
            // to ship against it.
            .where((i) => !isInvoiceVoided(i.status))
            .where((i) =>
                cutoff == null ||
                (i.invoiceDate ?? i.addedDate ?? DateTime(1970))
                    .isAfter(cutoff))
            .toList();
    rows.sort((a, b) => (b.invoiceDate ?? b.addedDate ?? DateTime(0))
        .compareTo(a.invoiceDate ?? a.addedDate ?? DateTime(0)));

    if (!mounted) return;
    setState(() {
      _invoices = rows;
      _loading = false;
    });
    _loadMeta(cc, rows);
  }

  /// Customer names + packed progress. Runs after the list is on screen so the
  /// sheet doesn't sit blank while it counts.
  Future<void> _loadMeta(int cc, List<Invoice> rows) async {
    if (rows.isEmpty) return;
    final labels = rows.map((e) => e.invoicePreLabel).toList();

    // Code-only customer lookup: AR_Customer is partitioned by Company_Code
    // but invoices reference codes across those partitions, so scoping the
    // query by company hides most names behind a bare code.
    final codes = rows
        .map((e) => (e.customer ?? '').trim())
        .where((e) => e.isNotEmpty)
        .toSet()
        .toList();
    if (codes.isNotEmpty) {
      final custs = await isar.customers
          .filter()
          .anyOf(codes, (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final c in custs) {
        _custNames[c.code] = (c.name ?? '').trim();
      }
    }

    final items = await isar.invoiceItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels, (q, l) => q.invoicePreLabelEqualTo(l))
        .findAll();
    final byInvoice = <String, List<InvoiceItem>>{};
    for (final it in items) {
      (byInvoice[it.invoicePreLabel] ??= <InvoiceItem>[]).add(it);
    }

    final allocated = await SiPackBalanceService.allocatedByLine(
      companyCode: cc,
      siPreLabels: labels,
      excludePackPreLabel: widget.pack.packPreLabel,
    );
    SiPackBalanceService.addBuffer(allocated, widget.existingItems);

    if (!mounted) return;
    setState(() {
      _allocated = allocated;
      _progress.clear();
      for (final label in labels) {
        final invoiced =
            SiPackBalanceService.invoicedByLine(byInvoice[label] ?? const []);
        if (invoiced.isEmpty) continue;
        final p = SiPackBalanceService.progressFor(
          siPreLabel: label,
          invoiced: invoiced,
          allocated: allocated,
        );
        _progress[label] = (p.packed, p.invoiced);
      }
    });
  }

  /// 0 = nothing packed, 1 = partly, 2 = fully.
  int _statusOf(String label) {
    final pr = _progress[label];
    if (pr == null) return 0;
    final (done, total) = pr;
    if (done <= 0.0001) return 0;
    if (total > 0 && done + 0.0001 >= total) return 2;
    return 1;
  }

  String _custLabel(Invoice i) {
    final code = (i.customer ?? '').trim();
    if (code.isEmpty) return '';
    return CustomerLabel.format(code, _custNames[code]);
  }

  List<Invoice> get _visible {
    var out = _invoices;
    if (_statusFilter.isNotEmpty) {
      out = out
          .where((i) => _statusFilter.contains(_statusOf(i.invoicePreLabel)))
          .toList();
    }
    if (_query.isNotEmpty) {
      out = out.where((i) {
        final l = i.invoicePreLabel.toLowerCase();
        final c = _custLabel(i).toLowerCase();
        return l.contains(_query) || c.contains(_query);
      }).toList();
    }
    final sorted = [...out];
    sorted.sort((a, b) {
      int r;
      switch (_sortBy) {
        case 1:
          r = _custLabel(a).toLowerCase().compareTo(_custLabel(b).toLowerCase());
        case 2:
          r = a.invoicePreLabel.compareTo(b.invoicePreLabel);
        default:
          final ad = a.invoiceDate ?? a.addedDate;
          final bd = b.invoiceDate ?? b.addedDate;
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

  Future<void> _openInvoice(Invoice inv) async {
    final cc = widget.pack.companyCode;
    if (cc == null) return;
    setState(() {
      _selected = inv;
      _loadingLines = true;
      _chosen.clear();
      _qtyCtrls.clear();
    });

    final lines = (await isar.invoiceItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .invoicePreLabelEqualTo(inv.invoicePreLabel)
            .findAll())
        .where((e) => !SiPackBalanceService.isLineCancelled(e.status))
        .toList()
      ..sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));

    final skus = lines.map((e) => e.skuNo).toSet().toList();
    final desc = <int, String>{};
    if (skus.isNotEmpty) {
      final invItems = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
          .findAll();
      for (final i in invItems) {
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

  /// Invoiced qty for one line, in the line's own UOM. FOC is included — free
  /// goods still get boxed.
  ///
  /// Loose quantities (`Quantity_Loose` / `Foc_Loose`) are deliberately NOT
  /// folded in: they are counted in base units, and adding them to a figure
  /// denominated in cartons would silently inflate the line. Splitting a loose
  /// remainder onto its own pack line is phase 2, alongside the same work on
  /// the picking side.
  double _invoicedOf(InvoiceItem it) => (it.quantity ?? 0) + (it.foc ?? 0);

  /// What is left to pack on this line, after every other pack's claim and
  /// anything already staged in this one.
  double _remainingOf(InvoiceItem it) {
    final si = _selected?.invoicePreLabel ?? '';
    final key = '$si|${SiPackBalanceService.keyFor(it.skuNo, it.uom)}';
    final taken = _allocated[key] ?? 0;
    final left = _invoicedOf(it) - taken;
    return left <= 0 ? 0 : left;
  }

  bool _blocked(InvoiceItem it) => _remainingOf(it) <= 0.0001;

  List<InvoiceItem> get _visibleLines {
    if (_lineQuery.isEmpty) return _lines;
    return _lines.where((it) {
      final sku = it.skuNo.toString();
      final d = (_desc[it.skuNo] ?? '').toLowerCase();
      final plu = (it.pluNo ?? '').toLowerCase();
      return sku.contains(_lineQuery) ||
          d.contains(_lineQuery) ||
          plu.contains(_lineQuery);
    }).toList();
  }

  void _toggle(InvoiceItem it) {
    setState(() {
      if (_chosen.contains(it.sequenceNo)) {
        _chosen.remove(it.sequenceNo);
        _qtyCtrls.remove(it.sequenceNo)?.dispose();
      } else {
        _chosen.add(it.sequenceNo);
        // Default to everything still outstanding — packing an invoice in
        // full is the common case.
        _qtyCtrls[it.sequenceNo] =
            TextEditingController(text: _fmtQty(_remainingOf(it)));
      }
    });
  }

  void _toggleAll() {
    setState(() {
      final open = _visibleLines.where((e) => !_blocked(e)).toList();
      final allOn = open.every((e) => _chosen.contains(e.sequenceNo));
      if (allOn) {
        for (final it in open) {
          _chosen.remove(it.sequenceNo);
          _qtyCtrls.remove(it.sequenceNo)?.dispose();
        }
      } else {
        for (final it in open) {
          if (_chosen.contains(it.sequenceNo)) continue;
          _chosen.add(it.sequenceNo);
          _qtyCtrls[it.sequenceNo] =
              TextEditingController(text: _fmtQty(_remainingOf(it)));
        }
      }
    });
  }

  Future<void> _addSelected() async {
    final cc = widget.pack.companyCode;
    final inv = _selected;
    if (cc == null || inv == null || _chosen.isEmpty) return;
    final now = DateTime.now();
    final userId = AuthService().currentUser?.userId;

    final rows = <PackListItem>[];
    for (final it in _lines.where((e) => _chosen.contains(e.sequenceNo))) {
      final asked = double.tryParse(_qtyCtrls[it.sequenceNo]?.text ?? '') ?? 0;
      if (asked <= 0) continue;
      // Never stage more than the invoice has left. The server enforces this
      // too, but a rejected upload surfaces long after the packer has walked
      // away from the bay.
      final left = _remainingOf(it);
      final qty = asked > left ? left : asked;
      if (qty <= 0) continue;
      rows.add(PackListItem()
        ..companyCode = cc
        ..packPreLabel = widget.pack.packPreLabel
        ..skuNo = it.skuNo
        ..uom = it.uom
        // No parent pick: this invoice was not raised from one.
        ..parentPreLabel = null
        ..sourceSq = null
        ..sourceSi = inv.invoicePreLabel
        ..locationCode = (it.locationCode ?? inv.locationCode)?.trim() ??
            widget.pack.locationCode
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
      _selected == null ? _invoiceList() : _lineList();

  // ───────────────────────────── invoice list ──────────────────────────

  Widget _invoiceList() {
    return Column(children: [
      _searchField(_searchCtrl, 'Search invoice no or customer'),
      _filterBar(),
      Expanded(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _visible.isEmpty
                ? _empty()
                : ListView.separated(
                    controller: widget.scrollController,
                    padding: const EdgeInsets.fromLTRB(AppDesign.space3, 0,
                        AppDesign.space3, AppDesign.space3),
                    itemCount: _visible.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 5),
                    itemBuilder: (context, i) => _invoiceTile(_visible[i]),
                  ),
      ),
    ]);
  }

  Widget _empty() => Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDesign.space4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.receipt_long,
                  size: 34, color: AppDesign.inkSubtle),
              const SizedBox(height: 8),
              Text(
                _syncing
                    ? 'Checking for new invoices…'
                    : _invoices.isEmpty
                        ? 'No invoices for ${_locationCode ?? 'this site'} in '
                            '${_days == 0 ? 'the sync window' : 'the last $_days days'}'
                        : 'Nothing matches this filter',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppDesign.inkMuted),
              ),
              if (_invoices.isNotEmpty && !_statusFilter.contains(2)) ...[
                const SizedBox(height: 6),
                TextButton(
                  onPressed: () => setState(() => _statusFilter.add(2)),
                  child: const Text('Include fully packed',
                      style: TextStyle(fontSize: 11.5)),
                ),
              ],
            ],
          ),
        ),
      );

  Widget _filterBar() {
    Widget chip(String label, bool selected, VoidCallback onTap,
        {Color? colour}) {
      final c = colour ?? AppDesign.modPacking;
      return Padding(
        padding: const EdgeInsets.only(right: 6),
        child: Material(
          color: selected ? c : AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppDesign.radiusPill),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
                border: Border.all(
                    color: selected ? c : AppDesign.border,
                    width: selected ? 1.3 : 1),
              ),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                      color: selected ? Colors.white : c)),
            ),
          ),
        ),
      );
    }

    void toggleStatus(int v) => setState(() {
          if (!_statusFilter.remove(v)) _statusFilter.add(v);
        });

    return Container(
      width: double.infinity,
      color: AppDesign.surfaceAlt,
      padding:
          const EdgeInsets.fromLTRB(AppDesign.space3, 6, AppDesign.space3, 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (final (label, days) in _dayOptions)
            chip(label, _days == days, () {
              setState(() => _days = days);
              _load();
            }, colour: AppDesign.info),
          Container(
            width: 1,
            height: 18,
            color: AppDesign.border,
            margin: const EdgeInsets.symmetric(horizontal: 6),
          ),
          chip('Not packed', _statusFilter.contains(0), () => toggleStatus(0)),
          chip('Partial', _statusFilter.contains(1), () => toggleStatus(1),
              colour: AppDesign.warning),
          chip('Full', _statusFilter.contains(2), () => toggleStatus(2),
              colour: AppDesign.success),
          Container(
            width: 1,
            height: 18,
            color: AppDesign.border,
            margin: const EdgeInsets.symmetric(horizontal: 6),
          ),
          // Explicit refresh as well as the automatic one: an invoice raised
          // in the office thirty seconds ago is exactly the one someone is
          // standing here waiting for.
          if (_syncing)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: AppDesign.modPacking),
              ),
            )
          else
            InkWell(
              onTap: _refresh,
              borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.radiusPill),
                  border: Border.all(color: AppDesign.border),
                ),
                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.refresh, size: 13, color: AppDesign.modPacking),
                  SizedBox(width: 4),
                  Text('Refresh',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.modPacking)),
                ]),
              ),
            ),
        ]),
      ),
    );
  }

  Widget _statusChip(String label) {
    final pr = _progress[label];
    if (pr == null) return const SizedBox.shrink();
    final (done, total) = pr;
    final s = _statusOf(label);
    if (s == 0) return const SizedBox.shrink();
    final c = s == 2 ? AppDesign.success : AppDesign.warning;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppDesign.radiusPill),
      ),
      child: Text(
        s == 2 ? 'PACKED' : '${_fmtQty(done)}/${_fmtQty(total)}',
        style: TextStyle(fontSize: 8.5, fontWeight: FontWeight.w900, color: c),
      ),
    );
  }

  Widget _invoiceTile(Invoice inv) {
    final cust = _custLabel(inv);
    final when = inv.invoiceDate ?? inv.addedDate;
    final packed = _statusOf(inv.invoicePreLabel) == 2;
    final entries = inv.totalInvoiceEntry ?? 0;
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: () => _openInvoice(inv),
        child: Opacity(
          opacity: packed ? 0.6 : 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              border: Border.all(color: AppDesign.border),
            ),
            child: Row(children: [
              const Icon(Icons.receipt_long,
                  size: 16, color: AppDesign.modPacking),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Text(inv.invoicePreLabel,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: AppDesign.ink),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      _statusChip(inv.invoicePreLabel),
                    ]),
                    if (cust.isNotEmpty)
                      Text(cust,
                          style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w600,
                              color: AppDesign.info),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    Text(
                      [
                        if (when != null) _fmtDate(when),
                        '$entries line${entries == 1 ? '' : 's'}',
                      ].join('  ·  '),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 18, color: AppDesign.inkSubtle),
            ]),
          ),
        ),
      ),
    );
  }

  // ────────────────────────────── line list ────────────────────────────

  Widget _lineList() {
    final inv = _selected!;
    final open = _visibleLines.where((e) => !_blocked(e)).toList();
    final allOn =
        open.isNotEmpty && open.every((e) => _chosen.contains(e.sequenceNo));
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(
            AppDesign.space2, AppDesign.space2, AppDesign.space3, 0),
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 18),
            visualDensity: VisualDensity.compact,
            onPressed: () => setState(() {
              _selected = null;
              _chosen.clear();
              _lineSearchCtrl.clear();
            }),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(inv.invoicePreLabel,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.ink)),
                if (_custLabel(inv).isNotEmpty)
                  Text(_custLabel(inv),
                      style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.info),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (open.isNotEmpty)
            TextButton(
              onPressed: _toggleAll,
              style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 8)),
              child: Text(allOn ? 'Clear' : 'All',
                  style: const TextStyle(
                      fontSize: 11.5, fontWeight: FontWeight.w700)),
            ),
        ]),
      ),
      _searchField(_lineSearchCtrl, 'Search description, SKU or PLU'),
      Expanded(
        child: _loadingLines
            ? const Center(child: CircularProgressIndicator())
            : _visibleLines.isEmpty
                ? const Center(
                    child: Text('No lines on this invoice',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.inkMuted)),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    padding: const EdgeInsets.fromLTRB(AppDesign.space3, 0,
                        AppDesign.space3, AppDesign.space3),
                    itemCount: _visibleLines.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 5),
                    itemBuilder: (context, i) => _lineTile(_visibleLines[i]),
                  ),
      ),
      SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              AppDesign.space3, 6, AppDesign.space3, AppDesign.space3),
          child: SizedBox(
            width: double.infinity,
            height: 44,
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

  Widget _lineTile(InvoiceItem it) {
    final blocked = _blocked(it);
    final selected = _chosen.contains(it.sequenceNo);
    final d = _desc[it.skuNo] ?? '';
    final remaining = _remainingOf(it);
    final invoiced = _invoicedOf(it);
    return Opacity(
      opacity: blocked ? 0.55 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: blocked
              ? AppDesign.bg
              : (selected ? AppDesign.modPackingBg : AppDesign.surface),
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
              color: selected ? AppDesign.modPacking : AppDesign.border),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(children: [
          Checkbox(
            value: selected,
            onChanged: blocked ? null : (_) => _toggle(it),
            activeColor: AppDesign.modPacking,
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Expanded(
                    child: Text(d.isNotEmpty ? d : 'SKU ${it.skuNo}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: blocked ? AppDesign.inkSubtle : AppDesign.ink,
                          decoration:
                              blocked ? TextDecoration.lineThrough : null,
                          decorationColor: AppDesign.inkSubtle,
                          decorationThickness: 2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  if (blocked) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppDesign.success.withOpacity(0.12),
                        borderRadius:
                            BorderRadius.circular(AppDesign.radiusPill),
                      ),
                      child: const Text('PACKED',
                          style: TextStyle(
                              fontSize: 8.5,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.4,
                              color: AppDesign.success)),
                    ),
                  ],
                ]),
                const SizedBox(height: 2),
                Text(
                  [
                    it.uom,
                    'SKU ${it.skuNo}',
                    if ((it.pluNo ?? '').trim().isNotEmpty) 'PLU ${it.pluNo}',
                    if ((it.foc ?? 0) > 0) 'FOC ${_fmtQty(it.foc ?? 0)}',
                    blocked
                        ? 'Fully packed'
                        : 'Remaining ${_fmtQty(remaining)}/${_fmtQty(invoiced)}',
                  ].where((e) => e.isNotEmpty).join('  ·  '),
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: blocked ? AppDesign.inkSubtle : AppDesign.inkMuted),
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
                controller: _qtyCtrls[it.sequenceNo],
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
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
            ),
          const SizedBox(width: 4),
        ]),
      ),
    );
  }

  static String _fmtQty(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

  /// "04 AUG 26"
  static String _fmtDate(DateTime d) {
    const m = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', //
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, "0")} ${m[d.month - 1]} $yy';
  }

  Widget _searchField(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDesign.space3, AppDesign.space2,
          AppDesign.space3, AppDesign.space2),
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
                child: Icon(Icons.clear, size: 14, color: AppDesign.inkSubtle),
              ),
            ),
          const SizedBox(width: 4),
        ]),
      ),
    );
  }
}
