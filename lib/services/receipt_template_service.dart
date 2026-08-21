import 'package:isar/isar.dart';

import '../main.dart';
import '../models/receipt_template.dart';

/// Stores and seeds the named receipt layouts.
///
/// The seeds exist so printing works the moment the feature is switched on —
/// nobody should have to author a template before their first receipt. They're
/// written once (guarded on an empty collection per module) and are ordinary
/// editable rows afterwards, not read-only built-ins.
class ReceiptTemplateService {
  ReceiptTemplateService._();
  static final ReceiptTemplateService _i = ReceiptTemplateService._();
  factory ReceiptTemplateService() => _i;

  /// Templates for a module, defaults first, then by sort order and name.
  Future<List<ReceiptTemplate>> templates(String module) async {
    await seedIfEmpty(module);
    final rows =
        await isar.receiptTemplates.filter().moduleEqualTo(module).findAll();
    rows.sort((a, b) {
      if (a.isDefault != b.isDefault) return a.isDefault ? -1 : 1;
      final c = a.sortOrder.compareTo(b.sortOrder);
      return c != 0 ? c : a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return rows;
  }

  /// The template to pre-select when printing. Never null once seeded.
  Future<ReceiptTemplate> defaultFor(String module) async {
    final rows = await templates(module);
    return rows.firstWhere((t) => t.isDefault, orElse: () => rows.first);
  }

  Future<void> save(ReceiptTemplate t) async {
    await isar.writeTxn(() async {
      // Exactly one default per module — promoting one demotes the rest.
      if (t.isDefault) {
        final others = await isar.receiptTemplates
            .filter()
            .moduleEqualTo(t.module)
            .and()
            .isDefaultEqualTo(true)
            .findAll();
        for (final o in others) {
          if (o.id != t.id) {
            o.isDefault = false;
            await isar.receiptTemplates.put(o);
          }
        }
      }
      await isar.receiptTemplates.put(t);
    });
  }

  /// Deletes [t], handing the default flag to whatever remains so a module is
  /// never left without one.
  Future<void> delete(ReceiptTemplate t) async {
    await isar.writeTxn(() => isar.receiptTemplates.delete(t.id));
    final rest = await isar.receiptTemplates
        .filter()
        .moduleEqualTo(t.module)
        .findAll();
    if (rest.isNotEmpty && !rest.any((r) => r.isDefault)) {
      rest.first.isDefault = true;
      await isar.writeTxn(() => isar.receiptTemplates.put(rest.first));
    }
  }

  Future<ReceiptTemplate> duplicate(ReceiptTemplate t) async {
    final copy = t.copy()
      ..id = Isar.autoIncrement
      ..name = '${t.name} (copy)'
      ..isDefault = false
      ..sortOrder = t.sortOrder + 1;
    await isar.writeTxn(() => isar.receiptTemplates.put(copy));
    return copy;
  }

  /// Writes the starter set for a module the first time it's asked for.
  Future<void> seedIfEmpty(String module) async {
    final count =
        await isar.receiptTemplates.filter().moduleEqualTo(module).count();
    if (count > 0) return;

    final seeds = module == ReceiptTemplate.modulePack
        ? _packSeeds()
        : _pickSeeds();
    await isar.writeTxn(() => isar.receiptTemplates.putAll(seeds));
  }

  List<ReceiptTemplate> _pickSeeds() => [
        _base(ReceiptTemplate.modulePick, 'By SQ', 'PICKING LIST',
            ReceiptGrouping.sq, 0, isDefault: true)
          // A pick has no upstream document, so the reference column is noise.
          ..showSource = false
          ..signatures = ['Picked by', 'Checked by'],
        _base(ReceiptTemplate.modulePick, 'By customer', 'PICKING LIST',
            ReceiptGrouping.customer, 1)
          ..showSource = false
          ..signatures = ['Picked by', 'Checked by'],
        _base(ReceiptTemplate.modulePick, 'Flat list', 'PICKING LIST',
            ReceiptGrouping.none, 2)
          ..showSource = false
          ..signatures = ['Picked by'],
      ];

  List<ReceiptTemplate> _packSeeds() => [
        _base(ReceiptTemplate.modulePack, 'By customer', 'PACKING LIST',
            ReceiptGrouping.customer, 0, isDefault: true)
          ..signatures = ['Packed by', 'Checked by'],
        _base(ReceiptTemplate.modulePack, 'By SQ', 'PACKING LIST',
            ReceiptGrouping.sq, 1)
          ..signatures = ['Packed by', 'Checked by'],
        _base(ReceiptTemplate.modulePack, 'By source pick', 'PACKING LIST',
            ReceiptGrouping.sourceDoc, 2)
          ..signatures = ['Packed by', 'Checked by'],
        // A delivery-facing variant: no internal PLU/short-qty detail, and the
        // signature the driver actually needs.
        _base(ReceiptTemplate.modulePack, 'Delivery note', 'DELIVERY NOTE',
            ReceiptGrouping.customer, 3)
          ..showPlu = false
          ..showSource = false
          ..showShortQty = false
          ..showAssignee = false
          ..showLocation = false
          ..signatures = ['Delivered by', 'Received by'],
      ];

  ReceiptTemplate _base(String module, String name, String title,
          ReceiptGrouping grouping, int order,
          {bool isDefault = false}) =>
      ReceiptTemplate()
        ..module = module
        ..name = name
        ..title = title
        ..grouping = grouping
        ..sortOrder = order
        ..isDefault = isDefault;
}
