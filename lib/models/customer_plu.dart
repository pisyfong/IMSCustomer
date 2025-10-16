import 'package:isar/isar.dart';

part 'customer_plu.g.dart';

@collection
class CustomerPlu {
  Id id = Isar.autoIncrement;
  
  late int companyCode;
  late String customerCode;
  late String skuNo;
  late String pluNo;
  
  DateTime? lastUpdated;
  
  CustomerPlu();
  
  factory CustomerPlu.fromJson(Map<String, dynamic> json, int companyCode, String customerCode) {
    return CustomerPlu()
      ..companyCode = companyCode
      ..customerCode = customerCode
      ..skuNo = json['Sku_No']?.toString() ?? json['skuNo']?.toString() ?? ''
      ..pluNo = json['Plu_No']?.toString() ?? json['pluNo']?.toString() ?? ''
      ..lastUpdated = DateTime.now();
  }
  
  Map<String, dynamic> toJson() => {
    'companyCode': companyCode,
    'customerCode': customerCode,
    'skuNo': skuNo,
    'pluNo': pluNo,
    'lastUpdated': lastUpdated?.toIso8601String(),
  };
}
