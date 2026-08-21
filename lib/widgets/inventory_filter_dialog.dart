import 'package:flutter/material.dart';

import '../services/inventory_service.dart';
import '../services/taxonomy_mode_service.dart';
import '../theme/app_design.dart';

/// The inventory filter, as a self-contained dialog.
///
/// Owns every piece of state it shows. The previous version drove itself from
/// the page's state, which a dialog route cannot see — so labels that arrived
/// after it opened were invisible, and each tap rebuilt the whole catalogue
/// grid behind it. Here the page is not touched until the operator is done:
/// [show] returns the chosen filter, or null if nothing changed.
///
/// Three rules keep it fast:
///   * option lists come from the in-memory taxonomy snapshot, not Isar;
///   * labels are fetched once, on open;
///   * the catalogue is never requeried while the dialog is up.
class InventoryFilterDialog extends StatefulWidget {
  final InventoryFilter initial;
  final int companyCode;

  const InventoryFilterDialog({
    Key? key,
    required this.initial,
    required this.companyCode,
  }) : super(key: key);

  /// Returns the filter to apply, or null when the operator changed nothing.
  static Future<InventoryFilter?> show(
    BuildContext context, {
    required InventoryFilter current,
    required int companyCode,
  }) {
    return showDialog<InventoryFilter>(
      context: context,
      barrierDismissible: true,
      builder: (_) => InventoryFilterDialog(
        initial: current,
        companyCode: companyCode,
      ),
    );
  }

  @override
  State<InventoryFilterDialog> createState() => _InventoryFilterDialogState();
}

class _InventoryFilterDialogState extends State<InventoryFilterDialog> {
  final _service = InventoryService();

  /// A working copy. The page's filter is untouched until we pop a result, so
  /// dismissing without applying cannot leave it half-edited.
  late InventoryFilter _draft;

  Map<String, List<String>> _options = const {};
  Map<String, String> _groupLabels = const {};
  Map<String, String> _deptLabels = const {};
  Map<String, String> _brandLabels = const {};
  Map<String, String> _categoryLabels = const {};
  Map<String, String> _subDeptLabels = const {};

  bool _loading = true;
  bool _dirty = false;

  final Set<String> _collapsed = {};

  bool get _isWeb =>
      TaxonomyModeService.instance.modeOrDefault == TaxonomyMode.web;

  @override
  void initState() {
    super.initState();
    _draft = _copy(widget.initial);
    _load();
  }

  static InventoryFilter _copy(InventoryFilter f) => InventoryFilter()
    ..stockStatus = f.stockStatus
    ..groups = f.groups == null ? null : List<String>.from(f.groups!)
    ..departments =
        f.departments == null ? null : List<String>.from(f.departments!)
    ..subDepartments = f.subDepartments == null
        ? null
        : List<String>.from(f.subDepartments!)
    ..categories = f.categories == null ? null : List<String>.from(f.categories!)
    ..brands = f.brands == null ? null : List<String>.from(f.brands!)
    ..itemStatus =
        f.itemStatus == null ? null : List<String>.from(f.itemStatus!)
    ..minPrice = f.minPrice
    ..maxPrice = f.maxPrice;

  /// Loads option lists and labels. Both are cached and single-flighted in the
  /// service, so re-opening the dialog costs nothing.
  Future<void> _load({bool optionsOnly = false}) async {
    final cc = widget.companyCode;
    var options = await _service.getFilterOptions(
      companyCode: cc,
      groups: _draft.groups,
      departments: _draft.departments,
      subDepartments: _draft.subDepartments,
    );

    // A selection can survive only while it is still offered. Pruning can
    // change what the levels below should show, so recompute once when it did.
    if (_pruneSelections(options)) {
      options = await _service.getFilterOptions(
        companyCode: cc,
        groups: _draft.groups,
        departments: _draft.departments,
        subDepartments: _draft.subDepartments,
      );
    }

    if (!optionsOnly) {
      final results = await Future.wait([
        _service.getGroupMap(companyCode: cc),
        _service.getDepartmentMap(companyCode: cc),
        _service.getBrandMap(companyCode: cc),
      ]);
      final taxonomy = await _service.getCategoryAndSubDeptMaps(companyCode: cc);
      if (!mounted) return;
      _groupLabels = results[0];
      _deptLabels = results[1];
      _brandLabels = results[2];
      _categoryLabels = taxonomy.categories;
      _subDeptLabels = taxonomy.subDepartments;
    }

    if (!mounted) return;
    setState(() {
      _options = options;
      _loading = false;
    });
  }

