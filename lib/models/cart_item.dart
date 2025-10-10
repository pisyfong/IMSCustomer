import 'package:isar/isar.dart';

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
  int quantity = 1;
  String? remarks;
  DateTime addedDate = DateTime.now();

  // Calculated fields
  double get subtotal => (unitPrice ?? 0) * quantity;
  double get gstSubtotal => (gstPrice ?? 0) * quantity;
  
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
    int quantity = 1,
    String? remarks,
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
      ..remarks = remarks
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
      'Remarks': remarks,
      'Added_Date': addedDate.toIso8601String(),
      'Subtotal': subtotal,
      'GST_Subtotal': gstSubtotal,
    };
  }
}
