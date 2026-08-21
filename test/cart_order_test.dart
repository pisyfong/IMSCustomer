import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/models/cart_item.dart';

/// Cart order is not cosmetic: checkout numbers the lines by their position,
/// so this ordering becomes `Quote_Item.Sequence_No` and the order of the
/// printed quotation. These pin the rule that decides it.
void main() {
  var nextId = 1;
  CartItem line({int? sortIndex, int addedMs = 0, int? id}) {
    final it = CartItem()
      ..companyCode = 1
      ..skuNo = 100
      ..sortIndex = sortIndex
      ..addedDate = DateTime.fromMillisecondsSinceEpoch(addedMs);
    it.id = id ?? nextId++;
    return it;
  }

  List<int?> orderOf(List<CartItem> items) {
    final copy = [...items]..sort(CartItem.compareForSequence);
    return [for (final i in copy) i.sortIndex];
  }

  group('a cart that has been arranged', () {
    test('follows the manual order', () {
      final items = [line(sortIndex: 2), line(sortIndex: 0), line(sortIndex: 1)];
      expect(orderOf(items), [0, 1, 2]);
    });

    test('a newly added line goes to the bottom, not the top', () {
      // The new line has no sortIndex. If null sorted first, every item added
      // after an arrangement would jump the queue.
      final arranged = [line(sortIndex: 0), line(sortIndex: 1)];
      final fresh = line(addedMs: 5000);
      expect(orderOf([fresh, ...arranged]), [0, 1, null]);
    });

    test('two fresh lines keep the order they were added in', () {
      final a = line(addedMs: 1000, id: 10);
      final b = line(addedMs: 2000, id: 11);
      final sorted = [b, a]..sort(CartItem.compareForSequence);
      expect(sorted.first.id, 10);
    });
  });

  group('a cart that has never been arranged', () {
    test('is ordered by when things were added', () {
      final a = line(addedMs: 3000, id: 1);
      final b = line(addedMs: 1000, id: 2);
      final c = line(addedMs: 2000, id: 3);
      final sorted = [a, b, c]..sort(CartItem.compareForSequence);
      expect([for (final i in sorted) i.id], [2, 3, 1]);
    });

    test('items added in the same millisecond fall back to id', () {
      // Without this the two would compare equal and their order would depend
      // on the sort's stability and on Isar's storage layout.
      final a = line(addedMs: 1000, id: 7);
      final b = line(addedMs: 1000, id: 4);
      final sorted = [a, b]..sort(CartItem.compareForSequence);
      expect([for (final i in sorted) i.id], [4, 7]);
    });
  });

  group('the comparator is a valid ordering', () {
    test('it is antisymmetric on every pair the cart can produce', () {
      final items = [
        line(sortIndex: 0, addedMs: 900, id: 1),
        line(sortIndex: 1, addedMs: 100, id: 2),
        line(addedMs: 500, id: 3),
        line(addedMs: 500, id: 4),
        line(addedMs: 700, id: 5),
      ];
      for (final a in items) {
        for (final b in items) {
          final ab = CartItem.compareForSequence(a, b);
          final ba = CartItem.compareForSequence(b, a);
          expect(ab.sign, -ba.sign, reason: 'ids ${a.id} vs ${b.id}');
        }
      }
    });

    test('sorting is stable regardless of the starting arrangement', () {
      final items = [
        line(sortIndex: 1, id: 1),
        line(sortIndex: 0, id: 2),
        line(addedMs: 10, id: 3),
        line(addedMs: 20, id: 4),
      ];
      final forward = [...items]..sort(CartItem.compareForSequence);
      final backward = [...items.reversed]..sort(CartItem.compareForSequence);
      expect([for (final i in forward) i.id], [for (final i in backward) i.id]);
    });
  });

  group('dragging renumbers everything', () {
    test('a moved line takes its new position and the rest close up', () {
      // Mirrors what the page does before it calls reorderCart: remove and
      // reinsert, then hand the whole id list over to be numbered 0..n-1.
      final ids = [10, 11, 12, 13];
      const oldIndex = 0;
      var newIndex = 3; // dropped at the end
      if (newIndex > oldIndex) newIndex -= 1;
      final moved = ids.removeAt(oldIndex);
      ids.insert(newIndex, moved);
      expect(ids, [11, 12, 10, 13]);
    });

    test('a line dragged upward does not overshoot', () {
      final ids = [10, 11, 12, 13];
      const oldIndex = 3;
      var newIndex = 1;
      if (newIndex > oldIndex) newIndex -= 1; // no adjustment going up
      final moved = ids.removeAt(oldIndex);
      ids.insert(newIndex, moved);
      expect(ids, [10, 13, 11, 12]);
    });
  });
}