  // ─────────────────────────────────────────────────────────── selections

  /// Applies a change, then reloads the option lists beneath it.
  ///
  /// Selections are not cleared wholesale. Adding a second group must not
  /// discard a department already chosen under the first — only selections
  /// that are no longer on offer are dropped, which happens naturally when the
  /// group they belonged to is deselected.
  void _change(void Function() mutate) {
    setState(() {
      mutate();
      _dirty = true;
    });
    _load(optionsOnly: true);
  }

  void _toggle(List<String>? Function() get, void Function(List<String>?) set,
      String value) {
    _change(() {
      final list = List<String>.from(get() ?? const []);
      list.contains(value) ? list.remove(value) : list.add(value);
      set(list.isEmpty ? null : list);
    });
  }

  /// Drops selections the new option lists no longer contain.
  ///
  /// Returns true when something was dropped, so the caller can recompute the
  /// levels below it.
  bool _pruneSelections(Map<String, List<String>> options) {
    var changed = false;

    List<String>? prune(List<String>? current, List<String>? allowed) {
      if (current == null || current.isEmpty) return current;
      final set = (allowed ?? const <String>[]).toSet();
      final kept = current.where(set.contains).toList();
      if (kept.length != current.length) changed = true;
      return kept.isEmpty ? null : kept;
    }

    _draft.departments = prune(_draft.departments, options['departments']);
    _draft.subDepartments =
        prune(_draft.subDepartments, options['subDepartments']);
    _draft.categories = prune(_draft.categories, options['categories']);
    _draft.brands = prune(_draft.brands, options['brands']);
    return changed;
  }

  int get _activeCount {
    var n = 0;
    if (_draft.stockStatus != null && _draft.stockStatus != StockStatus.all) n++;
    if (_draft.groups?.isNotEmpty ?? false) n++;
    if (_draft.departments?.isNotEmpty ?? false) n++;
    if (_draft.subDepartments?.isNotEmpty ?? false) n++;
    if (_draft.categories?.isNotEmpty ?? false) n++;
    if (_draft.brands?.isNotEmpty ?? false) n++;
    return n;
  }

  // ────────────────────────────────────────────────────────────── labels

  String _label(Map<String, String> labels, String code) {
    final c = code.trim();
    final v = labels[c] ?? labels[c.toUpperCase()];
    return (v == null || v.isEmpty) ? c : v;
  }

  /// "HA - Aluminium". The group is part of a department's identity: the same
  /// code appears under several groups meaning different things.
  String _deptLabel(String key) {
    final grp = InventoryService.groupOfDepartmentKey(key);
    final code = InventoryService.codeOfDepartmentKey(key);
    final desc = _deptLabels['${grp.toUpperCase()}|${code.toUpperCase()}'];
    final text = (desc == null || desc.isEmpty) ? code : desc;
    return grp.isEmpty ? text : '$grp - $text';
  }

  /// In web mode only codes published to the web are offered. If nothing
  /// matches, the list is shown unfiltered rather than left empty — an
  /// unlabelled filter beats a missing one.
  List<String> _visible(String key, Map<String, String> labels) {
    final codes = _options[key] ?? const <String>[];
    if (!_isWeb || labels.isEmpty || codes.isEmpty) return codes;
    final shown = codes.where((c) {
      final k = c.trim().toUpperCase();
      return labels.containsKey(c.trim()) ||
          labels.containsKey(k) ||
          labels.keys.any((x) => x.endsWith('|$k'));
    }).toList();
    return shown.isEmpty ? codes : shown;
  }

