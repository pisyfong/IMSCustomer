import 'package:flutter/material.dart';

import '../models/receipt_template.dart';
import '../services/receipt_service.dart';
import '../services/receipt_template_service.dart';
import '../theme/app_design.dart';
import '../widgets/receipt_paper_view.dart';

/// Manages the named receipt layouts for picking and packing.
///
/// Two tabs, one per module, because a template only ever applies to one of
/// them — a "Delivery note" makes no sense on a pick, and mixing them into one
/// list would just mean explaining that.
class ReceiptTemplatesPage extends StatefulWidget {
  const ReceiptTemplatesPage({super.key});

  @override
  State<ReceiptTemplatesPage> createState() => _ReceiptTemplatesPageState();
}

class _ReceiptTemplatesPageState extends State<ReceiptTemplatesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this)
    ..addListener(() {
      if (!_tabs.indexIsChanging) setState(() {});
    });

  final _svc = ReceiptTemplateService();
  List<ReceiptTemplate> _pick = [];
  List<ReceiptTemplate> _pack = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final pick = await _svc.templates(ReceiptTemplate.modulePick);
    final pack = await _svc.templates(ReceiptTemplate.modulePack);
    if (!mounted) return;
    setState(() {
      _pick = pick;
      _pack = pack;
      _loading = false;
    });
  }

  String get _module => _tabs.index == 0
      ? ReceiptTemplate.modulePick
      : ReceiptTemplate.modulePack;

  Color get _accent =>
      _tabs.index == 0 ? AppDesign.modPicking : AppDesign.modPacking;

  Future<void> _edit(ReceiptTemplate t) async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        // Edit a copy so backing out really discards.
        builder: (_) => ReceiptTemplateEditorPage(template: t.copy()),
      ),
    );
    if (saved == true) await _load();
  }

  Future<void> _add() async {
    final t = ReceiptTemplate()
      ..module = _module
      ..name = 'New template'
      ..title = _module == ReceiptTemplate.modulePick
          ? 'PICKING LIST'
          : 'PACKING LIST'
      ..signatures = _module == ReceiptTemplate.modulePick
          ? ['Picked by', 'Checked by']
          : ['Packed by', 'Checked by'];
    await _edit(t);
  }

  @override
  Widget build(BuildContext context) {
    final rows = _tabs.index == 0 ? _pick : _pack;
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppBar(
        title: const Text('Receipt templates',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppDesign.ink)),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
        bottom: TabBar(
          controller: _tabs,
          labelColor: _accent,
          unselectedLabelColor: AppDesign.inkSubtle,
          indicatorColor: _accent,
          labelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          tabs: const [Tab(text: 'PICKING'), Tab(text: 'PACKING')],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _add,
        backgroundColor: _accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add, size: 18),
        label: const Text('New',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 90),
              itemCount: rows.length,
              itemBuilder: (context, i) => _row(rows[i]),
            ),
    );
  }

  Widget _row(ReceiptTemplate t) {
    final on = <String>[
      t.grouping.label,
      if (t.showBarcode) 'barcode',
      if (t.signatures.isNotEmpty) '${t.signatures.length} signature'
          '${t.signatures.length == 1 ? '' : 's'}',
      if (t.footerNote.trim().isNotEmpty) 'note',
    ].join(' · ');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: AppDesign.card(),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radius),
        onTap: () => _edit(t),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
          child: Row(children: [
            Container(width: 3, height: 34, color: _accent),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    Flexible(
                      child: Text(t.name,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w800),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                    if (t.isDefault) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppDesign.success.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text('DEFAULT',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                                color: AppDesign.success)),
                      ),
                    ],
                  ]),
                  Text(t.title, style: AppDesign.caption),
                  Text(on,
                      style: const TextStyle(
                          fontSize: 10, color: AppDesign.inkSubtle),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, size: 18),
              onSelected: (v) async {
                switch (v) {
                  case 'default':
                    t.isDefault = true;
                    await _svc.save(t);
                  case 'duplicate':
                    await _svc.duplicate(t);
                  case 'delete':
                    if (!await _confirmDelete(t)) return;
                    await _svc.delete(t);
                }
                await _load();
              },
              itemBuilder: (_) => [
                if (!t.isDefault)
                  const PopupMenuItem(
                      value: 'default', child: Text('Make default')),
                const PopupMenuItem(
                    value: 'duplicate', child: Text('Duplicate')),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete',
                      style: TextStyle(color: AppDesign.danger)),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(ReceiptTemplate t) async {
    final rows = _tabs.index == 0 ? _pick : _pack;
    if (rows.length <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Keep at least one template — printing needs somewhere '
            'to start from'),
      ));
      return false;
    }
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete template?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        content: Text('"${t.name}" will be removed from this device.',
            style: AppDesign.bodyMuted),
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
    return ok == true;
  }
}

