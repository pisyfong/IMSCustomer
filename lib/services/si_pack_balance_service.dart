import 'package:isar/isar.dart';

import '../main.dart';
import '../models/invoice.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';

/// How much of each sales invoice has already been packed.
///
/// Packing from an invoice is a source in its own right, not a view onto a
/// pick: an SI raised in the legacy system has no pick behind it (only 37 of
/// 270,285 invoices carry any pick reference at all, none in recent history),
/// so a pack line built from one is tied to the invoice by [PackListItem
/// .sourceSi] and nothing else.
///
/// The unit throughout is the invoice line's own UOM. Quantities are never
/// converted to base units here — a pack line is packed in the UOM it was
/// invoiced in, and mixing the two is how a carton becomes a piece.
class SiPackBalanceService {
  SiPackBalanceService._();

  /// `Quantity + Foc` keyed by (sku, uom) for one invoice.
  ///
  /// Free goods are included: they are shipped, so they are packed. Cancelled
  /// lines are not.
  static Map<String, double> invoicedByLine(List<InvoiceItem> items) {
    final out = <String, double>{};
    for (final it in items) {
      // MP_Invoice_Item marks a cancelled line 'C' — NOT 'X', which is the
      // pick/pack convention. Checking the wrong letter counted voided lines
      // as demand, so an invoice could never read as fully packed.
      if (isLineCancelled(it.status)) continue;
      final key = keyFor(it.skuNo, it.uom);
      out[key] = (out[key] ?? 0) + (it.quantity ?? 0) + (it.foc ?? 0);
    }
    return out;
  }

  /// Already allocated to packs, keyed by `siPreLabel|sku|uom`, for the
  /// invoices named in [siPreLabels].
  ///
  /// Sums the ALLOCATED qty (`qty`), not `packQty` — an invoice line committed
  /// to a pack is spoken for whether or not the goods are physically in the
  /// box yet. Otherwise two packers would each see the full quantity as
  /// available and the invoice would be packed twice.
  ///
  /// Cancelled lines and lines on cancelled packs release their claim.
  /// [excludePackPreLabel] drops one pack from the tally — pass the pack being
  /// edited so its own saved rows can be counted from the in-memory buffer
  /// instead of twice.
  static Future<Map<String, double>> allocatedByLine({
    required int companyCode,
    required List<String> siPreLabels,
    String? excludePackPreLabel,
  }) async {
    if (siPreLabels.isEmpty) return {};

    final rows = await isar.packListItems
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .anyOf(siPreLabels, (q, si) => q.sourceSiEqualTo(si))
        .findAll();
    if (rows.isEmpty) return {};

    final cancelledPacks = (await isar.packLists
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .statusEqualTo('X')
            .findAll())
        .map((p) => p.packPreLabel)
        .whereType<String>()
        .toSet();

    final out = <String, double>{};
    for (final it in rows) {
      if (it.status == 'X') continue;
      if (cancelledPacks.contains(it.packPreLabel)) continue;
      if (excludePackPreLabel != null &&
          it.packPreLabel == excludePackPreLabel) {
        continue;
      }
      final si = it.sourceSi;
      if (si == null || si.isEmpty) continue;
      final key = '$si|${keyFor(it.skuNo, it.uom)}';
      out[key] = (out[key] ?? 0) + (it.qty ?? 0);
    }
    return out;
  }

  /// Folds an unsaved buffer (the pack currently being edited) onto a tally
  /// produced by [allocatedByLine].
  static void addBuffer(Map<String, double> tally, List<PackListItem> buffer) {
    for (final it in buffer) {
      if (it.status == 'X') continue;
      final si = it.sourceSi;
      if (si == null || si.isEmpty) continue;
      final key = '$si|${keyFor(it.skuNo, it.uom)}';
      tally[key] = (tally[key] ?? 0) + (it.qty ?? 0);
    }
  }

  /// Packed / invoiced totals for one invoice, for the progress chip.
  static ({double packed, double invoiced}) progressFor({
    required String siPreLabel,
    required Map<String, double> invoiced,
    required Map<String, double> allocated,
  }) {
    double inv = 0;
    double pk = 0;
    for (final e in invoiced.entries) {
      inv += e.value;
      pk += allocated['$siPreLabel|${e.key}'] ?? 0;
    }
    return (packed: pk, invoiced: inv);
  }

  static String keyFor(int? skuNo, String? uom) => '${skuNo ?? 0}|${uom ?? ''}';

  /// Whether an MP_Invoice_Item line is cancelled.
  ///
  /// Invoices use 'C'; picks and packs use 'X'. Both are accepted here so a
  /// mixed-convention row can never quietly count as live stock.
  static bool isLineCancelled(String? status) {
    final s = (status ?? '').trim().toUpperCase();
    return s == 'C' || s == 'X';
  }
}
