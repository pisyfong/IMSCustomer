import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/models/cart_item.dart';

/// Ordering has to agree with picking about what a line means. Picking reduces
/// an SQ line to base units as
///
///   (Quote_Quantity + Quote_Foc) * Factor + Quote_Quantity_Loose + Quote_Foc_Loose
///
/// and prices only the charged portion. These tests pin the ordering side to
/// the same two rules, because a disagreement shows up as an unfillable order
/// or a customer billed for a giveaway.
void main() {
  CartItem line({
    double quantity = 0,
    double foc = 0,
    double loose = 0,
    double focLoose = 0,
    double factor = 1,
    double price = 0,
  }) =>
      CartItem()
        ..companyCode = 1
        ..skuNo = 604
        ..uom = 'CTN'
        ..factor = factor
        ..unitPrice = price
        ..gstPrice = price
        ..quantity = quantity
        ..foc = foc
        ..quantityLoose = loose
        ..focLoose = focLoose;

  group('base units', () {
    test('pack quantity is multiplied by the factor', () {
      expect(line(quantity: 2, factor: 12).totalBaseUnits, 24);
    });

    test('FOC packs count as units even though they cost nothing', () {
      expect(line(quantity: 2, foc: 1, factor: 12).totalBaseUnits, 36);
    });

    test('loose quantities are already base units and are not scaled', () {
      expect(
        line(quantity: 2, loose: 3, focLoose: 1, factor: 12).totalBaseUnits,
        28, // 2*12 + 3 + 1
      );
    });

    test('a factor of zero is treated as one rather than collapsing the line',
        () {
      expect(line(quantity: 5, factor: 0).totalBaseUnits, 5);
    });

    test('a line with no factor set behaves as singles', () {
      final l = CartItem()
        ..companyCode = 1
        ..skuNo = 1
        ..quantity = 7;
      expect(l.totalBaseUnits, 7);
    });
  });

  group('pricing', () {
    test('FOC adds nothing to the charged amount', () {
      final withFoc = line(quantity: 2, foc: 5, factor: 12, price: 60);
      final without = line(quantity: 2, factor: 12, price: 60);
      expect(withFoc.subtotal, without.subtotal);
      expect(withFoc.subtotal, 120);
    });

    test('loose units are charged per base unit, not per pack', () {
      // One loose piece out of a 12-pack costing 60 is 5, not 60.
      expect(line(quantity: 0, loose: 1, factor: 12, price: 60).subtotal, 5);
    });

    test('FOC loose is free as well', () {
      expect(line(quantity: 1, focLoose: 6, factor: 12, price: 60).subtotal, 60);
    });

    test('a mixed line charges packs and loose but never the giveaway', () {
      // 2 CTN + 3 loose, plus 1 free CTN and 6 free loose.
      final l =
          line(quantity: 2, foc: 1, loose: 3, focLoose: 6, factor: 12, price: 60);
      expect(l.subtotal, 120 + 15); // 2*60 + 3*5
      expect(l.totalBaseUnits, 45); // (2+1)*12 + 3 + 6
    });

    test('unpriced lines do not throw', () {
      expect(line(quantity: 3, loose: 2, factor: 12).subtotal, 0);
    });
  });

  factorFallbackTests();

  group('null quantities read as zero', () {
    test('a line that predates these fields is not garbage', () {
      final legacy = CartItem()
        ..companyCode = 1
        ..skuNo = 1
        ..factor = 12
        ..unitPrice = 60
        ..gstPrice = 60
        ..quantity = 2;
      expect(legacy.focQty, 0);
      expect(legacy.looseQty, 0);
      expect(legacy.focLooseQty, 0);
      expect(legacy.subtotal, 120);
      expect(legacy.totalBaseUnits, 24);
    });
  });
}

/// The factor fallbacks are written in three places and each one guards a
/// nullable column. Getting the order wrong — testing `(f ?? 1) > 0` and then
/// force-unwrapping `f` — passes the guard on null and throws, which is how a
/// red screen ended up flashing on every item tap.
void factorFallbackTests() {
  double factorOrOne(double? factor) {
    final f = factor ?? 1;
    return f > 0 ? f : 1;
  }

  group('factor fallback is null-safe', () {
    test('null falls back to 1 instead of throwing', () {
      expect(() => factorOrOne(null), returnsNormally);
      expect(factorOrOne(null), 1);
    });

    test('zero and negative fall back to 1', () {
      expect(factorOrOne(0), 1);
      expect(factorOrOne(-5), 1);
    });

    test('a real pack size is preserved', () {
      expect(factorOrOne(12), 12);
    });
  });
}
