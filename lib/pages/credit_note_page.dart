import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/adjustment.dart';
import '../models/adjustment_item.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../services/adjustment_pdf_service.dart';
import '../services/adjustment_service.dart';
import '../services/representative_service.dart';
import '../services/credit_term_service.dart';
import '../models/representative.dart';
import '../models/credit_term.dart';
import '../services/auth_service.dart';
import '../services/customer_state_service.dart';
import '../services/location_service.dart';
import '../services/plu_service.dart';
import '../services/qty.dart';
import '../theme/app_design.dart';
import '../widgets/customer_picker_sheet.dart';
import '../widgets/ui_kit.dart';
import 'package:isar/isar.dart';

/// Raises a credit note (or another customer-side adjustment) on the device.
///
/// Composed offline and queued: the document number, its date and the stock
/// movement are all settled by the server at upload, because none of them can
/// be decided correctly on a handheld. Until then it carries a provisional
/// number that is visibly not a document number.
class CreditNotePage extends StatefulWidget {
  const CreditNotePage({Key? key}) : super(key: key);

  @override
  State<CreditNotePage> createState() => _CreditNotePageState();
}

class _CreditNotePageState extends State<CreditNotePage> {
  final AdjustmentService _service = AdjustmentService();
  final AuthService _auth = AuthService();

  int _companyCode = 1;
  String _locationCode = '';
  int? _userId;

  /// Legacy fills Representative_ID and Term on every adjustment; the first
  /// upload left both empty, which made the due date land on the document date.
  List<Representative> _reps = [];
  Representative? _rep;
  CreditTerm? _term;

  List<AdjustmentCode> _codes = [];
  List<AdjustmentBatch> _batches = [];
  AdjustmentCode? _code;
  AdjustmentBatch? _batch;

  final List<AdjustmentItem> _items = [];
  final _referenceCtrl = TextEditingController();
  final _remarkCtrl = TextEditingController();

  bool _loading = true;
  bool _saving = false;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _referenceCtrl.dispose();
    _remarkCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final company = await _auth.getSelectedCompany();
      final raw = company?['companyCode'] ?? 1;
      _companyCode = raw is String ? int.tryParse(raw) ?? 1 : raw as int;
      // The selected location lives in its own Isar singleton, not on the
      // company map — the rest of the app reads it through LocationService and
      // so must this. Reading `company['locationCode']` returned null on every
      // device, which then read as "no location selected" no matter what the
      // operator had picked.
      _locationCode = (await LocationService().selectedCode() ?? '').trim();
      _userId = _auth.currentUser?.userId;
      _customer ??= CustomerStateService().selectedCustomer;
      unawaited(_resolveTerm());

      if (_locationCode.isEmpty) {
        throw 'No location is selected. Adjustment codes and their running '
            'numbers are defined per location, so pick one in Settings first.';
      }

      final reps = await RepresentativeService()
          .getCachedRepresentatives(companyCode: _companyCode);

      // Local first, so the screen opens in a chiller or a customer's yard —
      // which is exactly where credit notes get raised. The server is asked
      // afterwards, and only to refresh what is already usable.
      var codes = await _service.localCodes(
          companyCode: _companyCode, locationCode: _locationCode);
      var batches = await _service.localBatches(
          companyCode: _companyCode, locationCode: _locationCode);

