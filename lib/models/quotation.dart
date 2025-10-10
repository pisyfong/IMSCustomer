import 'package:isar/isar.dart';

part 'quotation.g.dart';

@collection
class Quotation {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('quotePreLabel')])
  late int companyCode;

  @Index()
  late String quotePreLabel;
  
  // Unnamed constructor required by Isar
  Quotation();

  String? masterPreLabel;
  DateTime? quoteDate;
  String? customer;
  String? term;
  DateTime? quoteExpiry;
  String? status;
  String? ref1;
  String? ref2;
  String? ref3;
  String? ref4;
  String? remark1;
  String? remark2;
  String? alternateCompany;
  String? alternateDoc;
  String? currency;
  double? rate;
  double? totalQuoteQuantity;
  int? totalQuoteItem;
  double? grossAmount;
  double? totalDiscountRate;
  double? totalDiscountAmount;
  double? totalTaxRate;
  double? totalTaxAmount;
  double? netAmount;
  double? otherCharges;
  int? approvedBy;
  DateTime? approvedDate;
  int? lastModifiedBy;
  DateTime? lastWriteTimeStamp;
  int? addedBy;
  DateTime? addedDate;
  int? cancelledBy;
  DateTime? cancelledDate;
  int? shipTo;
  int? quotedBy;
  String? attentionRemark;
  String? ppDiscountByRate;
  double? ppDiscountRate;
  double? ppDiscountAmount;
  DateTime? ppDueDate;
  String? locationCode;
  String? projectCode;
  String? syLocationCode;
  double? otherChargesRate;
  String? sourceLocationCode;
  double? gstAmount;
  double? totalAmountB4Gst;
  double? roundingDiscount;
  int? representativeId;
  String? internalReference;
  String? ref5;
  String? wayBillNo;
  int? deliveredBy;
  DateTime? deliveredDate;
  String? webStatus;
  int? verifyBy;
  DateTime? verifyDate;
  int? packBy;
  DateTime? packDate;
  String? attachmentPath1;
  String? attachmentPath2;
  DateTime? attachmentDate1;
  DateTime? attachmentDate2;
  String? latitude;
  String? longitude;
  int? totalEdit;
  int? totalPrint;
  int? pickNo;
  String? downloadPrelabel;

  // Sync tracking fields
  @Index()
  bool isSynced = false;
  
  DateTime? lastSyncAttempt;
  String? syncError;

  // Helper getters
  String get displayQuotePreLabel => quotePreLabel;
  String get displayCustomer => customer ?? '';
  String get displayStatus => status ?? '';
  String get displayNetAmount => 'RM ${(netAmount ?? 0.0).toStringAsFixed(2)}';
  String get displayQuoteDate => quoteDate != null 
      ? '${quoteDate!.day}/${quoteDate!.month}/${quoteDate!.year}' 
      : '';

  // Factory constructor from JSON (from server)
  factory Quotation.fromJson(Map<String, dynamic> json) {
    return Quotation()
      ..companyCode = json['Company_Code'] as int
      ..quotePreLabel = json['Quote_PreLabel'] as String
      ..masterPreLabel = json['Master_PreLabel'] as String?
      ..quoteDate = json['Quote_Date'] != null ? DateTime.parse(json['Quote_Date']) : null
      ..customer = json['Customer'] as String?
      ..term = json['Term'] as String?
      ..quoteExpiry = json['Quote_Expiry'] != null ? DateTime.parse(json['Quote_Expiry']) : null
      ..status = json['Status'] as String?
      ..ref1 = json['Ref1'] as String?
      ..ref2 = json['Ref2'] as String?
      ..ref3 = json['Ref3'] as String?
      ..ref4 = json['Ref4'] as String?
      ..remark1 = json['Remark1'] as String?
      ..remark2 = json['Remark2'] as String?
      ..alternateCompany = json['Alternate_Company'] as String?
      ..alternateDoc = json['Alternate_Doc'] as String?
      ..currency = json['Currency'] as String?
      ..rate = _parseDouble(json['Rate'])
      ..totalQuoteQuantity = _parseDouble(json['Total_Quote_Quantity'])
      ..totalQuoteItem = json['Total_Quote_Item'] as int?
      ..grossAmount = _parseDouble(json['Gross_Amount'])
      ..totalDiscountRate = _parseDouble(json['Total_Discount_Rate'])
      ..totalDiscountAmount = _parseDouble(json['Total_Discount_Amount'])
      ..totalTaxRate = _parseDouble(json['Total_Tax_Rate'])
      ..totalTaxAmount = _parseDouble(json['Total_Tax_Amount'])
      ..netAmount = _parseDouble(json['Net_Amount'])
      ..otherCharges = _parseDouble(json['Other_Charges'])
      ..approvedBy = json['Approved_By'] as int?
      ..approvedDate = json['Approved_Date'] != null ? DateTime.parse(json['Approved_Date']) : null
      ..lastModifiedBy = json['Last_Modified_By'] as int?
      ..lastWriteTimeStamp = json['LastWriteTimeStamp'] != null ? DateTime.parse(json['LastWriteTimeStamp']) : null
      ..addedBy = json['Added_By'] as int?
      ..addedDate = json['Added_Date'] != null ? DateTime.parse(json['Added_Date']) : null
      ..cancelledBy = json['Cancelled_By'] as int?
      ..cancelledDate = json['Cancelled_Date'] != null ? DateTime.parse(json['Cancelled_Date']) : null
      ..shipTo = json['Ship_To'] as int?
      ..quotedBy = json['Quoted_By'] as int?
      ..attentionRemark = json['Attention_Remark'] as String?
      ..ppDiscountByRate = json['PP_DiscountByRate'] as String?
      ..ppDiscountRate = _parseDouble(json['PP_Discount_Rate'])
      ..ppDiscountAmount = _parseDouble(json['PP_Discount_Amount'])
      ..ppDueDate = json['PP_Due_Date'] != null ? DateTime.parse(json['PP_Due_Date']) : null
      ..locationCode = json['Location_Code'] as String?
      ..projectCode = json['Project_Code'] as String?
      ..syLocationCode = json['SY_Location_Code'] as String?
      ..otherChargesRate = _parseDouble(json['Other_Charges_Rate'])
      ..sourceLocationCode = json['Source_Location_Code'] as String?
      ..gstAmount = _parseDouble(json['GST_Amount'])
      ..totalAmountB4Gst = _parseDouble(json['Total_Amount_B4_GST'])
      ..roundingDiscount = _parseDouble(json['ROUNDING_DISCOUNT'])
      ..representativeId = json['Representative_ID'] as int?
      ..internalReference = json['Internal_Reference'] as String?
      ..ref5 = json['Ref5'] as String?
      ..wayBillNo = json['Way_Bill_No'] as String?
      ..deliveredBy = json['Delivered_By'] as int?
      ..deliveredDate = json['Delivered_Date'] != null ? DateTime.parse(json['Delivered_Date']) : null
      ..webStatus = json['Web_Status'] as String?
      ..verifyBy = json['Verify_By'] as int?
      ..verifyDate = json['Verify_Date'] != null ? DateTime.parse(json['Verify_Date']) : null
      ..packBy = json['Pack_By'] as int?
      ..packDate = json['Pack_Date'] != null ? DateTime.parse(json['Pack_Date']) : null
      ..attachmentPath1 = json['Attachment_Path1'] as String?
      ..attachmentPath2 = json['Attachment_Path2'] as String?
      ..attachmentDate1 = json['Attachment_Date1'] != null ? DateTime.parse(json['Attachment_Date1']) : null
      ..attachmentDate2 = json['Attachment_Date2'] != null ? DateTime.parse(json['Attachment_Date2']) : null
      ..latitude = json['latitude'] as String?
      ..longitude = json['longitude'] as String?
      ..totalEdit = json['Total_Edit'] as int?
      ..totalPrint = json['Total_Print'] as int?
      ..pickNo = json['Pick_No'] as int?
      ..downloadPrelabel = json['Download_Prelabel'] as String?
      ..isSynced = true; // Data from server is already synced
  }

  // Convert to JSON for sending to server
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'Quote_PreLabel': quotePreLabel,
      'Master_PreLabel': masterPreLabel,
      'Quote_Date': quoteDate?.toIso8601String(),
      'Customer': customer,
      'Term': term,
      'Quote_Expiry': quoteExpiry?.toIso8601String(),
      'Status': status,
      'Ref1': ref1,
      'Ref2': ref2,
      'Ref3': ref3,
      'Ref4': ref4,
      'Remark1': remark1,
      'Remark2': remark2,
      'Alternate_Company': alternateCompany,
      'Alternate_Doc': alternateDoc,
      'Currency': currency,
      'Rate': rate,
      'Total_Quote_Quantity': totalQuoteQuantity,
      'Total_Quote_Item': totalQuoteItem,
      'Gross_Amount': grossAmount,
      'Total_Discount_Rate': totalDiscountRate,
      'Total_Discount_Amount': totalDiscountAmount,
      'Total_Tax_Rate': totalTaxRate,
      'Total_Tax_Amount': totalTaxAmount,
      'Net_Amount': netAmount,
      'Other_Charges': otherCharges,
      'Approved_By': approvedBy,
      'Approved_Date': approvedDate?.toIso8601String(),
      'Last_Modified_By': lastModifiedBy,
      'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
      'Added_By': addedBy,
      'Added_Date': addedDate?.toIso8601String(),
      'Cancelled_By': cancelledBy,
      'Cancelled_Date': cancelledDate?.toIso8601String(),
      'Ship_To': shipTo,
      'Quoted_By': quotedBy,
      'Attention_Remark': attentionRemark,
      'PP_DiscountByRate': ppDiscountByRate,
      'PP_Discount_Rate': ppDiscountRate,
      'PP_Discount_Amount': ppDiscountAmount,
      'PP_Due_Date': ppDueDate?.toIso8601String(),
      'Location_Code': locationCode,
      'Project_Code': projectCode,
      'SY_Location_Code': syLocationCode,
      'Other_Charges_Rate': otherChargesRate,
      'Source_Location_Code': sourceLocationCode,
      'GST_Amount': gstAmount,
      'Total_Amount_B4_GST': totalAmountB4Gst,
      'ROUNDING_DISCOUNT': roundingDiscount,
      'Representative_ID': representativeId,
      'Internal_Reference': internalReference,
      'Ref5': ref5,
      'Way_Bill_No': wayBillNo,
      'Delivered_By': deliveredBy,
      'Delivered_Date': deliveredDate?.toIso8601String(),
      'Web_Status': webStatus,
      'Verify_By': verifyBy,
      'Verify_Date': verifyDate?.toIso8601String(),
      'Pack_By': packBy,
      'Pack_Date': packDate?.toIso8601String(),
      'Attachment_Path1': attachmentPath1,
      'Attachment_Path2': attachmentPath2,
      'Attachment_Date1': attachmentDate1?.toIso8601String(),
      'Attachment_Date2': attachmentDate2?.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'Total_Edit': totalEdit,
      'Total_Print': totalPrint,
      'Pick_No': pickNo,
      'Download_Prelabel': downloadPrelabel,
    };
  }

  // Helper method to parse double values
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