// ───────────────────────────── Editor ──────────────────────────────────────

/// Edits one template. Works on a copy handed in by the list, so Cancel is a
/// real cancel and Save is the only thing that writes.
class ReceiptTemplateEditorPage extends StatefulWidget {
  final ReceiptTemplate template;
  const ReceiptTemplateEditorPage({super.key, required this.template});

  @override
  State<ReceiptTemplateEditorPage> createState() =>
      _ReceiptTemplateEditorPageState();
}

class _ReceiptTemplateEditorPageState extends State<ReceiptTemplateEditorPage> {
  late final ReceiptTemplate _t = widget.template;

  late final _name = TextEditingController(text: _t.name);
  late final _title = TextEditingController(text: _t.title);
  late final _header = TextEditingController(text: _t.headerLines.join('\n'));
  late final _footer = TextEditingController(text: _t.footerNote);
  late final _signatures =
      TextEditingController(text: _t.signatures.join('\n'));

  bool _previewing = false;

  Color get _accent => _t.module == ReceiptTemplate.modulePick
      ? AppDesign.modPicking
      : AppDesign.modPacking;

  @override
  void dispose() {
    for (final c in [_name, _title, _header, _footer, _signatures]) {
      c.dispose();
    }
    super.dispose();
  }

  /// Copies the form into [_t]. Shared by Save and Preview so the preview
  /// shows what you're currently editing, not what was last written.
  void _applyForm() {
    _t
      ..name = _name.text.trim()
      ..title = _title.text.trim()
      // Multi-line fields are stored as lists; blank lines are dropped so a
      // stray return doesn't print an empty line on every receipt.
      ..headerLines = _lines(_header.text)
      ..footerNote = _footer.text.trim()
      ..signatures = _lines(_signatures.text);
  }

