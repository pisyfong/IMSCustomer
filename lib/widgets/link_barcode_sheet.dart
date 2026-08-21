import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/in_stock_uom.dart';
import '../services/plu_service.dart';
import '../theme/app_design.dart';

/// One item a scanned barcode could belong to.
class BarcodeCandidate {
  final int skuNo;
  final String description;

  /// Shown as context — the UOM this item appears as on the document being
  /// worked. NOT the answer: a carton barcode is routinely scanned against a
  /// line picked in kilos.
  final String? docUom;

  const BarcodeCandidate({
    required this.skuNo,
    required this.description,
    this.docUom,
  });
}

/// Attach an unrecognised barcode to an item, in two steps: which item, then
/// which unit.
///
/// The unit step is not a formality. Over 3,000 of this customer's ~7,000 SKUs
/// carry more than one UOM, and a barcode is specific to ONE of them — a case
/// code and a loose-unit code are different barcodes for the same item. An
/// earlier version inferred the UOM from the document line, which quietly got
/// it wrong whenever someone scanned a carton against a line picked in kilos.
///
/// Each unit shows its factor, because "CTN" alone doesn't tell a picker
/// whether this carton is 10 or 24.
class LinkBarcodeSheet extends StatefulWidget {
  final String code;
  final int companyCode;
  final List<BarcodeCandidate> candidates;

  /// Who is creating the unit, for the audit columns on In_Stock_Uom.
  final int userId;

  /// The document being worked — only for the error message if a queued unit
  /// turns out to clash with the server's factor.
  final String? sourceDoc;

  const LinkBarcodeSheet({
    super.key,
    required this.code,
    required this.companyCode,
    required this.candidates,
    required this.userId,
    this.sourceDoc,
  });

  /// Returns (skuNo, uom), or null if dismissed.
  static Future<(int, String)?> show(
    BuildContext context, {
    required String code,
    required int companyCode,
    required List<BarcodeCandidate> candidates,
    required int userId,
    String? sourceDoc,
  }) {
    return showModalBottomSheet<(int, String)>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LinkBarcodeSheet(
        code: code,
        companyCode: companyCode,
        candidates: candidates,
        userId: userId,
        sourceDoc: sourceDoc,
      ),
    );
  }

  @override
  State<LinkBarcodeSheet> createState() => _LinkBarcodeSheetState();
}

class _LinkBarcodeSheetState extends State<LinkBarcodeSheet> {
  BarcodeCandidate? _item;

  /// Units this SKU already has, with their factors.
  List<InStockUom> _uoms = [];

  /// The company UOM master — everything selectable, including units this SKU
  /// does NOT yet have. A new case code usually arrives BECAUSE the item just
  /// gained a pack size nobody had recorded, so limiting the list to existing
  /// units makes the common case impossible.
  List<({String uom, String description})> _master = const [];

  bool _loadingUoms = false;
  bool _busy = false;