      if (codes.isEmpty || batches.isEmpty) {
        // Nothing cached: this device has never completed a full sync since
        // credit notes existed. Fall back to a live fetch rather than refusing.
        try {
          await _service.syncLookups(
              companyCode: _companyCode, locationCode: _locationCode);
          codes = await _service.localCodes(
              companyCode: _companyCode, locationCode: _locationCode);
          batches = await _service.localBatches(
              companyCode: _companyCode, locationCode: _locationCode);
        } catch (e) {
          if (codes.isEmpty) {
            throw 'No adjustment codes for $_locationCode on this device, and '
                'the server is unreachable ($e). Run a full sync while online.';
          }
        }
      } else {
        // Refresh in the background: a batch closing mid-month must not be
        // discovered only at upload.
        unawaited(_service
            .syncLookups(
                companyCode: _companyCode, locationCode: _locationCode)
            .catchError((_) {}));
      }
      if (!mounted) return;
      setState(() {
        // Vendor-only codes have no place on a customer document.
        _codes = codes.where((c) => c.forCustomer).toList();
        _batches = batches;
        _code = _codes.where((c) => c.code == 'CN').firstOrNull ??
            (_codes.isNotEmpty ? _codes.first : null);
        _batch = batches.isNotEmpty ? batches.first : null;
        _reps = reps;
        _rep ??= reps.isNotEmpty ? reps.first : null;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadError = '$e';
        _loading = false;
      });
    }
  }

  /// Chosen on this page rather than inherited outright.
  ///
  /// Seeded from the ordering flow's selection because that is usually who the
  /// credit note is for, but a credit note is often raised for a different
  /// customer than the one currently being ordered for — so it has to be
  /// changeable without leaving the page.
  Customer? _customer;

  double get _total {
    var t = 0.0;
    for (final i in _items) {
      t += i.lineTotal;
    }
    return t;
  }

  bool get _canSave =>
      !_saving &&
      _code != null &&
      _batch != null &&
      _customer != null &&
      _items.isNotEmpty;

  Future<void> _save() async {
    if (!_canSave) return;
    setState(() => _saving = true);
    try {
      final seq = await _nextLocalSeq();
      final header = Adjustment()
        ..companyCode = _companyCode
        ..preLabel = AdjustmentService.provisionalPreLabel(
            prefix: '$_locationCode/${_code!.code}/', localSeq: seq)
        ..adjustment = _code!.code
        ..adjustmentDescription = _code!.description
        ..sign = _code!.sign
        ..partyCode = _customer!.code
        ..partyName = _customer!.name
        ..isCustomer = 'Y'
        ..locationCode = _locationCode
        ..batchNo = _batch!.batchNo
        ..batchName = _batch!.batchName
        ..representativeId = _rep?.representativeId
        ..term = _term?.term
        ..termDays = _term?.days
        ..reference = _referenceCtrl.text.trim()
        ..remark = _remarkCtrl.text.trim()
        ..addedBy = _userId;

      await _service.saveLocal(header, _items);
      if (!mounted) return;

      // Same sequence the checkout uses after creating a quotation: render,
      // open the viewer, then offer Open and Share. The document number on it
      // is still provisional — the real one is assigned at upload and shown
      // again then.
      await _showReport(header);
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Could not save: $e')));
    }
  }

  /// Renders the credit note, opens it, and offers Open / Share afterwards.
  ///
  /// A failure here never costs the saved document — it is already in Isar and
  /// queued for upload, so the report is reported as a separate problem.
  Future<void> _showReport(Adjustment header) async {
    AdjustmentPdfResult? pdf;
    try {
      pdf = await AdjustmentPdfService().buildAndOpen(header);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved, but the report failed: $e')),
      );
      return;
    }
    if (!mounted) return;

    final action = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(children: [
          const Icon(Icons.check_circle, size: 20, color: AppDesign.success),
          const SizedBox(width: 8),
          Expanded(
            child: Text('${_code!.code} saved',
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w800)),
          ),
        ]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(header.preLabel,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppDesign.modCreditNote)),
            const SizedBox(height: 6),
            const Text(
              'This number is temporary. The real one is assigned when the '
              'document is uploaded from Pending Uploads.',
              style: TextStyle(fontSize: 11.5, color: AppDesign.inkMuted),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, 'close'),
              child: const Text('Close')),
          TextButton.icon(
            onPressed: () => Navigator.pop(ctx, 'open'),
            icon: const Icon(Icons.picture_as_pdf, size: 17),
            label: const Text('Open PDF'),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(ctx, 'share'),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modCreditNote,
                foregroundColor: Colors.white),
            icon: const Icon(Icons.share, size: 17),
            label: const Text('Share'),
          ),
        ],
      ),
    );

    try {
      if (action == 'share') await AdjustmentPdfService().share(pdf);
      if (action == 'open') await AdjustmentPdfService().open(pdf);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open the report: $e')),
        );
      }
    }
  }

  /// A local counter for the provisional number, so two drafts made offline
  /// never share a label. Counts what is already queued rather than keeping a
  /// separate counter that could drift out of step with it.
  Future<int> _nextLocalSeq() async {
    final existing = await isar.adjustments.count();
    return existing + 1;
  }

  // ── UI ───────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppBar(
        title: Text(_code == null ? 'Credit Note' : _code!.description,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppDesign.ink)),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _loadError != null
              ? UiEmptyState(
                  icon: Icons.cloud_off,
                  title: 'Cannot start a credit note',
                  message: _loadError!,
                  actionLabel: 'Retry',
                  onAction: _load,
                  accent: AppDesign.danger,
                )
              : _form(),
      bottomNavigationBar: _loading || _loadError != null ? null : _footer(),
    );
  }

  Widget _form() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      children: [
        InkWell(
          onTap: _pickCustomer,
          borderRadius: BorderRadius.circular(AppDesign.radius),
          child: _card([
            Row(
              children: [
                _label('CUSTOMER'),
                const Spacer(),
                Text(_customer == null ? 'Select' : 'Change',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.modCreditNote)),
                const Icon(Icons.chevron_right,
                    size: 16, color: AppDesign.modCreditNote),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              _customer == null
                  ? 'Tap to choose a customer'
                  : (_customer!.name ?? '').trim().isEmpty
                      ? _customer!.code
                      : _customer!.name!.trim(),
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _customer == null ? AppDesign.danger : AppDesign.ink),
            ),
            if (_customer != null)
              Text(_customer!.code,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted)),
          ]),
        ),
        const SizedBox(height: 8),
        _card([
          Row(
            children: [
              Expanded(child: _codePicker()),
              const SizedBox(width: 8),
              Expanded(child: _batchPicker()),
            ],
          ),
          if (_code != null && _code!.sign != 0) ...[
            const SizedBox(height: 6),
            Text(
              _code!.sign > 0
                  ? 'Returns stock — quantity and FOC both go back in'
                  : 'Removes stock — quantity and FOC both come out',
              style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: AppDesign.inkMuted),
            ),
          ],
        ]),
        const SizedBox(height: 8),
        _card([
          _label('REFERENCE'),
          const SizedBox(height: 4),
          _text(_referenceCtrl, 'Invoice or document reference'),
          const SizedBox(height: 10),
          _label('REMARK'),
          const SizedBox(height: 4),
          _text(_remarkCtrl, 'Why this credit note is being raised'),
        ]),
        const SizedBox(height: 8),
        _itemsCard(),
      ],
    );
  }

  Widget _codePicker() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('TYPE'),
          const SizedBox(height: 4),
          _dropdown<AdjustmentCode>(
            value: _code,
            items: _codes,
            labelOf: (c) => c.label,
            onChanged: (c) => setState(() => _code = c),
            empty: 'No codes',
          ),
        ],
      );

  Widget _batchPicker() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label('BATCH'),
          const SizedBox(height: 4),
          _dropdown<AdjustmentBatch>(
            value: _batch,
            items: _batches,
            labelOf: (b) => b.label,
            onChanged: (b) => setState(() => _batch = b),
            empty: 'None open',
          ),
        ],
      );

  Widget _itemsCard() {
    return _card([
      Row(
        children: [
          _label('ITEMS (${_items.length})'),
          const Spacer(),
          TextButton.icon(
            style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: AppDesign.modCreditNote),
            onPressed: _addItem,
            icon: const Icon(Icons.add, size: 16),
            label: const Text('Add',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
      if (_items.isEmpty)
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('No items yet.',
              style: TextStyle(fontSize: 12, color: AppDesign.inkSubtle)),
        )
      else
        for (var i = 0; i < _items.length; i++) _itemRow(i),
    ]);
  }

  Widget _itemRow(int i) {
    final it = _items[i];
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(it.description ?? 'SKU ${it.skuNo}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: AppDesign.ink)),
                const SizedBox(height: 2),
                Text(
                  '${Qty.fmt(it.quantity)} ${it.uom}'
                  '${it.focQuantity > 0 ? '  +${Qty.fmt(it.focQuantity)} FOC' : ''}'
                  '  ·  RM ${it.unitCost.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted),
                ),
              ],
            ),
          ),
          Text('RM ${it.lineTotal.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: AppDesign.accentInk)),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.close, size: 17, color: AppDesign.inkSubtle),
            onPressed: () => setState(() => _items.removeAt(i)),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                const Expanded(
                  child: Text('Total credit',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.inkMuted)),
                ),
                Text('RM ${_total.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.4,
                        color: AppDesign.accentInk)),
              ],
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _canSave ? _save : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppDesign.modCreditNote,
                  disabledBackgroundColor: AppDesign.borderStrong,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDesign.radius)),
                ),
                icon: _saving
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.save_outlined, size: 17),
                label: Text(_saving ? 'Saving…' : 'Save for upload',
                    style: const TextStyle(
                        fontSize: 13.5, fontWeight: FontWeight.w800)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// The customer's credit term decides the due date — legacy reads
  /// `PI_Credit_Term` for the term on the customer record and dates the
  /// document forward by its days. Without it the due date equals the document
  /// date, which is what the first upload produced.
  Future<void> _resolveTerm() async {
    final code = (_customer?.term ?? '').trim();
    if (code.isEmpty) {
      setState(() => _term = null);
      return;
    }
    try {
      final found = await CreditTermService(signalRService)
          .getCreditTerm(companyCode: _companyCode, term: code);
      if (mounted) setState(() => _term = found);
    } catch (_) {
      // A missing term only costs the due date; the document is still valid.
    }
  }

  Future<void> _pickCustomer() async {
    final picked = await CustomerPickerSheet.show(
      context,
      companyCode: _companyCode,
      selectedCode: _customer?.code,
      accent: AppDesign.modCreditNote,
    );
    if (picked != null) {
      setState(() => _customer = picked);
      await _resolveTerm();
    }
  }

  Future<void> _addItem() async {
    final added = await showModalBottomSheet<AdjustmentItem>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddAdjustmentItemSheet(companyCode: _companyCode),
    );
    if (added != null) setState(() => _items.add(added));
  }

  // ── Small shared pieces ──────────────────────────────────────────────────

  Widget _card(List<Widget> children) => Container(
        padding: const EdgeInsets.all(10),
        decoration: AppDesign.card(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children),
      );

  Widget _label(String t) => Text(t,
      style: const TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.6,
          color: AppDesign.inkSubtle));

  Widget _text(TextEditingController c, String hint) => TextField(
        controller: c,
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle:
              const TextStyle(fontSize: 12, color: AppDesign.inkSubtle),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              borderSide: const BorderSide(color: AppDesign.border)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              borderSide: const BorderSide(color: AppDesign.border)),
        ),
      );

  Widget _dropdown<T>({
    required T? value,
    required List<T> items,
    required String Function(T) labelOf,
    required ValueChanged<T?> onChanged,
    required String empty,
  }) {
    if (items.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.border),
        ),
        child: Text(empty,
            style:
                const TextStyle(fontSize: 12, color: AppDesign.inkSubtle)),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          isDense: true,
          style: const TextStyle(fontSize: 12, color: AppDesign.ink),
          items: [
            for (final i in items)
              DropdownMenuItem<T>(
                  value: i,
                  child:
                      Text(labelOf(i), overflow: TextOverflow.ellipsis))
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}

