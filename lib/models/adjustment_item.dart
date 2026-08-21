import 'package:isar/isar.dart';

part 'adjustment_item.g.dart';

/// One line of an [Adjustment], mirroring `AD_Adjustment_Item`.
///
/// The costs are carried alongside the price because legacy writes all of them
/// onto the line: `Average_Cost`, `Standard_Cost` and `Last_Cost` are the
/// item's costs at the moment the document was raised, and they are what the
/// stock valuation is reconciled against later. Capturing them on the device
/// means the line records what was true when the operator saw it, not what the
/// master happens to say whenever the upload gets through.
@collection
class AdjustmentItem {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  /// Links to [Adjustment.preLabel]. Rewritten together with the header when
  /// the server allocates the real number, so the two can never disagree.
  @Index()
  late String preLabel;

  late int sequenceNo;

  @Index()
  late int skuNo;

  String? pluNo;
  String? description;
  late String uom;

  /// Base units per [uom].
  double factor = 1;

  double quantity = 0;

  /// Free goods. Not charged, but it DOES move stock — legacy adds
  /// `Quantity + FOC_Quantity` to the accumulator.
  double focQuantity = 0;

  /// `Unit_Cost` — what the customer is credited per unit. Typed by the
  /// operator, defaulting to the item's selling price.
  double unitCost = 0;

  /// The item's selling price, stored for reference exactly as legacy does.
  /// Not the value of the line; [unitCost] is.
  double sellingPrice = 0;

  double averageCost = 0;
  double standardCost = 0;
  double lastCost = 0;

  String? remark;

  /// Charged value. FOC contributes nothing.
  @ignore
  double get lineTotal => unitCost * quantity;

  /// What this line moves in stock, in the line's UOM — free goods included.
  /// Direction comes from the document's sign, not from here.
  @ignore
  double get movedQuantity => quantity + focQuantity;
}