  /// Filters the item step. A pick can run to dozens of lines, and the whole
  /// point of this screen is that the goods are in the picker's hand — so
  /// finding the right line has to be faster than reading the list.
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
        () => setState(() => _query = _searchCtrl.text.trim().toLowerCase()));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  /// Matches on description or SKU, so a picker can type either what the
  /// label says or the number they can see on the shelf tag.
  List<BarcodeCandidate> get _visibleCandidates {
    if (_query.isEmpty) return widget.candidates;
    return widget.candidates
        .where((c) =>
            c.description.toLowerCase().contains(_query) ||
            c.skuNo.toString().contains(_query))
        .toList();
  }

  Future<void> _pickItem(BarcodeCandidate c) async {
    setState(() {
      _item = c;
      _loadingUoms = true;
      _uoms = [];
    });
    final rows = (await isar.inStockUoms
            .filter()
            .companyCodeEqualTo(widget.companyCode)
            .and()
            .skuNoEqualTo(c.skuNo)
            .findAll())
        .where((u) => (u.uom ?? '').trim().isNotEmpty)
        // 'I' = inactive. Linking a barcode to a retired unit would scan to
        // something nobody sells any more.
        .where((u) => (u.status ?? 'A').trim().toUpperCase() != 'I')
        .toList()
      ..sort((a, b) => (a.factor ?? 1).compareTo(b.factor ?? 1));

    // Paint the units this item already has IMMEDIATELY. They came from Isar
    // and need no network, so holding them back behind the master fetch would
    // make an offline picker watch a spinner run out a 20-second timeout
    // before showing a list that was ready all along.
    if (!mounted) return;
    setState(() {
      _uoms = rows;
      _loadingUoms = false;
    });

    // The master list only ADDS units the item doesn't have yet, so it can
    // arrive late — or never, offline — without holding anything up.
    PluService(isar).uomMaster(widget.companyCode).then((master) {
      if (mounted && master.isNotEmpty) setState(() => _master = master);
    });
  }

  /// Every selectable unit, ordered: the document's unit, then units the item
  /// already has, then the rest of the master.
  List<({String uom, double? factor, bool onSku, bool isDoc})> _options() {
    final onSku = <String, double?>{
      for (final u in _uoms) (u.uom ?? '').trim().toUpperCase(): u.factor,
    };
    final doc = (_item?.docUom ?? '').trim().toUpperCase();

    final out = <({String uom, double? factor, bool onSku, bool isDoc})>[];
    final seen = <String>{};

    void add(String uom) {
      final key = uom.trim().toUpperCase();
      if (uom.trim().isEmpty || !seen.add(key)) return;
      out.add((
        uom: uom.trim(),
        factor: onSku[key],
        onSku: onSku.containsKey(key),
        isDoc: key == doc && doc.isNotEmpty,
      ));
    }

    for (final u in _uoms) {
      add((u.uom ?? '').trim());
    }
    for (final m in _master) {
      add(m.uom);
    }

    int rank(({String uom, double? factor, bool onSku, bool isDoc}) o) =>
        o.isDoc ? 0 : (o.onSku ? 1 : 2);
    out.sort((a, b) {
      final r = rank(a).compareTo(rank(b));
      if (r != 0) return r;
      // Within "already on the item", smallest factor first so the base unit
      // leads and the factors read as a ladder.
      if (a.onSku && b.onSku) {
        return (a.factor ?? 1).compareTo(b.factor ?? 1);
      }
      return a.uom.compareTo(b.uom);
    });
    return out;
  }

  /// A unit the item doesn't have yet needs its pack factor before it can be
  /// used. Never defaulted: the factor says how many base units are in one of
  /// these, and a wrong one misstates every future document for the item.
  Future<void> _createUomThenReturn(String uom) async {
    final item = _item;
    if (item == null) return;
    final baseUom = _uoms.isEmpty ? '' : (_uoms.first.uom ?? '').trim();

    final ctrl = TextEditingController();
    final factor = await showDialog<double>(
      context: context,
      builder: (c) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('How many in 1 $uom?'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            baseUom.isEmpty
                ? '$uom is new for this item. Enter its pack factor.'
                : '$uom is new for this item. How many $baseUom make one $uom?',
            style: const TextStyle(fontSize: 12, color: AppDesign.inkMuted),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: ctrl,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Pack factor',
              suffixText: baseUom.isEmpty ? null : baseUom,
              border: const OutlineInputBorder(),
            ),
          ),
        ]),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modPicking,
                foregroundColor: Colors.white),
            onPressed: () {
              final v = double.tryParse(ctrl.text.trim()) ?? 0;
              if (v > 0) Navigator.pop(c, v);
            },
            child: const Text('Add unit'),
          ),
        ],
      ),
    );
    if (factor == null || !mounted) return;

    setState(() => _busy = true);
    // Queued, not sent. The unit is usable on this device immediately so the
    // picker carries straight on to the barcode; the server gets the last word
    // on the next sync and stops everything if it holds a different factor.
    await PluService(isar).addSkuUomOffline(
      companyCode: widget.companyCode,
      skuNo: item.skuNo,
      uom: uom,
      factor: factor,
      userId: widget.userId,
      sourceDoc: widget.sourceDoc,
    );
    if (!mounted) return;
    setState(() => _busy = false);
    Navigator.pop(context, (item.skuNo, uom));
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.62,
      minChildSize: 0.4,
      maxChildSize: 0.9,
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
            _header(),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(
              child: _item == null
                  ? _itemStep(controller)
                  : _uomStep(controller),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final onUomStep = _item != null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 10),
      child: Row(children: [
        if (onUomStep)
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 18),
            visualDensity: VisualDensity.compact,
            onPressed: () => setState(() {
              _item = null;
              _uoms = [];
            }),
          )
        else
          const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(onUomStep ? 'Which unit is this barcode?' : 'New barcode',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.ink)),
              const SizedBox(height: 3),
              // The code itself, monospaced — it is the one value that must be
              // read digit by digit before committing it.
              Text(widget.code,
                  style: const TextStyle(
                      fontSize: 12.5,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: AppDesign.modPicking)),
              if (onUomStep) ...[
                const SizedBox(height: 2),
                Text(_item!.description,
                    style: const TextStyle(
                        fontSize: 11, color: AppDesign.inkMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ],
          ),
        ),
        // Step marker: two dots, filled to the step you're on.
        Row(mainAxisSize: MainAxisSize.min, children: [
          _dot(true),
          const SizedBox(width: 4),
          _dot(onUomStep),
        ]),
      ]),
    );
  }

  Widget _dot(bool on) => Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: on ? AppDesign.modPicking : AppDesign.border,
          shape: BoxShape.circle,
        ),
      );

  Widget _itemStep(ScrollController controller) {
    if (widget.candidates.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('Nothing on this document to attach it to.',
              textAlign: TextAlign.center, style: AppDesign.bodyMuted),
        ),
      );
    }
    final visible = _visibleCandidates;
    return Column(children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Which item is it? This barcode will scan as that item on every '
            'device from now on.',
            style: TextStyle(
                fontSize: 11.5, color: AppDesign.inkMuted, height: 1.4),
          ),
        ),
      ),
      // Only worth the vertical space once the list is long enough to scan
      // by eye — below that the search box IS the noise.
      if (widget.candidates.length > 6) _searchField(),
      if (visible.isEmpty)
        const Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No item on this document matches.',
                  textAlign: TextAlign.center, style: AppDesign.bodyMuted),
            ),
          ),
        )
      else
      Expanded(
        child: ListView.separated(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
          itemCount: visible.length,
          separatorBuilder: (_, __) => const SizedBox(height: 6),
          itemBuilder: (c, i) {
            final it = visible[i];
            return Material(
              color: AppDesign.surface,
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                onTap: () => _pickItem(it),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    border: Border.all(color: AppDesign.border),
                  ),
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(it.description,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppDesign.ink),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 2),
                          Text(
                            [
                              'SKU ${it.skuNo}',
                              if ((it.docUom ?? '').isNotEmpty)
                                'on this document as ${it.docUom}',
                            ].join('  ·  '),
                            style: const TextStyle(
                                fontSize: 10.5, color: AppDesign.inkMuted),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right,
                        size: 18, color: AppDesign.inkSubtle),
                  ]),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
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
              controller: _searchCtrl,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppDesign.ink),
              decoration: const InputDecoration(
                hintText: 'Search description or SKU',
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
              onTap: _searchCtrl.clear,
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

  Widget _uomStep(ScrollController controller) {
    if (_loadingUoms) return const Center(child: CircularProgressIndicator());

    final options = _options();
    if (options.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No units available for this item, and the unit list could not be '
            'reached. Connect and try again.',
            textAlign: TextAlign.center,
            style: AppDesign.bodyMuted,
          ),
        ),
      );
    }

    // The smallest factor among the units the item HAS is its base unit —
    // what every other factor is expressed in.
    final baseUom = _uoms.isEmpty ? '' : (_uoms.first.uom ?? '').trim();

    return Stack(children: [
      ListView.separated(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (c, i) {
          final o = options[i];
          final accent = o.isDoc
              ? AppDesign.modPicking
              : (o.onSku ? AppDesign.success : AppDesign.warning);
          return Material(
            color: AppDesign.surface,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              onTap: _busy
                  ? null
                  : () {
                      if (o.onSku) {
                        Navigator.pop(context, (_item!.skuNo, o.uom));
                      } else {
                        // Not on this item yet — it needs a pack factor first.
                        _createUomThenReturn(o.uom);
                      }
                    },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  color: o.isDoc ? accent.withOpacity(0.05) : null,
                  border: Border.all(
                      color: o.isDoc
                          ? accent.withOpacity(0.5)
                          : AppDesign.border),
                ),
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 9, vertical: 5),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    ),
                    child: Text(o.uom,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                            color: accent)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      // "CTN" alone doesn't say whether the carton is 10 or 24.
                      !o.onSku
                          ? 'Not on this item yet — set its factor'
                          : (baseUom.isEmpty ||
                                  o.uom.toUpperCase() == baseUom.toUpperCase())
                              ? 'Base unit'
                              : '1 ${o.uom} = ${_fmt(o.factor ?? 1)} $baseUom',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _tag(o.isDoc
                      ? 'ON DOC'
                      : (o.onSku ? 'ON ITEM' : 'NEW'), accent),
                ]),
              ),
            ),
          );
        },
      ),
      if (_busy)
        const Positioned.fill(
          child: ColoredBox(
            color: Color(0x66FFFFFF),
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
    ]);
  }

  Widget _tag(String label, Color c) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: c.withOpacity(0.12),
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.4,
                color: c)),
      );

  static String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toString();
}
