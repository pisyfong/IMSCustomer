import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/models/invoice.dart';
import 'package:ims_customer/pages/add_pack_from_si_tab.dart' show isInvoiceVoided;
import 'package:ims_customer/services/si_pack_balance_service.dart';

/// Which invoices may be packed, and which lines of them count.
///
/// The statuses come from two different vocabularies and mixing them up is
/// silent: the HEADER uses A/F/P/C (settlement), the LINES use A/C, and picks
/// and packs elsewhere in this app use 'X'. Checking the wrong letter doesn't
/// error — it just quietly offers voided goods, or hides live ones.
void main() {
  group('which invoices can be packed', () {
    test('settlement status does not gate packing', () {
      // A/F/P describe PAYMENT, not whether the goods have shipped. Barring
      // settled invoices would hide the large majority: on the live server the
      // last 90 days hold A=406 against F=8683.
      expect(isInvoiceVoided('A'), isFalse, reason: 'open');
      expect(isInvoiceVoided('F'), isFalse, reason: 'fully settled');
      expect(isInvoiceVoided('P'), isFalse, reason: 'part settled');
    });

    test('a voided invoice cannot be packed', () {
      // Legacy marks a void as Status 'C' with Voided_By/Voided_Date.
      expect(isInvoiceVoided('C'), isTrue);
    });

    test('tolerates padding and case from a char() column', () {
      expect(isInvoiceVoided(' c '), isTrue);
      expect(isInvoiceVoided('c'), isTrue);
      expect(isInvoiceVoided(' A '), isFalse);
    });

    test('an unset status is treated as packable, not voided', () {
      // Refusing on null would strand real work over a missing field.
      expect(isInvoiceVoided(null), isFalse);
      expect(isInvoiceVoided(''), isFalse);
    });
  });

  group('which invoice LINES count', () {
    test("a cancelled line is 'C' — the invoice vocabulary", () {
      expect(SiPackBalanceService.isLineCancelled('C'), isTrue);
    });

    test("'X' is also honoured, so a mixed convention cannot leak through", () {
      // Picks and packs use 'X'. Accepting both means a row written by either
      // convention can never quietly count as live stock.
      expect(SiPackBalanceService.isLineCancelled('X'), isTrue);
    });

    test('a live line counts', () {
      expect(SiPackBalanceService.isLineCancelled('A'), isFalse);
      expect(SiPackBalanceService.isLineCancelled(null), isFalse);
    });
  });

  group('cancelled lines are not demand', () {
    InvoiceItem line(String status, double qty, double foc) => InvoiceItem(
          companyCode: 1,
          invoicePreLabel: 'YTSI-2608/0001',
          sequenceNo: 1,
          doPreLabel: '',
          skuNo: 604,
          uom: 'CTN',
          status: status,
          quantity: qty,
          foc: foc,
        );

    test('a live line is counted, FOC included — free goods still ship', () {
      final d = SiPackBalanceService.invoicedByLine([line('A', 10, 2)]);
      expect(d[SiPackBalanceService.keyFor(604, 'CTN')], 12);
    });

    test('a cancelled line contributes nothing', () {
      // Before this was fixed the code checked for 'X', so a 'C' line counted
      // as demand and the invoice could never read as fully packed.
      final d = SiPackBalanceService.invoicedByLine([line('C', 10, 2)]);
      expect(d, isEmpty);
    });
  });
}
