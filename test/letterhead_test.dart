import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/models/app_location.dart';

/// The letterhead is what a customer's customer reads on a quotation. It used
/// to be hardcoded, which shipped one company's address to every deployment —
/// a fault with no error and no crash, visible only on paper.
void main() {
  AppLocation loc({
    String? a1,
    String? a2,
    String? a3,
    String? postcode,
    String? city,
    String? state,
    String? phone,
    String? fax,
    String? email,
  }) =>
      AppLocation()
        ..companyCode = 1
        ..locationCode = 'YT'
        ..address1 = a1
        ..address2 = a2
        ..address3 = a3
        ..postcode = postcode
        ..city = city
        ..state = state
        ..phone = phone
        ..fax = fax
        ..email = email;

  group('prints only what exists', () {
    test('a site with nothing filled in prints nothing', () {
      // This is the YeonTak case today: names are set, addresses are blank.
      // Blank is honest; a leftover from another deployment is not.
      expect(loc().letterheadLines, isEmpty);
    });

    test('blank and whitespace-only fields are dropped, not printed', () {
      expect(loc(a1: '   ', city: '', phone: '  ').letterheadLines, isEmpty);
    });

    test('a partially filled site prints just its parts', () {
      expect(
        loc(a1: 'LOT 1422 EASTWOOD VALLEY', email: 'sales@example.com')
            .letterheadLines,
        ['LOT 1422 EASTWOOD VALLEY', 'Email: sales@example.com'],
      );
    });
  });

  group('formatting', () {
    test('postcode, city and state read as one line', () {
      expect(
        loc(postcode: '96000', city: 'MIRI', state: 'SARAWAK').letterheadLines,
        ['96000 MIRI SARAWAK'],
      );
    });

    test('a missing part of that line does not leave a double space', () {
      expect(loc(city: 'MIRI', state: 'SARAWAK').letterheadLines,
          ['MIRI SARAWAK']);
    });

    test('one number serving as both collapses to TEL/FAX', () {
      // Printing "TEL: x FAX: x" twice over reads as an error to a customer.
      expect(loc(phone: '085-419489', fax: '085-419489').letterheadLines,
          ['TEL/FAX: 085-419489']);
    });

    test('different numbers stay labelled separately', () {
      expect(loc(phone: '085-419489', fax: '085-111222').letterheadLines,
          ['TEL: 085-419489   FAX: 085-111222']);
    });

    test('either one alone is labelled correctly', () {
      expect(loc(phone: '013-6686555').letterheadLines, ['TEL: 013-6686555']);
      expect(loc(fax: '085-419489').letterheadLines, ['FAX: 085-419489']);
    });

    test('a fully populated site reads in document order', () {
      expect(
        loc(
          a1: 'LOT 1422 EASTWOOD VALLEY INDUSTRIAL PARK 1,',
          a2: 'JALAN MIRI BY-PASS,',
          postcode: '96000',
          city: 'MIRI',
          state: 'SARAWAK',
          phone: '085-419489',
          fax: '085-419489',
          email: 'sales@example.com',
        ).letterheadLines,
        [
          'LOT 1422 EASTWOOD VALLEY INDUSTRIAL PARK 1,',
          'JALAN MIRI BY-PASS,',
          '96000 MIRI SARAWAK',
          'TEL/FAX: 085-419489',
          'Email: sales@example.com',
        ],
      );
    });
  });
}