  /// A section is worth showing when it can actually narrow the list: two or
  /// more real options, or one once a parent filter is already applied.
  /// 'NA' is the placeholder for a level a site does not use.
  bool _worthShowing(List<String> values, {bool narrowed = false}) {
    final real = values
        .map((v) => InventoryService.codeOfDepartmentKey(v).trim().toUpperCase())
        .where((v) => v.isNotEmpty && v != 'NA')
        .toSet();
    return real.length >= 2 || (narrowed && real.isNotEmpty);
  }

  // ──────────────────────────────────────────────────────────────── build

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 36),
      backgroundColor: AppDesign.bg,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.radiusLg)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 520,
          maxHeight: MediaQuery.of(context).size.height * 0.86,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            Flexible(
              child: _loading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 60),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: _body(),
                    ),
            ),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    final n = _activeCount;
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 6, 10),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(bottom: BorderSide(color: AppDesign.border)),
      ),
      child: Row(
        children: [
          const Icon(Icons.tune, size: 18, color: AppDesign.modOrdering),
          const SizedBox(width: 8),
          const Text('Filters',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppDesign.ink)),
          if (n > 0) ...[
            const SizedBox(width: 6),
            _pill('$n'),
          ],
          const Spacer(),
          if (n > 0)
            TextButton(
              style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  foregroundColor: AppDesign.danger),
              onPressed: () => _change(() => _draft.clear()),
              child: const Text('Clear all',
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
            ),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon:
                const Icon(Icons.close, size: 20, color: AppDesign.inkMuted),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: AppDesign.modOrdering,
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w900,
                color: Colors.white)),
      );

  Widget _body() {
    final groups = _visible('groups', _groupLabels);
    final depts = _visible('departments', _deptLabels);
    final subs = _options['subDepartments'] ?? const <String>[];
    final cats = _options['categories'] ?? const <String>[];
    final brands = _options['brands'] ?? const <String>[];

    final hasGroup = _draft.groups?.isNotEmpty ?? false;
    final hasDept = _draft.departments?.isNotEmpty ?? false;
    final hasSub = _draft.subDepartments?.isNotEmpty ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _section(
          key: 'stock',
          title: 'Availability',
          count: (_draft.stockStatus != null &&
                  _draft.stockStatus != StockStatus.all)
              ? 1
              : 0,
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _stockChip('All', null),
              _stockChip('In stock', StockStatus.inStock),
              _stockChip('Out of stock', StockStatus.outOfStock),
              _stockChip('Low stock', StockStatus.lowStock),
            ],
          ),
        ),
        if (_worthShowing(groups))
          _section(
            key: 'group',
            title: 'Group',
            count: _draft.groups?.length ?? 0,
            child: _chips(
              values: groups,
              labelOf: (c) => _label(_groupLabels, c),
              selected: _draft.groups,
              onTap: (c) => _toggle(() => _draft.groups,
                  (v) => _draft.groups = v, c),
            ),
          ),
        if (_worthShowing(depts, narrowed: hasGroup))
          _section(
            key: 'department',
            title: 'Department',
            count: _draft.departments?.length ?? 0,
            child: _chips(
              values: depts,
              labelOf: _deptLabel,
              subOf: InventoryService.codeOfDepartmentKey,
              selected: _draft.departments,
              onTap: (c) => _toggle(() => _draft.departments,
                  (v) => _draft.departments = v, c),
            ),
          ),
        if (_worthShowing(subs, narrowed: hasDept))
          _section(
            key: 'subDept',
            title: 'Sub-department',
            count: _draft.subDepartments?.length ?? 0,
            child: _chips(
              values: subs,
              labelOf: (c) => _label(_subDeptLabels, c),
              selected: _draft.subDepartments,
              onTap: (c) => _toggle(() => _draft.subDepartments,
                  (v) => _draft.subDepartments = v, c),
            ),
          ),
        if (_worthShowing(cats, narrowed: hasSub))
          _section(
            key: 'category',
            title: 'Category',
            count: _draft.categories?.length ?? 0,
            child: _chips(
              values: cats,
              labelOf: (c) => _label(_categoryLabels, c),
              selected: _draft.categories,
              onTap: (c) => _toggle(() => _draft.categories,
                  (v) => _draft.categories = v, c),
            ),
          ),
        if (_worthShowing(brands))
          _section(
            key: 'brand',
            title: 'Brand',
            count: _draft.brands?.length ?? 0,
            child: _chips(
              values: brands,
              labelOf: (c) => _label(_brandLabels, c),
              subOf: (c) => c,
              selected: _draft.brands,
              onTap: (c) =>
                  _toggle(() => _draft.brands, (v) => _draft.brands = v, c),
            ),
          ),
      ],
    );
  }

  Widget _stockChip(String label, StockStatus? status) {
    final current = _draft.stockStatus;
    final selected = status == null
        ? (current == null || current == StockStatus.all)
        : current == status;
    return _chip(
      label: label,
      selected: selected,
      onTap: () => _change(() => _draft.stockStatus = status),
    );
  }

  /// Long option lists get their own scroll rather than stretching the dialog.
  Widget _chips({
    required List<String> values,
    required String Function(String) labelOf,
    String Function(String)? subOf,
    required List<String>? selected,
    required void Function(String) onTap,
  }) {
    final sel = selected?.toSet() ?? const <String>{};
    final wrap = Wrap(
      spacing: 6,
      runSpacing: 6,
      children: values
          .map((v) => _chip(
                label: labelOf(v),
                sub: subOf == null ? null : subOf(v),
                selected: sel.contains(v),
                onTap: () => onTap(v),
              ))
          .toList(),
    );
    if (values.length <= 24) return wrap;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 190),
      child: SingleChildScrollView(child: wrap),
    );
  }

  Widget _chip({
    required String label,
    required bool selected,
    required VoidCallback onTap,
    String? sub,
  }) {
    final showSub =
        sub != null && sub.trim().toUpperCase() != label.trim().toUpperCase();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? AppDesign.modOrdering : AppDesign.surface,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(
              color: selected ? AppDesign.modOrdering : AppDesign.border),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : AppDesign.ink)),
            if (showSub)
              Text(sub,
                  style: TextStyle(
                      fontSize: 8.5,
                      fontWeight: FontWeight.w600,
                      color:
                          selected ? Colors.white70 : AppDesign.inkSubtle)),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String key,
    required String title,
    required int count,
    required Widget child,
  }) {
    final open = !_collapsed.contains(key);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        border: Border.all(color: AppDesign.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() =>
                open ? _collapsed.add(key) : _collapsed.remove(key)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              child: Row(
                children: [
                  Text(title.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: AppDesign.inkMuted)),
                  if (count > 0) ...[
                    const SizedBox(width: 6),
                    _pill('$count'),
                  ],
                  const Spacer(),
                  Icon(open ? Icons.expand_less : Icons.expand_more,
                      size: 18, color: AppDesign.inkSubtle),
                ],
              ),
            ),
          ),
          if (open) ...[
            const Divider(height: 1, color: AppDesign.divider),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 9, 10, 11),
              child: child,
            ),
          ],
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          // Returning the draft is the only thing that applies it, so the
          // catalogue is queried exactly once no matter how many chips were
          // tapped.
          onPressed: () => Navigator.of(context).pop(_dirty ? _draft : null),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppDesign.modOrdering,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radius)),
          ),
          child: Text(_dirty ? 'Show items' : 'Close',
              style: const TextStyle(
                  fontSize: 13.5, fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }
}
