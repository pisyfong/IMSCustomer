import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/models/cart_item.dart';
import 'package:ims_customer/services/qty.dart';

/// Quantities are 2dp from the field the operator types into all the way to
/// `decimal(18,4)` in RMS. These pin the two ends of that: what the helper
/// does, and that a CartItem cannot hold a quantity it could not display.
void main() {
  group('rounding', () {
    test('two decimals survive', () {
      expect(Qty.round(2.5), 2.5);
      expect(Qty.round(2.55), 2.55);
      expect(Qty.round(0.01), 0.01);
    });

    test('a third decimal is rounded away', () {
      expect(Qty.round(2.555), 2.56);
      expect(Qty.round(1.004), 1.0);
    });

    test('float drift is cleaned up', () {
      // 0.1 + 0.2 is 0.30000000000000004. A cart line accumulates by addition,
      // so this is the everyday case, not a curiosity.
      expect(Qty.round(0.1 + 0.2), 0.3);
      expect(Qty.round(2.675), 2.67); // binary float, same as toStringAsFixed
    });

    test('rounding agrees with formatting, always', () {
      // If these ever disagreed, a line would display one quantity and store
      // another — the exact failure the shared helper exists to prevent.
      for (final v in [
        0.0, 0.005, 0.01, 1.0 / 3, 2.5, 2.555, 12.345, 999.999, 0.1 + 0.2
      ]) {
        expect(Qty.fmt(Qty.round(v)), Qty.fmt(v), reason: 'v = $v');
      }
    });
  });

  group('formatting', () {
    test('always two places, so a column of quantities lines up', () {
      expect(Qty.fmt(10), '10.00');
      expect(Qty.fmt(0), '0.00');
      expect(Qty.fmt(2.5), '2.50');
    });
  });

  group('parsing operator input', () {
    test('an empty field reads as zero, not as junk', () {
      // Clearing a box to retype it must not tear the row out from under the
      // cursor, so empty is a real value.
      expect(Qty.tryParse(''), 0);
      expect(Qty.tryParse('   '), 0);
    });

    test('mid-typing junk is refused rather than committed', () {
      expect(Qty.tryParse('-'), isNull);
      expect(Qty.tryParse('1.2.3'), isNull);
      expect(Qty.tryParse('abc'), isNull);
      expect(Qty.tryParse('-5'), isNull);
    });

    test('a valid entry comes back rounded', () {
      expect(Qty.tryParse('2.5'), 2.5);
      expect(Qty.tryParse(' 2.567 '), 2.57);
    });

    test('infinity and NaN do not get through', () {
      // double.tryParse accepts these spellings, and either would poison a
      // total all the way to the invoice.
      expect(Qty.tryParse('Infinity'), isNull);
      expect(Qty.tryParse('NaN'), isNull);
    });
  });

  group('CartItem holds what it shows', () {
    test('a decimal quantity is kept, not rounded to a whole number', () {
      // This is the regression: the cart used to do `value.round()`, so a
      // 2.5 KG line silently became 3 KG — while Loose on the same row kept
      // its decimals.
      final item = CartItem()..quantity = 2.5;
      expect(item.quantity, 2.5);
    });

    test('a third decimal cannot be stored', () {
      final item = CartItem()..quantity = 2.555;
      expect(item.quantity, 2.56);
      expect(Qty.fmt(item.quantity), '2.56');
    });

    test('a negative quantity clamps to zero', () {
      final item = CartItem()..quantity = -3;
      expect(item.quantity, 0);
    });

    test('an unset quantity reads as zero, not as a sentinel', () {
      // A cart row written by the previous build has no `qty` at all. Null
      // collapsing to 0 is visibly wrong; a reinterpreted int would be
      // plausibly wrong, which is worse.
      expect(CartItem().quantity, 0);
    });

    test('the money follows the decimal quantity', () {
      final item = CartItem()
        ..unitPrice = 10
        ..factor = 12
        ..quantity = 2.5;
      expect(item.subtotal, 25.0);
    });

    test('base units add packs and basic quantities together', () {
      final item = CartItem()
        ..factor = 12
        ..quantity = 2.5
        ..quantityLoose = 3
        ..foc = 1;
      // (2.5 + 1) × 12 + 3
      expect(item.totalBaseUnits, 45.0);
    });
  });
}
