/// One place that decides how precise a quantity is, and how it is written.
///
/// Every quantity column this app writes is `decimal(18,4)` in RMS —
/// `MP_Quote_Item.Quote_Quantity`, `MP_Invoice_Item.Quantity`, and the Foc /
/// _Loose companions of both. Four decimals is what legacy stores for weighed
/// goods (KG lines of 0.575 and 52.753 are ordinary in the invoice history),
/// so nothing here is fighting the schema: 2dp is a deliberate *entry*
/// convention for the handheld, well inside what the column holds.
///
/// It is a convention worth enforcing in one place because the alternative
/// showed up in practice: the cart used to do `item.quantity = value.round()`,
/// so a typed 2.5 became 3 with no warning, while the same 2.5 typed into
/// Loose was kept exactly. Two fields on one row, two different rules.
class Qty {
  const Qty._();

  /// Decimal places every quantity is entered, displayed and stored with.
  static const int decimals = 2;

  /// Rounds to [decimals]. Applied where a value enters the model, so a
  /// quantity cannot be stored more precisely than it can be displayed — a
  /// line showing 2.50 that actually holds 2.499 is how a total stops adding
  /// up on screen.
  ///
  /// Rounds the way `toStringAsFixed` does, since that is what draws the
  /// number: both go through the same binary-float value, so display and
  /// storage cannot disagree.
  static double round(double v) => double.parse(v.toStringAsFixed(decimals));

  /// The display form. Always [decimals] places — `10.00`, not `10`.
  ///
  /// Fixed width is the point: four quantity boxes in a row are read as a
  /// column, and ragged decimals make a 10 and a 1.0 hard to tell apart at a
  /// glance on a handheld held at arm's length.
  static String fmt(double v) => v.toStringAsFixed(decimals);

  /// Parses operator input, returning null for anything not yet a number.
  ///
  /// Null means "leave the model alone" — mid-typing text like `-`, `1.2.3` or
  /// an empty field must not be committed as a value. An empty field is the
  /// exception: it reads as zero, which is what lets a box be cleared and
  /// retyped without the row vanishing underneath the cursor.
  static double? tryParse(String text) {
    final raw = text.trim();
    if (raw.isEmpty) return 0;
    final v = double.tryParse(raw);
    if (v == null || v < 0 || !v.isFinite) return null;
    return round(v);
  }
}
