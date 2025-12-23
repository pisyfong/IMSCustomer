import 'package:isar/isar.dart';

part 'draft_quotation.g.dart';

@collection
class DraftQuotation {
  Id id = Isar.autoIncrement;

  @Index()
  int companyCode = 0;

  @Index()
  String? customerCode;

  String? customerName;

  String? salespersonCode;

  String? salespersonName;

  DateTime? createdDate;

  DateTime? lastModifiedDate;

  String? remarks;

  double totalQuantity = 0;

  int totalItems = 0;

  double netAmount = 0;

  double grossAmount = 0;

  String? status; // 'draft', 'converted'

  String? convertedQuotePreLabel; // Set when converted to actual quotation

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Company_Code': companyCode,
      'Customer_Code': customerCode,
      'Customer_Name': customerName,
      'Salesperson_Code': salespersonCode,
      'Salesperson_Name': salespersonName,
      'Created_Date': createdDate?.toIso8601String(),
      'Last_Modified_Date': lastModifiedDate?.toIso8601String(),
      'Remarks': remarks,
      'Total_Quantity': totalQuantity,
      'Total_Items': totalItems,
      'Net_Amount': netAmount,
      'Gross_Amount': grossAmount,
      'Status': status,
      'Converted_Quote_Pre_Label': convertedQuotePreLabel,
    };
  }

  static DraftQuotation fromJson(Map<String, dynamic> json) {
    return DraftQuotation()
      ..companyCode = json['Company_Code'] ?? 0
      ..customerCode = json['Customer_Code']
      ..customerName = json['Customer_Name']
      ..salespersonCode = json['Salesperson_Code']
      ..salespersonName = json['Salesperson_Name']
      ..createdDate = json['Created_Date'] != null
          ? DateTime.tryParse(json['Created_Date'])
          : null
      ..lastModifiedDate = json['Last_Modified_Date'] != null
          ? DateTime.tryParse(json['Last_Modified_Date'])
          : null
      ..remarks = json['Remarks']
      ..totalQuantity = (json['Total_Quantity'] ?? 0).toDouble()
      ..totalItems = json['Total_Items'] ?? 0
      ..netAmount = (json['Net_Amount'] ?? 0).toDouble()
      ..grossAmount = (json['Gross_Amount'] ?? 0).toDouble()
      ..status = json['Status']
      ..convertedQuotePreLabel = json['Converted_Quote_Pre_Label'];
  }
}

@collection
class DraftQuotationItem {
  Id id = Isar.autoIncrement;

  @Index()
  int draftId = 0; // Links to DraftQuotation.id

  @Index()
  int companyCode = 0;

  int sequenceNo = 0;

  int skuNo = 0;

  String? pluNo;

  String? description;

  String? uom;

  double quantity = 0;

  double unitPrice = 0;

  double netAmount = 0;

  String? remark;

  String? brand;

  DateTime? addedDate;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Draft_Id': draftId,
      'Company_Code': companyCode,
      'Sequence_No': sequenceNo,
      'Sku_No': skuNo,
      'Plu_No': pluNo,
      'Description': description,
      'Uom': uom,
      'Quantity': quantity,
      'Unit_Price': unitPrice,
      'Net_Amount': netAmount,
      'Remark': remark,
      'Brand': brand,
      'Added_Date': addedDate?.toIso8601String(),
    };
  }

  static DraftQuotationItem fromJson(Map<String, dynamic> json) {
    return DraftQuotationItem()
      ..draftId = json['Draft_Id'] ?? 0
      ..companyCode = json['Company_Code'] ?? 0
      ..sequenceNo = json['Sequence_No'] ?? 0
      ..skuNo = json['Sku_No'] ?? 0
      ..pluNo = json['Plu_No']
      ..description = json['Description']
      ..uom = json['Uom']
      ..quantity = (json['Quantity'] ?? 0).toDouble()
      ..unitPrice = (json['Unit_Price'] ?? 0).toDouble()
      ..netAmount = (json['Net_Amount'] ?? 0).toDouble()
      ..remark = json['Remark']
      ..brand = json['Brand']
      ..addedDate = json['Added_Date'] != null
          ? DateTime.tryParse(json['Added_Date'])
          : null;
  }
}
