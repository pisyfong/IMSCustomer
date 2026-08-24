import 'package:flutter_test/flutter_test.dart';
import 'package:ims_customer/services/source_document_service.dart';

SourceDocumentLine line({
  double quantity = 0,
  double quantityLoose = 0,
  double foc = 0,
  double focLoose = 0,
  double unitPrice = 0,
  double factor = 1,
}) =>
    SourceDocumentLine(
      skuNo: 1,
      pluNo: null,
      description: 'X',
      uom: 'CTN',
      factor: factor,
      quantity: quantity,
      quantityLoose: quantityLoose,
      foc: foc,
      focLoose: focLoose,
      unitPrice: unitPrice,
      sellingPrice: unitPrice,
      averageCost: 0,
      standardCost: 0,
      lastCost: 0,
    );

void main() {
  group('a source line folded into one adjustment quantity', () {
    test('whole packs pass through untouched', () {
      expect(line(quantity: 3, factor: 12).qtyInUom, 3);
    });

    test('loose units come back as a fraction of the pack', () {
      // 2 cartons plus 6 loose of a 12-pack is two and a half cartons — the
      // adjustment line has one quantity and one UOM, so that is what it must
      // carry.
      expect(line(quantity: 2, quantityLoose: 6, factor: 12).qtyInUom, 2.5);
    });

    test('a loose-only line still credits something', () {
      // The failure this guards: dropping the line because Quantity is zero,
      // which is exactly how a part-carton return would vanish.
      final l = line(quantityLoose: 6, factor: 12);
      expect(l.qtyInUom, 0.5);
      expect(l.hasAnything, isTrue);
    });

    test('free goods fold the same way', () {
      expect(line(foc: 1, focLoose: 6, factor: 12).focInUom, 1.5);
    });

    test('a factor of zero is treated as one, not divided by', () {
      expect(line(quantity: 1, quantityLoose: 2, factor: 0).qtyInUom, 3);
    });

    test('an empty line is not offered', () {
      expect(line().hasAnything, isFalse);
    });
  });

  group('what the document charged', () {
    test('packs at the pack price, loose at the base price', () {
      // 2 × 24.00 plus 6 × 2.00 = 60.00.
      final l = line(quantity: 2, quantityLoose: 6, unitPrice: 24, factor: 12);
      expect(l.lineValue, 60);
    });

    test('free goods are worth nothing', () {
      expect(line(foc: 5, focLoose: 5, unitPrice: 24, factor: 12).lineValue, 0);
    });
  });
}
