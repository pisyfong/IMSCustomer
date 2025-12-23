import 'package:isar/isar.dart';

part 'in_stock_plu.g.dart';

/// InStockPlu model - mirrors the In_Stock_PLU table from server
/// Used for offline PLU barcode scanning
@collection
class InStockPlu {
  Id id = Isar.autoIncrement;
  
  @Index()
  final int companyCode;
  
  @Index(composite: [CompositeIndex('companyCode')])
  final String pluNo;
  
  @Index()
  final int? skuNo;
  
  final String? uom;
  final String? status;
  final int? lastModifiedBy;
  final int? addedBy;
  final DateTime? addedDate;
  final DateTime? lastWriteTimeStamp;
  final String? defPlu;
  final DateTime? lastEditDate;
  final DateTime? creationDate;
  final String? desc1;
  final String? desc2;
  
  InStockPlu({
    required this.companyCode,
    required this.pluNo,
    this.skuNo,
    this.uom,
    this.status,
    this.lastModifiedBy,
    this.addedBy,
    this.addedDate,
    this.lastWriteTimeStamp,
    this.defPlu,
    this.lastEditDate,
    this.creationDate,
    this.desc1,
    this.desc2,
  });
  
  /// Check if this is the default PLU for the SKU
  bool get isDefault => defPlu?.toUpperCase() == 'Y';
  
  factory InStockPlu.fromMap(Map<String, dynamic> map) {
    return InStockPlu(
      companyCode: map['Company_Code'] as int,
      pluNo: map['Plu_No'] as String,
      skuNo: map['Sku_No'] as int?,
      uom: map['Uom'] as String?,
      status: map['Status'] as String?,
      lastModifiedBy: map['Last_Modified_By'] as int?,
      addedBy: map['Added_By'] as int?,
      addedDate: map['Added_Date'] != null 
          ? DateTime.tryParse(map['Added_Date'].toString()) 
          : null,
      lastWriteTimeStamp: map['LastWriteTimeStamp'] != null 
          ? DateTime.tryParse(map['LastWriteTimeStamp'].toString()) 
          : null,
      defPlu: map['Def_Plu'] as String?,
      lastEditDate: map['LastEditDate'] != null 
          ? DateTime.tryParse(map['LastEditDate'].toString()) 
          : null,
      creationDate: map['CreationDate'] != null 
          ? DateTime.tryParse(map['CreationDate'].toString()) 
          : null,
      desc1: map['Desc1'] as String?,
      desc2: map['Desc2'] as String?,
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'Company_Code': companyCode,
      'Plu_No': pluNo,
      'Sku_No': skuNo,
      'Uom': uom,
      'Status': status,
      'Last_Modified_By': lastModifiedBy,
      'Added_By': addedBy,
      'Added_Date': addedDate?.toIso8601String(),
      'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
      'Def_Plu': defPlu,
      'LastEditDate': lastEditDate?.toIso8601String(),
      'CreationDate': creationDate?.toIso8601String(),
      'Desc1': desc1,
      'Desc2': desc2,
    };
  }
  
  @override
  String toString() {
    return 'InStockPlu(companyCode: $companyCode, pluNo: $pluNo, skuNo: $skuNo, uom: $uom, desc1: $desc1)';
  }
}
