import 'dart:async';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/inventory_item.dart';
import '../services/cart_service.dart';
import '../services/customer_service.dart';
import '../services/loose_uom_rule.dart';
import '../services/qty.dart';
import '../services/user_app_settings_service.dart';
import '../theme/app_design.dart';
import 'ui_kit.dart';

/// One line of a previous document, in the shape the cart needs it.
///
/// Invoices and quotations store the same line under different column names
/// (`Quantity` / `Quote_Quantity`, `Foc` / `Quote_Foc`, and so on). Both are
/// mapped to this once, at the call site, so everything below is written
/// against a single shape — re-ordering an invoice line and re-ordering a
/// quotation line are the same act and should not be two code paths.
class ReorderLine {
  final int skuNo;
  final String uom;
  final double qty;
  final double price;
  final double foc;
  final double quantityLoose;
  final double focLoose;
  final double? factor;
  final String? pluNo;
  final String? remark;

  /// Filled in from the local catalogue — neither document table stores it.
  final String description;

  const ReorderLine({
    required this.skuNo,
    required this.uom,
    required this.qty,
    required this.price,
    this.foc = 0,
    this.quantityLoose = 0,
    this.focLoose = 0,
    this.factor,
    this.pluNo,
    this.remark,
    this.description = '',
  });

  ReorderLine withDescription(String d) => ReorderLine(
        skuNo: skuNo,
        uom: uom,
        qty: qty,
        price: price,
        foc: foc,
        quantityLoose: quantityLoose,
        focLoose: focLoose,
        factor: factor,
        pluNo: pluNo,
        remark: remark,
        description: d,
      );

  bool get hasExtras => foc > 0 || quantityLoose > 0 || focLoose > 0;

  double get safeFactor => (factor ?? 1) > 0 ? (factor ?? 1) : 1;

  /// Nothing to order. A fully-cancelled line looks like this, and putting it
  /// in the cart would create a zero line the checkout must strip.
  bool get isEmpty => qty <= 0 && !hasExtras;
}

/// A previous invoice or quotation, with its lines re-orderable into the cart.
///
/// This is the one design for both. It replaced an invoice `AlertDialog` whose
/// only action was Close, and a 1,261-line quotation page whose "Add to cart"
/// was a stub — it cleared the selection and reported success without ever
/// writing a cart row. The quantity and price editing that page offered is
/// kept here, so nothing was lost in the consolidation; the difference is that
/// the button now does what it says.
///
/// Adds are persisted through [CartService], so they survive closing this
/// sheet, leaving the page and restarting the app. Re-adding a SKU and UOM
/// already in the cart accumulates onto that line instead of creating a
/// second one.
class ReorderDocumentSheet extends StatefulWidget {
  final String title;
  final String docNo;
  final String? subtitle;
  final int companyCode;

  /// `Alternate_Company` / `Alternate_Doc` from the document header — the
  /// group company that ISSUED the document, and its reference there.
  ///
  /// Not the bill-to customer, which is a separate column: verified on Miri
  /// company 1 (2026-08-20), the two are equal on 13 of 187,320 quotes, and
  /// the prelabel prefix follows the alternate company one-to-one — AR ->
  /// 000327 AUTO REGAL, YT -> 000326 YEON TAK COLDSTORAGE, YC -> 0344 YEON TAK
  /// CATERING, AA -> 000328 AYAM ASIA. Those four names are exactly the four
  /// rows of `PI_Company`.
  ///
  /// The stored value is an `[ACC].dbo.AR_Customer.Code` — the group's own
  /// companies are registered there as inter-company debtors. Procurement
  /// resolves the same column against `AP_Vendor`, correctly for its
  /// purchase-side documents; resolving a sales document that way yields a
  /// real company name that is the wrong one, since code `000326` is
  /// "YEON TAK COLDSTORAGE" in AR_Customer and "TOTARA SDN BHD" in AP_Vendor.
  final String? alternateCompany;
  final String? alternateDoc;

  /// Loaded lazily so the sheet can show its header and a spinner rather than
  /// making the operator wait on a blank screen for the item query.
  final Future<List<ReorderLine>> Function() loadLines;

  final Color accent;

  const ReorderDocumentSheet({
    Key? key,
    required this.title,
    required this.docNo,
    required this.companyCode,
    required this.loadLines,
    required this.accent,
    this.subtitle,
    this.alternateCompany,
    this.alternateDoc,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String docNo,
    String? subtitle,
    required int companyCode,
    required Future<List<ReorderLine>> Function() loadLines,
    required Color accent,
    String? alternateCompany,
    String? alternateDoc,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReorderDocumentSheet(
        title: title,
        docNo: docNo,
        subtitle: subtitle,
        companyCode: companyCode,
        loadLines: loadLines,
        accent: accent,
        alternateCompany: alternateCompany,
        alternateDoc: alternateDoc,
      ),
    );
  }

