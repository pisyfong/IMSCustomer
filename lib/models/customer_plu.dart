import 'package:isar/isar.dart';

part 'customer_plu.g.dart';

@collection
class CustomerPlu {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('customerCode'), CompositeIndex('skuNo')])
  late int companyCode;

  late String customerCode;

  late int skuNo;

  late String pluNo;

  String? uom;

  CustomerPlu();

  factory CustomerPlu.fromMap(Map<String, dynamic> map) {
    return CustomerPlu()
      ..companyCode = map['Company_Code'] is int
          ? map['Company_Code'] as int
          : int.tryParse(map['Company_Code']?.toString() ?? '') ?? 0
      ..customerCode = map['Customer']?.toString() ?? map['Customer_Code']?.toString() ?? ''
      ..skuNo = map['Sku_No'] is int
          ? map['Sku_No'] as int
          : int.tryParse(map['Sku_No']?.toString() ?? '') ?? 0
      ..pluNo = map['Plu_No']?.toString() ?? ''
      ..uom = map['Uom']?.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'Company_Code': companyCode,
      'Customer_Code': customerCode,
      'Sku_No': skuNo,
      'Plu_No': pluNo,
      'Uom': uom,
    };
  }
}
