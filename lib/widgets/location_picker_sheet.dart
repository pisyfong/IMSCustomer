import 'package:flutter/material.dart';
import '../models/app_location.dart';
import '../services/location_service.dart';
import '../theme/app_design.dart';

/// Searchable picker for the locations the signed-in user may work in.
///
/// Reads the local cache (works offline) and refreshes in the background.
/// Returns the chosen [AppLocation], or null when dismissed.
class LocationPickerSheet extends StatefulWidget {
  final int companyCode;
  final String? selectedCode;
  const LocationPickerSheet({
    super.key,
    required this.companyCode,
    this.selectedCode,
  });

  static Future<AppLocation?> show(
    BuildContext context, {
    required int companyCode,
    String? selectedCode,
  }) {
    return showModalBottomSheet<AppLocation>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LocationPickerSheet(
        companyCode: companyCode,
        selectedCode: selectedCode,
      ),
    );
  }

  @override
  State<LocationPickerSheet> createState() => _LocationPickerSheetState();
}

class _LocationPickerSheetState extends State<LocationPickerSheet> {
  final _searchCtrl = TextEditingController();
  List<AppLocation> _all = [];
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
    final svc = LocationService();
    var rows = await svc.locations(companyCode: widget.companyCode);
    if (rows.isEmpty) {
      await svc.sync(companyCode: widget.companyCode);
      rows = await svc.locations(companyCode: widget.companyCode);
    } else {
      svc.sync(companyCode: widget.companyCode); // refresh behind the list
    }
    if (!mounted) return;
    setState(() {
      _all = rows;
      _loading = false;
    });
  }

  List<AppLocation> get _visible {
    if (_q.isEmpty) return _all;
    return _all
        .where((l) =>
            l.locationCode.toLowerCase().contains(_q) ||
            (l.name ?? '').toLowerCase().contains(_q) ||
            (l.city ?? '').toLowerCase().contains(_q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
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
                child: Text('Location',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppDesign.space3, 0, AppDesign.space3, AppDesign.space2),
              child: Container(
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  border: Border.all(color: AppDesign.borderStrong),
                ),
                child: Row(children: [
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
                        hintText: 'Search location',
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
                  const SizedBox(width: 4),
                ]),
              ),
            ),
            const Divider(height: 1, color: AppDesign.border),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _visible.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                              _all.isEmpty
                                  ? 'No locations available for your account —\nconnect once to load them.'
                                  : 'No location matches "${_searchCtrl.text}"',
                              textAlign: TextAlign.center,
                              style: AppDesign.caption,
                            ),
                          ),
                        )
                      : ListView.builder(
                          controller: controller,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          itemCount: _visible.length,
                          itemBuilder: (context, i) => _row(_visible[i]),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(AppLocation l) {
    final selected = l.locationCode == widget.selectedCode;
    final sub = [
      if ((l.city ?? '').isNotEmpty) l.city!,
      if ((l.state ?? '').isNotEmpty) l.state!,
    ].join(', ');
    return InkWell(
      onTap: () => Navigator.pop(context, l),
      child: Container(
        color: selected ? AppDesign.accentSoft : null,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        child: Row(children: [
          Icon(Icons.warehouse_outlined,
              size: 18,
              color: selected ? AppDesign.accent : AppDesign.inkSubtle),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(children: [
                  Flexible(
                    child: Text(l.displayName,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color:
                                selected ? AppDesign.accent : AppDesign.ink),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                  if (l.isDefault) ...[
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
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
                if (sub.isNotEmpty)
                  Text(sub,
                      style: const TextStyle(
                          fontSize: 11, color: AppDesign.inkMuted),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (selected)
            const Icon(Icons.check, size: 18, color: AppDesign.accent),
        ]),
      ),
    );
  }
}
