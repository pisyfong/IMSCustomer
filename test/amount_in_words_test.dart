import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/adjustment_pdf_service.dart';

/// The credit note prints its value in words, and that line is what governs if
/// the digits are ever disputed. It has to match the amount exactly.
void main() {
  group('the sample document', () {
    test('155.00 reads as the legacy report prints it', () {
      // Taken verbatim from FST/CN/000496.
      expect(AmountInWords.ringgit(155),
          'ONE HUNDRED FIFTY-FIVE AND CENTS ZERO ONLY');
    });
  });

  group('whole ringgit', () {
    test('single digits', () {
      expect(AmountInWords.ringgit(1), 'ONE AND CENTS ZERO ONLY');
    });

    test('the teens are not built from tens and units', () {
      expect(AmountInWords.ringgit(13), startsWith('THIRTEEN '));
      expect(AmountInWords.ringgit(15), startsWith('FIFTEEN '));
    });

    test('tens hyphenate, as the printed form does', () {
      expect(AmountInWords.ringgit(45), startsWith('FORTY-FIVE '));
      expect(AmountInWords.ringgit(90), startsWith('NINETY '));
    });

    test('hundreds do NOT take AND — legacy prints it without', () {
      expect(AmountInWords.ringgit(101), startsWith('ONE HUNDRED ONE '));
      expect(AmountInWords.ringgit(200), startsWith('TWO HUNDRED '));
    });

    test('thousands and above', () {
      expect(AmountInWords.ringgit(1000), startsWith('ONE THOUSAND '));
      expect(AmountInWords.ringgit(2500),
          startsWith('TWO THOUSAND FIVE HUNDRED '));
      expect(AmountInWords.ringgit(1000000), startsWith('ONE MILLION '));
    });

    test('zero is spelled, not blank', () {
      expect(AmountInWords.ringgit(0), 'ZERO AND CENTS ZERO ONLY');
    });
  });

  group('cents', () {
    test('are spelled out when present', () {
      expect(AmountInWords.ringgit(12.50), endsWith('AND CENTS FIFTY ONLY'));
      expect(AmountInWords.ringgit(3.05), endsWith('AND CENTS FIVE ONLY'));
    });

    test('are rounded, never truncated', () {
      // Truncating would print a figure lower than the totals box shows, which
      // on a credit note means crediting less than the document says.
      expect(AmountInWords.ringgit(0.159), endsWith('CENTS SIXTEEN ONLY'));
    });

    test('float drift does not lose a cent', () {
      // 1.10 is 1.0999999... in binary; flooring the cents would print NINE.
      expect(AmountInWords.ringgit(1.10), 'ONE AND CENTS TEN ONLY');
      expect(AmountInWords.ringgit(0.1 + 0.2), 'ZERO AND CENTS THIRTY ONLY');
    });
  });
}
