import 'package:isar/isar.dart';

part 'customer_plu.g.dart';

@collection
class CustomerPlu {
  Id id = Isar.autoIncrement;

  // Composite index for fast lookups by (company, customer, SKU). Not unique
  // because a single (customer, SKU) can in principle have multiple PLU rows
  // (different UOMs, barcode aliases). Uniqueness is enforced via the
  // deterministic id computed in fromMap below.
  @Index(composite: [
    CompositeIndex('customerCode'),
    CompositeIndex('skuNo'),
  ])
  late int companyCode;

  late String customerCode;

  late int skuNo;

  late String pluNo;

  String? uom;

  // Additional fields from AR_Customer_Item used by the base-table sync.
  String? description;
  double? sellingPrice;
  String? itemCode;
  String? remark;

  @Index()
  DateTime? lastWriteTimeStamp;

  CustomerPlu();

  factory CustomerPlu.fromMap(Map<String, dynamic> map) {
    final company = map['Company_Code'] is int
        ? map['Company_Code'] as int
        : int.tryParse(map['Company_Code']?.toString() ?? '') ?? 0;
    final customer = (map['Customer_Code'] ?? map['Customer'])?.toString() ?? '';
    final sku = map['Sku_No'] is int
        ? map['Sku_No'] as int
        : int.tryParse(map['Sku_No']?.toString() ?? '') ?? 0;
    final plu = map['Plu_No']?.toString() ?? '';
    final uom = map['Uom']?.toString() ?? '';

    return CustomerPlu()
      // Deterministic id ensures putAll upserts the same row across syncs.
      // Hash of the natural key (company, customer, sku, uom, plu).
      ..id = _composeId(company, customer, sku, uom, plu)
      ..companyCode = company
      ..customerCode = customer
      ..skuNo = sku
      ..pluNo = plu
      ..uom = uom.isEmpty ? null : uom
      ..description = map['Description'] as String?
      ..sellingPrice = _parseDouble(map['Selling_Price'])
      ..itemCode = map['Item_Code'] as String?
      ..remark = map['Remark'] as String?
      ..lastWriteTimeStamp = _parseDate(map['LastWriteTimeStamp']);
  }

  /// Stable id derived from the natural key. Used so re-syncing the same row
  /// upserts in place rather than appending a duplicate.
  /// Combines two 31-bit String hashCodes into a 62-bit value to keep
  /// collision odds negligible at scale (Dart String.hashCode alone is 31
  /// bits and collides ~2-3 times per 100k items).
  static int _composeId(int company, String customer, int sku, String uom, String plu) {
    final h1 = '$company|$customer|$sku|$uom|$plu'.hashCode & 0x7FFFFFFF;
    final h2 = '$plu|$uom|$sku|$customer|$company'.hashCode & 0x7FFFFFFF;
    return (h1 << 31) | h2;
  }

  static double? _parseDouble(dynamic v) {
    if (v == null) return null;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) return double.tryParse(v);
    return null;
  }

  static DateTime? _parseDate(dynamic v) {
    if (v == null) return null;
    if (v is DateTime) return v;
    if (v is String) return DateTime.tryParse(v);
    return null;
  }

  Map<String, dynamic> toMap() {
    return {
      'Company_Code': companyCode,
      'Customer_Code': customerCode,
      'Sku_No': skuNo,
      'Plu_No': pluNo,
      'Uom': uom,
      'Description': description,
      'Selling_Price': sellingPrice,
      'Item_Code': itemCode,
      'Remark': remark,
      'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
    };
  }
}
