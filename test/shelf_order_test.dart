import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/shelf_service.dart';

/// Sorting by shelf only earns its keep if the order matches the walk.
void main() {
  List<String?> sorted(List<String?> input) {
    final out = [...input]..sort(ShelfService.compare);
    return out;
  }

  group('shelf ordering is aisle order, not alphabetical', () {
    test('digit runs compare numerically', () {
      // The whole point: a plain string sort puts C10 before C2, which sends
      // the picker back down the aisle they just walked.
      expect(
        sorted(['W3-C10-1', 'W3-C2-1', 'W3-C1-1']),
        ['W3-C1-1', 'W3-C2-1', 'W3-C10-1'],
      );
    });

    test('orders across a whole warehouse run', () {
      expect(
        sorted(['W3-C13-1', 'W1-C08-01-1', 'W3-C7-1', 'W2-B05-01-2']),
        ['W1-C08-01-1', 'W2-B05-01-2', 'W3-C7-1', 'W3-C13-1'],
      );
    });

    test('leading zeros do not change the order', () {
      expect(sorted(['A08', 'A8', 'A10']).first, anyOf('A08', 'A8'));
      expect(sorted(['A08', 'A10'])..toString(), ['A08', 'A10']);
    });

    test('separators are not significant', () {
      // 'W3-C2' and 'W3 C2' are the same position typed two ways.
      expect(ShelfService.compare('W3-C2', 'W3 C2'), 0);
    });

    test('case is not significant', () {
      expect(ShelfService.compare('col b r7a', 'COL B R7A'), 0);
    });
  });

  group('unplaced items sort last', () {
    test('null and empty go to the end', () {
      expect(sorted(['B2', null, 'A1', '']), ['A1', 'B2', null, '']);
    });

    test('two unplaced items tie', () {
      expect(ShelfService.compare(null, ''), 0);
    });
  });

  group('bins — one item can sit in several', () {
    test('comma-separated splits', () {
      expect(ShelfService.bins('W3-C11-1,W3-C12-1'),
          ['W3-C11-1', 'W3-C12-1']);
    });

    test('semicolons too, and surrounding space is trimmed', () {
      expect(ShelfService.bins('A1 ; B2'), ['A1', 'B2']);
    });

    test('SPACE-separated stays whole — it is ambiguous', () {
      // 'A20 A21' is two bins and 'COL B R7A' is one label; nothing in the
      // data tells them apart, so neither is split.
      expect(ShelfService.bins('A20 A21'), ['A20 A21']);
      expect(ShelfService.bins('COL B R7A'), ['COL B R7A']);
    });

    test('single bin returns itself', () {
      expect(ShelfService.bins('AR08'), ['AR08']);
    });

    test('empty and null yield nothing to group by', () {
      expect(ShelfService.bins(''), isEmpty);
      expect(ShelfService.bins(null), isEmpty);
      expect(ShelfService.bins('   '), isEmpty);
    });
  });

  group('readable', () {
    test('adds a space after a comma so the line can wrap', () {
      expect(ShelfService.readable('W3-C11-1,W3-C12-1'),
          'W3-C11-1, W3-C12-1');
    });

    test('space-separated labels are left exactly as written', () {
      // 'A20 A21' is two bins and 'COL B R7A' is one label containing spaces —
      // indistinguishable, which is why neither is parsed.
      expect(ShelfService.readable('A20 A21'), 'A20 A21');
      expect(ShelfService.readable('COL B R7A'), 'COL B R7A');
    });

    test('does not double a space that is already there', () {
      expect(ShelfService.readable('A1, A2'), 'A1, A2');
    });
  });
}
