import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/line_money.dart';

/// The footer of the ordering sheet now shows its working: unit price, what it
/// multiplies, and the total. That only helps if the numbers on screen agree
/// with each other and with the order that gets created.
void main() {
  group('totals', () {
    test('packs are charged at the UOM price', () {
      final m = LineMoney(unitPrice: 12.50, factor: 12, packs: 10);
      expect(m.packTotal, 125.0);
      expect(m.total, 125.0);
    });

    test('loose is charged per base unit, not per pack', () {
      // The whole point of the split: 5 singles out of a 12-pack costing
      // RM 12.50 is RM 5.21, not RM 62.50.
      final m = LineMoney(unitPrice: 12.50, factor: 12, loose: 5);
      expect(m.looseTotal, closeTo(5.2083, 0.0001));
      expect(m.packTotal, 0);
    });

    test('a mixed line adds both', () {
      final m = LineMoney(unitPrice: 12.50, factor: 12, packs: 10, loose: 5);
      expect(m.total, closeTo(130.2083, 0.0001));
    });

    test('an empty line costs nothing', () {
      expect(LineMoney(unitPrice: 12.50, factor: 12).total, 0);
    });

    test('a missing or nonsense factor cannot divide by zero', () {
      // factor 0 reaching this from a half-loaded UOM list must not produce
      // Infinity on the button — the operator would see "RM Infinity".
      expect(LineMoney(unitPrice: 10, factor: 0, loose: 3).looseTotal, 30);
      expect(LineMoney(unitPrice: 10, factor: -4, loose: 3).looseTotal, 30);
    });

    test('at factor 1 a loose unit costs the same as a pack', () {
      final m = LineMoney(unitPrice: 3.20, factor: 1, packs: 2, loose: 2);
      expect(m.total, closeTo(12.80, 0.0001));
    });
  });

  group('money formatting', () {
    test('ordinary money is two decimals', () {
      expect(LineMoney.money(125), '125.00');
      expect(LineMoney.money(5.208333), '5.21');
    });

    test('an exact base price keeps two decimals — no false precision', () {
      // RM 24.00 / 12 is exactly 2.00. Writing it 2.0000 would suggest a
      // rounding subtlety that is not there.
      expect(LineMoney.money(2.0, exact: true), '2.00');
      expect(LineMoney.money(1.25, exact: true), '1.25');
    });

    test('an inexact base price shows the decimals that explain the total', () {
      // 1.04 × 5 = 5.20, but the line total is 5.21. Four decimals is what
      // makes those two numbers reconcile on screen.
      expect(LineMoney.money(12.50 / 12, exact: true), '1.0417');
    });

    test('rounding is binary-float rounding, not decimal half-up', () {
      // 2.005 is not 2.005 in a double — it is 2.00499999…, so this rounds
      // DOWN. Worth pinning rather than wishing away: it is the same rounding
      // the cart and the quotation do, so the three agree. A display that
      // rounded differently from the stored value is how a sheet ends up
      // promising a total the order does not carry.
      expect(LineMoney.money(2.005), '2.00');
      expect(LineMoney.money(0.994), '0.99');
      expect(LineMoney.money(2.675), '2.67');
    });
  });

  group('quantity formatting', () {
    test('whole numbers do not grow a decimal point', () {
      expect(LineMoney.qty(10), '10');
      expect(LineMoney.qty(0), '0');
    });

    test('fractions keep theirs', () {
      expect(LineMoney.qty(2.5), '2.5');
    });
  });
}
