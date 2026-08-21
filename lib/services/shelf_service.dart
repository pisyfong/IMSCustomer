import 'package:isar/isar.dart';

import '../main.dart';
import '../models/in_stock_location.dart';

/// Shelf / bin positions from In_Stock_Location, shared by picking and packing.
///
/// `In_Stock_Location.Location` is free text the warehouse types, and the
/// convention varies by site: YeonTak writes `A20 A21` (two bins, space
/// separated) at one site and `COL B R7A` (a *single* bin whose label contains
/// spaces) at another, while KBW writes `W3-C11-1,W3-C12-1` with commas. There
/// is no rule that separates those cases, so the string is shown as written
/// and never parsed into parts.
class ShelfService {
  ShelfService._();

  /// SKU -> shelf string, for the site [locationCode].
  ///
  /// One SKU can occupy several bins and a pick can span sites, so distinct
  /// values are merged. When the document has no site of its own, positions
  /// from every site are merged: "somewhere in A1-02" beats a blank.
  static Future<Map<int, String>> forSkus(
    int companyCode,
    List<int> skus,
    String? locationCode,
  ) async {
    if (skus.isEmpty) return {};
    final rows = await isar.inStockLocations
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .anyOf(skus, (q, sku) => q.skuNoEqualTo(sku))
        .findAll();

    final site = (locationCode ?? '').trim();
    final bySku = <int, Set<String>>{};
    for (final r in rows) {
      final shelf = (r.shelf ?? '').trim();
      if (shelf.isEmpty) continue;
      // Location_Code is char(3) on the server, so trim both sides.
      if (site.isNotEmpty && r.locationCode.trim() != site) continue;
      bySku.putIfAbsent(r.skuNo, () => <String>{}).add(readable(shelf));
    }
    return {for (final e in bySku.entries) e.key: e.value.join('  •  ')};
  }

  /// Puts a space after the separators the warehouse uses, so a multi-bin
  /// string can wrap.
  ///
  /// Only whitespace is added — no token is split, reordered or dropped — so
  /// an unexpected format degrades to being shown verbatim rather than
  /// mangled.
  static String readable(String shelf) =>
      shelf.replaceAllMapped(RegExp(r'\s*([,;])\s*'), (m) => '${m[1]} ');

  /// The individual bins in a shelf string, for grouping and filtering.
  ///
  /// Splits on commas and semicolons ONLY. Those are unambiguous list
  /// separators (`W3-C11-1,W3-C12-1` is plainly two bins). Spaces are not:
  /// `A20 A21` is two bins at one site while `COL B R7A` is a single label
  /// at another, and nothing in the data distinguishes them — so a
  /// space-separated string stays whole rather than being invented into
  /// positions that don't exist.
  ///
  /// An item in several bins therefore appears under each of them in the
  /// walk-order strip, which is what a picker wants: whichever bay they are
  /// standing at, the line is listed.
  static List<String> bins(String? shelf) {
    final s = (shelf ?? '').trim();
    if (s.isEmpty) return const [];
    return s
        .split(RegExp(r'[,;]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  /// Orders two shelf strings the way a picker walks the aisle.
  ///
  /// Digit runs compare NUMERICALLY, so `W3-C2-1` comes before `W3-C10-1`.
  /// A plain string sort puts C10 first, which sends someone back down the
  /// aisle they just walked — the whole point of sorting by shelf is to walk
  /// each run once.
  ///
  /// Items with no shelf sort LAST: the known route comes first, and the
  /// unplaced stragglers are dealt with at the end rather than interrupting
  /// it.
  static int compare(String? a, String? b) {
    final x = (a ?? '').trim();
    final y = (b ?? '').trim();
    if (x.isEmpty && y.isEmpty) return 0;
    if (x.isEmpty) return 1;
    if (y.isEmpty) return -1;

    final ax = _chunk(x);
    final by = _chunk(y);
    for (var i = 0; i < ax.length && i < by.length; i++) {
      final p = ax[i];
      final q = by[i];
      final pn = int.tryParse(p);
      final qn = int.tryParse(q);
      final int c;
      if (pn != null && qn != null) {
        c = pn.compareTo(qn);
      } else {
        c = p.toUpperCase().compareTo(q.toUpperCase());
      }
      if (c != 0) return c;
    }
    return ax.length.compareTo(by.length);
  }

  /// Splits into alternating digit / non-digit runs, discarding separators so
  /// `W3-C2` and `W3 C2` order together.
  static List<String> _chunk(String s) =>
      RegExp(r'\d+|[^\d\W_]+').allMatches(s).map((m) => m[0]!).toList();
}
