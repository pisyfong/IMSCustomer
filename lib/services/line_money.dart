/// What an order line costs, and how to write it down.
///
/// Kept out of the widget so the arithmetic the operator reads in the sheet
/// footer can be tested without pumping a screen. The rule is the one the cart
/// and the quotation already use — packs at the UOM price, loose at the
/// base-unit price, FOC at nothing — and it lives here precisely so those three
/// places cannot drift apart.
class LineMoney {
  final double unitPrice; // per chosen UOM
  final double factor; // base units per chosen UOM
  final double packs;
  final double loose;

  LineMoney({
    required this.unitPrice,
    required double factor,
    this.packs = 0,
    this.loose = 0,
  }) : factor = factor > 0 ? factor : 1;

  /// Price of one base unit. A pack price divided by its factor.
  double get basePrice => unitPrice / factor;

  double get packTotal => unitPrice * packs;
  double get looseTotal => basePrice * loose;
  double get total => packTotal + looseTotal;

  /// Money for display.
  ///
  /// [exact] is for base-unit prices, which divide a pack price by its factor
  /// and so are routinely not representable at 2dp: RM 12.50 / 12 is
  /// 1.041666… Showing 1.04 there makes the line beneath it look wrong — the
  /// operator multiplies by 5, gets 5.20, and reads 5.21 next to it. The extra
  /// decimals appear only when they are actually needed, so a clean price like
  /// RM 2.50 is never dressed up as RM 2.5000.
  static String money(double v, {bool exact = false}) {
    if (!exact) return v.toStringAsFixed(2);
    final rounded = double.parse(v.toStringAsFixed(2));
    return (rounded - v).abs() < 0.0000005
        ? v.toStringAsFixed(2)
        : v.toStringAsFixed(4);
  }

  /// Quantities: whole numbers stay whole, fractions keep their decimals.
  static String qty(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();
}