/// Picks an item, its UOM and the quantities, and sets the credit price.
///
/// The price starts at the item's selling price and is editable — which is
/// what the legacy desktop app does, confirmed by tracing a real credit note:
/// the field is the operator's to set, and the selling price is only where it
/// begins. The item's costs are captured alongside it because legacy writes
/// all three onto the line.
class _AddAdjustmentItemSheet extends StatefulWidget {
  final int companyCode;
  const _AddAdjustmentItemSheet({required this.companyCode});

  @override
  State<_AddAdjustmentItemSheet> createState() =>
      _AddAdjustmentItemSheetState();
}

class _AddAdjustmentItemSheetState extends State<_AddAdjustmentItemSheet> {
  final _searchCtrl = TextEditingController();
  final _qtyCtrl = TextEditingController(text: '1.00');
  final _focCtrl = TextEditingController(text: '0.00');
  final _priceCtrl = TextEditingController();
  final _remarkCtrl = TextEditingController();

  List<InventoryItem> _results = [];
  InventoryItem? _picked;
  bool _searching = false;

  @override
  void dispose() {
    _searchCtrl.dispose();
    _qtyCtrl.dispose();
    _focCtrl.dispose();
    _priceCtrl.dispose();
    _remarkCtrl.dispose();
    super.dispose();
  }

