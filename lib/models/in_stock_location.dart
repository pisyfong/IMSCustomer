import 'package:isar/isar.dart';

part 'in_stock_location.g.dart';

/// Per-location stock quantities. The displayed Qty_On_Hand for an SKU is
/// computed by aggregating these rows across all locations using the 9-term
/// formula (see [signedQtyOnHand]). One row per (companyCode, skuNo, locationCode).
///
/// In_Stock_Location does NOT have a LastWriteTimeStamp column on the server,
/// so the client always full-syncs this collection (server method
/// getInStockLocationPage ignores lastSync).
@collection
class InStockLocation {
  Id id = Isar.autoIncrement;

  @Index(composite: [
    CompositeIndex('skuNo'),
    CompositeIndex('locationCode'),
  ], unique: true, replace: true)
  late int companyCode;

  late int skuNo;

  /// The SITE this row belongs to (STK, MME, …) — not a shelf.
  late String locationCode;

  /// Shelf / bin the stock physically sits on, as entered by the warehouse.
  ///
  /// Free text, and one SKU can occupy several bins, so this arrives as a
  /// single string holding multiple positions (e.g. "A1-02, B3-14"). It is
  /// displayed rather than parsed — the separator is whatever the customer
  /// types, and guessing at it would mangle perfectly good labels.
  String? shelf;

  // The 9 quantity columns used for the on-hand computation
  double? qtyOnHand;
  double? qtyOnReceived;
  double? qtyOnCustomerReturn;
  double? qtyOnAdjIn;
  double? qtyOnSales;
  double? qtyOnSalesOrder;
  double? qtyOnTrading;
  double? qtyOnReturn;
  double? qtyOnAdjOut;

  // Other useful columns kept for completeness; expand as needed.
  double? minStockLevel;
  double? maxStockLevel;
  double? reorderLevel;
  double? averageCost;
  double? standardCost;
  double? lastCost;
  double? fifoCost;

  /// Net signed contribution of this row to the SKU's effective on-hand.
  /// Sum across rows for a SKU yields the displayed Qty_On_Hand.
  double get signedQtyOnHand =>
      (qtyOnHand ?? 0) +
      (qtyOnReceived ?? 0) +
      (qtyOnCustomerReturn ?? 0) +
      (qtyOnAdjIn ?? 0) -
      (qtyOnSales ?? 0) -
      (qtyOnSalesOrder ?? 0) -
      (qtyOnTrading ?? 0) -
      (qtyOnReturn ?? 0) -
      (qtyOnAdjOut ?? 0);

  static InStockLocation fromJson(Map<String, dynamic> json) {
    return InStockLocation()
      ..companyCode = _parseInt(json['Company_Code']) ?? 0
      ..skuNo = _parseInt(json['Sku_No']) ?? 0
      ..locationCode = (json['Location_Code'] as String?)?.trim() ?? ''
      // In_Stock_Location.Location — the shelf string, NOT Location_Code.
      ..shelf = (json['Location'] as String?)?.trim()
      ..qtyOnHand = _parseDouble(json['Qty_On_Hand'])
      ..qtyOnReceived = _parseDouble(json['Qty_On_Received'])
      ..qtyOnCustomerReturn = _parseDouble(json['Qty_On_Customer_Return'])
      ..qtyOnAdjIn = _parseDouble(json['Qty_On_Adj_In'])
      ..qtyOnSales = _parseDouble(json['Qty_On_Sales'])
      ..qtyOnSalesOrder = _parseDouble(json['Qty_On_Sales_Order'])
      ..qtyOnTrading = _parseDouble(json['Qty_On_Trading'])
      ..qtyOnReturn = _parseDouble(json['Qty_On_Return'])
      ..qtyOnAdjOut = _parseDouble(json['Qty_On_Adj_Out'])
      ..minStockLevel = _parseDouble(json['Min_Stock_Level'])
      ..maxStockLevel = _parseDouble(json['Max_Stock_Level'])
      ..reorderLevel = _parseDouble(json['Reorder_Level'])
      ..averageCost = _parseDouble(json['Average_Cost'])
      ..standardCost = _parseDouble(json['Standard_Cost'])
      ..lastCost = _parseDouble(json['Last_Cost'])
      ..fifoCost = _parseDouble(json['Fifo_Cost']);
  }

  static int? _parseInt(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v);
    return null;
  }

  static double? _parseDouble(dynamic v) {
    if (v == null) return null;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) return double.tryParse(v);
    return null;
  }
}
