import 'package:isar/isar.dart';

import '../main.dart';
import '../models/in_stock_plu.dart';
import '../models/in_stock_uom.dart';
import '../models/inventory_item.dart';

/// What a scanned barcode turned into.
///
/// Separated from the page so the resolution rules — which UOM a barcode
/// means, which price applies, what a factor of zero should become — are
/// testable without a camera.
class ScanResolution {
  final int skuNo;
  final String pluNo;
  final String description;

  /// The UOM the *barcode* means, not the item's default.
  ///
  /// `In_Stock_PLU` is keyed per SKU **and** UOM: a carton and a loose piece
  /// of the same item carry different barcodes. Scanning the carton must add a
  /// carton, so the matched row's UOM wins over the master's.
  final String uom;

  /// Base units per [uom]. Never zero — a zero factor divides through every
  /// loose-price calculation downstream.
  final double factor;

  final double gstPrice;
  final double unitPrice;

  const ScanResolution({
    required this.skuNo,
    required this.pluNo,
    required this.description,
    required this.uom,
    required this.factor,
    required this.gstPrice,
    required this.unitPrice,
  });
}

/// Why a scan produced nothing.
enum ScanFailure {
  /// The barcode is not in `In_Stock_PLU` for this company.
  unknownBarcode,

  /// The PLU row exists but carries no SKU — a data fault, not a bad scan.
  pluWithoutSku,

  /// The SKU has no row in the item master, so there is no price to charge.
  noMasterRow,
}

/// The outcome of one scan: exactly one of [resolution] or [failure] is set.
class ScanOutcome {
  final String code;
  final ScanResolution? resolution;
  final ScanFailure? failure;

  const ScanOutcome.found(this.code, ScanResolution this.resolution)
      : failure = null;
  const ScanOutcome.failed(this.code, ScanFailure this.failure)
      : resolution = null;

  bool get ok => resolution != null;
}

/// Turns a scanned barcode into something that can be put in the cart.
///
/// Local tables only. A counter that stops working when the signal drops is
/// not a counter, and every table this needs — `In_Stock_PLU`, the item
/// master, `In_Stock_Uom` — is already cached by full sync.
class ScanResolver {
  final int companyCode;

  /// When true, a scan is booked in the item's BASIC unit whatever unit the
  /// barcode itself stands for.
  ///
  /// Barcodes are printed per pack: an item can carry one code on the carton
  /// and another on the piece. Most counters want everything counted in the
  /// same unit regardless — a carton scanned is twelve pieces — because that
  /// is how the order is written and how stock is held. Turning this off
  /// honours the barcode instead, so a carton barcode books one carton.
  final bool preferBasicUom;

  const ScanResolver({
    required this.companyCode,
    this.preferBasicUom = true,
  });

  /// Whether this SKU carries a barcode for [uom].
  ///
  /// Trimmed and case-folded on both sides: `In_Stock_PLU.Uom` is a padded
  /// char column, so a raw comparison against `'EA'` misses every row.
  Future<bool> _hasPluFor(int sku, String uom) async {
    final target = uom.trim().toUpperCase();
    if (target.isEmpty) return false;
    final rows = await isar.inStockPlus
        .filter()
        .companyCodeEqualTo(companyCode)
        .skuNoEqualTo(sku)
        .findAll();
    return rows
        .any((r) => (r.uom ?? '').trim().toUpperCase() == target);
  }

