import 'package:isar/isar.dart';

import '../services/qty.dart';

part 'cart_item.g.dart';

@collection
class CartItem {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;
  
  @Index()
  late int skuNo;

  String? pluNo;         // PLU/Barcode number
  String? description;
  String? uom;
  double? unitPrice;     // Price per UOM
  double? gstPrice;      // GST inclusive price
  double? factor;        // UOM factor

  /// Ordered quantity in the line's UOM, to [Qty.decimals] places.
  ///
  /// Stored under a NEW name because this was an `int`. Isar identifies a
  /// property by name, so widening `quantity` in place would leave existing
  /// rows' stored integers to be read back through a double's bit layout —
  /// garbage weights on a live cart. A new name makes it a clean drop-and-add:
  /// a cart saved by the previous build reads null here and collapses to 0,
  /// which is visibly wrong rather than plausibly wrong.
  ///
  /// Nullable for the same reason the FOC trio below is: a non-nullable number
  /// added to a collection that already has rows reads back as a sentinel on
  /// those rows, not as the initialiser.
  double? qty;

  /// The quantity, as everything outside this class sees it.
  ///
  /// `@ignore` because Isar persists getters as well as fields — without it
  /// this would put a second `quantity` property into the schema, colliding
  /// with the very `int` column the rename exists to retire.
  @ignore
  double get quantity => qty ?? 0;

  set quantity(double v) => qty = Qty.round(v < 0 ? 0 : v);

  String? remarks;
  DateTime addedDate = DateTime.now();

  /// Manual position, set by dragging a line in the cart.
  ///
  /// This is the SQ's `Sequence_No` in waiting — checkout numbers the lines
  /// by their position in the list, so reordering here reorders the printed
  /// quotation and everything downstream of it.
  ///
  /// Null means "never dragged", and null sorts last, which is what puts a
  /// newly added item at the bottom of a cart the operator has already
  /// arranged. Nullable also dodges the Isar trap: a non-nullable int added
  /// to a collection with existing rows reads back as int64 min on those
  /// rows, so every pre-existing line would claim first place.
  int? sortIndex;

  /// The order lines are shown in, and therefore the order they are numbered.
  ///
  /// Isar gives no ordering guarantee for an unsorted query — results follow
  /// the storage layout and shift when a row is updated — so the list is
  /// always sorted explicitly. `addedDate` is the tie-break for lines that
  /// have never been dragged, with `id` behind it because two items added in
  /// the same millisecond are otherwise ordered arbitrarily.
  static int compareForSequence(CartItem a, CartItem b) {
    final ai = a.sortIndex;
    final bi = b.sortIndex;
    if (ai != null && bi != null && ai != bi) return ai.compareTo(bi);
    if (ai != null && bi == null) return -1;
    if (ai == null && bi != null) return 1;
    final c = a.addedDate.compareTo(b.addedDate);
    return c != 0 ? c : a.id.compareTo(b.id);
  }

  /// The three companions to `quantity`, matching the SQ line the checkout
  /// writes: Quote_Foc, Quote_Quantity_Loose and Quote_Foc_Loose.
  ///
  /// Nullable on purpose. A non-nullable number added to a collection that
  /// already has rows reads back as a sentinel on those rows rather than the
  /// initialiser, so every existing cart would come up with garbage. Null
  /// means "never set", and the getters below collapse that to zero.
  double? foc;
  double? quantityLoose;
  double? focLoose;

  // Balance quantity fields from inventory
  double? balanceQuantity;
  double? balanceQuantityLoose;
  double? balanceFoc;
  double? balanceFocLoose;

  double get focQty => foc ?? 0;
  double get looseQty => quantityLoose ?? 0;
  double get focLooseQty => focLoose ?? 0;

  /// Price of one base unit. Loose quantities are counted in base units while
  /// `unitPrice` is per pack, so charging `unitPrice` for a loose single would
  /// bill a whole carton for one piece.
  double get basicUnitPrice => (unitPrice ?? 0) / _safeFactor;
  double get basicGstPrice => (gstPrice ?? 0) / _safeFactor;

  double get _safeFactor {
    final f = factor ?? 1;
    return f > 0 ? f : 1;
  }

  /// Everything the line represents, in base units — the only unit in which a
  /// pack quantity and a loose quantity can be added together.
  double get totalBaseUnits =>
      (quantity + focQty) * _safeFactor + looseQty + focLooseQty;

  // Calculated fields
  //
  // FOC is given away, so it contributes units but never money. Only the
  // charged quantities appear here.
  double get subtotal =>
      (unitPrice ?? 0) * quantity + basicUnitPrice * looseQty;
  double get gstSubtotal =>
      (gstPrice ?? 0) * quantity + basicGstPrice * looseQty;

  // Display helpers
  String get displayDescription => description ?? 'Unknown Item';
  String get displayUom => uom ?? 'PCS';
  String get displayUnitPrice => 'RM ${(unitPrice ?? 0).toStringAsFixed(2)}';
  String get displayGstPrice => 'RM ${(gstPrice ?? 0).toStringAsFixed(2)}';
  String get displaySubtotal => 'RM ${subtotal.toStringAsFixed(2)}';
  String get displayGstSubtotal => 'RM ${gstSubtotal.toStringAsFixed(2)}';

  // Convert from inventory item
  static CartItem fromInventoryItem({
    required int companyCode,
    required int skuNo,
    String? pluNo,
    required String description,
    required String uom,
    required double unitPrice,
    required double gstPrice,
    required double factor,
    double quantity = 1,
    double? foc,
    double? quantityLoose,
    double? focLoose,
    String? remarks,
    double? balanceQuantity,
    double? balanceQuantityLoose,
    double? balanceFoc,
    double? balanceFocLoose,
  }) {
    return CartItem()
      ..companyCode = companyCode
      ..skuNo = skuNo
      ..pluNo = pluNo
      ..description = description
      ..uom = uom
      ..unitPrice = unitPrice
      ..gstPrice = gstPrice
      ..factor = factor
      ..quantity = quantity
      // Rounded on the way in, like `quantity` is by its setter, so no path
      // into the cart can seed a line with more precision than it can show.
      ..foc = foc == null ? null : Qty.round(foc)
      ..quantityLoose =
          quantityLoose == null ? null : Qty.round(quantityLoose)
      ..focLoose = focLoose == null ? null : Qty.round(focLoose)
      ..remarks = remarks
      ..balanceQuantity = balanceQuantity
      ..balanceQuantityLoose = balanceQuantityLoose
      ..balanceFoc = balanceFoc
      ..balanceFocLoose = balanceFocLoose
      ..addedDate = DateTime.now();
  }

  // Convert to JSON for API
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'Sku_No': skuNo,
      'Plu_No': pluNo,
      'Description': description,
      'Uom': uom,
      'Unit_Price': unitPrice,
      'GST_Price': gstPrice,
      'Factor': factor,
      'Quantity': quantity,
      'Foc': focQty,
      'Quantity_Loose': looseQty,
      'Foc_Loose': focLooseQty,
      'Remarks': remarks,
      'Added_Date': addedDate.toIso8601String(),
      'Subtotal': subtotal,
      'GST_Subtotal': gstSubtotal,
    };
  }
}
