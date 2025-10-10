import 'package:isar/isar.dart';

part 'plu.g.dart';

@collection
class Plu {
  Id id = Isar.autoIncrement;
  
  @Index()
  final int companyCode;
  
  @Index(composite: [CompositeIndex('companyCode')])
  final String pluNo;
  
  @Index()
  final int? skuNo;
  
  final String? uom;
  final String? status;
  final String? desc1;
  final String? desc2;
  
  @Index()
  final bool isDefault;
  
  Plu({
    required this.companyCode,
    required this.pluNo,
    this.skuNo,
    this.uom,
    this.status,
    this.desc1,
    this.desc2,
    this.isDefault = false,
  });
  
  factory Plu.fromMap(Map<String, dynamic> map) {
    return Plu(
      companyCode: map['Company_Code'] as int,
      pluNo: map['Plu_No'] as String,
      skuNo: map['Sku_No'] as int?,
      uom: map['Uom'] as String?,
      status: map['Status'] as String?,
      desc1: map['Desc1'] as String?,
      desc2: map['Desc2'] as String?,
      isDefault: (map['Def_Plu'] as String?) == 'Y',
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'Company_Code': companyCode,
      'Plu_No': pluNo,
      'Sku_No': skuNo,
      'Uom': uom,
      'Status': status,
      'Desc1': desc1,
      'Desc2': desc2,
      'Def_Plu': isDefault ? 'Y' : 'N',
    };
  }
}
