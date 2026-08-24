import 'package:isar/isar.dart';

import '../main.dart';
import '../models/inventory_item.dart';
import '../models/invoice.dart';
import '../models/quotation.dart';
import '../models/quote_item.dart';

/// Which kind of document a credit note is being raised against.
enum SourceDocKind { invoice, quotation }

extension SourceDocKindX on SourceDocKind {
  String get label => this == SourceDocKind.invoice ? 'Invoice' : 'Quotation';
  String get short => this == SourceDocKind.invoice ? 'SI' : 'SQ';
}

/// A past invoice or quotation, reduced to what picking one needs.
///
/// Deliberately not the Isar entity: the picker and the item sheet only care
/// about the number, the date and the size of the document, and keeping the
/// two source shapes behind one type is what lets the rest of the credit note
/// stay ignorant of which one was chosen.
class SourceDocument {
  final SourceDocKind kind;
  final String docNo;
  final DateTime? date;
  final String? customer;
  final double netAmount;

  const SourceDocument({
    required this.kind,
    required this.docNo,
    required this.date,
    required this.customer,
    required this.netAmount,
  });
}

/// One line of a [SourceDocument], carrying the price it was sold at.
///
/// The prices are the document's own, not today's master price — that is the
/// whole point of raising a credit note against a document. What the customer
/// was actually charged is what they get credited, unless the operator
/// deliberately changes it.
class SourceDocumentLine {
  final int skuNo;
  final String? pluNo;
  final String? description;
  final String uom;
  final double factor;

  /// As billed: whole [uom] units and loose base units, kept apart so the row
  /// can show the operator exactly what the document said.
  final double quantity;
  final double quantityLoose;
  final double foc;
  final double focLoose;

  /// Price per [uom] on the source document.
  final double unitPrice;

  /// The item's selling price at the time, carried onto the adjustment line
  /// for reference exactly as legacy does.
  final double sellingPrice;

  final double averageCost;
  final double standardCost;
  final double lastCost;

  const SourceDocumentLine({
    required this.skuNo,
    required this.pluNo,
    required this.description,
    required this.uom,
    required this.factor,
    required this.quantity,
    required this.quantityLoose,
    required this.foc,
    required this.focLoose,
    required this.unitPrice,
    required this.sellingPrice,
    required this.averageCost,
    required this.standardCost,
    required this.lastCost,
  });

  double get _f => factor > 0 ? factor : 1;

  /// The whole line expressed in [uom], loose units folded back in. An
  /// adjustment line has one quantity and one UOM, so this is what gets
  /// suggested — and it is the same arithmetic the history rows use.
  double get qtyInUom => quantity + quantityLoose / _f;

  double get focInUom => foc + focLoose / _f;

  /// What the line was worth on the source document: packs at the UOM price,
  /// loose at the base-unit price, free goods free.
  double get lineValue => unitPrice * quantity + (unitPrice / _f) * quantityLoose;

  bool get hasAnything => qtyInUom > 0 || focInUom > 0;
}

/// Loads a customer's past invoices and quotations, and their lines, from the
/// local cache.
///
/// Local only, by design: credit notes are raised in a customer's yard where
/// there is no signal, and the documents involved are ones the device already
/// synced. A network round trip here would turn a working screen into a
/// spinner exactly where it is least wanted.
class SourceDocumentService {
  /// Documents for one customer, newest first.
  Future<List<SourceDocument>> documents({
    required int companyCode,
    required String customerCode,
    required SourceDocKind kind,
    int limit = 60,
  }) async {
    if (customerCode.trim().isEmpty) return [];
    final code = customerCode.trim();

    if (kind == SourceDocKind.invoice) {
      final rows = await isar.invoices
          .filter()
          .companyCodeEqualTo(companyCode)
          .customerEqualTo(code)
          .findAll();
      rows.sort((a, b) => (b.invoiceDate ?? DateTime(1970))
          .compareTo(a.invoiceDate ?? DateTime(1970)));
      return rows
          .take(limit)
          .map((e) => SourceDocument(
                kind: kind,
                docNo: e.invoicePreLabel.trim(),
                date: e.invoiceDate,
                customer: e.customer,
                netAmount: e.netAmount ?? 0,
              ))
          .toList();
    }

    final rows = await isar.quotations
        .filter()
        .companyCodeEqualTo(companyCode)
        .customerEqualTo(code)
        .sortByQuoteDateDesc()
        .limit(limit)
        .findAll();
    return rows
        .map((e) => SourceDocument(
              kind: kind,
              docNo: e.quotePreLabel.trim(),
              date: e.quoteDate,
              customer: e.customer,
              netAmount: e.netAmount ?? 0,
            ))
        .toList();
  }

