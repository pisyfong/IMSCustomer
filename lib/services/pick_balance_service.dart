import 'package:isar/isar.dart';
import '../main.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';

/// Computes how much of each SQ line has already been ALLOCATED to pick lists
/// (the planned qty on pick lines, summed across every pick). Used by the
/// "Add from SQ" screen to show the remaining allocatable qty per line and to
/// enforce the split (one SQ line can span N picks).
///
/// Matching is by (parentSqPreLabel, skuNo, uom) — the pick line's own
/// sequenceNo is the PICK's running number, not the quote line's, so it can't
/// be used to key against quote items.
class PickBalanceService {
  /// Returns {key → totalAllocatedQty} for the company. `qty` (the planned
  /// pick amount) is summed, not `pickQty` — a fully-allocated SQ line has no
  /// remaining even if it hasn't been physically picked yet.
  ///
  /// [excludePickPreLabel] omits one pick from the tally — pass the pick
  /// currently being edited so its (unsaved) buffer can be added separately
  /// without double-counting once it has been saved.
  static Future<Map<String, double>> allocatedByLine({
    required int companyCode,
    List<String>? sqPreLabels,
    String? excludePickPreLabel,
  }) async {
    // `parentPreLabel` is indexed, so when the caller names the SQs it wants
    // (both callers pass exactly one), narrow in the query. Loading every line
    // in the company and filtering in Dart is what made "Add from SQ" crawl.
    final rows = (sqPreLabels == null || sqPreLabels.isEmpty)
        ? await isar.pickListItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .parentPreLabelIsNotNull()
            .findAll()
        : await isar.pickListItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .anyOf(sqPreLabels, (q, sq) => q.parentPreLabelEqualTo(sq))
            .findAll();

    // A CANCELLED pick releases its allocation back to the SQ, so its lines
    // must not count here either — mirrors the server's Rule 2 join.
    final cancelled = (await isar.pickLists
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .statusEqualTo('X')
            .findAll())
        .map((p) => p.pickPreLabel)
        .whereType<String>()
        .toSet();

    final Map<String, double> out = {};
    for (final it in rows) {
      if (it.status == 'X') continue; // cancelled line
      if (cancelled.contains(it.pickPreLabel)) continue; // cancelled pick
      if (excludePickPreLabel != null &&
          it.pickPreLabel == excludePickPreLabel) {
        continue;
      }
      final parent = it.parentPreLabel;
      if (parent == null || parent.isEmpty) continue;
      if (sqPreLabels != null && !sqPreLabels.contains(parent)) continue;
      final key = keyFor(parent, it.skuNo ?? 0, it.uom ?? '');
      out[key] = (out[key] ?? 0) + (it.qty ?? 0);
    }
    return out;
  }

  /// Add the allocations from an in-memory buffer (the current pick's unsaved
  /// items) onto an existing tally.
  static void addBuffer(Map<String, double> tally, List<PickListItem> buffer) {
    for (final it in buffer) {
      final parent = it.parentPreLabel;
      if (parent == null || parent.isEmpty) continue;
      if (it.status == 'X') continue;
      final key = keyFor(parent, it.skuNo ?? 0, it.uom ?? '');
      tally[key] = (tally[key] ?? 0) + (it.qty ?? 0);
    }
  }

  static String keyFor(String sqPreLabel, int skuNo, String uom) =>
      '$sqPreLabel|$skuNo|$uom';
}
