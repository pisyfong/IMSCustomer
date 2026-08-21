import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/widgets/ui_kit.dart';

/// Regression tests for UiAvatar.initialsFor.
///
/// These exist because of a real field failure: opening the ordering hub for
/// ONE customer showed a blank page, while every other customer worked. The
/// old sales-quotation page derived its avatar initials with
///
///     final words = name.split(' ');
///     if (words.length >= 2) return '${words[0][0]}${words[1][0]}';
///
/// `split(' ')` splits on EVERY single space, so any run of two spaces — or a
/// leading space — yields an empty element, and indexing `[0]` into it throws
/// RangeError. The throw happened inside build(), so Flutter replaced the whole
/// page with an ErrorWidget: a blank screen, no message, no crash report.
///
/// A customer name is free text typed by staff. Double spaces are normal, not
/// exotic, which is why it hit exactly one record and looked like data
/// corruption rather than a code bug.
void main() {
  group('initialsFor — the shapes that used to crash', () {
    // The actual field failure, captured from the device log:
    //   CustomerStateService: Selected customer set - GROCERY  (11/G02)
    // Note the two spaces before '(' — the print template only supplies one,
    // so AR_Customer.Name is literally 'GROCERY '. One word plus a trailing
    // space is the exact combination that breaks split(' ')[1].
    test('THE one: customer 11/G02, Name = "GROCERY "', () {
      expect(UiAvatar.initialsFor('GROCERY '), 'G');
    });

    test('double space between words', () {
      // "ABC  SDN BHD".split(' ') == ['ABC', '', 'SDN', 'BHD'] -> ''[0] threw.
      expect(UiAvatar.initialsFor('ABC  SDN BHD'), 'AS');
    });

    test('leading space', () {
      // ' ABC'.split(' ') == ['', 'ABC'] -> words[0][0] threw on the FIRST word.
      expect(UiAvatar.initialsFor(' ABC TRADING'), 'AT');
    });

    test('trailing space with a single word', () {
      expect(UiAvatar.initialsFor('ABC '), 'A');
    });

    test('tab and newline count as separators, not as characters', () {
      expect(UiAvatar.initialsFor('ABC\tSDN\nBHD'), 'AS');
    });

    test('whitespace only degrades to a placeholder', () {
      expect(UiAvatar.initialsFor('   '), '?');
    });

    test('empty name degrades to a placeholder', () {
      expect(UiAvatar.initialsFor(''), '?');
    });
  });

  group('initialsFor — ordinary names still behave', () {
    test('two words', () {
      expect(UiAvatar.initialsFor('Ahmad Faizal'), 'AF');
    });

    test('one word', () {
      expect(UiAvatar.initialsFor('Ahmad'), 'A');
    });

    test('more than two words uses the first two only', () {
      expect(UiAvatar.initialsFor('Syarikat Perniagaan Maju Jaya'), 'SP');
    });

    test('already uppercase is left alone', () {
      expect(UiAvatar.initialsFor('MDS SARAWAK'), 'MS');
    });
  });

  group('initialsFor — non-ASCII', () {
    // `.characters` takes a grapheme cluster, not a UTF-16 code unit. Indexing
    // with [0] would split a surrogate pair and produce an unrenderable half
    // character.
    test('emoji is not split mid-surrogate', () {
      expect(UiAvatar.initialsFor('🏢 Warehouse'), '🏢W');
    });

    test('accented letters survive uppercasing', () {
      expect(UiAvatar.initialsFor('Émile Zola'), 'ÉZ');
    });
  });

  group('colorFor is total', () {
    // Dart's % is euclidean — negative hashCodes still index safely — but the
    // guarantee is worth pinning, since the old code relied on it implicitly.
    test('never throws, whatever the name', () {
      for (final n in ['', ' ', 'A', 'ABC  SDN BHD', '🏢', 'x' * 500]) {
        expect(() => UiAvatar.colorFor(n), returnsNormally, reason: 'name: "$n"');
      }
    });
  });
}