  /// The lines of one document, in document order, enriched with the
  /// description and costs the adjustment line has to carry.
  ///
  /// Neither `MP_Quote_Item` nor `SI_Invoice_Item` stores a description — both
  /// join to the item master for it — so the master is read here once per SKU
  /// rather than leaving every row showing "SKU 12345".
  Future<List<SourceDocumentLine>> lines({
    required int companyCode,
    required SourceDocument doc,
  }) async {
    final raw = doc.kind == SourceDocKind.invoice
        ? await _invoiceLines(companyCode, doc.docNo)
        : await _quoteLines(companyCode, doc.docNo);
    if (raw.isEmpty) return [];

    final masters = await _masters(companyCode, raw.map((e) => e.skuNo).toSet());

    return raw.map((l) {
      final m = masters['${l.skuNo}|${l.uom.toUpperCase()}'] ??
          masters['${l.skuNo}|'];
      return SourceDocumentLine(
        skuNo: l.skuNo,
        pluNo: (l.pluNo ?? '').trim().isEmpty
            ? (m?.pluNo?.toString().trim())
            : l.pluNo!.trim(),
        description: m?.description,
        uom: l.uom,
        factor: l.factor,
        quantity: l.quantity,
        quantityLoose: l.quantityLoose,
        foc: l.foc,
        focLoose: l.focLoose,
        unitPrice: l.unitPrice,
        // The master's price is the fallback only; the document's own price
        // wins, because that is what the customer was charged.
        sellingPrice: l.sellingPrice > 0
            ? l.sellingPrice
            : (m?.gstPrice ?? m?.price ?? 0),
        averageCost: l.averageCost > 0 ? l.averageCost : (m?.averageCost ?? 0),
        standardCost:
            l.standardCost > 0 ? l.standardCost : (m?.standardCost ?? 0),
        lastCost: l.lastCost > 0 ? l.lastCost : (m?.lastCost ?? 0),
      );
    }).where((l) => l.hasAnything).toList();
  }

  // ── Per-source readers ───────────────────────────────────────────────────

  Future<List<_RawLine>> _invoiceLines(int companyCode, String docNo) async {
    final rows = await isar.invoiceItems
        .filter()
        .companyCodeEqualTo(companyCode)
        .invoicePreLabelEqualTo(docNo)
        .findAll();
    rows.sort((a, b) => (a.itemSequence ?? a.sequenceNo)
        .compareTo(b.itemSequence ?? b.sequenceNo));
    return rows
        .map((e) => _RawLine(
              skuNo: e.skuNo,
              pluNo: e.pluNo,
              uom: e.uom,
              factor: e.factor ?? 1,
              quantity: e.quantity ?? 0,
              quantityLoose: e.quantityLoose ?? 0,
              foc: e.foc ?? 0,
              focLoose: e.focLoose ?? 0,
              unitPrice: e.unitPrice ?? 0,
              sellingPrice: e.instantNormalSellingPrice ?? e.unitPrice ?? 0,
              averageCost: e.averageCost ?? 0,
              standardCost: e.standardCost ?? 0,
              lastCost: e.lastCost ?? 0,
            ))
        .toList();
  }

  Future<List<_RawLine>> _quoteLines(int companyCode, String docNo) async {
    final rows = await isar.quoteItems
        .filter()
        .companyCodeEqualTo(companyCode)
        .quotePreLabelEqualTo(docNo)
        .findAll();
    rows.sort((a, b) => (a.itemSequence ?? a.sequenceNo)
        .compareTo(b.itemSequence ?? b.sequenceNo));
    return rows
        .map((e) => _RawLine(
              skuNo: e.skuNo,
              pluNo: e.pluNo,
              uom: e.uom,
              factor: e.factor ?? 1,
              quantity: e.quoteQuantity ?? 0,
              quantityLoose: e.quoteQuantityLoose ?? 0,
              foc: e.quoteFoc ?? 0,
              focLoose: e.quoteFocLoose ?? 0,
              unitPrice: e.unitPrice ?? 0,
              sellingPrice: e.instantNormalSellingPrice ?? e.unitPrice ?? 0,
              averageCost: e.averageCost ?? 0,
              standardCost: e.standardCost ?? 0,
              lastCost: e.lastCost ?? 0,
            ))
        .toList();
  }

  /// Item master rows for a set of SKUs, keyed `sku|UOM` and again as `sku|`
  /// so a line whose UOM has no master row still finds a description.
  Future<Map<String, InventoryItem>> _masters(
      int companyCode, Set<int> skus) async {
    if (skus.isEmpty) return {};
    final rows = await isar.inventoryItems
        .filter()
        .companyCodeEqualTo(companyCode)
        .anyOf(skus, (q, sku) => q.skuNoEqualTo(sku))
        .findAll();
    final out = <String, InventoryItem>{};
    for (final r in rows) {
      out['${r.skuNo}|${(r.uom ?? '').toUpperCase()}'] = r;
      out.putIfAbsent('${r.skuNo}|', () => r);
    }
    return out;
  }
}

/// The two source shapes normalised before the master join.
class _RawLine {
  final int skuNo;
  final String? pluNo;
  final String uom;
  final double factor;
  final double quantity;
  final double quantityLoose;
  final double foc;
  final double focLoose;
  final double unitPrice;
  final double sellingPrice;
  final double averageCost;
  final double standardCost;
  final double lastCost;

  const _RawLine({
    required this.skuNo,
    required this.pluNo,
    required this.uom,
    required this.factor,
    required this.quantity,
    required this.quantityLoose,
    required this.foc,
    required this.focLoose,
    required this.unitPrice,
    required this.sellingPrice,
    required this.averageCost,
    required this.standardCost,
    required this.lastCost,
  });
}
