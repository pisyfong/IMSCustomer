import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/quotation.dart';
import '../services/quotation_pdf_service.dart';
import '../services/quotation_service.dart';
import '../services/signalr_service.dart';

/// Lists locally-created quotations that haven't been uploaded to the server.
/// Supports per-row "Regenerate PDF" + "Upload now", and multi-select for
/// "Upload Selected (N)" / "Upload All".
class PendingUploadsPage extends StatefulWidget {
  const PendingUploadsPage({super.key});

  @override
  State<PendingUploadsPage> createState() => _PendingUploadsPageState();
}

class _PendingUploadsPageState extends State<PendingUploadsPage>
    with RouteAware, SingleTickerProviderStateMixin {
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

  // Last-run summary stats
  int? _lastTotal;
  int? _lastSynced;
  int? _lastSkipped;
  int? _lastFailed;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    _cloudSpin.dispose();
    super.dispose();
  }

  /// Called when this page is pushed onto the navigator.
  @override
  void didPush() => _load();

  /// Called when the route above this one is popped (we become visible again).
  @override
  void didPopNext() => _load();

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
      if (!mounted) return;
      setState(() {
        _unsynced = list;
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
    if (_unsynced.isEmpty) return;

    final selectedQuotes = _selected.isEmpty
        ? _unsynced
        : _unsynced.where((q) => _selected.contains(q.id)).toList();
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
        ..addAll(_unsynced.map((q) => q.id));
    });
  }

  void _clearSelection() {
    setState(() => _selected.clear());
  }

  // ─── Build ───

  @override
  Widget build(BuildContext context) {
    final allSelected =
        _selected.length == _unsynced.length && _unsynced.isNotEmpty;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Pending Uploads'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        actions: [
          if (_unsynced.isNotEmpty)
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
        child: Column(
          children: [
            _buildSummaryCard(),
            const SizedBox(height: 8),
            Expanded(child: _buildList()),
            if (_lastTotal != null) _buildLastRunSummary(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSummaryCard() {
    final count = _unsynced.length;
    final ok = count == 0;
    final selN = _selected.length;
    final narrow = MediaQuery.of(context).size.width < 360;

    return Container(
      margin: EdgeInsets.fromLTRB(narrow ? 8 : 12, 12, narrow ? 8 : 12, 0),
      padding: EdgeInsets.all(narrow ? 12 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: ok
              ? [Colors.green.shade400, Colors.green.shade600]
              : [Colors.deepOrange.shade400, Colors.deepOrange.shade700],
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: (ok ? Colors.green : Colors.deepOrange).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: narrow ? 44 : 56,
            height: narrow ? 44 : 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: RotationTransition(
              turns: _cloudSpin,
              child: Icon(
                ok ? Icons.cloud_done_outlined : Icons.cloud_upload_outlined,
                size: narrow ? 24 : 32,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: narrow ? 10 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ok ? 'All caught up' : '$count pending',
                  style: TextStyle(
                    fontSize: narrow ? 18 : 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  ok
                      ? 'No quotations awaiting upload.'
                      : selN > 0
                          ? '$selN selected of $count'
                          : 'Tap to select • long-press for actions',
                  style: TextStyle(
                    fontSize: narrow ? 11 : 13,
                    color: Colors.white.withOpacity(0.92),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_unsynced.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,
                size: 64, color: Colors.green.shade400),
            const SizedBox(height: 12),
            Text(
              'Nothing to upload',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'All quotations are synced with the server.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      itemCount: _unsynced.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) => _buildRow(_unsynced[index]),
    );
  }

  Widget _buildRow(Quotation q) {
    final isSelected = _selected.contains(q.id);
    final hasError = q.syncError != null && q.syncError!.isNotEmpty;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _toggleSelect(q),
        onLongPress: () => _showRowActions(q),
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
    final total = _unsynced.length;
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
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
