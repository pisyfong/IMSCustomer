import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../services/user_directory_service.dart';
import '../theme/app_design.dart';

/// Searchable PI_Users picker used by the "Assigned To" field on picks/packs.
///
/// Reads the local directory cache (works offline) and refreshes in the
/// background. Returns the chosen [AppUser], or an [AppUser] with userId 0 to
/// mean "Unassigned". Returns null when dismissed.
class UserPickerSheet extends StatefulWidget {
  final int? selectedUserId;
  final Color accent;
  const UserPickerSheet({
    super.key,
    this.selectedUserId,
    this.accent = AppDesign.accent,
  });

  /// Convenience: show the sheet and get the chosen user id back.
  /// Returns `(picked: false, ...)` semantics via null when dismissed.
  static Future<AppUser?> show(
    BuildContext context, {
    int? selectedUserId,
    Color accent = AppDesign.accent,
  }) {
    return showModalBottomSheet<AppUser>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => UserPickerSheet(
        selectedUserId: selectedUserId,
        accent: accent,
      ),
    );
  }

  @override
  State<UserPickerSheet> createState() => _UserPickerSheetState();
}

class _UserPickerSheetState extends State<UserPickerSheet> {
  final _searchCtrl = TextEditingController();
  List<AppUser> _all = [];
  String _q = '';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _searchCtrl.addListener(
        () => setState(() => _q = _searchCtrl.text.trim().toLowerCase()));
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final svc = UserDirectoryService();
    var rows = await svc.users(); // cache first, refreshes in background
    if (rows.isEmpty) {
      // Nothing cached yet (first run) — wait for one sync attempt.
      await svc.sync();
      rows = await svc.users(refresh: false);
    }
    if (!mounted) return;
    setState(() {
      _all = rows;
      _loading = false;
    });
  }

  List<AppUser> get _visible {
    if (_q.isEmpty) return _all;
    return _all.where((u) {
      return u.displayName.toLowerCase().contains(_q) ||
          (u.loginName ?? '').toLowerCase().contains(_q) ||
          (u.designation ?? '').toLowerCase().contains(_q) ||
          u.userId.toString() == _q;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 12, 14, 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Assign to',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ),
            ),
            // Search
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppDesign.space3, 0, AppDesign.space3, AppDesign.space2),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  color: AppDesign.surface,
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  border: Border.all(color: AppDesign.borderStrong),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.search,
                        size: 16, color: AppDesign.inkSubtle),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TextField(
                        controller: _searchCtrl,
                        autofocus: true,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppDesign.ink),
                        decoration: const InputDecoration(
                          hintText: 'Search name, login or role…',
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
                          child: Icon(Icons.clear,
                              size: 14, color: AppDesign.inkSubtle),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      controller: controller,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      children: [
                        // Explicit "unassigned" option.
                        _row(
                          AppUser()..userId = 0,
                          label: 'Unassigned',
                          subtitle: 'No one assigned',
                          icon: Icons.person_off_outlined,
                        ),
                        if (_visible.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Center(
                              child: Text(
                                _all.isEmpty
                                    ? 'No users cached yet — connect once to load the directory.'
                                    : 'No users match "${_searchCtrl.text}"',
                                textAlign: TextAlign.center,
                                style: AppDesign.caption,
                              ),
                            ),
                          ),
                        for (final u in _visible) _row(u),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(AppUser u,
      {String? label, String? subtitle, IconData icon = Icons.person_outline}) {
    final selected = (widget.selectedUserId ?? 0) == u.userId;
    final name = label ?? u.displayName;
    final sub = subtitle ??
        [
          if ((u.loginName ?? '').isNotEmpty) u.loginName!,
          if ((u.designation ?? '').isNotEmpty) u.designation!,
        ].join(' · ');
    return InkWell(
      onTap: () => Navigator.pop(context, u),
      child: Container(
        color: selected ? widget.accent.withOpacity(0.06) : null,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Row(
          children: [
            Icon(icon,
                size: 18,
                color: selected ? widget.accent : AppDesign.inkSubtle),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: selected ? widget.accent : AppDesign.ink)),
                  if (sub.isNotEmpty)
                    Text(sub,
                        style: const TextStyle(
                            fontSize: 11, color: AppDesign.inkMuted),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            if (selected) Icon(Icons.check, size: 18, color: widget.accent),
          ],
        ),
      ),
    );
  }
}