  @override
  State<ReorderDocumentSheet> createState() => _ReorderDocumentSheetState();
}

class _ReorderDocumentSheetState extends State<ReorderDocumentSheet> {
  final CartService _cart = CartService();

  List<ReorderLine>? _lines;
  String? _error;
  bool _adding = false;
  bool _canEditPrice = false;

  /// Resolved from [widget.alternateCompany]; empty until the lookup returns,
  /// and stays empty if the code matches nothing the device has cached.
  String _altCompanyName = '';

  /// Per-line editable state, by index into [_lines].
  ///
  /// All four quantity buckets are editable, under the same names they carry
  /// in the ordering sheet, the cart and the SI allocation screen. A re-order
  /// that could only change the charged quantity would force the operator to
  /// add the line and then go and fix the free goods in the cart.
  final Map<int, TextEditingController> _qtyCtrls = {};
  final Map<int, TextEditingController> _focCtrls = {};
  final Map<int, TextEditingController> _looseCtrls = {};
  final Map<int, TextEditingController> _focLooseCtrls = {};
  final Map<int, TextEditingController> _priceCtrls = {};
  final Set<int> _selected = {};

  /// Lines added during this visit, so a row that has been ordered says so.
  /// Keyed by sku + uom, because the same SKU in two units is two cart lines.
  final Set<String> _added = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final m in [
      _qtyCtrls,
      _focCtrls,
      _looseCtrls,
      _focLooseCtrls,
      _priceCtrls
    ]) {
      for (final c in m.values) {
        c.dispose();
      }
    }
    super.dispose();
  }

  /// Resolves `Alternate_Company` to a readable name, offline.
  ///
  /// The app's own customer cache is sourced from `[ACC].dbo.AR_Customer` —
  /// the very table this code points at — so no server round trip is needed
  /// and the header still fills in on a handheld with no signal.
  Future<void> _resolveAlternateCompany() async {
    final code = (widget.alternateCompany ?? '').trim();
    if (code.isEmpty) return;
    try {
      // The local read never touches the hub, but the service takes one.
      final customers = await CustomerService(signalRService)
          .getLocalCustomers(widget.companyCode);
      final match = customers.where((c) => c.code.trim() == code);
      final name = match.isEmpty ? '' : (match.first.name ?? '').trim();
      if (mounted && name.isNotEmpty) setState(() => _altCompanyName = name);
    } catch (_) {
      // The code alone is still useful; a lookup failure must not blank it.
    }
  }

  Future<void> _load() async {
    // Not awaited: the header can fill in its name a moment after the lines
    // appear, and a slow customer query should not hold up the re-order.
    unawaited(_resolveAlternateCompany());
    try {
      final canEdit = await UserAppSettingsService()
          .canChangePrice(companyCode: widget.companyCode);
      final lines = await widget.loadLines();
      final withNames = await _fillDescriptions(lines);
      if (!mounted) return;
      setState(() {
        _lines = withNames;
        _canEditPrice = canEdit;
        for (var i = 0; i < withNames.length; i++) {
          final l = withNames[i];
          _qtyCtrls[i] = TextEditingController(text: Qty.fmt(l.qty));
          _focCtrls[i] = TextEditingController(text: Qty.fmt(l.foc));
          _looseCtrls[i] =
              TextEditingController(text: Qty.fmt(l.quantityLoose));
          _focLooseCtrls[i] = TextEditingController(text: Qty.fmt(l.focLoose));
          _priceCtrls[i] =
              TextEditingController(text: l.price.toStringAsFixed(2));
          // Everything orderable starts selected: re-ordering a whole document
          // is the common case, and deselecting two lines beats ticking ten.
          if (!l.isEmpty) _selected.add(i);
        }
      });
    } catch (e) {
      if (mounted) setState(() => _error = '$e');
    }
  }

  /// Looks the product names up locally, in one query rather than per line.
  ///
  /// Neither document table stores a description, and a cart full of
  /// "SKU 1234" is unreadable. A missing catalogue row falls back to the SKU
  /// rather than blocking the re-order — the line is still orderable.
  Future<List<ReorderLine>> _fillDescriptions(List<ReorderLine> lines) async {
    if (lines.isEmpty) return lines;
    try {
      final skus = {for (final l in lines) l.skuNo}.toList();
      final rows = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(widget.companyCode)
          .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
          .findAll();
      final byS = {for (final r in rows) r.skuNo: r};
      return [
        for (final l in lines)
          l.withDescription((byS[l.skuNo]?.description ?? '').trim().isEmpty
              ? 'SKU ${l.skuNo}'
              : byS[l.skuNo]!.description!.trim())
      ];
    } catch (_) {
      return [for (final l in lines) l.withDescription('SKU ${l.skuNo}')];
    }
  }

  String _key(ReorderLine l) => '${l.skuNo}|${l.uom.toUpperCase()}';

  /// What the operator has typed, falling back to what the document said.
  double _qtyAt(int i) =>
      Qty.tryParse(_qtyCtrls[i]?.text ?? '') ?? _lines![i].qty;

  double _focAt(int i) =>
      Qty.tryParse(_focCtrls[i]?.text ?? '') ?? _lines![i].foc;

  /// Basic quantities read as zero when the chosen UOM has no basic split, so
  /// a value typed against a pack UOM cannot survive into a line where it
  /// would mean something else.
  double _looseAt(int i) => _showBasic(i)
      ? (Qty.tryParse(_looseCtrls[i]?.text ?? '') ?? _lines![i].quantityLoose)
      : 0;

  double _focLooseAt(int i) => _showBasic(i)
      ? (Qty.tryParse(_focLooseCtrls[i]?.text ?? '') ?? _lines![i].focLoose)
      : 0;

  double _priceAt(int i) =>
      double.tryParse((_priceCtrls[i]?.text ?? '').trim()) ?? _lines![i].price;

  /// Whether basic (base-unit) quantities mean anything on this line.
  ///
  /// The same [LooseUomRule] the ordering sheet and the cart use: only a UOM
  /// holding more than one base unit has a "beyond whole packs" to speak of.
  /// A line that already carries basic quantities keeps its fields regardless,
  /// so re-ordering can never silently drop what the document recorded.
  bool _showBasic(int i) {
    final l = _lines![i];
    return LooseUomRule.applies(
      uom: l.uom,
      factor: l.factor,
      existingLoose: l.quantityLoose,
      existingFocLoose: l.focLoose,
    );
  }

  Future<void> _addOne(int i) async {
    final l = _lines![i];
    final qty = _qtyAt(i);
    final foc = _focAt(i);
    final loose = _looseAt(i);
    final focLoose = _focLooseAt(i);
    // A line edited down to nothing is a deselection, not an order.
    if (qty <= 0 && foc <= 0 && loose <= 0 && focLoose <= 0) return;
    await _cart.addToCart(
      companyCode: widget.companyCode,
      skuNo: l.skuNo,
      pluNo: l.pluNo,
      description: l.description,
      uom: l.uom,
      // The document's price is what was actually charged, so it is used for
      // both — deriving a net price by dividing out a tax rate this line may
      // never have carried would quietly change the number.
      unitPrice: _priceAt(i),
      gstPrice: _priceAt(i),
      factor: l.safeFactor,
      quantity: qty,
      foc: foc,
      quantityLoose: loose,
      focLoose: focLoose,
      remarks: 'Re-order ${widget.docNo}',
    );
    if (mounted) setState(() => _added.add(_key(l)));
  }

  Future<void> _addSelected() async {
    final lines = _lines;
    if (lines == null || _adding) return;
    final targets = _selected.toList()..sort();
    if (targets.isEmpty) return;

    setState(() => _adding = true);
    var added = 0;
    try {
      for (final i in targets) {
        await _addOne(i);
        added++;
      }
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added $added line(s) to the cart')),
      );
    } catch (e) {
      if (mounted) {
        setState(() => _adding = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Stopped after $added line(s): $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.only(top: 10, bottom: 4),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppDesign.borderStrong,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
            ),
            _header(),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(child: _body(controller)),
            if (_lines != null && _lines!.any((l) => !l.isEmpty)) _footer(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final lines = _lines;
    final orderable = lines?.where((l) => !l.isEmpty).length ?? 0;
    final allOn = lines != null && _selected.length == orderable;
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 6, 6, 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.title,
                    style: const TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.6,
                        color: AppDesign.inkSubtle)),
                Text(widget.docNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                        color: widget.accent)),
                if ((widget.subtitle ?? '').isNotEmpty)
                  Text(widget.subtitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted)),
                _altCompanyRow(),
              ],
            ),
          ),
          if (orderable > 0)
            TextButton(
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: widget.accent,
              ),
              onPressed: () => setState(() {
                if (allOn) {
                  _selected.clear();
                } else {
                  for (var i = 0; i < lines!.length; i++) {
                    if (!lines[i].isEmpty) _selected.add(i);
                  }
                }
              }),
              child: Text(allOn ? 'None' : 'All',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800)),
            ),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.close, size: 20, color: AppDesign.inkMuted),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  /// The billing entity line.
  ///
  /// Shows the name once resolved and the code always — the code is what is
  /// stored and what anyone checking against the desktop app will search on,
  /// and it is the only thing available when the customer cache has not synced.
  Widget _altCompanyRow() {
    final code = (widget.alternateCompany ?? '').trim();
    final doc = (widget.alternateDoc ?? '').trim();
    if (code.isEmpty && doc.isEmpty) return const SizedBox.shrink();

    final label = _altCompanyName.isEmpty
        ? code
        : (code.isEmpty ? _altCompanyName : '$_altCompanyName  ($code)');

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: AppDesign.modPackingBg,
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            ),
            child: const Text('ISSUED BY',
                style: TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                    color: AppDesign.modPacking)),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              [
                if (label.isNotEmpty) label,
                if (doc.isNotEmpty) 'Ref $doc',
              ].join('   ·   '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.ink),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(ScrollController controller) {
    if (_error != null) {
      return UiEmptyState(
        icon: Icons.error_outline,
        title: 'Could not load the lines',
        message: _error!,
        accent: AppDesign.danger,
      );
    }
    if (_lines == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_lines!.isEmpty) {
      return const UiEmptyState(
        icon: Icons.inbox_outlined,
        title: 'No lines on this document',
        message: 'Nothing here can be re-ordered.',
      );
    }
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      itemCount: _lines!.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (context, i) => _lineCard(i),
    );
  }

  Widget _lineCard(int i) {
    final l = _lines![i];
    final selected = _selected.contains(i);
    final inCart = _added.contains(_key(l));

    return Container(
      decoration: AppDesign.card(),
      padding: const EdgeInsets.fromLTRB(6, 8, 10, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 34,
            child: l.isEmpty
                ? const SizedBox.shrink()
                : Checkbox(
                    value: selected,
                    activeColor: widget.accent,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (v) => setState(() {
                      if (v == true) {
                        _selected.add(i);
                      } else {
                        _selected.remove(i);
                      }
                    }),
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        color: AppDesign.ink)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _chip('${l.skuNo}', AppDesign.bg, AppDesign.inkMuted),
                    const SizedBox(width: 5),
                    _chip(l.uom.isEmpty ? '—' : l.uom, AppDesign.modPickingBg,
                        AppDesign.info),
                    if (l.isEmpty) ...[
                      const SizedBox(width: 5),
                      _chip('nothing to order', AppDesign.bg,
                          AppDesign.inkSubtle),
                    ],
                  ],
                ),
                if (!l.isEmpty) ...[
                  const SizedBox(height: 6),
                  // Editable before ordering. The quantities that suited last
                  // month are a starting point, not the order — this is what
                  // the old quotation page offered and it is worth keeping.
                  Row(
                    children: [
                      _miniField(
                        label: 'Qty',
                        ctrl: _qtyCtrls[i]!,
                        accent: widget.accent,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(width: 6),
                      _miniField(
                        label: 'FOC',
                        ctrl: _focCtrls[i]!,
                        accent: AppDesign.warning,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(width: 6),
                      _miniField(
                        label: _canEditPrice ? 'Price' : 'Price 🔒',
                        ctrl: _priceCtrls[i]!,
                        accent: AppDesign.accentInk,
                        enabled: _canEditPrice,
                        onChanged: (_) => setState(() {}),
                      ),
                    ],
                  ),
                  // Basic quantities only where they mean something — a UOM
                  // that is already the base unit has no partial pack.
                  if (_showBasic(i)) ...[
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        _miniField(
                          label: 'Qty Basic',
                          ctrl: _looseCtrls[i]!,
                          accent: widget.accent,
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(width: 6),
                        _miniField(
                          label: 'FOC Basic',
                          ctrl: _focLooseCtrls[i]!,
                          accent: AppDesign.warning,
                          onChanged: (_) => setState(() {}),
                        ),
                        // Keeps the pair the same width as the row above, so
                        // the columns line up instead of stretching.
                        const Spacer(),
                      ],
                    ),
                  ],
                ],
                const SizedBox(height: 5),
                Text(
                  _summaryLine(l, i),
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted),
                ),
              ],
            ),
          ),
          if (!l.isEmpty) ...[
            const SizedBox(width: 6),
            _LineAddButton(
              accent: widget.accent,
              alreadyAdded: inCart,
              onPressed: () => _addOne(i),
            ),
          ],
        ],
      ),
    );
  }

  /// The line total at the current numbers, plus whatever the document carried
  /// that is not editable here.
  ///
  /// Extras are named rather than folded into the quantity, because the button
  /// beside them orders exactly this and the operator is agreeing to it.
  String _summaryLine(ReorderLine l, int i) {
    if (l.isEmpty) return 'This line was cancelled or fully returned.';
    final free = _focAt(i) * l.safeFactor + _focLooseAt(i);
    final base = (_qtyAt(i) + _focAt(i)) * l.safeFactor +
        _looseAt(i) +
        _focLooseAt(i);
    return 'RM ${_lineTotal(i).toStringAsFixed(2)}'
        '   ·   ${Qty.fmt(base)} base units'
        '${free > 0 ? '   ·   ${Qty.fmt(free)} free' : ''}'
        '${l.safeFactor != 1 ? '   ·   ×${Qty.fmt(l.safeFactor)}' : ''}';
  }

  /// Charged value at the current numbers: packs at the UOM price, basic
  /// quantities at the base-unit price, FOC at nothing. The same rule the
  /// cart, the ordering sheet and the quotation all apply.
  double _lineTotal(int i) {
    final l = _lines![i];
    final price = _priceAt(i);
    return price * _qtyAt(i) + (price / l.safeFactor) * _looseAt(i);
  }

  Widget _miniField({
    required String label,
    required TextEditingController ctrl,
    required Color accent,
    required ValueChanged<String> onChanged,
    bool enabled = true,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 8.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.3,
                  color: enabled ? accent : AppDesign.inkSubtle)),
          const SizedBox(height: 2),
          SizedBox(
            height: 30,
            child: TextField(
              controller: ctrl,
              enabled: enabled,
              onChanged: onChanged,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                isDense: true,
                filled: !enabled,
                fillColor: AppDesign.bg,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    borderSide: const BorderSide(color: AppDesign.border)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    borderSide: const BorderSide(color: AppDesign.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    borderSide: BorderSide(color: accent, width: 1.4)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
            color: bg, borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
        child: Text(text,
            style:
                TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: fg)),
      );

  Widget _footer() {
    final n = _selected.length;
    // Total at the edited numbers, so the button agrees with the rows above it.
    var total = 0.0;
    for (final i in _selected) {
      total += _lineTotal(i);
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    n == 0 ? 'Nothing selected' : '$n line(s) selected',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppDesign.inkMuted),
                  ),
                ),
                Text('RM ${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                        color: AppDesign.accentInk)),
              ],
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (_adding || n == 0) ? null : _addSelected,
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.accent,
                  disabledBackgroundColor: AppDesign.borderStrong,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDesign.radius)),
                ),
                icon: _adding
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.add_shopping_cart, size: 17),
                label: Text(
                  _adding ? 'Adding…' : 'Add to cart',
                  style: const TextStyle(
                      fontSize: 13.5, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Per-line add, with its own busy state so a slow write cannot be tapped
/// twice into two cart lines.
class _LineAddButton extends StatefulWidget {
  final Color accent;
  final bool alreadyAdded;
  final Future<void> Function() onPressed;

  const _LineAddButton({
    required this.accent,
    required this.alreadyAdded,
    required this.onPressed,
  });

  @override
  State<_LineAddButton> createState() => _LineAddButtonState();
}

class _LineAddButtonState extends State<_LineAddButton> {
  bool _busy = false;

  Future<void> _run() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await widget.onPressed();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not add: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // "Added" is a note, not a lock: a line can be ordered twice, and the
    // second tap accumulates onto the same cart line.
    final added = widget.alreadyAdded;
    final colour = added ? AppDesign.success : widget.accent;
    return SizedBox(
      height: 32,
      child: OutlinedButton(
        onPressed: _busy ? null : _run,
        style: OutlinedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          foregroundColor: colour,
          side: BorderSide(color: colour.withOpacity(added ? 0.9 : 0.5)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
        ),
        child: _busy
            ? const SizedBox(
                width: 13,
                height: 13,
                child: CircularProgressIndicator(strokeWidth: 2))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(added ? Icons.check : Icons.add_shopping_cart, size: 14),
                  const SizedBox(width: 4),
                  Text(added ? 'Added' : 'Add',
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w800)),
                ],
              ),
      ),
    );
  }
}
