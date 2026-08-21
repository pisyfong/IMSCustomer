import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/quotation.dart';
import '../models/pick_list.dart';
import '../models/pack_list.dart';
import '../services/pick_service.dart';
import '../services/pack_service.dart';
import '../services/user_directory_service.dart';
import '../theme/app_design.dart';
import '../services/quotation_pdf_service.dart';
import '../services/quotation_service.dart';
import '../services/removed_uploads_service.dart';
import '../services/adjustment_pdf_service.dart';
import '../services/adjustment_service.dart';
import '../widgets/cn_result_dialog.dart';
import '../models/adjustment.dart';
import '../services/signalr_service.dart';

/// Lists locally-created quotations that haven't been uploaded to the server.
/// Supports per-row "Regenerate PDF" + "Upload now", and multi-select for
/// "Upload Selected (N)" / "Upload All".
class PendingUploadsPage extends StatefulWidget {
  const PendingUploadsPage({super.key});

  @override
  State<PendingUploadsPage> createState() => _PendingUploadsPageState();
}

// Two tickers live here (_cloudSpin + the TabController), so this needs the
// multi-ticker mixin — SingleTickerProviderStateMixin throws on the second.
class _PendingUploadsPageState extends State<PendingUploadsPage>
    with RouteAware, TickerProviderStateMixin {
  final QuotationService _quotationService =
      QuotationService(SignalRService());

  List<Quotation> _unsynced = [];
  bool _isLoading = true;
  bool _isUploading = false;

  late final AnimationController _cloudSpin = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );

  /// Set of selected quotation IDs (Isar id). Empty = "Upload All" mode.
  final Set<int> _selected = <int>{};

  /// Tabs: 0 = Quotations, 1 = Picks, 2 = Packs.
  late final TabController _tabs = TabController(length: 4, vsync: this);

  List<Adjustment> _adjustments = [];
  bool _busyAdj = false;
  final AdjustmentService _adjService = AdjustmentService();

  List<PickList> _picks = [];
  List<PackList> _packs = [];
  final Map<int, String> _assignee = {}; // userId -> display name
  bool _busyPick = false;
  bool _busyPack = false;

  // ─── Removed rows (a maintenance affordance, deliberately undiscoverable) ─
  //
  // Reached by tapping the title five times; holding it for three seconds
  // opens the recycle bin. Both gestures are on the title because this is for
  // whoever is called about a stuck upload, not for the operator using the
  // screen every day — a visible Delete here would invite people to clear away
  // documents that genuinely still need sending.
  final RemovedUploadsService _removedService = RemovedUploadsService();
  Set<String> _removedKeys = <String>{};
  bool _removeMode = false;

  /// Taps on the title so far, and when the last one landed. The run resets
  /// after a pause so ordinary taps months apart never accumulate into the
  /// gesture.
  int _titleTaps = 0;
  DateTime? _lastTitleTap;
  Timer? _holdTimer;

  // Last-run summary stats
  int? _lastTotal;
  int? _lastSynced;
  int? _lastSkipped;
  int? _lastFailed;

  @override
  void initState() {
    super.initState();
    _loadRemoved();
    _load();
  }

  Future<void> _loadRemoved() async {
    final keys = await _removedService.loadKeys();
    if (mounted) setState(() => _removedKeys = keys);
  }

  /// The stable key for a row. See [RemovedUploadsService.keyFor].
  String _keyOfQuote(Quotation q) =>
      RemovedUploadsService.keyFor('SQ', q.quotePreLabel);
  String _keyOfPick(PickList p) =>
      RemovedUploadsService.keyFor('PICK', p.pickPreLabel);
  String _keyOfPack(PackList p) =>
      RemovedUploadsService.keyFor('PACK', p.packPreLabel);
  String _keyOfAdjustment(Adjustment a) =>
      RemovedUploadsService.keyFor('ADJ', a.preLabel);

  /// Everything except what has been removed. Applied to every list, every
  /// count and the dashboard badge, so a removed row is gone from the app's
  /// arithmetic and not merely absent from one screen.
  List<T> _visible<T>(List<T> rows, String Function(T) keyOf) =>
      rows.where((r) => !_removedKeys.contains(keyOf(r))).toList();

  /// Asks, then removes.
  ///
  /// The confirmation is deliberate. The gesture that reaches this mode is
  /// obscure enough that whoever is in it meant to be, but the rows around it
  /// are the only record that an order has not reached the server — so the
  /// step that makes one disappear is worth one deliberate tap.
  Future<void> _confirmRemove(String key, String label, String kind) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove from the list?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.isEmpty ? '(no document number)' : label,
                style: const TextStyle(fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            const Text(
              'It will stop appearing here and on the dashboard. '
              'It is not deleted from the device and can be restored from the '
              'recycle bin.',
              style: TextStyle(fontSize: 12.5),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppDesign.danger),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (ok != true) return;

    await _removedService.remove(
        key: key, label: label, kind: kind, at: DateTime.now());
    final keys = await _removedService.loadKeys();
    if (!mounted) return;
    setState(() => _removedKeys = keys);
    // No confirmation message. The row vanishing IS the confirmation, the
    // dialog already asked, and the recycle bin is the way back — an Undo
    // banner on top of all three was just something else to wait out.
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  /// Shows a transient message, replacing any message already on screen.
  ///
  /// `showSnackBar` QUEUES. Removing five rows in a row therefore played five
  /// four-second messages back to back — twenty seconds of banner that looked
  /// stuck and outlived the action that caused it. Each new message now
  /// dismisses the previous one, so the banner always reflects the last thing
  /// the operator did.
  void _toast(String message, {SnackBarAction? action}) {
    final m = ScaffoldMessenger.of(context);
    m.hideCurrentSnackBar();
    m.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      action: action,
    ));
  }

  Future<void> _restore(String key) async {
    await _removedService.restore(key);
    final keys = await _removedService.loadKeys();
    if (!mounted) return;
    setState(() => _removedKeys = keys);
  }

  // ─── The two hidden gestures ───

  void _onTitleTap() {
    final now = DateTime.now();
    // "Five times continuously" — a gap longer than a deliberate run of taps
    // starts over, so this cannot be reached by chance over a long session.
    if (_lastTitleTap == null ||
        now.difference(_lastTitleTap!) > const Duration(milliseconds: 900)) {
      _titleTaps = 0;
    }
    _lastTitleTap = now;
    _titleTaps++;
    if (_titleTaps < 5) return;

    _titleTaps = 0;
    setState(() => _removeMode = !_removeMode);
    _toast(_removeMode
        ? 'Remove mode on — tap the bin on a row'
        : 'Remove mode off');
  }

  /// Three seconds of hold, not Flutter's ~half-second long press.
  ///
  /// `onLongPressStart` already fires at the framework's threshold, so the
  /// remainder is timed from there. Releasing early cancels, which keeps an
  /// ordinary accidental long press from opening the bin.
  void _onTitleHoldStart() {
    _holdTimer?.cancel();
    _holdTimer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) _openRecycleBin();
    });
  }

  void _onTitleHoldEnd() {
    _holdTimer?.cancel();
    _holdTimer = null;
  }

  /// The recycle bin: everything removed, newest first, restorable.
  ///
  /// A sheet of its own rather than a filtered view of the list, because it
  /// answers a different question — "what did I take away?" — and because the
  /// rows in it no longer exist as far as every other list is concerned.
  Future<void> _openRecycleBin() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSheet) => FutureBuilder<List<RemovedUpload>>(
          future: _removedService.load(),
          builder: (ctx, snap) {
            final rows = snap.data ?? const <RemovedUpload>[];
            return DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 0.92,
              minChildSize: 0.35,
              expand: false,
              builder: (ctx, controller) => Container(
                decoration: const BoxDecoration(
                  color: AppDesign.bg,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppDesign.radiusLg)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 6),
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppDesign.borderStrong,
                        borderRadius:
                            BorderRadius.circular(AppDesign.radiusPill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 6, 8),
                      child: Row(
                        children: [
                          const Icon(Icons.delete_outline,
                              size: 18, color: AppDesign.inkMuted),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('Recycle bin',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: AppDesign.ink)),
                          ),
                          if (rows.isNotEmpty)
                            TextButton(
                              onPressed: () async {
                                await _removedService.restoreAll();
                                final keys =
                                    await _removedService.loadKeys();
                                if (mounted) {
                                  setState(() => _removedKeys = keys);
                                }
                                setSheet(() {});
                              },
                              child: const Text('Restore all',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800)),
                            ),
                          IconButton(
                            visualDensity: VisualDensity.compact,
                            icon: const Icon(Icons.close,
                                size: 20, color: AppDesign.inkMuted),
                            onPressed: () => Navigator.pop(ctx),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppDesign.border),
                    Expanded(
                      child: rows.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(24),
                                child: Text(
                                  'Nothing has been removed.',
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      color: AppDesign.inkSubtle),
                                ),
                              ),
                            )
                          : ListView.separated(
                              controller: controller,
                              padding: const EdgeInsets.all(10),
                              itemCount: rows.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 6),
                              itemBuilder: (ctx, i) {
                                final r = rows[i];
                                return Container(
                                  decoration: AppDesign.card(),
                                  padding: const EdgeInsets.fromLTRB(
                                      12, 8, 6, 8),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              r.label.isEmpty
                                                  ? '(no document number)'
                                                  : r.label,
                                              maxLines: 1,
                                              overflow:
                                                  TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.w800,
                                                  color: AppDesign.ink),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              '${r.kind}  ·  removed '
                                              '${_ago(r.removedAt)}',
                                              style: const TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight:
                                                      FontWeight.w600,
                                                  color:
                                                      AppDesign.inkMuted),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton.icon(
                                        onPressed: () async {
                                          await _restore(r.key);
                                          setSheet(() {});
                                        },
                                        icon: const Icon(Icons.restore,
                                            size: 16),
                                        label: const Text('Restore',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                    FontWeight.w800)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
    // The sheet can restore rows, so the page behind it has to catch up.
    if (mounted) _loadRemoved();
  }

  static String _ago(DateTime t) {
    final d = DateTime.now().difference(t);
    if (d.inMinutes < 1) return 'just now';
    if (d.inHours < 1) return '${d.inMinutes}m ago';
    if (d.inDays < 1) return '${d.inHours}h ago';
    return '${d.inDays}d ago';
  }

  /// The banner shown while remove mode is on.
  ///
  /// Without it the screen would be lying: rows would be missing with nothing
  /// to say why. It is also the only way out that does not require knowing
  /// the gesture.
  Widget _buildModeBanner() {
    if (!_removeMode) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      color: AppDesign.danger.withOpacity(0.10),
      padding: const EdgeInsets.fromLTRB(12, 7, 6, 7),
      child: Row(
        children: [
          const Icon(Icons.delete_outline, size: 16, color: AppDesign.danger),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Remove mode · tap the bin on a row',
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.danger),
            ),
          ),
          if (_removedKeys.isNotEmpty)
            TextButton(
              style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  foregroundColor: AppDesign.danger),
              onPressed: _openRecycleBin,
              child: Text('Bin (${_removedKeys.length})',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800)),
            ),
          TextButton(
            style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                foregroundColor: AppDesign.danger),
            onPressed: () => setState(() => _removeMode = false),
            child: const Text('Done',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }

  /// The per-row bin button, shown only in remove mode.
  Widget _rowModeButton(String key, String label, String kind) => IconButton(
        tooltip: 'Remove from the list',
        visualDensity: VisualDensity.compact,
        icon: const Icon(Icons.delete_outline,
            size: 20, color: AppDesign.danger),
        onPressed: () => _confirmRemove(key, label, kind),
      );

  Future<void> _load() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    _cloudSpin
      ..reset()
      ..forward();
    try {
      final list = await isar.quotations
          .filter()
          .isSyncedEqualTo(false)
          .findAll();
      final picks =
          await isar.pickLists.filter().isSyncedEqualTo(false).findAll();
      final packs =
          await isar.packLists.filter().isSyncedEqualTo(false).findAll();
      final adjustments = await _adjService.unsynced();

      // Resolve assignee names once for the rows.
      final dir = UserDirectoryService();
      final ids = <int>{
        ...picks.map((e) => e.assignedTo).whereType<int>(),
        ...packs.map((e) => e.assignedTo).whereType<int>(),
      };
      for (final id in ids) {
        _assignee[id] = await dir.nameFor(id);
      }

      if (!mounted) return;
      setState(() {
        _unsynced = list;
        _picks = picks;
        _packs = packs;
        _adjustments = adjustments;
        // Drop any selections that no longer exist
        _selected.retainWhere((id) => list.any((q) => q.id == id));
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load: $e')),
      );
    }
  }

  // ─── Upload handlers ───

  Future<void> _uploadSelectedOrAll() async {
    if (_isUploading) return;
    if (_visibleQuotes.isEmpty) return;

    // Hidden rows are excluded. A row is normally hidden because it keeps
    // failing, so including it in every "upload all" would go on producing
    // errors for something that is not on screen to explain them.
    final selectedQuotes = _selected.isEmpty
        ? _visibleQuotes
        : _visibleQuotes.where((q) => _selected.contains(q.id)).toList();
    if (selectedQuotes.isEmpty) return;

    await _runUpload(selectedQuotes);
  }

  Future<void> _uploadOne(Quotation q) async {
    if (_isUploading) return;
    await _runUpload([q]);
  }

  Future<void> _runUpload(List<Quotation> quotes) async {
    setState(() => _isUploading = true);
    try {
      final results = await _quotationService.syncQuotationsByPreLabels(
        quotes.map((q) => q.quotePreLabel).toList(),
      );
      await _load();
      if (!mounted) return;
      setState(() {
        _lastTotal = results['total'] as int?;
        _lastSynced = results['synced'] as int?;
        _lastSkipped = results['skipped'] as int?;
        _lastFailed = results['failed'] as int?;
        _selected.clear();
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor:
              (_lastFailed ?? 0) > 0 ? Colors.orange : Colors.green,
          content: Text(
            'Uploaded ${_lastSynced ?? 0} of ${_lastTotal ?? 0}'
            '${(_lastFailed ?? 0) > 0 ? "  (${_lastFailed} failed)" : ""}',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isUploading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Upload failed: $e'),
        ),
      );
    }
  }

  // ─── PDF regeneration ───

  Future<void> _regeneratePdf(Quotation q) async {
    try {
      await QuotationPdfService().regenerateAndPreview(q);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('PDF generation failed: $e'),
        ),
      );
    }
  }

  // ─── Selection helpers ───

  void _toggleSelect(Quotation q) {
    setState(() {
      if (_selected.contains(q.id)) {
        _selected.remove(q.id);
      } else {
        _selected.add(q.id);
      }
    });
  }

  void _selectAll() {
    setState(() {
      _selected
        ..clear()
        ..addAll(_visibleQuotes.map((q) => q.id));
    });
  }

  void _clearSelection() {
    setState(() => _selected.clear());
  }

  // ─── Build ───

  @override
  Widget build(BuildContext context) {
    final allSelected =
        _selected.length == _visibleQuotes.length && _visibleQuotes.isNotEmpty;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: GestureDetector(
          // Opaque so taps land on the whole title area, not just the glyphs.
          behavior: HitTestBehavior.opaque,
          onTap: _onTitleTap,
          onLongPressStart: (_) => _onTitleHoldStart(),
          onLongPressEnd: (_) => _onTitleHoldEnd(),
          onLongPressCancel: _onTitleHoldEnd,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Pending Uploads',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.ink)),
              // Only ever visible once a mode is on, so the gesture stays
              // undiscoverable until someone is told about it.
              if (_removeMode) ...[
                const SizedBox(width: 6),
                const Icon(Icons.delete_outline,
                    size: 15, color: AppDesign.danger),
              ],
            ],
          ),
        ),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
        actions: [
          if (_visibleQuotes.isNotEmpty && _tabs.index == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: TextButton(
                onPressed: allSelected ? _clearSelection : _selectAll,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(allSelected ? 'Clear' : 'Select all'),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reload',
            onPressed: _isLoading ? null : _load,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          _segmented(),
          const Divider(height: 1, color: AppDesign.border),
          Expanded(
            child: TabBarView(
          controller: _tabs,
          children: [
            Column(
              children: [
                _buildModeBanner(),
                _buildSummaryCard(),
                const SizedBox(height: 8),
                Expanded(child: _buildList()),
                if (_lastTotal != null) _buildLastRunSummary(),
              ],
            ),
            _docTab(
              rows: _visiblePicks,
              removedKeyOf: _keyOfPick,
              kindLabel: 'Pick',
              label: (p) => p.pickPreLabel ?? '—',
              subtitle: (p) =>
                  '${p.totalPickItem ?? 0} items · qty ${(p.totalPickQty ?? 0).toStringAsFixed(0)}',
              assignedTo: (p) => p.assignedTo,
              icon: Icons.shelves,
              colour: AppDesign.modPicking,
              busy: _busyPick,
              emptyText: 'All picks are uploaded.',
              onUploadAll: _uploadAllPicks,
              onUploadOne: (p) => _uploadPicks([p]),
            ),
            _docTab(
              rows: _visiblePacks,
              removedKeyOf: _keyOfPack,
              kindLabel: 'Pack',
              label: (p) => p.packPreLabel ?? '—',
              subtitle: (p) =>
                  '${p.totalPackItem ?? 0} items · qty ${(p.totalPackQty ?? 0).toStringAsFixed(0)}',
              assignedTo: (p) => p.assignedTo,
              icon: Icons.inventory_2,
              colour: AppDesign.modPacking,
              busy: _busyPack,
              emptyText: 'All packs are uploaded.',
              onUploadAll: _uploadAllPacks,
              onUploadOne: (p) => _uploadPacks([p]),
            ),
            _docTab(
              rows: _visibleAdjustments,
              removedKeyOf: _keyOfAdjustment,
              kindLabel: 'Credit note',
              label: (a) => a.preLabel,
              subtitle: (a) =>
                  '${a.adjustmentDescription ?? a.adjustment}'
                  '${(a.partyName ?? '').isEmpty ? '' : ' · ${a.partyName}'}'
                  '${a.isProvisional ? '  ·  number assigned on upload' : ''}',
              assignedTo: (a) => a.addedBy,
              icon: Icons.receipt_long,
              colour: AppDesign.modCreditNote,
              busy: _busyAdj,
              emptyText: 'No credit notes waiting.',
              onUploadAll: _uploadAllAdjustments,
              onUploadOne: (a) => _uploadAdjustments([a]),
              onReprint: _reprintAdjustment,
            ),
          ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: _tabs.index == 0 ? _buildBottomBar() : null,
    );
  }


  // ─────────────── Pick / Pack pending tabs ────────────────

  /// Shared list body for the Picks and Packs tabs.
  Widget _docTab<T>({
    required List<T> rows,
    required String Function(T) label,
    required String Function(T) subtitle,
    required int? Function(T) assignedTo,
    required IconData icon,
    required Color colour,
    required bool busy,
    required String emptyText,
    required Future<void> Function() onUploadAll,
    required Future<void> Function(T) onUploadOne,
    /// Supplied by the pick and pack tabs so a row can be removed without
    /// this generic builder knowing what kind of document it holds.
    String Function(T)? removedKeyOf,
    String kindLabel = 'Document',
    /// Supplied by the CN tab. Quotations get the same action from their own
    /// row menu; picks and packs have no printed form to reproduce.
    Future<void> Function(T)? onReprint,
  }) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());
    if (rows.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_done_outlined, size: 48, color: Colors.green),
            const SizedBox(height: 8),
            const Text('Nothing pending', style: AppDesign.body),
            const SizedBox(height: 2),
            Text(emptyText, style: AppDesign.caption),
          ],
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
          child: SizedBox(
            height: 38,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: busy ? null : onUploadAll,
              icon: busy
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.cloud_upload_outlined, size: 16),
              label: Text(busy ? 'Uploading…' : 'Upload all (${rows.length})',
                  style:
                      const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
              style: ElevatedButton.styleFrom(
                backgroundColor: colour,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _load,
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemCount: rows.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, i) {
                final r = rows[i];
                final who = assignedTo(r);
                return Container(
                  decoration: BoxDecoration(
                    color: AppDesign.surface,
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
                            color: colour,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(AppDesign.radiusSm)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 8, 4, 8),
                            child: Row(
                              children: [
                                Icon(icon, size: 16, color: colour),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(label(r),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: AppDesign.ink,
                                              height: 1.1),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                      const SizedBox(height: 3),
                                      Text(subtitle(r),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: AppDesign.ink)),
                                      const SizedBox(height: 2),
                                      Row(children: [
                                        Icon(Icons.person_outline,
                                            size: 11,
                                            color: who == null
                                                ? AppDesign.inkSubtle
                                                : AppDesign.inkMuted),
                                        const SizedBox(width: 3),
                                        Flexible(
                                          child: Text(
                                            who == null
                                                ? 'Unassigned'
                                                : (_assignee[who] ??
                                                    'User $who'),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: AppDesign.inkMuted),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                                if (_removeMode && removedKeyOf != null)
                                  _rowModeButton(
                                      removedKeyOf(r), label(r), kindLabel)
                                else ...[
                                  if (onReprint != null)
                                    IconButton(
                                      tooltip: 'Reprint',
                                      visualDensity: VisualDensity.compact,
                                      icon: Icon(Icons.print_outlined,
                                          size: 19, color: colour),
                                      onPressed: () => onReprint(r),
                                    ),
                                  IconButton(
                                    tooltip: 'Upload now',
                                    icon: Icon(Icons.cloud_upload_outlined,
                                        size: 20, color: colour),
                                    onPressed:
                                        busy ? null : () => onUploadOne(r),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Removed rows are excluded, like the quotation tab: a row is normally
  // removed because it keeps failing, and re-sending it every run would go
  // on producing errors for something not on screen to explain them.
  Future<void> _uploadAllPicks() => _uploadPicks(_visiblePicks);

  Future<void> _uploadPicks(List<PickList> rows) async {
    final labels = rows.map((e) => e.pickPreLabel).whereType<String>().toList();
    if (labels.isEmpty) return;
    setState(() => _busyPick = true);
    try {
      final svc = PickService();
      final r = await svc.syncPicksByPreLabels(labels);
      await _load();
      if (!mounted) return;
      final ok = (r['synced'] ?? 0);
      final failed = (r['failed'] ?? 0);
      final firstErr =
          svc.lastErrors.values.isNotEmpty ? svc.lastErrors.values.first : null;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: failed == 0 ? AppDesign.success : AppDesign.danger,
        duration: Duration(seconds: failed == 0 ? 2 : 5),
        content: Text(failed == 0
            ? 'Uploaded $ok pick(s)'
            : 'Uploaded $ok, failed $failed${firstErr != null ? " — $firstErr" : ""}'),
      ));
    } finally {
      if (mounted) setState(() => _busyPick = false);
    }
  }

  Future<void> _uploadAllPacks() => _uploadPacks(_visiblePacks);

  /// Rebuilds a credit note's report from what is stored.
  ///
  /// Works before and after upload: a queued note prints its provisional
  /// number, an uploaded one prints the number the server gave it — whichever
  /// the row is currently carrying.
  Future<void> _reprintAdjustment(Adjustment a) async {
    try {
      await AdjustmentPdfService().shareFor(a);
    } catch (e) {
      if (!mounted) return;
      _toast('Report failed: $e');
    }
  }

  Future<void> _uploadAllAdjustments() =>
      _uploadAdjustments(_visibleAdjustments);

  /// Sends credit notes one at a time.
  ///
  /// Not batched: each one takes a document number out of the legacy running
  /// sequence, and a partial failure has to leave the ones that succeeded
  /// numbered and the rest untouched.
  Future<void> _uploadAdjustments(List<Adjustment> rows) async {
    if (_busyAdj || rows.isEmpty) return;
    setState(() => _busyAdj = true);
    final result = await _adjService.uploadAll(rows);
    await _load();
    if (!mounted) return;
    setState(() => _busyAdj = false);
    // The real document numbers are only known now, and they are what gets
    // quoted to the customer — so they are shown once, plainly, rather than
    // left to be discovered in a list.
    await CnResultDialog.show(context,
        uploaded: result.uploaded, error: result.error);
  }


  Future<void> _uploadPacks(List<PackList> rows) async {
    final labels = rows.map((e) => e.packPreLabel).whereType<String>().toList();
    if (labels.isEmpty) return;
    setState(() => _busyPack = true);
    try {
      final svc = PackService();
      final r = await svc.syncPacksByPreLabels(labels);
      await _load();
      if (!mounted) return;
      final ok = (r['synced'] ?? 0);
      final failed = (r['failed'] ?? 0);
      final firstErr =
          svc.lastErrors.values.isNotEmpty ? svc.lastErrors.values.first : null;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: failed == 0 ? AppDesign.success : AppDesign.danger,
        duration: Duration(seconds: failed == 0 ? 2 : 5),
        content: Text(failed == 0
            ? 'Uploaded $ok pack(s)'
            : 'Uploaded $ok, failed $failed${firstErr != null ? " — $firstErr" : ""}'),
      ));
    } finally {
      if (mounted) setState(() => _busyPack = false);
    }
  }


  /// Compact segmented tabs — same language as the Picking / Packing hubs.
  Widget _segmented() {
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.border),
        ),
        child: Row(children: [
          _segBtn('Quotations', _visibleQuotes.length, 0, AppDesign.accent),
          _segBtn('Picks', _visiblePicks.length, 1, AppDesign.modPicking),
          _segBtn('Packs', _visiblePacks.length, 2, AppDesign.modPacking),
          _segBtn('CN', _visibleAdjustments.length, 3, AppDesign.modCreditNote),
        ]),
      ),
    );
  }

  Widget _segBtn(String label, int count, int index, Color colour) {
    final selected = _tabs.index == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _tabs.animateTo(index)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(vertical: 6),
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
          child: Text('$label  $count',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                color: selected ? colour : AppDesign.inkMuted,
              )),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    final count = _visibleQuotes.length;
    final ok = count == 0;
    final selN = _selected.length;
    final c = ok ? AppDesign.success : AppDesign.accent;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: c.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: c.withOpacity(0.14),
              borderRadius: BorderRadius.circular(6),
            ),
            child: RotationTransition(
              turns: _cloudSpin,
              child: Icon(
                ok ? Icons.cloud_done_outlined : Icons.cloud_upload_outlined,
                size: 17,
                color: c,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ok ? 'All caught up' : '$count pending',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w800, color: c),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 1),
                Text(
                  ok
                      ? 'No quotations awaiting upload.'
                      : selN > 0
                          ? '$selN selected of $count'
                          : 'Tap to select · long-press for actions',
                  style: const TextStyle(
                      fontSize: 11, color: AppDesign.inkMuted),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// The three lists as the screen shows them: everything except what has
  /// been removed. Every count, tab badge and upload action reads these, never
  /// the raw lists — a segment reading "Picks 1" over an empty tab is exactly
  /// the mismatch this screen exists to avoid.
  List<Quotation> get _visibleQuotes => _visible(_unsynced, _keyOfQuote);
  List<PickList> get _visiblePicks => _visible(_picks, _keyOfPick);
  List<PackList> get _visiblePacks => _visible(_packs, _keyOfPack);
  List<Adjustment> get _visibleAdjustments =>
      _visible(_adjustments, _keyOfAdjustment);

  Widget _buildList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_visibleQuotes.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_done_outlined, size: 48, color: Colors.green),
            const SizedBox(height: 8),
            const Text('Nothing pending', style: AppDesign.body),
            const SizedBox(height: 2),
            const Text('All quotations are synced with the server.',
                style: AppDesign.caption),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      itemCount: _visibleQuotes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => _buildRow(_visibleQuotes[index]),
    );
  }

  Widget _buildRow(Quotation q) {
    final isSelected = _selected.contains(q.id);
    final hasError = q.syncError != null && q.syncError!.isNotEmpty;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _removeMode ? null : () => _toggleSelect(q),
        onLongPress: _removeMode ? null : () => _showRowActions(q),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepOrange.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? Colors.deepOrange
                  : hasError
                      ? Colors.red.shade200
                      : Colors.deepOrange.shade100,
              width: isSelected ? 2 : 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // In either mode the checkbox gives way to the hide/restore
              // control: selecting rows is for uploading them, which is not
              // what the operator is doing here.
              if (_removeMode)
                _rowModeButton(_keyOfQuote(q), q.quotePreLabel, 'Quotation')
              else
                SizedBox(
                  width: 28,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (_) => _toggleSelect(q),
                    activeColor: Colors.deepOrange,
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              const SizedBox(width: 4),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: (hasError ? Colors.red : Colors.deepOrange)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  hasError ? Icons.error_outline : Icons.schedule,
                  size: 20,
                  color: hasError
                      ? Colors.red.shade700
                      : Colors.deepOrange.shade700,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      q.quotePreLabel,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            q.customer ?? 'No customer',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'RM ${(q.netAmount ?? 0).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                      ],
                    ),
                    if (hasError) ...[
                      const SizedBox(height: 4),
                      Text(
                        q.syncError!,
                        style: TextStyle(
                            fontSize: 11, color: Colors.red.shade700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, size: 20),
                onPressed: () => _showRowActions(q),
                tooltip: 'Actions',
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRowActions(Quotation q) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf,
                  color: Colors.deepOrange.shade700),
              title: const Text('Regenerate PDF'),
              subtitle: Text(q.quotePreLabel,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              onTap: () async {
                Navigator.pop(context);
                await _regeneratePdf(q);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.cloud_upload, color: Colors.green.shade700),
              title: const Text('Upload now'),
              subtitle: Text('Just this quotation',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              onTap: () async {
                Navigator.pop(context);
                await _uploadOne(q);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    final selN = _selected.length;
    final total = _visibleQuotes.length;
    final label = selN > 0
        ? 'Upload Selected ($selN)'
        : total > 0
            ? 'Upload All ($total)'
            : 'Nothing to upload';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 48,
          child: ElevatedButton.icon(
            onPressed: total == 0 || _isUploading ? null : _uploadSelectedOrAll,
            icon: _isUploading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  )
                : const Icon(Icons.cloud_upload),
            label: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _isUploading ? 'Uploading...' : label,
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLastRunSummary() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statChip('Total', _lastTotal ?? 0, Colors.blue),
          _statChip('Synced', _lastSynced ?? 0, Colors.green),
          _statChip('Skipped', _lastSkipped ?? 0, Colors.orange),
          _statChip('Failed', _lastFailed ?? 0, Colors.red),
        ],
      ),
    );
  }

  Widget _statChip(String label, int value, Color color) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$value',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
