import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/removed_uploads_service.dart';

/// Removing a pending upload takes the row out of the list, the tab counts
/// and the dashboard badge — but not out of the database. The only things that
/// can go wrong are the key (remove the wrong row, or fail to find it again to
/// restore it) and the round trip through storage.
void main() {
  group('keys identify one row and only that row', () {
    test('kind and pre-label together make the key', () {
      expect(RemovedUploadsService.keyFor('SQ', 'FST/SQ/002755'),
          'SQ|FST/SQ/002755');
    });

    test('the same pre-label under two kinds is two different rows', () {
      // A pick and a quotation could carry the same number. Without the kind,
      // removing one would remove the other.
      expect(RemovedUploadsService.keyFor('PICK', 'X-001'),
          isNot(RemovedUploadsService.keyFor('PACK', 'X-001')));
    });

    test('case and padding do not create a second key for one row', () {
      // Pre-labels come off char(n) columns and through several code paths;
      // 'x-001', 'X-001 ' and 'X-001' are one document.
      final a = RemovedUploadsService.keyFor('SQ', 'x-001');
      final b = RemovedUploadsService.keyFor('SQ', ' X-001 ');
      final c = RemovedUploadsService.keyFor('SQ', 'X-001');
      expect(a, b);
      expect(b, c);
    });

    test('a missing pre-label still yields a stable key, not a crash', () {
      expect(RemovedUploadsService.keyFor('SQ', null), 'SQ|');
      expect(RemovedUploadsService.keyFor('SQ', ''), 'SQ|');
      expect(RemovedUploadsService.keyFor('SQ', '   '), 'SQ|');
    });

    test('two rows that both lack a pre-label collide — known and accepted',
        () {
      // Documented rather than hidden: an unlabelled draft is a transient
      // state, and the cost is that removing one removes the other until either
      // gets its number. Restoring brings both back.
      expect(RemovedUploadsService.keyFor('SQ', null),
          RemovedUploadsService.keyFor('SQ', ''));
    });
  });

  group('the set semantics the page relies on', () {
    test('removing twice leaves one entry, so restoring once is enough', () {
      final set = <String>{};
      const k = 'SQ|A';
      set.add(k);
      set.add(k);
      expect(set.length, 1);
      set.remove(k);
      expect(set, isEmpty);
    });

    test('filtering keeps everything not removed', () {
      final removed = {'SQ|B'};
      final rows = ['SQ|A', 'SQ|B', 'SQ|C'];
      expect(rows.where((r) => !removed.contains(r)).toList(), ['SQ|A', 'SQ|C']);
    });

    test('the recycle bin lists exactly what the list suppresses', () {
      final removed = {'SQ|B'};
      final rows = ['SQ|A', 'SQ|B', 'SQ|C'];
      expect(rows.where((r) => removed.contains(r)).toList(), ['SQ|B']);
    });

    test('with nothing removed the normal view is unchanged', () {
      final removed = <String>{};
      final rows = ['SQ|A', 'SQ|B'];
      expect(rows.where((r) => !removed.contains(r)).toList(), rows);
      expect(rows.where((r) => removed.contains(r)), isEmpty);
    });
  });
}
