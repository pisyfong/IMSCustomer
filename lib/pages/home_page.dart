import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/adjustment.dart';
import '../services/module_access_service.dart';
import '../services/removed_uploads_service.dart';
import '../main.dart';
import '../models/quotation.dart';
import '../models/pick_list.dart';
import '../models/app_location.dart';
import '../models/customer.dart';
import '../models/quote.dart';
import '../models/pick_list_item.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../services/auth_service.dart';
import '../services/location_service.dart';
import '../services/offline_first_service.dart';
import '../theme/app_design.dart';
import '../widgets/app_nav_drawer.dart';
import '../widgets/company_picker_sheet.dart';
import '../widgets/location_picker_sheet.dart';
import 'credit_note_page.dart';
import 'customer_selection_page.dart';
import 'pending_uploads_page.dart';
import 'picking_page.dart';
import 'pick_detail_page.dart';
import 'packing_page.dart';
import 'pack_detail_page.dart';
import 'settings_page.dart';

/// Post-login control panel.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  String _fullName = '';
  Map<String, dynamic>? _selectedCompany;
  bool _isOnline = false;
  bool _loading = true;

  int _pendingUploads = 0;
  int _openPicks = 0;
  int _openPacks = 0;

  /// Open picks / packs assigned to the signed-in user.
  List<_WorkItem> _myWork = const [];

  /// 0 = picks, 1 = packs.
  int _workTab = 0;

  AppLocation? _location;

  List<_WorkItem> get _workPicks =>
      _myWork.where((w) => w.isPick).toList();
  List<_WorkItem> get _workPacks =>
      _myWork.where((w) => !w.isPick).toList();
  bool _autoPickPromptFired = false;

  @override
  void initState() {
    super.initState();
    _loadAll();
    _loadAccess();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAll();
  }

  Future<void> _loadAll() async {
    try {
      final user = await _auth.loadSavedLogin();
      final company = await _auth.getSelectedCompany();
      final online = OfflineFirstService.isLikelyOnline();

      // Location first — the counts below are scoped by it.
      //
      // Location follows the company: keep a valid choice, else fall back to
      // the user's default (Def_Location) or their only option.
      AppLocation? loc;
      final ccRaw = company?['companyCode'];
      final cc = ccRaw is int ? ccRaw : int.tryParse(ccRaw?.toString() ?? '');
      if (cc != null) {
        loc = await LocationService().ensureSelected(cc);
      }
      final locCode = loc?.locationCode;

      int pending = 0;
      int picks = 0;
      int packs = 0;
      try {
        // Pending is deliberately NOT location-scoped. It answers "is there
        // work stuck on this device?", and hiding an unsent document because
        // the operator switched location would let it sit there unnoticed —
        // the opposite of what the badge is for.
        //
        // Rows removed on the Pending Uploads screen are excluded here too.
        // The badge and that list have to agree: a badge reading 3 over a list
        // showing nothing is the kind of mismatch that gets the whole figure
        // ignored. Nothing is deleted — the rows sit in the recycle bin and
        // come back into both the moment they are restored.
        final removed = await RemovedUploadsService().loadKeys();
        bool kept(String kind, String? preLabel) => !removed
            .contains(RemovedUploadsService.keyFor(kind, preLabel));

        pending = (await isar.quotations.filter().isSyncedEqualTo(false).findAll())
            .where((e) => kept('SQ', e.quotePreLabel))
            .length;
        pending += (await isar.pickLists.filter().isSyncedEqualTo(false).findAll())
            .where((e) => kept('PICK', e.pickPreLabel))
            .length;
        pending += (await isar.packLists.filter().isSyncedEqualTo(false).findAll())
            .where((e) => kept('PACK', e.packPreLabel))
            .length;
        // Credit notes queue the same way and belong in the same figure — a
        // CN waiting to go is work stuck on this device just as much as an
        // unsent quotation.
        pending += (await isar.adjustments.filter().isSyncedEqualTo(false).findAll())
            .where((e) => kept('ADJ', e.preLabel))
            .length;

        // Open = not completed and not cancelled (was counting unsynced,
        // which is a different thing entirely), belonging to the company AND
        // the location being worked in — the hubs already filter on both, so
        // without the company test the tile promised work the hub then refused
        // to show.
        bool isOpen(String? st) => st != 'C' && st != 'X';
        bool mine(int? docCompany) => cc == null || docCompany == cc;
        picks = (await isar.pickLists.where().findAll())
            .where((e) =>
                isOpen(e.status) &&
                mine(e.companyCode) &&
                LocationService.inScope(e.locationCode, locCode))
            .length;
        packs = (await isar.packLists.where().findAll())
            .where((e) =>
                isOpen(e.status) &&
                mine(e.companyCode) &&
                LocationService.inScope(e.locationCode, locCode))
            .length;
      } catch (_) {}

      final work = await _loadMyWork(user?.userId, cc, locCode);

      if (!mounted) return;
      setState(() {
        _myWork = work;
        _location = loc;
        _fullName = user?.fullName ?? 'User';
        _selectedCompany = company;
        _isOnline = online;
        _pendingUploads = pending;
        _openPicks = picks;
        _openPacks = packs;
        _loading = false;
      });

      // If the user has no saved company (fresh login or wiped state),
      // fire the picker once. `ensureSelected` auto-picks when only one
      // company is available.
      if (!_autoPickPromptFired && !_hasCompany) {
        _autoPickPromptFired = true;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;
          await CompanyPickerSheet.ensureSelected(context, force: false);
          if (mounted) await _loadAll();
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 18) return 'Good afternoon';
    return 'Good evening';
  }

  String get _firstName {
    final parts = _fullName.trim().split(' ');
    return parts.isEmpty ? _fullName : parts.first;
  }

  bool get _hasCompany =>
      _selectedCompany != null && _selectedCompany!['companyCode'] != null;

  Future<void> _pickCompany({bool force = true}) async {
    await CompanyPickerSheet.ensureSelected(context, force: force);
    await _loadAll();
  }

  Future<void> _requireCompany() async {
    if (_hasCompany) return;
    await CompanyPickerSheet.ensureSelected(context, force: false);
    await _loadAll();
  }

  /// Which modules this user may open. Everything is allowed until the first
  /// answer arrives — see [ModuleAccessService] for why it fails open.
  ModuleAccess _access = ModuleAccess.all;

  Future<void> _loadAccess() async {
    final a = await ModuleAccessService().load();
    if (mounted) setState(() => _access = a);
  }

  /// Explains why a tile is dead, instead of letting it look broken.
  void _denied(String module) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text('$module is not enabled for your login'),
        duration: const Duration(seconds: 2),
      ));
  }

  Future<void> _openOrdering() async {
    await _requireCompany();
    if (!_hasCompany || !mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CustomerSelectionPage(selectedCompany: _selectedCompany!),
      ),
    );
    await _loadAll();
  }

  Future<void> _openPicking() async {
    await _requireCompany();
    if (!_hasCompany || !mounted) return;
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PickingPage()));
    await _loadAll();
  }

  Future<void> _openPacking() async {
    await _requireCompany();
    if (!_hasCompany || !mounted) return;
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PackingPage()));
    await _loadAll();
  }

  Future<void> _openCreditNote() async {
    await _requireCompany();
    if (!_hasCompany || !mounted) return;
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const CreditNotePage()));
    await _loadAll();
  }

  Future<void> _openPendingUploads() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PendingUploadsPage()));
    await _loadAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDesign.bg,
      drawer: const AppNavDrawer(current: AppSection.home),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: _loadAll,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    _header(context),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_hasCompany) ...[
                            _noCompanyBanner(),
                            const SizedBox(height: 10),
                          ],
                          _statsRow(),
                          const SizedBox(height: 14),
                          if (_myWork.isNotEmpty) ...[
                            _myWorkSection(),
                            const SizedBox(height: 10),
                          ],
                          _label('MODULES'),
                          const SizedBox(height: 6),
                          _moduleGrid(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }


  /// The signed-in user's open picks and packs, newest first, with their
  /// customer and progress resolved. Capped — this is a "what's next" glance,
  /// not a full list.
  /// [locCode] scopes the list to the location being worked in, matching the
  /// hubs — otherwise tapping through from "my open work" could land on a
  /// document the hub then refuses to show.
  /// [companyCode] and [locCode] scope the list to the company and location
  /// being worked in, matching the hubs — otherwise tapping through from
  /// "my open work" lands on a document the hub then refuses to show.
  Future<List<_WorkItem>> _loadMyWork(
      int? userId, int? companyCode, String? locCode) async {
    if (userId == null) return const [];
    try {
      bool open(String? st) => st != 'C' && st != 'X';
      bool here(String? l) => LocationService.inScope(l, locCode);
      bool mine(int? c) => companyCode == null || c == companyCode;

      final picks = (await isar.pickLists
              .filter()
              .assignedToEqualTo(userId)
              .findAll())
          .where((e) =>
              open(e.status) && mine(e.companyCode) && here(e.locationCode))
          .toList();
      final packs = (await isar.packLists
              .filter()
              .assignedToEqualTo(userId)
              .findAll())
          .where((e) =>
              open(e.status) && mine(e.companyCode) && here(e.locationCode))
          .toList();
      if (picks.isEmpty && packs.isEmpty) return const [];

      // Newest first, then keep only what fits on screen.
      DateTime k(DateTime? a, DateTime? b) => a ?? b ?? DateTime(0);
      final rows = <_WorkItem>[];

      final cc = picks.isNotEmpty
          ? picks.first.companyCode
          : packs.first.companyCode;

      // ── progress + source SQs, batched per type ──
      final pickLabels =
          picks.map((e) => e.pickPreLabel).whereType<String>().toList();
      final packLabels =
          packs.map((e) => e.packPreLabel).whereType<String>().toList();
      final sqOf = <String, Set<String>>{};
      final done = <String, double>{};
      final planned = <String, double>{};

      if (cc != null && pickLabels.isNotEmpty) {
        final items = await isar.pickListItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .anyOf(pickLabels, (q, l) => q.pickPreLabelEqualTo(l))
            .findAll();
        for (final it in items) {
          if (it.status == 'X') continue;
          final l = it.pickPreLabel;
          if (l == null) continue;
          done[l] = (done[l] ?? 0) + (it.pickQty ?? 0);
          planned[l] = (planned[l] ?? 0) + (it.qty ?? 0);
          final sq = it.parentPreLabel;
          if (sq != null && sq.isNotEmpty) {
            sqOf.putIfAbsent(l, () => <String>{}).add(sq);
          }
        }
      }
      if (cc != null && packLabels.isNotEmpty) {
        final items = await isar.packListItems
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .anyOf(packLabels, (q, l) => q.packPreLabelEqualTo(l))
            .findAll();
        for (final it in items) {
          if (it.status == 'X') continue;
          final l = it.packPreLabel;
          if (l == null) continue;
          done[l] = (done[l] ?? 0) + (it.packQty ?? 0);
          planned[l] = (planned[l] ?? 0) + (it.qty ?? 0);
          final sq = it.sourceSq;
          if (sq != null && sq.isNotEmpty) {
            sqOf.putIfAbsent(l, () => <String>{}).add(sq);
          }
        }
      }

      // ── SQ -> customer name ──
      final custOf = <String, String>{};
      final allSqs = sqOf.values.expand((e) => e).toSet().toList();
      if (cc != null && allSqs.isNotEmpty) {
        final quotes = await isar.quotes
            .filter()
            .companyCodeEqualTo(cc)
            .and()
            .anyOf(allSqs, (q, l) => q.quotePreLabelEqualTo(l))
            .findAll();
        final codeOfSq = <String, String>{};
        for (final q in quotes) {
          final l = q.quotePreLabel;
          final c = q.customer;
          if (l != null && c != null && c.isNotEmpty) codeOfSq[l] = c;
        }
        final names = <String, String>{};
        final codes = codeOfSq.values.toSet().toList();
        if (codes.isNotEmpty) {
          final custs = await isar.customers
              .filter()
              // Code-only, NOT scoped by company — AR_Customer is partitioned
              // by Company_Code but the documents referencing it are not, so
              // scoping drops the name for most rows. See the picking hub.
              .anyOf(codes, (q, c) => q.codeEqualTo(c))
              .findAll();
          for (final c in custs) {
            names[c.code] = (c.name ?? '').trim();
          }
        }
        codeOfSq.forEach((sq, code) {
          final n = names[code] ?? '';
          custOf[sq] = n.isEmpty ? code : n;
        });
      }

      String customerFor(String? label) {
        final sqs = sqOf[label ?? ''] ?? const <String>{};
        final names =
            sqs.map((sq) => custOf[sq] ?? '').where((e) => e.isNotEmpty).toSet();
        if (names.isEmpty) return '';
        return names.length == 1
            ? names.first
            : '${names.first}  +${names.length - 1}';
      }

      for (final e in picks) {
        final l = e.pickPreLabel ?? '';
        rows.add(_WorkItem(
          isPick: true,
          label: l,
          customer: customerFor(l),
          done: done[l] ?? 0,
          planned: planned[l] ?? 0,
          when: k(e.pickDate, e.addedDate),
          pick: e,
        ));
      }
      for (final e in packs) {
        final l = e.packPreLabel ?? '';
        rows.add(_WorkItem(
          isPick: false,
          label: l,
          customer: customerFor(l),
          done: done[l] ?? 0,
          planned: planned[l] ?? 0,
          when: k(e.addedDate, e.lastWriteTimeStamp),
          pack: e,
        ));
      }
      rows.sort((a, b) => b.when.compareTo(a.when));
      return rows;
    } catch (_) {
      return const [];
    }
  }

  Future<void> _openWork(_WorkItem w) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => w.isPick
            ? PickDetailPage(pick: w.pick!)
            : PackDetailPage(pick: w.pack!),
      ),
    );
    await _loadAll();
  }

  Widget _myWorkSection() {
    final picks = _workPicks;
    final packs = _workPacks;
    final rows = _workTab == 0 ? picks : packs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          _label('MY OPEN WORK'),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              color: AppDesign.accentSoft,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text('${_myWork.length}',
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: AppDesign.accent)),
          ),
        ]),
        const SizedBox(height: 6),
        // One frame around tabs + rows, so a single item still reads as a
        // panel instead of a lone card floating in blank space.
        Container(
          decoration: BoxDecoration(
            color: AppDesign.surface,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 4),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppDesign.bg,
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  ),
                  child: Row(children: [
                    _workSegBtn('Picks', picks.length, 0, AppDesign.modPicking),
                    _workSegBtn('Packs', packs.length, 1, AppDesign.modPacking),
                  ]),
                ),
              ),
              const Divider(height: 1, color: AppDesign.border),
              if (rows.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Center(
                    child: Text(
                        _workTab == 0
                            ? 'No picks assigned to you'
                            : 'No packs assigned to you',
                        style: AppDesign.caption),
                  ),
                )
              // Up to 3 rows render at their natural height; beyond that the
              // list gets a fixed window and scrolls.
              else if (rows.length <= 3)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < rows.length; i++) ...[
                      if (i > 0)
                        const Divider(
                            height: 1, indent: 10, color: AppDesign.divider),
                      _workRow(rows[i]),
                    ],
                  ],
                )
              else
                SizedBox(
                  height: 156,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    itemCount: rows.length,
                    separatorBuilder: (_, __) => const Divider(
                        height: 1, indent: 10, color: AppDesign.divider),
                    itemBuilder: (context, i) => _workRow(rows[i]),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _workSegBtn(String label, int count, int index, Color colour) {
    final selected = _workTab == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _workTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: selected ? colour.withOpacity(0.10) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text('$label  $count',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                color: selected ? colour : AppDesign.inkMuted,
              )),
        ),
      ),
    );
  }

  Widget _workRow(_WorkItem w) {
    final c = w.isPick ? AppDesign.modPicking : AppDesign.modPacking;
    final full = w.planned > 0 && w.done + 0.0001 >= w.planned;
    final pillC = full
        ? AppDesign.success
        : (w.done <= 0 ? AppDesign.inkMuted : c);
    String q(double v) =>
        v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _openWork(w),
        child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(9, 7, 8, 7),
                    child: Row(children: [
                      Icon(w.isPick ? Icons.shelves : Icons.inventory_2,
                          size: 15, color: c),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(w.label.isEmpty ? '—' : w.label,
                                style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w800,
                                    color: AppDesign.ink,
                                    height: 1.1),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            if (w.customer.isNotEmpty)
                              Text(w.customer,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppDesign.info),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: pillC.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('${q(w.done)}/${q(w.planned)}',
                            style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w800,
                                color: pillC)),
                      ),
                      const Icon(Icons.chevron_right,
                          size: 15, color: AppDesign.inkSubtle),
                    ]),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }

  // ─── Header ───────────────────────────────────────────────────────
  /// Flat surface with a hairline rule — same chrome as the module hubs.
  Widget _header(BuildContext context) {
    final companyName = _hasCompany
        ? (_selectedCompany!['companyName']?.toString() ?? '—')
        : 'No company selected';
    final companyCode =
        _hasCompany ? _selectedCompany!['companyCode']?.toString() : '';

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(bottom: BorderSide(color: AppDesign.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 34, minHeight: 34),
                  icon: const Icon(Icons.menu, color: AppDesign.ink, size: 21),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              const SizedBox(width: 4),
              // Greeting + name, stacked tight.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_greeting,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.inkSubtle)),
                    Text(
                      _firstName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.ink,
                        height: 1.15,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _statusPill(),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 34, minHeight: 34),
                icon: const Icon(Icons.settings_outlined,
                    color: AppDesign.inkMuted, size: 19),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Company selector.
          Material(
            color: AppDesign.accentSoft,
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              onTap: _pickCompany,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  border:
                      Border.all(color: AppDesign.accent.withOpacity(0.28)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.storefront_outlined,
                        color: AppDesign.accent, size: 15),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        _hasCompany
                            ? '$companyCode · $companyName'
                            : companyName,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _hasCompany
                              ? AppDesign.ink
                              : AppDesign.inkSubtle,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      _hasCompany ? 'Change' : 'Select',
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.accent),
                    ),
                    const Icon(Icons.chevron_right,
                        color: AppDesign.accent, size: 15),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          _locationSelector(),
        ],
      ),
    );
  }

  /// Location selector — the second half of the scope (company + location).
  Widget _locationSelector() {
    final has = _location != null;
    return Material(
      color: has ? AppDesign.surface : const Color(0xFFFFFBEB),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: _hasCompany ? _pickLocation : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(
                color: has ? AppDesign.border : const Color(0xFFFCD34D)),
          ),
          child: Row(
            children: [
              Icon(Icons.warehouse_outlined,
                  size: 15,
                  color: has ? AppDesign.info : const Color(0xFFB45309)),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  has
                      ? _location!.displayName
                      : (_hasCompany
                          ? 'No location — tap to choose'
                          : 'Select a company first'),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: has ? AppDesign.ink : const Color(0xFF92400E),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (_hasCompany) ...[
                Text(has ? 'Change' : 'Select',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color:
                            has ? AppDesign.info : const Color(0xFFB45309))),
                Icon(Icons.chevron_right,
                    size: 15,
                    color: has ? AppDesign.info : const Color(0xFFB45309)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickLocation() async {
    final ccRaw = _selectedCompany?['companyCode'];
    final cc = ccRaw is int ? ccRaw : int.tryParse(ccRaw?.toString() ?? '');
    if (cc == null) return;
    final picked = await LocationPickerSheet.show(
      context,
      companyCode: cc,
      selectedCode: _location?.locationCode,
    );
    if (picked == null || !mounted) return;
    await LocationService().select(picked);
    await _loadAll();
  }

  Widget _statusPill() {
    final c = _isOnline ? AppDesign.success : AppDesign.warning;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: c.withOpacity(0.10),
        borderRadius: BorderRadius.circular(AppDesign.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: c, shape: BoxShape.circle),
          ),
          const SizedBox(width: 4),
          Text(
            _isOnline ? 'Online' : 'Offline',
            style: TextStyle(
                fontSize: 9, fontWeight: FontWeight.w800, color: c),
          ),
        ],
      ),
    );
  }

  // ─── Stats ────────────────────────────────────────────────────────
  Widget _statsRow() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            icon: Icons.cloud_upload_outlined,
            label: 'To upload',
            value: '$_pendingUploads',
            tint: AppDesign.accent,
            onTap: _openPendingUploads,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _statCard(
            icon: Icons.shelves,
            label: 'Open picks',
            value: '$_openPicks',
            tint: AppDesign.modPicking,
            onTap: _openPicking,
            enabled: _access.picking,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _statCard(
            icon: Icons.inventory_2,
            label: 'Open packs',
            value: '$_openPacks',
            tint: AppDesign.modPacking,
            onTap: _openPacking,
            enabled: _access.packing,
          ),
        ),
      ],
    );
  }

  /// Number-forward stat tile: the figure leads, the label explains.
  Widget _statCard({
    required IconData icon,
    required String label,
    required String value,
    required Color tint,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    if (!enabled) tint = AppDesign.inkSubtle;
    return Material(
      color: AppDesign.surface,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: enabled ? onTap : () => _denied(label),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Colour rail — same device as the pick / pack list rows.
                Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: tint,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(AppDesign.radiusSm)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(icon, size: 13, color: tint),
                            const Spacer(),
                            Text(value,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w800,
                                  color: value == '0'
                                      ? AppDesign.inkSubtle
                                      : tint,
                                  height: 1.0,
                                )),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(label,
                            style: const TextStyle(
                                fontSize: 10,
                                color: AppDesign.inkMuted,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
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

  Widget _noCompanyBanner() {
    return Material(
      color: const Color(0xFFFFFBEB),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: _pickCompany,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: const Color(0xFFFCD34D)),
          ),
          child: Row(
            children: const [
              Icon(Icons.info_outline, size: 14, color: Color(0xFFB45309)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Select a company to unlock the modules',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF92400E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 14, color: Color(0xFFB45309)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Text(text, style: AppDesign.micro);

  // ─── Modules ──────────────────────────────────────────────────────
  /// Two-column grid — every module reachable without scrolling.
  Widget _moduleGrid() {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: _moduleTile(
              icon: Icons.shopping_cart_outlined,
              title: 'Ordering',
              subtitle: 'Quotes & checkout',
              accent: AppDesign.modOrdering,
              accentBg: AppDesign.modOrderingBg,
              onTap: _openOrdering,
              enabled: _access.ordering,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _moduleTile(
              icon: Icons.shelves,
              title: 'Picking',
              subtitle: 'Pick & confirm',
              accent: AppDesign.modPicking,
              accentBg: AppDesign.modPickingBg,
              onTap: _openPicking,
              enabled: _access.picking,
            ),
          ),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(
            child: _moduleTile(
              icon: Icons.inventory_2,
              title: 'Packing',
              subtitle: 'Pack picked items',
              accent: AppDesign.modPacking,
              accentBg: AppDesign.modPackingBg,
              onTap: _openPacking,
              enabled: _access.packing,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _moduleTile(
              icon: Icons.receipt_long_outlined,
              title: 'Credit Note',
              subtitle: 'Returns',
              accent: AppDesign.modCreditNote,
              accentBg: AppDesign.modCreditNoteBg,
              onTap: _openCreditNote,
              enabled: _access.creditNote,
            ),
          ),
        ]),
      ],
    );
  }

  Widget _moduleTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color accent,
    required Color accentBg,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    // Greyed, never hidden. A missing tile reads as a broken build; a dead one
    // that says why reads as a setting, and the operator can tell whoever
    // administers it which module they are missing.
    final accent0 = accent;
    accent = enabled ? accent0 : AppDesign.inkSubtle;
    accentBg = enabled ? accentBg : AppDesign.bg;
    return Material(
      color: accentBg,
      borderRadius: BorderRadius.circular(AppDesign.radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radius),
        onTap: enabled ? onTap : () => _denied(title),
        child: Container(
          padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radius),
            border: Border.all(color: accent.withOpacity(0.22)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Solid chip — the module's colour, stated plainly.
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.30),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, size: 18, color: Colors.white),
              ),
              const SizedBox(height: 9),
              Text(title,
                  style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: accent,
                      height: 1.1)),
              const SizedBox(height: 1),
              Text(subtitle,
                  style: const TextStyle(
                      fontSize: 10,
                      color: AppDesign.inkMuted,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

/// One row in "My open work".
class _WorkItem {
  final bool isPick;
  final String label;
  final String customer;
  final double done;
  final double planned;
  final DateTime when;
  final PickList? pick;
  final PackList? pack;
  const _WorkItem({
    required this.isPick,
    required this.label,
    required this.customer,
    required this.done,
    required this.planned,
    required this.when,
    this.pick,
    this.pack,
  });
}
