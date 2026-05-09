import 'package:isar/isar.dart';

part 'in_stock_uom.g.dart';

@collection
class InStockUom {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;
  
  @Index()
  late int skuNo;

  String? uom;
  double? factor;
  double? price;      // Unit price (ex-GST)
  double? gstPrice;   // Unit price (incl. GST)
  String? status;     // Status: 'A' = Active, 'I' = Inactive

  @Index()
  DateTime? lastWriteTimeStamp; // For delta sync

  // Convert from server response. Tolerates both PascalCase and lowercase
  // keys because In_Stock_Uom historically returns lowercase columns from
  // some endpoints and PascalCase from others.
  static InStockUom fromJson(Map<String, dynamic> json) {
    try {
      final int company = _parseInt(json['Company_Code'] ?? json['company_code']) ?? 0;
      final int sku = _parseInt(json['Sku_No'] ?? json['sku_no']) ?? 0;
      return InStockUom()
        ..companyCode = company
        ..skuNo = sku
        ..id = Isar.autoIncrement
        ..uom = (json['Uom'] ?? json['uom']) as String?
        ..factor = _parseDouble(json['Factor'] ?? json['factor'])
        ..price = _parseDouble(json['Price'] ?? json['price'])
        ..gstPrice = _parseDouble(json['GST_Price'] ?? json['gst_price'])
        ..status = (json['Status'] ?? json['status']) as String?
        ..lastWriteTimeStamp = _parseDate(json['LastWriteTimeStamp'] ?? json['lastwritetimestamp']);
    } catch (e, stackTrace) {
      print('❌ ERROR in InStockUom.fromJson: $e');
      print('📋 JSON data: $json');
      print('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  // Compose a stable unique Id per (companyCode, skuNo, uom)
  static int _composeId(int companyCode, int skuNo, String uom) {
    // Use hash of company + sku + uom for unique ID
    return (companyCode.toString() + skuNo.toString() + uom).hashCode;
  }

  // Helper methods for parsing
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  // Convert to JSON for server communication
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'Sku_No': skuNo,
      'Uom': uom,
      'Factor': factor,
      'Price': price,
      'GST_Price': gstPrice,
      'Status': status,
      'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
    };
  }

  // Display helpers
  String get displayUom => uom ?? 'N/A';
  String get displayFactor => factor != null ? 'x${factor!.toStringAsFixed(factor!.truncateToDouble() == factor ? 0 : 2)}' : 'x1';
  String get displayPrice => gstPrice != null ? 'RM ${gstPrice!.toStringAsFixed(2)}' : (price != null ? 'RM ${price!.toStringAsFixed(2)}' : 'Price N/A');
  String get displayPricePerUom => '${displayPrice} / ${displayUom}';
}
