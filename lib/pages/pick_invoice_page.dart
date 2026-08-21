import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../models/pick_list.dart';
import '../services/auth_service.dart';
import '../services/customer_label.dart';
import '../services/invoice_conversion_service.dart';
import '../theme/app_design.dart';

/// Turns a pick into Sales Invoices: one per source SQ, plus one for the
/// no-SQ lines.
///
/// The screen exists for one reason: the pick knows a single picked quantity
/// per line, but an invoice line needs it split across Quantity /
/// Quantity_Loose / FOC / FOC_Loose. A full pick pre-fills itself from the
/// SQ's own split and needs no input; a partial pick makes the operator
/// decide, because no rule can know whether the shorted amount should come
/// out of the charged quantity or the free goods.
///
/// Nothing is written until every line balances exactly (in base units) and
/// the server's dry run has been shown and confirmed.
class PickInvoicePage extends StatefulWidget {
  final PickList pick;
  const PickInvoicePage({super.key, required this.pick});

  @override
  State<PickInvoicePage> createState() => _PickInvoicePageState();
}

class _PickInvoicePageState extends State<PickInvoicePage> {
  final _svc = InvoiceConversionService();

  bool _loading = true;
  bool _working = false;
  List<InvoiceAllocation> _allocs = [];
  final Map<String, String> _sqCustomer = {}; // sq -> customer code
  final Map<String, String> _custName = {}; // code -> name
  final Map<int, String> _descriptions = {};

  /// Customer for the no-SQ invoice — the one thing only the operator knows.
  String? _noSqCustomerCode;

  /// 4 controllers per line, keyed by allocation identity.
  final Map<String, List<TextEditingController>> _ctrls = {};

  String _key(InvoiceAllocation a) => '${a.sq}|${a.skuNo}|${a.uom}';

  /// Open batches for this pick's location, and the operator's choice.
  ///
  /// Which batch an invoice is filed under is a decision only the operator can
  /// make — the names carry a date and a product category, and this database
  /// has up to nine open at once for one location. The app used to send none
  /// and the server took the highest-numbered open batch, which filed
  /// invoices under an unrelated one.
  List<InvoiceBatch> _batches = [];
  int? _batchNo;
  bool _batchesLoading = true;
  String? _batchError;

  bool get _hasNoSq => _allocs.any((a) => a.sq.isEmpty);
  bool get _allBalanced => _allocs.every((a) => a.balanced);
  bool get _ready =>
      _allocs.isNotEmpty &&
      _allBalanced &&
      (!_hasNoSq || (_noSqCustomerCode ?? '').isNotEmpty) &&
      _batchNo != null;

  @override
  void initState() {
    super.initState();
    _load();
    _loadBatches();
  }

  Future<void> _loadBatches() async {
    final cc = widget.pick.companyCode;
    final loc = (widget.pick.locationCode ?? '').trim();
    if (cc == null || loc.isEmpty) {
      setState(() {
        _batchesLoading = false;
        _batchError = 'This pick has no location, so its invoice batch '
            'cannot be determined.';
      });
      return;
    }
    try {
      final rows = await _svc.openBatches(companyCode: cc, locationCode: loc);
      if (!mounted) return;
      setState(() {
        _batches = rows;
        _batchesLoading = false;
        // Preselect ONLY when there is no choice to make. With several open,
        // a default is just a guess wearing a confident face — and the wrong
        // guess is invisible until accounts try to post the batch.
        _batchNo = rows.length == 1 ? rows.first.batchNo : null;
        _batchError = rows.isEmpty
            ? 'No open invoice batch for $loc — open one in the legacy app first.'
            : null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _batchesLoading = false;
        _batchError = 'Could not load invoice batches: $e';
      });
    }
  }

