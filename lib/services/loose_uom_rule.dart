import '../config/app_config.dart';

/// When loose (base-unit) quantities make sense for a line.
///
/// Ported from the procurement PD receive dialog, which gates its loose row
/// on the line rather than on a global switch:
///
/// ```dart
/// // delivery_form_screen.dart
/// final showLoose = item.quantityLoose > 0 ||
///     item.focLoose > 0 ||
///     (item.baseUom.trim().isNotEmpty &&
///         item.baseUom.trim().toUpperCase() != item.uom.trim().toUpperCase());
/// ```
///
/// The reasoning carries over unchanged: "loose" means *base units beyond
/// whole packs*, so it only exists when the chosen UOM **is** a pack. Order in
/// the base unit and a loose one is just one — offering the field there invites
/// the operator to enter the same goods twice, once as Qty and once as Loose.
///
/// The port does NOT copy procurement's comparison, though — it asks the
/// question of the factor instead, because this database answers the name
/// version wrongly. Verified against Miri company 1 (2026-08-20):
///
///   * the base UOM's factor is 1 on every row — 0 exceptions;
///   * the base UOM always exists in `In_Stock_Uom` — 0 missing;
///   * but **199 SKUs carry a non-base UOM whose factor is also 1** — aliases,
///     not packs. SKU 43 is `BAG/1, CTN/1, KG/1`; SKU 413 lists `EA/1, KG/1`
///     alongside real packs at 20 and 27.
///
/// On those 199, a name comparison says "CTN ≠ BAG, show loose" while a loose
/// CTN and a whole CTN are the same thing — exactly the double-entry the rule
/// exists to prevent. Since the base factor is always 1, `factor > 1` is both
/// necessary and sufficient, and the names are only consulted when no usable
/// factor arrived.
///
/// The two escape hatches matter as much as the rule:
///   * a line that already carries loose values keeps its fields, so hiding the
///     row can never strand a number the operator typed and can no longer see;
///   * when the factor is missing the base UOM name decides, which is better
///     than nothing and is what procurement does everywhere.
class LooseUomRule {
  const LooseUomRule._();

  /// Whether the Loose / FOC-loose fields belong on this line.
  ///
  /// [factor] is base units per chosen UOM — the deciding value. [baseUom] is
  /// `In_Stock.Uom` (procurement's `Base_Uom`) and [uom] is what the operator
  /// picked; those two are consulted only when no usable factor arrived.
  static bool applies({
    String? uom,
    String? baseUom,
    double? factor,
    double existingLoose = 0,
    double existingFocLoose = 0,
  }) {
    if (!AppConfig.enableLooseItems) return false;

    // Never hide a value that is already on the line.
    if (existingLoose > 0 || existingFocLoose > 0) return true;

    // A pack holds more than one base unit. Anything else — the base unit
    // itself, or one of the factor-1 aliases this data is full of — has no
    // "beyond whole packs" to speak of.
    final f = factor ?? 0;
    if (f > 0) return f > 1;

    // No usable factor (a half-loaded UOM list, or a cached row that predates
    // the column). Fall back to the names, and when even those are missing
    // stay hidden: a field that is absent costs one UOM tap, while a field
    // that is present and meaningless costs a wrong order.
    final chosen = (uom ?? '').trim().toUpperCase();
    final base = (baseUom ?? '').trim().toUpperCase();
    if (base.isNotEmpty && chosen.isNotEmpty) return base != chosen;
    return false;
  }
}