  Future<void> _save() async {
    if (_name.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Give the template a name')),
      );
      return;
    }
    _applyForm();
    await ReceiptTemplateService().save(_t);
    if (mounted) Navigator.pop(context, true);
  }

  /// Renders the template as it stands and shows it as paper.
  ///
  /// Nothing is persisted — you can try a layout, look at it, and back out.
  Future<void> _preview() async {
    _applyForm();
    setState(() => _previewing = true);
    final job = await ReceiptService().buildPreview(_t);
    if (!mounted) return;
    setState(() => _previewing = false);

    await showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDesign.radiusLg)),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(ctx).size.height * 0.86),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 8, 10),
              child: Row(children: [
                Icon(Icons.receipt_long, size: 18, color: _accent),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Preview',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800)),
                      Text(
                          'Demo data · ${job.cols == 32 ? '58mm' : '80mm'}',
                          style: AppDesign.caption),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 19),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ]),
            ),
            const Divider(height: 1, color: AppDesign.border),
            Flexible(child: ReceiptPaperView(job: job)),
          ]),
        ),
      ),
    );
  }

  List<String> _lines(String raw) => raw
      .split('\n')
      .map((l) => l.trim())
      .where((l) => l.isNotEmpty)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      appBar: AppBar(
        title: const Text('Edit template',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppDesign.ink)),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
        actions: [
          IconButton(
            tooltip: 'Preview',
            icon: _previewing
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.visibility_outlined, size: 20),
            onPressed: _previewing ? null : _preview,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 6, bottom: 6),
            child: ElevatedButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save, size: 16),
              label: const Text('Save',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.success,
                foregroundColor: Colors.white,
                minimumSize: const Size(0, 32),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
        children: [
          _section('IDENTITY', [
            _text(_name, 'Name', 'Shown when choosing a template'),
            _text(_title, 'Printed title', 'e.g. PICKING LIST, DELIVERY NOTE'),
            _switch('Default for this module', 'Pre-selected when printing',
                _t.isDefault, (v) => _t.isDefault = v),
          ]),
          _section('GROUPING', [
            for (final g in ReceiptGrouping.values) _grouping(g),
          ]),
          _section('COMPANY HEADER', [
            _switch('Company name', 'The selected company, in bold',
                _t.showCompanyName, (v) => _t.showCompanyName = v),
            _text(_header, 'Header lines',
                'Address, tel, SSM — one per line, centred', maxLines: 4),
          ]),
          _section('FIELDS', [
            _switch('Document date', null, _t.showDate, (v) => _t.showDate = v),
            _switch('Location', null, _t.showLocation,
                (v) => _t.showLocation = v),
            _switch('Assignee', null, _t.showAssignee,
                (v) => _t.showAssignee = v),
            _switch('Status', null, _t.showStatus, (v) => _t.showStatus = v),
            _switch('Printed at', null, _t.showPrintedAt,
                (v) => _t.showPrintedAt = v),
            _switch('Not-uploaded warning',
                'Flags a document the server hasn\'t seen yet',
                _t.showUnsyncedWarning, (v) => _t.showUnsyncedWarning = v),
            const Divider(height: 18, color: AppDesign.border),
            _switch('PLU', 'The shelf code, per line', _t.showPlu,
                (v) => _t.showPlu = v),
            _switch('UOM', null, _t.showUom, (v) => _t.showUom = v),
            _switch(
                'Source document',
                _t.module == ReceiptTemplate.modulePack
                    ? 'The pick each line came from'
                    : 'Picks have no upstream document — no effect here',
                _t.showSource,
                (v) => _t.showSource = v),
            _switch('Short quantity', 'Calls out lines under their target',
                _t.showShortQty, (v) => _t.showShortQty = v),
            _switch('Totals', 'Footer totals and per-section subtotals',
                _t.showTotals, (v) => _t.showTotals = v),
            _switch('Barcode', 'CODE128 of the document number',
                _t.showBarcode, (v) => _t.showBarcode = v),
          ]),
          _section('FOOTER', [
            _text(_footer, 'Note', 'Terms or remarks printed above the '
                'signatures', maxLines: 3),
            _text(_signatures, 'Signature lines',
                'One per line — blank prints none', maxLines: 3),
          ]),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _previewing ? null : _preview,
              icon: const Icon(Icons.receipt_long, size: 17),
              label: Text(_previewing ? 'Rendering…' : 'Preview receipt',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700)),
              style: OutlinedButton.styleFrom(
                foregroundColor: _accent,
                side: BorderSide(color: _accent),
                minimumSize: const Size(0, 44),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(String label, List<Widget> children) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        decoration: AppDesign.section(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppDesign.micro),
            const SizedBox(height: 6),
            ...children,
          ],
        ),
      );

  Widget _text(TextEditingController c, String label, String? hint,
          {int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: c,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 12),
            helperText: hint,
            helperStyle: const TextStyle(fontSize: 10),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          ),
        ),
      );

  Widget _switch(
          String title, String? sub, bool value, ValueChanged<bool> apply) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                if (sub != null) Text(sub, style: AppDesign.caption),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: _accent,
            onChanged: (v) => setState(() => apply(v)),
          ),
        ]),
      );

  Widget _grouping(ReceiptGrouping g) {
    final on = _t.grouping == g;
    // "Source pick" is meaningless on a pick — it silently falls back to SQ,
    // so don't offer it there.
    if (g == ReceiptGrouping.sourceDoc &&
        _t.module == ReceiptTemplate.modulePick) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () => setState(() => _t.grouping = g),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: on ? _accent.withOpacity(0.08) : null,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: on ? _accent : AppDesign.border),
        ),
        child: Row(children: [
          Icon(on ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              size: 16, color: on ? _accent : AppDesign.inkSubtle),
          const SizedBox(width: 9),
          Text(g.label,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: on ? FontWeight.w800 : FontWeight.w600,
                  color: on ? _accent : AppDesign.ink)),
        ]),
      ),
    );
  }
}
