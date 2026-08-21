import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/widgets/item_history_list.dart';

/// A history row is now an order waiting to be placed, not a read-only card.
/// Whatever it shows is what the Add button puts in the cart, so parsing and
/// display are worth pinning.
void main() {
  group('parsing a row from either loader', () {
    test('an invoice row', () {
      final e = ItemHistoryEntry.fromMap({
        'invoiceNo': 'INV0012',
        'date': DateTime(2026, 8, 3),
        'qty': 10,
        'uom': 'CTN',
        'price': 204.0,
        'foc': 2,
        'quantityLoose': 3,
        'focLoose': 1,
        'factor': 48,
      });
      expect(e.docNo, 'INV0012');
      expect(e.qty, 10);
      expect(e.foc, 2);
      expect(e.factor, 48);
    });

    test('a quotation row uses the other document key', () {
      final e = ItemHistoryEntry.fromMap({'quoteNo': 'SQ0007', 'qty': 1});
      expect(e.docNo, 'SQ0007');
    });

    test('the old rows, which carried no extras, still parse', () {
      // Both loaders gained foc/loose/factor keys in the same change as this
      // widget. A cached row written before that has none of them, and must
      // read as a plain quantity rather than throwing on a null.
      final e = ItemHistoryEntry.fromMap({
        'invoiceNo': 'INV1',
        'date': null,
        'qty': 4,
        'uom': 'PCS',
        'price': 3.5,
      });
      expect(e.foc, 0);
      expect(e.quantityLoose, 0);
      expect(e.factor, isNull);
      expect(e.hasExtras, isFalse);
    });

    test('numbers arriving as strings or ints are still numbers', () {
      // These maps cross an untyped boundary; Isar gives ints where a double
      // is expected and the hub has been known to send numerics as strings.
      final e = ItemHistoryEntry.fromMap(
          {'qty': '2.5', 'price': 10, 'foc': null, 'factor': '12'});
      expect(e.qty, 2.5);
      expect(e.price, 10.0);
      expect(e.foc, 0);
      expect(e.factor, 12.0);
    });

    test('a missing document number does not become "null"', () {
      expect(ItemHistoryEntry.fromMap({}).docNo, '-');
    });
  });

  group('what the row is worth', () {
    test('packs at the pack price', () {
      const e = ItemHistoryEntry(
          docNo: 'X', date: null, qty: 10, uom: 'CTN', price: 204, factor: 48);
      expect(e.lineTotal, 2040);
    });

    test('basic quantities at the base-unit price, not the pack price', () {
      const e = ItemHistoryEntry(
          docNo: 'X',
          date: null,
          qty: 0,
          uom: 'CTN',
          price: 120,
          quantityLoose: 6,
          factor: 12);
      expect(e.lineTotal, 60); // 6 × (120/12)
    });

    test('FOC adds nothing to the value', () {
      const e = ItemHistoryEntry(
          docNo: 'X',
          date: null,
          qty: 1,
          uom: 'CTN',
          price: 50,
          foc: 5,
          focLoose: 5,
          factor: 10);
      expect(e.lineTotal, 50);
    });

    test('a missing factor does not divide by zero or by null', () {
      const e = ItemHistoryEntry(
          docNo: 'X',
          date: null,
          qty: 1,
          uom: 'EA',
          price: 8,
          quantityLoose: 2);
      expect(e.lineTotal, 24); // factor treated as 1
      const z = ItemHistoryEntry(
          docNo: 'X',
          date: null,
          qty: 0,
          uom: 'EA',
          price: 8,
          quantityLoose: 2,
          factor: 0);
      expect(z.lineTotal, 16);
    });
  });

  group('extras are named, not summed', () {
    test('a line with no extras reads as a plain quantity', () {
      expect(ItemHistoryEntry.fromMap({'qty': 10, 'uom': 'CTN'}).hasExtras,
          isFalse);
    });

    test('any of the three counts as an extra', () {
      for (final k in ['foc', 'quantityLoose', 'focLoose']) {
        expect(ItemHistoryEntry.fromMap({'qty': 1, k: 1}).hasExtras, isTrue,
            reason: k);
      }
    });
  });
}
