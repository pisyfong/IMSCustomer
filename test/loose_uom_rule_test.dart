import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/config/app_config.dart';
import 'package:ims_customer/services/loose_uom_rule.dart';

/// The rule these tests pin is procurement's, not a new one: the PD receive
/// dialog shows its loose row only when the chosen UOM differs from the base
/// UOM, or when the line already carries loose values. Ordering has to answer
/// the same question the same way, or the two modules disagree about what a
/// quantity means.
void main() {
  group('the factor decides', () {
    test('ordering in the base unit hides loose', () {
      expect(
        LooseUomRule.applies(uom: 'EA', baseUom: 'EA', factor: 1),
        isFalse,
      );
    });

    test('ordering in a pack shows loose', () {
      expect(
        LooseUomRule.applies(uom: 'CTN', baseUom: 'EA', factor: 12),
        isTrue,
      );
    });

    test('a factor-1 ALIAS hides loose, even though its name differs', () {
      // Real data, Miri company 1: 199 SKUs carry a non-base UOM whose factor
      // is also 1. SKU 43 is BAG/1, CTN/1, KG/1 — three names for one unit.
      // Procurement's name comparison would offer a loose row on all three;
      // a loose CTN and a whole CTN are the same thing.
      expect(
        LooseUomRule.applies(uom: 'CTN', baseUom: 'BAG', factor: 1),
        isFalse,
      );
      expect(
        LooseUomRule.applies(uom: 'KG', baseUom: 'EA', factor: 1),
        isFalse,
      );
    });

    test('a fractional factor is not a pack', () {
      expect(
        LooseUomRule.applies(uom: 'HALF', baseUom: 'EA', factor: 0.5),
        isFalse,
      );
    });
  });

  group('falling back to the names when no factor arrived', () {
    test('a differing name shows loose', () {
      expect(LooseUomRule.applies(uom: 'CTN', baseUom: 'EA'), isTrue);
    });

    test('the same name does not', () {
      expect(LooseUomRule.applies(uom: 'EA', baseUom: 'EA'), isFalse);
    });

    test('the comparison ignores case and padding, as SQL Server char(n) needs',
        () {
      // In_Stock.Uom is char(n) — blank-padded — so an untrimmed compare would
      // read 'EA  ' as a different unit and show loose on every base-unit line.
      expect(LooseUomRule.applies(uom: 'ea', baseUom: 'EA  '), isFalse);
    });

    test('a zero or negative factor is treated as absent, not as a pack', () {
      expect(LooseUomRule.applies(uom: 'CTN', baseUom: 'EA', factor: 0), isTrue);
      expect(
          LooseUomRule.applies(uom: 'CTN', baseUom: 'EA', factor: -3), isTrue);
      expect(LooseUomRule.applies(uom: 'EA', baseUom: 'EA', factor: 0), isFalse);
    });

    test('nothing to go on at all stays hidden', () {
      // Hidden-but-wanted costs a UOM tap; shown-but-meaningless costs a wrong
      // order, so the unknown case resolves to hidden.
      expect(LooseUomRule.applies(uom: 'EA'), isFalse);
      expect(LooseUomRule.applies(), isFalse);
      expect(LooseUomRule.applies(uom: '', baseUom: 'EA'), isFalse);
    });
  });

  group('never strand a value', () {
    test('an existing loose qty keeps the fields even on a base-unit line', () {
      expect(
        LooseUomRule.applies(
            uom: 'EA', baseUom: 'EA', factor: 1, existingLoose: 3),
        isTrue,
      );
    });

    test('an existing FOC-loose qty does the same', () {
      expect(
        LooseUomRule.applies(
            uom: 'EA', baseUom: 'EA', factor: 1, existingFocLoose: 1),
        isTrue,
      );
    });

    test('zero values do not force the fields open', () {
      expect(
        LooseUomRule.applies(
            uom: 'EA',
            baseUom: 'EA',
            factor: 1,
            existingLoose: 0,
            existingFocLoose: 0),
        isFalse,
      );
    });
  });

  group('the global switch still wins', () {
    test('with loose disabled nothing shows, whatever the UOM', () {
      // Guard rather than assert: this build has the feature on. If a customer
      // build turns it off, the pack case below must go false too.
      if (AppConfig.enableLooseItems) {
        expect(
          LooseUomRule.applies(
              uom: 'CTN', baseUom: 'EA', factor: 12, existingLoose: 5),
          isTrue,
        );
        return;
      }
      expect(
        LooseUomRule.applies(
            uom: 'CTN', baseUom: 'EA', factor: 12, existingLoose: 5),
        isFalse,
      );
    });
  });
}
