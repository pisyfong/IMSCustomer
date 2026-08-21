import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../main.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/quote.dart';
import '../models/customer.dart';
import '../services/auth_service.dart';
import '../services/customer_label.dart';
import '../services/location_service.dart';
import '../services/user_directory_service.dart';
import '../services/base_inventory_sync_service.dart';
import '../services/base_transaction_sync_service.dart';
import '../services/pick_service.dart';
import '../theme/app_design.dart';
import '../widgets/app_nav_drawer.dart';
import 'barcode_scanner_page.dart';
import 'pick_detail_page.dart';

/// Picking hub.
///
/// Three tabs:
///  * **Assigned** — pick lists that came from the server (isSynced=true) and
///    aren't completed/cancelled yet. Picker opens one to work on it.
///  * **My picks** — locally-created pick lists (isSynced=false) still open.
///  * **Completed** — anything with status = 'C' or 'X'.
///
/// FAB on the two open tabs → create a fresh empty pick list, land on detail.
class PickingPage extends StatefulWidget {
  const PickingPage({super.key});

  @override
  State<PickingPage> createState() => _PickingPageState();
}

class _PickingPageState extends State<PickingPage>
    with SingleTickerProviderStateMixin {
  final _authService = AuthService();
  late TabController _tabs;
  int? _companyCode;
  int? _userId;
  String? _locationCode;

  bool _loading = true;
  bool _refreshing = false;
  final Set<int> _uploadingIds = <int>{}; // pick.id currently uploading

  List<PickList> _open = [];
  List<PickList> _completed = [];

  /// assignedTo -> display name, for the list rows.
  final Map<int, String> _assigneeNames = {};

  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this)
      ..addListener(() { if (mounted) setState(() {}); });
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text.trim().toLowerCase());
    });
    _init();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _tabs.dispose();
    super.dispose();
  }


  /// Doc label -> the customers behind it (resolved through its source SQs).
  /// A document can span several SQs, so this is a set.
  final Map<String, List<String>> _docCustomers = {};

  /// Rows whose customer chips the user expanded.
  final Set<int> _custExpanded = <int>{};

  Future<void> _loadCustomers(List<PickList> docs) async {
    final cc = _companyCode;
    if (cc == null || docs.isEmpty) return;
    final labels =
        docs.map((e) => e.pickPreLabel).whereType<String>().toSet().toList();
    if (labels.isEmpty) return;

    // doc -> source SQ labels
    final items = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(labels, (q, l) => q.pickPreLabelEqualTo(l))
        .findAll();
    final sqOf = <String, Set<String>>{};
    for (final it in items) {
      final doc = it.pickPreLabel;
      final sq = it.parentPreLabel;
      if (doc == null || sq == null || sq.isEmpty) continue;
      sqOf.putIfAbsent(doc, () => <String>{}).add(sq);
    }
    if (sqOf.isEmpty) return;

    // SQ -> customer code
    final allSqs = sqOf.values.expand((e) => e).toSet().toList();
    final quotes = await isar.quotes
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(allSqs, (q, l) => q.quotePreLabelEqualTo(l))
        .findAll();
    final custOfSq = <String, String>{};
    for (final q in quotes) {
      final l = q.quotePreLabel;
      final c = q.customer;
      if (l != null && c != null && c.isNotEmpty) custOfSq[l] = c;
    }

    // customer code -> name
    final codes = custOfSq.values.toSet().toList();
    final names = <String, String>{};
    if (codes.isNotEmpty) {
      final rows = await isar.customers
          .filter()
          // Code-only, NOT scoped by company. AR_Customer is partitioned by
          // Company_Code, but the documents that reference a customer are not:
          // of the 795 customer codes appearing on quotes, only 246 exist
          // under company 1 while 794 exist under some company. Scoping this
          // lookup silently drops the name for two thirds of rows and the
          // screen falls back to a bare code.
          .anyOf(codes, (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final r in rows) {
        names[r.code] = (r.name ?? '').trim();
      }
    }

    _docCustomers.clear();
    sqOf.forEach((doc, sqs) {
      final out = <String>{};
      for (final sq in sqs) {
        final code = custOfSq[sq];
        if (code == null) continue;
        // One house style for a customer everywhere — the hub rows used to
        // spell it 'CODE — NAME' while the detail pages said 'CODE - NAME'.
        out.add(CustomerLabel.format(code, names[code]));
      }
      if (out.isNotEmpty) _docCustomers[doc] = out.toList()..sort();
    });
  }

  /// Customer chips for a row. Collapses to the first chip + "+N" when the
  /// document spans several customers; tap the badge to expand in place.
  // ── Sorting ──
  /// 0 = added date, 1 = pick date, 2 = last modified.
  int _sortBy = 0;
  bool _sortDesc = true;

  static const List<(String, int)> _sortOptions = [
      const ('Added date', 0),
      const ('Pick date', 1),
      const ('Last modified', 2),
  ];

  String get _sortLabel =>
      _sortOptions.firstWhere((o) => o.$2 == _sortBy, orElse: () => _sortOptions.first).$1;

  DateTime? _sortKey(PickList p) {
    switch (_sortBy) {
      case 1:
        return p.pickDate ?? p.addedDate;
      case 2:
        return p.lastWriteTimeStamp;
      default:
        return p.addedDate;
    }
  }

  List<PickList> _applySort(List<PickList> rows) {
    final out = [...rows];
    out.sort((a, b) {
      final da = _sortKey(a);
      final db = _sortKey(b);
      if (da == null && db == null) return 0;
      if (da == null) return 1; // undated sinks to the bottom either way
      if (db == null) return -1;
      return _sortDesc ? db.compareTo(da) : da.compareTo(db);
    });
    return out;
  }

  Future<void> _openSortSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Sort by',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ),
            ),
            for (final o in _sortOptions)
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
                        color: _sortBy == o.$2 ? AppDesign.modPicking : AppDesign.ink)),
                trailing: _sortBy == o.$2
                    ? Icon(Icons.check, size: 18, color: AppDesign.modPicking)
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
                  color: AppDesign.modPicking),
              title: Text(_sortDesc ? 'Newest first' : 'Oldest first',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  // ── Quick filters ──
  bool _fMine = false;
  bool _fUnassigned = false;
  bool _fUnsynced = false;
  bool _fToday = false;

  bool get _anyFilter => _fMine || _fUnassigned || _fUnsynced || _fToday;

  void _clearFilters() => setState(() {
        _fMine = false;
        _fUnassigned = false;
        _fUnsynced = false;
        _fToday = false;
      });

  /// Search + quick filters. Filters AND together; Mine / Unassigned are
  /// mutually exclusive (selecting one clears the other).
  List<PickList> _filter(List<PickList> rows) {
    var out = rows;
    // Location scoping: only documents for the location being worked in.
    // Documents with no location are always shown — they'd otherwise be
    // invisible and unfixable.
    final loc = _locationCode;
    if (loc != null && loc.isNotEmpty) {
      // Via LocationService.inScope, never a raw ==.
      //
      // PI_Company_Location.Location_Code is char(3), so short codes arrive
      // blank-padded ('AA ', 'YT ') while the selected code is trimmed. A raw
      // comparison therefore failed for every 1- and 2-character location,
      // hiding documents here that the dashboard — which already went through
      // inScope — was happily listing. One filter, one definition.
      out = out
          .where((p) => LocationService.inScope(p.locationCode, loc))
          .toList();
    }
    if (_fMine) {
      out = out.where((p) => p.assignedTo != null && p.assignedTo == _userId).toList();
    }
    if (_fUnassigned) {
      out = out.where((p) => p.assignedTo == null).toList();
    }
    if (_fUnsynced) {
      out = out.where((p) => !p.isSynced).toList();
    }
    if (_fToday) {
      final n = DateTime.now();
      out = out.where((p) {
        final d = p.pickDate ?? p.addedDate;
        return d != null && d.year == n.year && d.month == n.month && d.day == n.day;
      }).toList();
    }
    if (_query.isNotEmpty) {
      out = out.where((p) {
        final l = (p.pickPreLabel ?? '').toLowerCase();
        final loc = (p.locationCode ?? '').toLowerCase();
        // Also match the customer(s) behind the document.
        final cust = (_docCustomers[p.pickPreLabel ?? ''] ?? const <String>[])
            .join(' ')
            .toLowerCase();
        return l.contains(_query) ||
            loc.contains(_query) ||
            cust.contains(_query);
      }).toList();
    }
    return _applySort(out);
  }

  Future<void> _scanCode() async {
    final code = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const BarcodeScannerPage()),
    );
    if (code == null || code.isEmpty || !mounted) return;
    await _dispatchCode(code);
    // A scan shouldn't leave the raw code lingering in the search box.
    if (mounted) _searchCtrl.clear();
  }

  /// Resolves a raw code (scanned or typed) in this order:
  ///   1. Existing pick list  → open its detail page.
  ///   2. Sales quote         → create a draft pick and jump into the
  ///                            "From SQ" flow pre-navigated to that SQ.
  ///   3. Nothing             → drop into the search field as a filter.
  Future<void> _dispatchCode(String code) async {
    if (!mounted) return;
    final trimmed = code.trim();
    if (trimmed.isEmpty) return;

    final asLower = trimmed.toLowerCase();
    final pickMatch = [..._open, ..._completed].firstWhere(
      (p) => (p.pickPreLabel ?? '').toLowerCase() == asLower,
      orElse: PickList.new,
    );
    if (pickMatch.pickPreLabel != null) {
      _searchCtrl.clear();
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PickDetailPage(pick: pickMatch)),
      );
      await _loadLocal();
      return;
    }

    if (_companyCode != null) {
      final sq = await isar.quotes
          .filter()
          .companyCodeEqualTo(_companyCode)
          .and()
          .quotePreLabelEqualTo(trimmed)
          .findFirst();
      if (sq != null && mounted) {
        _searchCtrl.clear();
        await _openDraftForSq(sq);
        return;
      }
    }

    _searchCtrl.text = trimmed;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No pick or SQ matches "$trimmed" — filtered')),
    );
  }

  Future<void> _openDraftForSq(Quote sq) async {
    if (_companyCode == null) return;
    // Pick number is minted on Save, so abandoning the draft doesn't burn one.
    final now = DateTime.now();
    final draft = PickList()
      ..companyCode = _companyCode
      ..pickDate = now
      ..status = 'A'
      ..batchCount = 1
      ..totalPickQty = 0
      ..totalPickItem = 0
      ..addedBy = _userId
      ..addedDate = now
      ..lastModifiedBy = _userId
      ..lastWriteTimeStamp = now
      ..locationCode = _locationCode
      ..assignedTo = _userId // defaults to the creating user
      ..isSynced = false;
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PickDetailPage(
          pick: draft,
          draft: true,
          initialSqPreLabel: sq.quotePreLabel,
        ),
      ),
    );
    await _loadLocal();
  }

  /// Upload a single pick from its row button.
  Future<void> _uploadOne(PickList p) async {
    final label = p.pickPreLabel;
    if (label == null || _uploadingIds.contains(p.id)) return;
    setState(() => _uploadingIds.add(p.id));
    try {
      final svc = PickService();
      final r = await svc.syncPicksByPreLabels([label]);
      await _loadLocal();
      if (!mounted) return;
      final ok = (r['synced'] ?? 0) > 0;
      final err = svc.lastErrors[label];
      // A successful upload can still have dropped lines that were deleted
      // elsewhere — say so, or they just vanish off the screen.
      final notice = svc.lastNotices[label];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // A notice means the upload worked but the server dropped lines
          // deleted elsewhere — amber, and held longer so it's readable.
          backgroundColor: !ok
              ? AppDesign.danger
              : (notice == null ? AppDesign.success : AppDesign.warning),
          duration: Duration(seconds: (ok && notice == null) ? 2 : 5),
          content: Text(ok
              ? (notice == null ? 'Uploaded $label' : 'Uploaded $label — $notice')
              : (err ?? 'Upload failed — check connection')),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: AppDesign.danger,
              content: Text('Upload failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _uploadingIds.remove(p.id));
    }
  }

  Future<void> _init() async {
    final sel = await _authService.getSelectedCompany();
    final raw = sel?['companyCode'];
    _companyCode = raw is int ? raw : int.tryParse(raw?.toString() ?? '');
    _userId = _authService.currentUser?.userId;
    _locationCode = await LocationService().selectedCode();
    if (!mounted) return;
    setState(() {});
    await _loadLocal();
    _refreshInBackground();
  }

  Future<void> _loadLocal() async {
    if (_companyCode == null) {
      setState(() => _loading = false);
      return;
    }
    final all = await isar.pickLists
        .filter()
        .companyCodeEqualTo(_companyCode)
        .findAll();

    // Dedupe by Pick_PreLabel. Legacy rows saved with an autoIncrement id
    // can collide with the deterministic-id row from download sync — keep the
    // canonical (deterministic-id) row and purge the stragglers from Isar.
    final byLabel = <String, PickList>{};
    final stragglers = <int>[];
    for (final p in all) {
      final label = p.pickPreLabel ?? '';
      final canonicalId =
          BaseTransactionSyncService.pickListId(p.companyCode ?? 0, label);
      final existing = byLabel[label];
      if (existing == null) {
        byLabel[label] = p;
      } else {
        // Prefer the canonical-id row; drop the other.
        final keepP = p.id == canonicalId ? p : existing;
        final dropP = p.id == canonicalId ? existing : p;
        byLabel[label] = keepP;
        if (dropP.id != canonicalId) stragglers.add(dropP.id);
      }
    }
    if (stragglers.isNotEmpty) {
      await isar.writeTxn(() async {
        await isar.pickLists.deleteAll(stragglers);
      });
    }

    final open = <PickList>[];
    final completed = <PickList>[];
    for (final p in byLabel.values) {
      // Completion is server-decided and only lands on a synced pick, so a
      // fully-picked pick shows in "Picked" only after it syncs back to the DB.
      final done = p.isSynced && (p.status == 'C' || p.status == 'X');
      (done ? completed : open).add(p);
    }
    int cmp(PickList a, PickList b) {
      final ad = a.pickDate ?? a.addedDate;
      final bd = b.pickDate ?? b.addedDate;
      if (ad == null && bd == null) return 0;
      if (ad == null) return 1;
      if (bd == null) return -1;
      return bd.compareTo(ad);
    }
    open.sort(cmp);
    completed.sort(cmp);

    await _loadCustomers([...open, ...completed]);

    // Resolve assignee names for the rows (cached directory, offline-safe).
    final dir = UserDirectoryService();
    for (final id in {
      ...open.map((e) => e.assignedTo),
      ...completed.map((e) => e.assignedTo),
    }.whereType<int>()) {
      _assigneeNames[id] = await dir.nameFor(id);
    }

    if (!mounted) return;
    setState(() {
      _open = open;
      _completed = completed;
      _loading = false;
    });
  }

  Future<void> _refreshInBackground() async {
    if (_companyCode == null || _refreshing) return;
    setState(() => _refreshing = true);
    try {
      // Push local (offline) picks up first, then pull the latest down so the
      // server-assigned state reflects back.
      final up = await PickService().syncUnsyncedPicks(companyCode: _companyCode);
      if ((up['synced'] ?? 0) > 0 && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppDesign.success,
            content: Text('Uploaded ${up['synced']} pick(s)'),
          ),
        );
      }
      // Barcodes refresh in the BACKGROUND — never awaited. It is a download
      // that nothing on this screen waits for, so making the operator watch
      // it would be pure cost: a slow or unreachable server would hold up the
      // pick/pack sync they actually pressed the button for.
      //
      // Ordering only matters for the pending-barcode UPLOAD, and that lives
      // inside PickService where it is awaited before any document goes up.
      unawaited(
          BaseInventorySyncService().syncPlusOnly(companyCode: _companyCode!));
      await BaseTransactionSyncService().syncAll(companyCode: _companyCode!);
      await _loadLocal();
    } catch (e) {
      print('⚠️ PickingPage refresh failed: $e');
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  Future<void> _createEmptyPick() async {
    if (_companyCode == null) return;
    // Draft header — NOT persisted yet, and NO pick number yet: it's minted on
    // Save so backing out doesn't consume a running number.
    final now = DateTime.now();
    final draft = PickList()
      ..companyCode = _companyCode
      ..pickDate = now
      ..status = 'A'
      ..batchCount = 1
      ..totalPickQty = 0
      ..totalPickItem = 0
      ..addedBy = _userId
      ..addedDate = now
      ..lastModifiedBy = _userId
      ..lastWriteTimeStamp = now
      ..locationCode = _locationCode
      ..assignedTo = _userId // defaults to the creating user
      ..isSynced = false;
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PickDetailPage(pick: draft, draft: true)),
    );
    await _loadLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      drawer: const AppNavDrawer(current: AppSection.picking),
      appBar: AppBar(
        title: const Text('Picking',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppDesign.ink)),
        backgroundColor: AppDesign.surface,
        foregroundColor: AppDesign.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: AppDesign.border)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 21),
            tooltip: 'New pick',
            onPressed: _companyCode == null ? null : _createEmptyPick,
          ),
          IconButton(
            icon: _refreshing
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh, size: 20),
            tooltip: 'Refresh',
            onPressed: _refreshing ? null : _refreshInBackground,
          ),
        ],
      ),
      // Scanning is the job — make it the one unmissable action.
      floatingActionButton: _companyCode == null
          ? null
          : FloatingActionButton.extended(
              onPressed: _scanCode,
              backgroundColor: AppDesign.modPicking,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.qr_code_scanner, size: 20),
              label: const Text('Scan',
                  style:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
            ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _controlRow(),
                  _segmented(),
                  if (_anyFilter) _activeFilterSummary(),
                  const Divider(height: 1, color: AppDesign.border),
                  Expanded(
                    child: TabBarView(
                      controller: _tabs,
                      children: [
                        _listOrEmpty(_filter(_open), 'No pending picks',
                            'Scan a document or tap + to start one.',
                            Icons.shelves),
                        _listOrEmpty(_filter(_completed), 'Nothing picked yet',
                            'Completed and cancelled picks land here.',
                            Icons.check_circle_outline),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// Search + filter in a single band (the scan action lives in the FAB).
  Widget _controlRow() {
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: AppDesign.bg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                border: Border.all(color: AppDesign.border),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.search, size: 17, color: AppDesign.inkSubtle),
                  const SizedBox(width: 6),
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      textInputAction: TextInputAction.search,
                      onSubmitted: _companyCode == null ? null : _dispatchCode,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.ink),
                      decoration: const InputDecoration(
                        hintText: 'Search pick / SQ',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppDesign.inkSubtle),
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
                      onTap: () => _searchCtrl.clear(),
                      borderRadius: BorderRadius.circular(12),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.clear,
                            size: 15, color: AppDesign.inkSubtle),
                      ),
                    ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          // Sort — tooltip states the current order.
          Tooltip(
            message: 'Sorted by $_sortLabel (${_sortDesc ? "newest" : "oldest"} first)',
            child: Material(
            color: AppDesign.modPickingBg,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              onTap: _openSortSheet,
              child: SizedBox(
                width: 38,
                height: 38,
                child: Icon(Icons.swap_vert, size: 19, color: AppDesign.modPicking),
              ),
            ),
          ),
          ),
          const SizedBox(width: 6),
          // Filter button carries a badge with the active count.
          Material(
            color: _anyFilter ? AppDesign.modPicking : AppDesign.modPickingBg,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              onTap: _openFilterSheet,
              child: SizedBox(
                width: 38,
                height: 38,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.tune,
                        size: 19,
                        color: _anyFilter ? Colors.white : AppDesign.modPicking),
                    if (_anyFilter)
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          constraints:
                              const BoxConstraints(minWidth: 13, minHeight: 13),
                          child: Text('$_activeFilterCount',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                  color: AppDesign.modPicking)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Compact segmented tabs — same language as the detail page sub-tabs.
  Widget _segmented() {
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppDesign.bg,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.border),
        ),
        child: Row(children: [
          _segBtn('Pending', _filter(_open).length, 0),
          _segBtn('Picked', _filter(_completed).length, 1),
        ]),
      ),
    );
  }

  Widget _segBtn(String label, int count, int index) {
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
                color: selected ? AppDesign.modPicking : AppDesign.inkMuted,
              )),
        ),
      ),
    );
  }

  /// One-line reminder of what is being filtered out, with a quick clear.
  Widget _activeFilterSummary() {
    final parts = <String>[
      if (_fMine) 'Mine',
      if (_fUnassigned) 'Unassigned',
      if (_fUnsynced) 'Not uploaded',
      if (_fToday) 'Today',
    ];
    return Container(
      color: AppDesign.surface,
      padding: const EdgeInsets.fromLTRB(12, 0, 8, 8),
      child: Row(children: [
        Icon(Icons.filter_alt, size: 13, color: AppDesign.modPicking),
        const SizedBox(width: 5),
        Expanded(
          child: Text(parts.join(' · '),
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w700, color: AppDesign.modPicking),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        InkWell(
          onTap: _clearFilters,
          borderRadius: BorderRadius.circular(12),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.close, size: 14, color: AppDesign.inkMuted),
          ),
        ),
      ]),
    );
  }

  int get _activeFilterCount =>
      (_fMine ? 1 : 0) +
      (_fUnassigned ? 1 : 0) +
      (_fUnsynced ? 1 : 0) +
      (_fToday ? 1 : 0);

  Future<void> _openFilterSheet() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheet) => SafeArea(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 8, 4),
              child: Row(children: [
                const Expanded(
                  child: Text('Filters',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                ),
                if (_anyFilter)
                  TextButton(
                    onPressed: () {
                      _clearFilters();
                      setSheet(() {});
                    },
                    child: const Text('Clear all',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppDesign.danger)),
                  ),
              ]),
            ),
            _filterTile('Assigned to me', Icons.person_outline, _fMine, () {
              setState(() {
                _fMine = !_fMine;
                if (_fMine) _fUnassigned = false;
              });
              setSheet(() {});
            }),
            _filterTile('Unassigned', Icons.person_off_outlined, _fUnassigned,
                () {
              setState(() {
                _fUnassigned = !_fUnassigned;
                if (_fUnassigned) _fMine = false;
              });
              setSheet(() {});
            }),
            _filterTile('Not uploaded', Icons.cloud_upload_outlined, _fUnsynced,
                () {
              setState(() => _fUnsynced = !_fUnsynced);
              setSheet(() {});
            }),
            _filterTile('Today', Icons.today_outlined, _fToday, () {
              setState(() => _fToday = !_fToday);
              setSheet(() {});
            }),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }

  Widget _filterTile(
      String label, IconData icon, bool active, VoidCallback onTap) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Icon(icon,
          size: 19, color: active ? AppDesign.modPicking : AppDesign.inkSubtle),
      title: Text(label,
          style: TextStyle(
              fontSize: 13,
              fontWeight: active ? FontWeight.w800 : FontWeight.w600,
              color: active ? AppDesign.modPicking : AppDesign.ink)),
      trailing: Icon(
          active ? Icons.check_box_rounded : Icons.check_box_outline_blank,
          size: 20,
          color: active ? AppDesign.modPicking : AppDesign.inkSubtle),
    );
  }

  Widget _listOrEmpty(List<PickList> rows, String title, String hint, IconData icon) {
    if (rows.isEmpty) {
      // Don't claim there's nothing to do when a filter/search is hiding it.
      final filtered = _anyFilter || _query.isNotEmpty;
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(filtered ? Icons.filter_alt_off_outlined : icon,
                size: 48, color: AppDesign.inkSubtle),
            const SizedBox(height: 8),
            Text(filtered ? 'Nothing matches' : title, style: AppDesign.body),
            const SizedBox(height: 2),
            Text(filtered ? 'Try clearing the filters or search.' : hint,
                style: AppDesign.caption, textAlign: TextAlign.center),
            if (filtered) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _clearFilters();
                  _searchCtrl.clear();
                },
                child: const Text('Clear filters',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ],
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _refreshInBackground,
      child: FutureBuilder<Map<int, _DocStat>>(
        future: _lineCounts(rows),
        builder: (context, snap) {
          final stats = snap.data ?? const <int, _DocStat>{};
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            itemCount: rows.length,
            separatorBuilder: (_, __) => const SizedBox(height: 5),
            itemBuilder: (context, i) => _pickRow(rows[i], stats[rows[i].id] ?? const _DocStat(0, 0, 0)),
          );
        },
      ),
    );
  }

  Future<Map<int, _DocStat>> _lineCounts(List<PickList> rows) async {
    if (_companyCode == null || rows.isEmpty) return const {};
    final out = <int, _DocStat>{};
    for (final p in rows) {
      final items = await isar.pickListItems
          .filter()
          .companyCodeEqualTo(_companyCode)
          .and()
          .pickPreLabelEqualTo(p.pickPreLabel)
          .and()
          .not()
          .statusEqualTo('X')
          .findAll();
      double done = 0, planned = 0;
      for (final it in items) {
        done += it.pickQty ?? 0;
        planned += it.qty ?? 0;
      }
      out[p.id] = _DocStat(items.length, done, planned);
    }
    return out;
  }

  /// Drops the trailing ".0" so quantities read as whole numbers.
  String _fmtQty(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

  /// "04 AUG 26"
  String _fmtDateLong(DateTime d) {
    const m = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    final yy = (d.year % 100).toString().padLeft(2, '0');
    return '${d.day.toString().padLeft(2, "0")} ${m[d.month - 1]} $yy';
  }

  Widget _pickRow(PickList p, _DocStat st) {
    final sFg = _statusFg(p.status);
    final closed = p.status == 'C' || p.status == 'X';
    final who = p.assignedTo;
    final when = p.pickDate ?? p.addedDate;
    final custs = _docCustomers[p.pickPreLabel ?? ''] ?? const <String>[];
    final expanded = _custExpanded.contains(p.id);
    final whoName =
        who == null ? 'Unassigned' : (_assigneeNames[who] ?? 'User $who');

    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PickDetailPage(pick: p)),
          );
          await _loadLocal();
        },
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
                  width: 3,
                  decoration: BoxDecoration(
                    color: sFg,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(AppDesign.radiusSm)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 7, 8, 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ── number + assignee … progress + sync ──
                        Row(children: [
                          Expanded(
                            child: Row(children: [
                              // The document number is the identity — never
                              // truncate it; the assignee shrinks instead.
                              Text(p.pickPreLabel ?? '—',
                                  style: const TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w800,
                                      color: AppDesign.ink,
                                      height: 1.1),
                                  softWrap: false),
                              const SizedBox(width: 6),
                              Icon(Icons.person,
                                  size: 11,
                                  color: who == null
                                      ? AppDesign.inkSubtle
                                      : AppDesign.inkMuted),
                              const SizedBox(width: 2),
                              Flexible(
                                child: Text(whoName,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: AppDesign.inkMuted),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ]),
                          ),
                          if (closed)
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Text(
                                  p.status == 'X' ? 'CANCELLED' : 'DONE',
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.3,
                                      color: sFg)),
                            ),
                          _progressPill(st),
                          const SizedBox(width: 6),
                          _syncControl(p),
                        ]),
                        // ── customer ──
                        if (custs.isNotEmpty) ...[
                          const SizedBox(height: 3),
                          GestureDetector(
                            onTap: custs.length > 1
                                ? () => setState(() {
                                      if (!_custExpanded.remove(p.id)) {
                                        _custExpanded.add(p.id);
                                      }
                                    })
                                : null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Toggle sits immediately after the first name.
                                Row(children: [
                                  Flexible(
                                    child: Text(
                                      custs.first,
                                      style: const TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppDesign.info,
                                          height: 1.25),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (custs.length > 1)
                                    Text(
                                        expanded
                                            ? '  less'
                                            : '  +${custs.length - 1}',
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            color: AppDesign.info)),
                                ]),
                                // Expanded → the rest, one per line.
                                if (expanded)
                                  for (final c in custs.skip(1))
                                    Text(
                                      c,
                                      style: const TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppDesign.info,
                                          height: 1.25),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ],
                            ),
                          ),
                        ],
                        const SizedBox(height: 2),
                        // ── when · how many ──
                        Text(
                          [
                            if (when != null) _fmtDateLong(when),
                            '${st.items} item${st.items == 1 ? "" : "s"}',
                          ].join('  ·  '),
                          style: const TextStyle(
                              fontSize: 10.5, color: AppDesign.inkMuted),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
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

  /// Progress as a single glanceable pill: grey untouched, module colour in
  /// progress, green when everything is done.
  Widget _progressPill(_DocStat st) {
    final done = st.planned > 0 && st.done + 0.0001 >= st.planned;
    final none = st.done <= 0;
    final c = done
        ? AppDesign.success
        : none
            ? AppDesign.inkMuted
            : AppDesign.modPicking;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text('${_fmtQty(st.done)}/${_fmtQty(st.planned)}',
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w800, color: c)),
    );
  }

  /// Trailing per-row sync control:
  ///  * unsynced → tappable "upload" button (spinner while uploading);
  ///  * synced   → a muted "synced" indicator (not tappable).
  Widget _syncControl(PickList p) {
    final uploading = _uploadingIds.contains(p.id);

    // Sized to sit flush with the right edge, matching the "+N" badge below.
    if (uploading) {
      return const SizedBox(
        width: 26,
        height: 20,
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (p.isSynced) {
      return const Tooltip(
        message: 'Synced',
        child: SizedBox(
          width: 26,
          height: 20,
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.cloud_done_outlined,
                size: 16, color: AppDesign.success),
          ),
        ),
      );
    }

    return Tooltip(
      message: 'Upload now',
      child: Material(
        color: AppDesign.modPickingBg,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () => _uploadOne(p),
          child: const SizedBox(
            width: 26,
            height: 20,
            child: Icon(Icons.cloud_upload_outlined,
                size: 15, color: AppDesign.modPicking),
          ),
        ),
      ),
    );
  }

  Color _statusFg(String? s) {
    switch (s) {
      case 'A': return AppDesign.modPicking;
      case 'C': return AppDesign.success;
      case 'X': return AppDesign.danger;
      default: return AppDesign.inkMuted;
    }
  }
}

/// Per-document roll-up shown in a hub row.
class _DocStat {
  final int items;
  final double done;
  final double planned;
  const _DocStat(this.items, this.done, this.planned);
}