  Future<ScanOutcome> resolve(String rawCode) async {
    final code = rawCode.trim();
    if (code.isEmpty) {
      return ScanOutcome.failed(code, ScanFailure.unknownBarcode);
    }

    final matches = await isar.inStockPlus
        .filter()
        .companyCodeEqualTo(companyCode)
        .pluNoEqualTo(code)
        .findAll();
    if (matches.isEmpty) {
      return ScanOutcome.failed(code, ScanFailure.unknownBarcode);
    }

    // One barcode can appear against several rows. The one flagged default is
    // the item's own; anything else is an alias.
    final InStockPlu hit =
        matches.where((p) => p.isDefault).firstOrNull ?? matches.first;
    final sku = hit.skuNo;
    if (sku == null) {
      return ScanOutcome.failed(code, ScanFailure.pluWithoutSku);
    }

    // The item master row. `InventoryItem.uom` IS the base unit — established
    // in LooseUomRule against real data: the base UOM's factor is 1 on every
    // row, with no exceptions, and it always exists in In_Stock_Uom.
    final master = await isar.inventoryItems
        .filter()
        .companyCodeEqualTo(companyCode)
        .skuNoEqualTo(sku)
        .findFirst();
    if (master == null) {
      return ScanOutcome.failed(code, ScanFailure.noMasterRow);
    }

    final basicUom = (master.uom ?? '').trim();
    final scannedUom = (hit.uom ?? '').trim();

    final units = await isar.inStockUoms
        .filter()
        .companyCodeEqualTo(companyCode)
        .skuNoEqualTo(sku)
        .findAll();

    InStockUom? rowFor(String uom) {
      if (uom.isEmpty) return null;
      final target = uom.toUpperCase();
      return units
          .where((u) => (u.uom ?? '').trim().toUpperCase() == target)
          .firstOrNull;
    }

    String uom;
    InStockUom? unit;
    if (preferBasicUom && basicUom.isNotEmpty && await _hasPluFor(sku, basicUom)) {
      // `In_Stock.Uom` IS the basic UOM — confirmed by the operator, and it is
      // the column the desktop's Basic UOM field shows.
      //
      // Gated on the basic unit actually carrying a barcode of its own. An
      // item barcoded only by the carton is an item nobody counts in pieces,
      // and rewriting such a scan into an unbarcoded unit invents a line the
      // warehouse cannot check back against the physical goods.
      uom = basicUom;
      unit = rowFor(basicUom);
    } else {
      uom = scannedUom.isNotEmpty ? scannedUom : basicUom;
      unit = rowFor(uom);
    }
    if (uom.isEmpty) uom = 'PCS';

    // Default first, then range-check: the reverse order passes the guard on
    // null and throws on the force-unwrap.
    final candidate = unit?.factor ?? 1.0;
    final factor = candidate > 0 ? candidate : 1.0;

    // NOTE: one scan is one unit of [uom], whichever barcode was used.
    //
    // The barcode identifies the ITEM, not an amount — a counter operator adds
    // a second unit by scanning again. Deliberately NOT scaled by the scanned
    // pack's factor: booking 50 for one pull of the trigger would take the
    // quantity out of the operator's hands, and the whole point of this screen
    // is that the count matches the physical acts performed at the counter.

    // Price comes from the UOM row, NOT the master.
    //
    // The master's price is per BASE unit. Charging it for a carton line
    // undercharges by the whole pack size — twelve pieces billed as one — so
    // the unit's own price is used whenever it exists.
    final gst = unit?.gstPrice ?? unit?.price ?? master.gstPrice ?? master.price ?? 0;
    final net = unit?.price ?? master.price ?? (gst > 0 ? gst / 1.06 : 0);

    // One line, every input and the decision made from them. A scan that
    // resolves to the wrong unit is otherwise undiagnosable from a device: the
    // cart log shows only the outcome, and "it picked EA" and "it picked the
    // base and the base IS EA" look identical from there.
    print('SCAN $code -> sku $sku | basicUom=$basicUom pluUom=$scannedUom '
        'preferBasic=$preferBasicUom => uom=$uom factor=$factor '
        'price=$gst | uomRows=${units.map((u) => '${u.uom}/${u.factor}').join(',')}'
        ' | pluUoms=${matches.map((m) => m.uom).join(',')}');

    return ScanOutcome.found(
      code,
      ScanResolution(
        skuNo: sku,
        pluNo: code,
        description: master.description ?? 'SKU $sku',
        uom: uom,
        factor: factor,
        gstPrice: gst,
        unitPrice: net,
      ),
    );
  }
}
