import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'quote.g.dart';

@Collection()
class Quote {
  Id id = Isar.autoIncrement;

  @Index()
  int? companyCode;

  String? quotePreLabel;
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
  double? totalAmountB4GST;
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

  Quote();

  // Factory constructor from JSON
  factory Quote.fromJson(Map<String, dynamic> json) {
    final quote = Quote();
    
    quote.companyCode = json['Company_Code'];
    quote.quotePreLabel = json['Quote_PreLabel'];
    quote.masterPreLabel = json['Master_PreLabel'];
    quote.quoteDate = json['Quote_Date'] != null ? DateTime.tryParse(json['Quote_Date'].toString()) : null;
    quote.customer = json['Customer'];
    quote.term = json['Term'];
    quote.quoteExpiry = json['Quote_Expiry'] != null ? DateTime.tryParse(json['Quote_Expiry'].toString()) : null;
    quote.status = json['Status'];
    quote.ref1 = json['Ref1'];
    quote.ref2 = json['Ref2'];
    quote.ref3 = json['Ref3'];
    quote.ref4 = json['Ref4'];
    quote.remark1 = json['Remark1'];
    quote.remark2 = json['Remark2'];
    quote.alternateCompany = json['Alternate_Company'];
    quote.alternateDoc = json['Alternate_Doc'];
    quote.currency = json['Currency'];
    quote.rate = json['Rate'] != null ? double.tryParse(json['Rate'].toString()) : null;
    quote.totalQuoteQuantity = json['Total_Quote_Quantity'] != null ? double.tryParse(json['Total_Quote_Quantity'].toString()) : null;
    quote.totalQuoteItem = json['Total_Quote_Item'] != null ? int.tryParse(json['Total_Quote_Item'].toString()) : null;
    quote.grossAmount = json['Gross_Amount'] != null ? double.tryParse(json['Gross_Amount'].toString()) : null;
    quote.totalDiscountRate = json['Total_Discount_Rate'] != null ? double.tryParse(json['Total_Discount_Rate'].toString()) : null;
    quote.totalDiscountAmount = json['Total_Discount_Amount'] != null ? double.tryParse(json['Total_Discount_Amount'].toString()) : null;
    quote.totalTaxRate = json['Total_Tax_Rate'] != null ? double.tryParse(json['Total_Tax_Rate'].toString()) : null;
    quote.totalTaxAmount = json['Total_Tax_Amount'] != null ? double.tryParse(json['Total_Tax_Amount'].toString()) : null;
    quote.netAmount = json['Net_Amount'] != null ? double.tryParse(json['Net_Amount'].toString()) : null;
    quote.otherCharges = json['Other_Charges'] != null ? double.tryParse(json['Other_Charges'].toString()) : null;
    quote.approvedBy = json['Approved_By'];
    quote.approvedDate = json['Approved_Date'] != null ? DateTime.tryParse(json['Approved_Date'].toString()) : null;
    quote.lastModifiedBy = json['Last_Modified_By'];
    quote.lastWriteTimeStamp = json['LastWriteTimeStamp'] != null ? DateTime.tryParse(json['LastWriteTimeStamp'].toString()) : null;
    quote.addedBy = json['Added_By'];
    quote.addedDate = json['Added_Date'] != null ? DateTime.tryParse(json['Added_Date'].toString()) : null;
    quote.cancelledBy = json['Cancelled_By'];
    quote.cancelledDate = json['Cancelled_Date'] != null ? DateTime.tryParse(json['Cancelled_Date'].toString()) : null;
    quote.shipTo = json['Ship_To'];
    quote.quotedBy = json['Quoted_By'];
    quote.attentionRemark = json['Attention_Remark'];
    quote.ppDiscountByRate = json['PP_DiscountByRate'];
    quote.ppDiscountRate = json['PP_Discount_Rate'] != null ? double.tryParse(json['PP_Discount_Rate'].toString()) : null;
    quote.ppDiscountAmount = json['PP_Discount_Amount'] != null ? double.tryParse(json['PP_Discount_Amount'].toString()) : null;
    quote.ppDueDate = json['PP_Due_Date'] != null ? DateTime.tryParse(json['PP_Due_Date'].toString()) : null;
    quote.locationCode = json['Location_Code'];
    quote.projectCode = json['Project_Code'];
    quote.syLocationCode = json['SY_Location_Code'];
    quote.otherChargesRate = json['Other_Charges_Rate'] != null ? double.tryParse(json['Other_Charges_Rate'].toString()) : null;
    quote.sourceLocationCode = json['Source_Location_Code'];
    quote.gstAmount = json['GST_Amount'] != null ? double.tryParse(json['GST_Amount'].toString()) : null;
    quote.totalAmountB4GST = json['Total_Amount_B4_GST'] != null ? double.tryParse(json['Total_Amount_B4_GST'].toString()) : null;
    quote.roundingDiscount = json['ROUNDING_DISCOUNT'] != null ? double.tryParse(json['ROUNDING_DISCOUNT'].toString()) : null;
    quote.representativeId = json['Representative_ID'];
    quote.internalReference = json['Internal_Reference'];
    quote.ref5 = json['Ref5'];
    quote.wayBillNo = json['Way_Bill_No'];
    quote.deliveredBy = json['Delivered_By'];
    quote.deliveredDate = json['Delivered_Date'] != null ? DateTime.tryParse(json['Delivered_Date'].toString()) : null;
    quote.webStatus = json['Web_Status'];
    quote.verifyBy = json['Verify_By'];
    quote.verifyDate = json['Verify_Date'] != null ? DateTime.tryParse(json['Verify_Date'].toString()) : null;
    quote.packBy = json['Pack_By'];
    quote.packDate = json['Pack_Date'] != null ? DateTime.tryParse(json['Pack_Date'].toString()) : null;
    quote.attachmentPath1 = json['Attachment_Path1'];
    quote.attachmentPath2 = json['Attachment_Path2'];
    quote.attachmentDate1 = json['Attachment_Date1'] != null ? DateTime.tryParse(json['Attachment_Date1'].toString()) : null;
    quote.attachmentDate2 = json['Attachment_Date2'] != null ? DateTime.tryParse(json['Attachment_Date2'].toString()) : null;
    quote.latitude = json['latitude'];
    quote.longitude = json['longitude'];
    quote.totalEdit = json['Total_Edit'];
    quote.totalPrint = json['Total_Print'];
    quote.pickNo = json['Pick_No'];
    quote.downloadPrelabel = json['Download_Prelabel'];

    return quote;
  }

  // Helper methods for display
  String get displayQuoteNumber => quotePreLabel ?? 'N/A';
  String get displayCustomer => customer ?? 'N/A';
  String get displayStatus => status ?? 'N/A';
  double get displayNetAmount => netAmount ?? 0.0;
  String get displayCurrency => currency ?? 'MYR';
  
  String get formattedQuoteDate {
    if (quoteDate == null) return 'N/A';
    return '${quoteDate!.day.toString().padLeft(2, '0')}/${quoteDate!.month.toString().padLeft(2, '0')}/${quoteDate!.year}';
  }
  
  String get formattedNetAmount {
    return '$displayCurrency ${displayNetAmount.toStringAsFixed(2)}';
  }

  String get statusDisplay {
    switch (status?.toUpperCase()) {
      case 'A':
        return 'Active';
      case 'C':
        return 'Cancelled';
      case 'P':
        return 'Pending';
      case 'D':
        return 'Draft';
      default:
        return status ?? 'Unknown';
    }
  }

  // Get status color (returns color for UI usage)
  Color getStatusColor() {
    switch (status?.toUpperCase()) {
      case 'A':
        return Colors.green;
      case 'C':
        return Colors.red;
      case 'P':
        return Colors.orange;
      case 'D':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