  Future<void> _search(String q) async {
    final term = q.trim();
    if (term.length < 2) {
      setState(() => _results = []);
      return;
    }
    setState(() => _searching = true);
    final all = await isar.inventoryItems
        .filter()
        .companyCodeEqualTo(widget.companyCode)
        .findAll();
    final lower = term.toLowerCase();
    final hits = all
        .where((e) =>
            (e.description ?? '').toLowerCase().contains(lower) ||
            '${e.skuNo}'.contains(term))
        .take(30)
        .toList();
    if (!mounted) return;
    setState(() {
      _results = hits;
      _searching = false;
    });
  }

  void _pick(InventoryItem item) {
    setState(() {
      _picked = item;
      // Selling price as the starting point, editable.
      final price = item.gstPrice ?? item.price ?? 0;
      _priceCtrl.text = price.toStringAsFixed(2);
    });
  }

  Future<void> _submit() async {
    final item = _picked;
    if (item == null) return;

    // Legacy resolves the PLU from In_Stock_PLU per SKU rather than reading
    // the single Plu_No on the master row — which is why the first upload
    // wrote an empty Plu_No while every legacy line carries a barcode. Falls
    // back to the master's value, then to blank.
    var plu = (item.pluNo?.toString() ?? '').trim();
    try {
      final best = await PluService(isar).getDefaultPluForSku(item.skuNo);
      final fromTable = (best?.pluNo ?? '').trim();
      if (fromTable.isNotEmpty) plu = fromTable;
    } catch (_) {
      // The barcode is a convenience on the printed document, not a
      // requirement — never block the line over it.
    }
    if (!mounted) return;
    final qty = Qty.tryParse(_qtyCtrl.text) ?? 0;
    final foc = Qty.tryParse(_focCtrl.text) ?? 0;
    if (qty <= 0 && foc <= 0) return;

    Navigator.pop(
      context,
      AdjustmentItem()
        ..companyCode = widget.companyCode
        ..preLabel = ''
        ..sequenceNo = 0
        ..skuNo = item.skuNo
        ..pluNo = plu
        ..description = item.description
        ..uom = item.uom ?? ''
        ..factor = 1
        ..quantity = qty
        ..focQuantity = foc
        ..unitCost = double.tryParse(_priceCtrl.text.trim()) ?? 0
        ..sellingPrice = item.gstPrice ?? item.price ?? 0
        ..averageCost = item.averageCost ?? 0
        ..standardCost = item.standardCost ?? 0
        ..lastCost = item.lastCost ?? 0
        ..remark = _remarkCtrl.text.trim(),
    );
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
              margin: const EdgeInsets.only(top: 10, bottom: 8),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppDesign.borderStrong,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _searchCtrl,
                autofocus: true,
                onChanged: _search,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search item or SKU',
                  prefixIcon: const Icon(Icons.search, size: 18),
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusSm)),
                ),
              ),
            ),
            if (_picked != null) _pickedPanel(),
            Expanded(
              child: _searching
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      controller: controller,
                      padding: const EdgeInsets.all(10),
                      itemCount: _results.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 8, color: AppDesign.divider),
                      itemBuilder: (context, i) {
                        final r = _results[i];
                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(r.description ?? 'SKU ${r.skuNo}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text(
                              '${r.skuNo} · ${r.uom ?? ''} · '
                              'RM ${(r.gstPrice ?? r.price ?? 0).toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 11)),
                          onTap: () => _pick(r),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pickedPanel() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      decoration: AppDesign.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_picked!.description ?? 'SKU ${_picked!.skuNo}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12.5, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: _num('Qty', _qtyCtrl, AppDesign.modCreditNote)),
              const SizedBox(width: 6),
              Expanded(child: _num('FOC', _focCtrl, AppDesign.warning)),
              const SizedBox(width: 6),
              Expanded(child: _num('Price', _priceCtrl, AppDesign.accentInk)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modCreditNote,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radius)),
              ),
              child: const Text('Add line',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _num(String label, TextEditingController c, Color accent) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: accent)),
          const SizedBox(height: 2),
          TextField(
            controller: c,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
            ),
          ),
        ],
      );
}
