import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/module_access_service.dart';

/// Access gating is a convenience control over which buttons are live — not a
/// security boundary. The behaviour that matters is which way it fails.
void main() {
  group('parsing the server answer', () {
    test('reads all four flags', () {
      final a = ModuleAccess.fromJson({
        'ordering': true,
        'picking': false,
        'packing': true,
        'creditNote': false,
      });
      expect(a.ordering, isTrue);
      expect(a.picking, isFalse);
      expect(a.packing, isTrue);
      expect(a.creditNote, isFalse);
    });

    test("accepts 'Y' as well as true, like the rest of this schema", () {
      final a = ModuleAccess.fromJson({'ordering': 'Y', 'picking': 'N'});
      expect(a.ordering, isTrue);
      expect(a.picking, isFalse);
    });

    test('a missing flag is denied, not assumed', () {
      // The server always sends all four. If one is absent the answer is
      // malformed, and inventing a grant from silence is the wrong guess —
      // failing open belongs at the service level, where it is deliberate and
      // visible, not hidden inside a parser.
      final a = ModuleAccess.fromJson({'ordering': true});
      expect(a.ordering, isTrue);
      expect(a.picking, isFalse);
      expect(a.packing, isFalse);
      expect(a.creditNote, isFalse);
    });

    test('junk values do not grant access', () {
      final a = ModuleAccess.fromJson(
          {'ordering': 'yes', 'picking': 1, 'packing': null, 'creditNote': {}});
      expect(a.ordering, isFalse);
      expect(a.picking, isFalse);
      expect(a.packing, isFalse);
      expect(a.creditNote, isFalse);
    });
  });

  group('the fallback', () {
    test('allows everything', () {
      // A site with no access.json, or an unreachable server, must not lock
      // people out of an app they were using yesterday.
      expect(ModuleAccess.all.ordering, isTrue);
      expect(ModuleAccess.all.picking, isTrue);
      expect(ModuleAccess.all.packing, isTrue);
      expect(ModuleAccess.all.creditNote, isTrue);
      expect(ModuleAccess.all.any, isTrue);
    });

    test('a fully denied user is still a valid answer', () {
      const none = ModuleAccess(
          ordering: false, picking: false, packing: false, creditNote: false);
      expect(none.any, isFalse);
    });
  });

  group('round trip', () {
    test('survives the cache', () {
      const a = ModuleAccess(
          ordering: true, picking: false, packing: true, creditNote: false);
      final back = ModuleAccess.fromJson(a.toJson());
      expect(back.ordering, a.ordering);
      expect(back.picking, a.picking);
      expect(back.packing, a.packing);
      expect(back.creditNote, a.creditNote);
    });
  });
}