  Future<void> _pickBatch() async {
    if (_batches.isEmpty) return;
    final chosen = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Invoice batch',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('The batch these invoices are filed under.',
                  style: TextStyle(fontSize: 11.5, color: AppDesign.inkMuted)),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _batches.length,
              itemBuilder: (c, i) {
                final b = _batches[i];
                final on = b.batchNo == _batchNo;
                return ListTile(
                  dense: true,
                  leading: Icon(
                      on ? Icons.radio_button_checked : Icons.radio_button_off,
                      size: 18,
                      color: on ? AppDesign.modPicking : AppDesign.inkSubtle),
                  title: Text(b.label,
                      style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: on ? FontWeight.w800 : FontWeight.w600)),
                  subtitle: Text('Batch ${b.batchNo}',
                      style: const TextStyle(fontSize: 11)),
                  onTap: () => Navigator.pop(c, b.batchNo),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ]),
      ),
    );
    if (chosen != null && mounted) setState(() => _batchNo = chosen);
  }

  Widget _batchBar() {
    final err = _batchError;
    final chosen =
        _batches.where((b) => b.batchNo == _batchNo).firstOrNull;
    return Container(
      width: double.infinity,
      color: AppDesign.surfaceAlt,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(children: [
        Icon(Icons.inventory_2_outlined,
            size: 16,
            color: err != null ? AppDesign.danger : AppDesign.modPicking),
        const SizedBox(width: 8),
        Expanded(
          child: _batchesLoading
              ? const Text('Loading invoice batches…',
                  style: TextStyle(fontSize: 12, color: AppDesign.inkMuted))
              : err != null
                  ? Text(err,
                      style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.danger))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Invoice batch',
                            style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.4,
                                color: AppDesign.inkMuted)),
                        Text(chosen?.label ?? 'Tap to choose',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: chosen == null
                                    ? AppDesign.warning
                                    : AppDesign.ink)),
                      ],
                    ),
        ),
        if (!_batchesLoading && err == null)
          TextButton(
            onPressed: _pickBatch,
            child: Text(chosen == null ? 'Choose' : 'Change',
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
          ),
      ]),
    );
  }

  @override
  void dispose() {
    for (final list in _ctrls.values) {
      for (final c in list) {
        c.dispose();
      }
    }
    super.dispose();
  }

  Future<void> _load() async {
    final cc = widget.pick.companyCode;
    final allocs = await _svc.buildAllocations(widget.pick);

    if (cc != null) {
      final sqs =
          allocs.map((a) => a.sq).where((s) => s.isNotEmpty).toSet().toList();
      _sqCustomer.addAll(await _svc.sqCustomers(cc, sqs));

      // Names by CODE ALONE — quote references cross the company partitions
      // of AR_Customer (the 11/G02 lesson).
      final codes = _sqCustomer.values.where((c) => c.isNotEmpty).toSet();
      if (codes.isNotEmpty) {
        final rows = await isar.customers
            .filter()
            .anyOf(codes.toList(), (q, c) => q.codeEqualTo(c))
            .findAll();
        for (final c in rows) {
          final n = (c.name ?? '').trim();
          if (n.isNotEmpty) _custName.putIfAbsent(c.code, () => n);
        }
      }

      final skus = allocs.map((a) => a.skuNo).toSet().toList();
      if (skus.isNotEmpty) {
        final inv = await isar.inventoryItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
            .findAll();
        for (final i in inv) {
          _descriptions[i.skuNo] = i.description ?? '';
        }
      }
    }

    for (final a in allocs) {
      _ctrls[_key(a)] = [
        TextEditingController(text: _fmt(a.qty)),
        TextEditingController(text: _fmt(a.qtyLoose)),
        TextEditingController(text: _fmt(a.foc)),
        TextEditingController(text: _fmt(a.focLoose)),
      ];
    }

    if (!mounted) return;
    setState(() {
      _allocs = allocs;
      _loading = false;
    });
  }

  static String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toString();

  void _applyField(InvoiceAllocation a, int slot, String text) {
    final v = double.tryParse(text) ?? 0;
    setState(() {
      switch (slot) {
        case 0:
          a.qty = v;
        case 1:
          a.qtyLoose = v;
        case 2:
          a.foc = v;
        case 3:
          a.focLoose = v;
      }
    });
  }

  // ─── Convert ─────────────────────────────────────────────────────────────

  Future<void> _convert() async {
    if (!_ready || _working) return;
    setState(() => _working = true);
    final token = InvoiceConversionService.newToken();
    try {
      final userId = AuthService().currentUser?.userId ?? 1;

      // 1. Dry run: the server prices and groups; the operator confirms what
      //    will actually be written before anything is.
      final plan = await _svc.convert(
        pick: widget.pick,
        allocations: _allocs,
        userId: userId,
        noSqCustomer: _noSqCustomerCode,
        uploadToken: token,
        dryRun: true,
        batchNo: _batchNo,
      );
      if (!mounted) return;

      final invoices = (plan['invoices'] as List?) ?? const [];
      final go = await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text('Create ${invoices.length} invoice(s)?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final inv in invoices)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    '${inv['sq'] ?? 'No SQ'} — '
                    '${CustomerLabel.format(inv['customer']?.toString(), _custName[inv['customer']])}\n'
                    '${inv['lines']} line(s) · RM ${(inv['netAmount'] as num).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 12.5, height: 1.35),
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                'Batch: ${_batches.where((b) => b.batchNo == _batchNo).firstOrNull?.label ?? _batchNo}',
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              const Text(
                'This writes the invoices to the server and commits stock. '
                'It cannot be undone from this device.',
                style: TextStyle(fontSize: 11.5, color: AppDesign.warning),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c, false),
                child: const Text('Back')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.modPicking,
                  foregroundColor: Colors.white),
              onPressed: () => Navigator.pop(c, true),
              child: const Text('Create'),
            ),
          ],
        ),
      );
      if (go != true || !mounted) return;

      // 2. The real thing — same token, so a retry after a dropped
      //    connection returns the original result instead of double-writing.
      final result = await _svc.convert(
        pick: widget.pick,
        allocations: _allocs,
        userId: userId,
        noSqCustomer: _noSqCustomerCode,
        uploadToken: token,
        dryRun: false,
        batchNo: _batchNo,
      );
      if (!mounted) return;

      final created = (result['invoices'] as List?) ?? const [];
      final pickInfo = result['pick'] as Map<String, dynamic>?;

      // The server closes the pick as part of the same transaction, trimming
      // unpicked quantities back to the SQ. Mirror that locally so the app
      // does not show an open pick the server considers finished.
      if (pickInfo != null && pickInfo['status'] == 'C') {
        widget.pick.status = 'C';
        widget.pick.isSynced = true;
        try {
          await isar.writeTxn(() async {
            await isar.pickLists.put(widget.pick);
          });
        } catch (_) {
          // Cosmetic only — the next sync brings the authoritative state.
        }
      }
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (c) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          icon: const Icon(Icons.check_circle,
              color: AppDesign.success, size: 40),
          title: const Text('Invoices created'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final inv in created)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '${inv['invoicePreLabel']}   (${inv['sq'] ?? 'No SQ'})',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                (pickInfo?['shortedLines'] ?? 0) == 0
                    ? 'Pick completed.'
                    : 'Pick completed. ${pickInfo!['shortedLines']} short '
                        'line(s) released back to the quotation.',
                style: const TextStyle(
                    fontSize: 11.5, height: 1.3, color: AppDesign.inkMuted),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.success,
                  foregroundColor: Colors.white),
              onPressed: () => Navigator.pop(c),
              child: const Text('Done'),
            ),
          ],
        ),
      );
      if (mounted) Navigator.pop(context, true);
    } on InvoiceConversionException catch (e) {
      if (!mounted) return;
      final problems = (e.details['problems'] as List?)?.join('\n') ?? '';
      showDialog<void>(
        context: context,
        builder: (c) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Cannot convert'),
          content: Text(
              problems.isEmpty ? e.message : '${e.message}\n\n$problems',
              style: const TextStyle(fontSize: 12.5)),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(c), child: const Text('OK')),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppDesign.danger,
        content: Text('Conversion failed: $e'),
      ));
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  // ─── Customer picker for the no-SQ invoice ───────────────────────────────

  Future<void> _pickNoSqCustomer() async {
    final picked = await showModalBottomSheet<Customer>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _CustomerSearchSheet(),
    );
    if (picked != null && mounted) {
      setState(() {
        _noSqCustomerCode = picked.code;
        final n = (picked.name ?? '').trim();
        if (n.isNotEmpty) _custName[picked.code] = n;
      });
    }
  }

  // ─── Build ───────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final groups = <String, List<InvoiceAllocation>>{};
    for (final a in _allocs) {
      groups.putIfAbsent(a.sq, () => []).add(a);
    }
    final order = groups.keys.where((s) => s.isNotEmpty).toList()..sort();
    if (groups.containsKey('')) order.add('');

    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create invoices',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.ink)),
            Text(widget.pick.pickPreLabel ?? '',
                style:
                    const TextStyle(fontSize: 11, color: AppDesign.inkMuted)),
          ],
        ),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _allocs.isEmpty
              ? const Center(
                  child: Text('Nothing picked yet — nothing to invoice',
                      style: AppDesign.bodyMuted))
              : Column(children: [
                  _batchBar(),
                  const Divider(height: 1, color: AppDesign.border),
                  Expanded(
                    child: ListView(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 120),
                  children: [
                    _explainer(),
                    const SizedBox(height: 10),
                    for (final sq in order) ...[
                      _groupHeader(sq, groups[sq]!),
                      for (final a in groups[sq]!) _lineCard(a),
                      const SizedBox(height: 12),
                    ],
                      ],
                    ),
                  ),
                ]),
      bottomNavigationBar: _loading || _allocs.isEmpty ? null : _bottomBar(),
    );
  }

  Widget _explainer() => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppDesign.modPickingBg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border:
              Border.all(color: AppDesign.modPicking.withOpacity(0.25)),
        ),
        child: const Text(
          'One invoice per SQ, plus one for lines without an SQ. Split each '
          'picked amount into charged, loose and FOC — fully-picked lines are '
          'filled in from the SQ already.',
          style: TextStyle(
              fontSize: 11.5, height: 1.35, color: AppDesign.modPicking),
        ),
      );

  Widget _groupHeader(String sq, List<InvoiceAllocation> lines) {
    final isNoSq = sq.isEmpty;
    final code = isNoSq ? (_noSqCustomerCode ?? '') : (_sqCustomer[sq] ?? '');
    final label = isNoSq
        ? 'No SQ — separate invoice'
        : CustomerLabel.sqWithCustomer(sq, code, _custName[code]);

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppDesign.modPicking.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.modPicking.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Icon(isNoSq ? Icons.note_add_outlined : Icons.description_outlined,
              size: 14, color: AppDesign.modPicking),
          const SizedBox(width: 6),
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.modPicking),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          if (isNoSq)
            TextButton.icon(
              onPressed: _working ? null : _pickNoSqCustomer,
              icon: Icon(
                  code.isEmpty ? Icons.person_add_alt : Icons.person_outline,
                  size: 15),
              label: Text(
                code.isEmpty
                    ? 'Choose customer'
                    : CustomerLabel.format(code, _custName[code]),
                style: const TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w800),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              style: TextButton.styleFrom(
                foregroundColor:
                    code.isEmpty ? AppDesign.warning : AppDesign.modPicking,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(0, 30),
              ),
            ),
        ],
      ),
    );
  }

  Widget _lineCard(InvoiceAllocation a) {
    final desc = _descriptions[a.skuNo] ?? '';
    final ctrls = _ctrls[_key(a)]!;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.all(10),
      decoration: AppDesign.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  desc.isNotEmpty ? desc : 'SKU ${a.skuNo}',
                  style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.ink,
                      height: 1.2),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                  'picked ${_fmt(a.pickedQty)} ${a.uom}'
                  '${a.pickedLooseBase > 0 ? ' +${_fmt(a.pickedLooseBase)} loose' : ''}',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.modPicking)),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            'SKU ${a.skuNo} · ${a.uom}'
            '${a.factor != 1 ? ' × ${_fmt(a.factor)}' : ''}'
            '${a.prefilledFromQuote ? '  ·  from SQ' : ''}',
            style: const TextStyle(fontSize: 10, color: AppDesign.inkMuted),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _field('Qty', ctrls[0], (t) => _applyField(a, 0, t)),
              const SizedBox(width: 6),
              // Same names as the ordering sheet and the cart. An allocation
              // screen that renamed the buckets would make the operator match
              // them up by position instead of by label.
              _field('Qty Basic', ctrls[1], (t) => _applyField(a, 1, t)),
              const SizedBox(width: 6),
              _field('FOC', ctrls[2], (t) => _applyField(a, 2, t),
                  accent: AppDesign.warning),
              const SizedBox(width: 6),
              _field('FOC Basic', ctrls[3], (t) => _applyField(a, 3, t),
                  accent: AppDesign.warning),
            ],
          ),
          const SizedBox(height: 6),
          // The invariant, live. Base units so factor lines read honestly.
          a.balanced
              ? const Row(children: [
                  Icon(Icons.check_circle, size: 13, color: AppDesign.success),
                  SizedBox(width: 4),
                  Text('Fully allocated',
                      style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.success)),
                ])
              : Row(children: [
                  const Icon(Icons.error_outline,
                      size: 13, color: AppDesign.warning),
                  const SizedBox(width: 4),
                  Text(
                    a.remainingBase > 0
                        ? '${_fmt(a.remainingBase)} base unit(s) left to allocate'
                        : '${_fmt(-a.remainingBase)} base unit(s) over — more than was picked',
                    style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: AppDesign.warning),
                  ),
                ]),
        ],
      ),
    );
  }

  Widget _field(String label, TextEditingController ctrl,
      ValueChanged<String> onChanged,
      {Color accent = AppDesign.modPicking}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                  color: accent)),
          const SizedBox(height: 2),
          TextField(
            controller: ctrl,
            onChanged: onChanged,
            enabled: !_working,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  borderSide: const BorderSide(color: AppDesign.border)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  borderSide: BorderSide(color: accent, width: 1.5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    final unbalanced = _allocs.where((a) => !a.balanced).length;
    final needsCustomer = _hasNoSq && (_noSqCustomerCode ?? '').isEmpty;
    final String hint;
    if (unbalanced > 0) {
      hint = '$unbalanced line(s) not fully allocated';
    } else if (needsCustomer) {
      hint = 'Choose a customer for the no-SQ invoice';
    } else if (_batchNo == null) {
      hint = _batchError ?? 'Choose the invoice batch';
    } else {
      final n =
          _allocs.map((a) => a.sq).toSet().length;
      hint = 'Ready — $n invoice(s) will be created';
    }

    return Container(
      padding: EdgeInsets.fromLTRB(
          12, 10, 12, 10 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(hint,
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: _ready ? AppDesign.success : AppDesign.warning)),
          ),
          ElevatedButton.icon(
            onPressed: _ready && !_working ? _convert : null,
            icon: _working
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.receipt_long, size: 17),
            label: Text(_working ? 'Working…' : 'Create invoices',
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w800)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppDesign.modPicking,
              foregroundColor: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radius)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Searchable customer picker for the no-SQ invoice. Searches ALL locally
/// synced customers by code or name — deliberately not scoped to the selected
/// company, since customer records cross company partitions here.
class _CustomerSearchSheet extends StatefulWidget {
  const _CustomerSearchSheet();

  @override
  State<_CustomerSearchSheet> createState() => _CustomerSearchSheetState();
}

class _CustomerSearchSheetState extends State<_CustomerSearchSheet> {
  final _ctrl = TextEditingController();
  List<Customer> _results = [];

  @override
  void initState() {
    super.initState();
    _search('');
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _search(String q) async {
    final t = q.trim();
    List<Customer> rows;
    if (t.isEmpty) {
      rows = await isar.customers.where().sortByCode().limit(50).findAll();
    } else {
      rows = await isar.customers
          .filter()
          .codeContains(t, caseSensitive: false)
          .or()
          .nameContains(t, caseSensitive: false)
          .sortByCode()
          .limit(50)
          .findAll();
    }
    if (mounted) setState(() => _results = rows);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
                color: AppDesign.border,
                borderRadius: BorderRadius.circular(2)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _ctrl,
              autofocus: true,
              onChanged: _search,
              decoration: InputDecoration(
                hintText: 'Search customer code or name',
                prefixIcon: const Icon(Icons.search, size: 18),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _results.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: AppDesign.divider),
              itemBuilder: (context, i) {
                final c = _results[i];
                return ListTile(
                  dense: true,
                  title: Text(CustomerLabel.format(c.code, c.name),
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700)),
                  onTap: () => Navigator.pop(context, c),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
