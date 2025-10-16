import 'package:isar/isar.dart';

part 'invoice.g.dart';

@collection
class Invoice {
  Id id = Isar.autoIncrement;
  
  final int? batchNo;
  final int companyCode;
  @Index(composite: [CompositeIndex('companyCode')])
  final String invoicePreLabel;
  final DateTime? invoiceDate;
  final DateTime? dueDate;
  final String? customer;
  final int? shipTo;
  final int? representativeId;
  final String? recurInvoice;
  final double? recurDeposit;
  final String? terms;
  final String? status;
  final String? alternateCompany;
  final String? alternateDoc;
  final String? ref1;
  final String? ref2;
  final String? ref3;
  final String? ref4;
  final String? currency;
  final double? rate;
  final String? remark1;
  final String? remark2;
  final int? totalInvoiceEntry;
  final double? totalInvoiceQuantity;
  final double? grossAmount;
  final double? invoiceDiscountRate;
  final double? invoiceDiscountAmount;
  final double? invoiceTaxRate;
  final double? invoiceTaxAmount;
  final double? otherCharges;
  final double? netAmount;
  final int? addedBy;
  final DateTime? addedDate;
  final int? voidedBy;
  final DateTime? voidedDate;
  final int? lastModifiedBy;
  final DateTime? lastWriteTimeStamp;
  final String? transfer;
  final String? linkAccount;
  final String? wayBillNo;
  final int? deliveredBy;
  final DateTime? deliveredDate;
  final String? ppDiscountByRate;
  final double? ppDiscountRate;
  final double? ppDiscountAmount;
  final DateTime? ppDueDate;
  final String? locationCode;
  final String? projectCode;
  final String? syLocationCode;
  final double? otherChargesRate;
  final String? cancelPosted;
  final String? dueDateByDelivered;
  final String? ppDueDateByDelivered;
  final String? ref5;
  final String? adjustmentPrelabel;
  final String? allowDiscountNote;
  final String? srPrelabel;
  final String? sourceLocationCode;
  final String? webSI;
  final String? internalReference;
  final double? gstAmount;
  final double? totalAmountB4GST;
  final double? roundingDiscount;
  final String? webLinkPrelabel;
  final DateTime? lastModifiedDate;
  final int? totalEdit;
  final int? totalPrint;
  final String? appDLPrelabel;
  final String? webStatus;
  final int? verifyBy;
  final DateTime? verifyDate;
  final int? packBy;
  final DateTime? packDate;
  final String? attachmentPath1;
  final String? attachmentPath2;
  final DateTime? attachmentDate1;
  final DateTime? attachmentDate2;
  final String? latitude;
  final String? longitude;
  final int? pickNo;
  final String? accEntryReference;
  final int? imsPostedBy;
  final DateTime? imsPostedDate;
  final int? accPostedBy;
  final DateTime? accPostedDate;

  Invoice({
    this.batchNo,
    required this.companyCode,
    required this.invoicePreLabel,
    this.invoiceDate,
    this.dueDate,
    this.customer,
    this.shipTo,
    this.representativeId,
    this.recurInvoice,
    this.recurDeposit,
    this.terms,
    this.status,
    this.alternateCompany,
    this.alternateDoc,
    this.ref1,
    this.ref2,
    this.ref3,
    this.ref4,
    this.currency,
    this.rate,
    this.remark1,
    this.remark2,
    this.totalInvoiceEntry,
    this.totalInvoiceQuantity,
    this.grossAmount,
    this.invoiceDiscountRate,
    this.invoiceDiscountAmount,
    this.invoiceTaxRate,
    this.invoiceTaxAmount,
    this.otherCharges,
    this.netAmount,
    this.addedBy,
    this.addedDate,
    this.voidedBy,
    this.voidedDate,
    this.lastModifiedBy,
    this.lastWriteTimeStamp,
    this.transfer,
    this.linkAccount,
    this.wayBillNo,
    this.deliveredBy,
    this.deliveredDate,
    this.ppDiscountByRate,
    this.ppDiscountRate,
    this.ppDiscountAmount,
    this.ppDueDate,
    this.locationCode,
    this.projectCode,
    this.syLocationCode,
    this.otherChargesRate,
    this.cancelPosted,
    this.dueDateByDelivered,
    this.ppDueDateByDelivered,
    this.ref5,
    this.adjustmentPrelabel,
    this.allowDiscountNote,
    this.srPrelabel,
    this.sourceLocationCode,
    this.webSI,
    this.internalReference,
    this.gstAmount,
    this.totalAmountB4GST,
    this.roundingDiscount,
    this.webLinkPrelabel,
    this.lastModifiedDate,
    this.totalEdit,
    this.totalPrint,
    this.appDLPrelabel,
    this.webStatus,
    this.verifyBy,
    this.verifyDate,
    this.packBy,
    this.packDate,
    this.attachmentPath1,
    this.attachmentPath2,
    this.attachmentDate1,
    this.attachmentDate2,
    this.latitude,
    this.longitude,
    this.pickNo,
    this.accEntryReference,
    this.imsPostedBy,
    this.imsPostedDate,
    this.accPostedBy,
    this.accPostedDate,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      batchNo: _parseInt(json['Batch_No']),
      companyCode: _parseInt(json['Company_Code']) ?? 0,
      invoicePreLabel: json['Invoice_PreLabel'] as String,
      invoiceDate: json['Invoice_Date'] != null ? DateTime.parse(json['Invoice_Date']) : null,
      dueDate: json['Due_Date'] != null ? DateTime.parse(json['Due_Date']) : null,
      customer: json['Customer'] as String?,
      shipTo: _parseInt(json['Ship_To']),
      representativeId: _parseInt(json['Representative_ID']),
      recurInvoice: json['Recur_Invoice'] as String?,
      recurDeposit: (json['Recur_Deposit'] as num?)?.toDouble(),
      terms: json['Terms'] as String?,
      status: json['Status'] as String?,
      alternateCompany: json['Alternate_Company'] as String?,
      alternateDoc: json['Alternate_Doc'] as String?,
      ref1: json['Ref1'] as String?,
      ref2: json['Ref2'] as String?,
      ref3: json['Ref3'] as String?,
      ref4: json['Ref4'] as String?,
      currency: json['Currency'] as String?,
      rate: (json['Rate'] as num?)?.toDouble(),
      remark1: json['Remark1'] as String?,
      remark2: json['Remark2'] as String?,
      totalInvoiceEntry: _parseInt(json['Total_Invoice_Entry']),
      totalInvoiceQuantity: (json['Total_Invoice_Quantity'] as num?)?.toDouble(),
      grossAmount: (json['Gross_Amount'] as num?)?.toDouble(),
      invoiceDiscountRate: (json['Invoice_Discount_Rate'] as num?)?.toDouble(),
      invoiceDiscountAmount: (json['Invoice_Discount_Amount'] as num?)?.toDouble(),
      invoiceTaxRate: (json['Invoice_Tax_Rate'] as num?)?.toDouble(),
      invoiceTaxAmount: (json['Invoice_Tax_Amount'] as num?)?.toDouble(),
      otherCharges: (json['Other_Charges'] as num?)?.toDouble(),
      netAmount: (json['Net_Amount'] as num?)?.toDouble(),
      addedBy: _parseInt(json['Added_By']),
      addedDate: json['Added_Date'] != null ? DateTime.parse(json['Added_Date']) : null,
      voidedBy: _parseInt(json['Voided_By']),
      voidedDate: json['Voided_Date'] != null ? DateTime.parse(json['Voided_Date']) : null,
      lastModifiedBy: _parseInt(json['Last_Modified_By']),
      lastWriteTimeStamp: json['LastWriteTimeStamp'] != null ? DateTime.parse(json['LastWriteTimeStamp']) : null,
      transfer: json['Transfer'] as String?,
      linkAccount: json['Link_Account'] as String?,
      wayBillNo: json['Way_Bill_No'] as String?,
      deliveredBy: _parseInt(json['Delivered_By']),
      deliveredDate: json['Delivered_Date'] != null ? DateTime.parse(json['Delivered_Date']) : null,
      ppDiscountByRate: json['PP_DiscountByRate'] as String?,
      ppDiscountRate: (json['PP_Discount_Rate'] as num?)?.toDouble(),
      ppDiscountAmount: (json['PP_Discount_Amount'] as num?)?.toDouble(),
      ppDueDate: json['PP_Due_Date'] != null ? DateTime.parse(json['PP_Due_Date']) : null,
      locationCode: json['Location_Code'] as String?,
      projectCode: json['Project_Code'] as String?,
      syLocationCode: json['SY_Location_Code'] as String?,
      otherChargesRate: (json['Other_Charges_Rate'] as num?)?.toDouble(),
      cancelPosted: json['Cancel_Posted'] as String?,
      dueDateByDelivered: json['DueDate_By_Delivered'] as String?,
      ppDueDateByDelivered: json['PP_DueDate_By_Delivered'] as String?,
      ref5: json['Ref5'] as String?,
      adjustmentPrelabel: json['Adjustment_Prelabel'] as String?,
      allowDiscountNote: json['Allow_Discount_Note'] as String?,
      srPrelabel: json['SR_Prelabel'] as String?,
      sourceLocationCode: json['Source_Location_Code'] as String?,
      webSI: json['Web_SI'] as String?,
      internalReference: json['Internal_Reference'] as String?,
      gstAmount: (json['GST_Amount'] as num?)?.toDouble(),
      totalAmountB4GST: (json['Total_Amount_B4_GST'] as num?)?.toDouble(),
      roundingDiscount: (json['ROUNDING_DISCOUNT'] as num?)?.toDouble(),
      webLinkPrelabel: json['Web_Link_Prelabel'] as String?,
      lastModifiedDate: json['Last_Modified_Date'] != null ? DateTime.parse(json['Last_Modified_Date']) : null,
      totalEdit: _parseInt(json['Total_Edit']),
      totalPrint: _parseInt(json['Total_Print']),
      appDLPrelabel: json['App_DL_Prelabel'] as String?,
      webStatus: json['Web_Status'] as String?,
      verifyBy: _parseInt(json['Verify_By']),
      verifyDate: json['Verify_Date'] != null ? DateTime.parse(json['Verify_Date']) : null,
      packBy: _parseInt(json['Pack_By']),
      packDate: json['Pack_Date'] != null ? DateTime.parse(json['Pack_Date']) : null,
      attachmentPath1: json['Attachment_Path1'] as String?,
      attachmentPath2: json['Attachment_Path2'] as String?,
      attachmentDate1: json['Attachment_Date1'] != null ? DateTime.parse(json['Attachment_Date1']) : null,
      attachmentDate2: json['Attachment_Date2'] != null ? DateTime.parse(json['Attachment_Date2']) : null,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      pickNo: _parseInt(json['Pick_No']),
      accEntryReference: json['ACC_Entry_Reference'] as String?,
      imsPostedBy: _parseInt(json['IMS_Posted_By']),
      imsPostedDate: json['IMS_Posted_Date'] != null ? DateTime.parse(json['IMS_Posted_Date']) : null,
      accPostedBy: _parseInt(json['ACC_Posted_By']),
      accPostedDate: json['ACC_Posted_Date'] != null ? DateTime.parse(json['ACC_Posted_Date']) : null,
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Batch_No': batchNo,
      'Company_Code': companyCode,
      'Invoice_PreLabel': invoicePreLabel,
      'Invoice_Date': invoiceDate?.toIso8601String(),
      'Due_Date': dueDate?.toIso8601String(),
      'Customer': customer,
      'Ship_To': shipTo,
      'Representative_ID': representativeId,
      'Recur_Invoice': recurInvoice,
      'Recur_Deposit': recurDeposit,
      'Terms': terms,
      'Status': status,
      'Alternate_Company': alternateCompany,
      'Alternate_Doc': alternateDoc,
      'Ref1': ref1,
      'Ref2': ref2,
      'Ref3': ref3,
      'Ref4': ref4,
      'Currency': currency,
      'Rate': rate,
      'Remark1': remark1,
      'Remark2': remark2,
      'Total_Invoice_Entry': totalInvoiceEntry,
      'Total_Invoice_Quantity': totalInvoiceQuantity,
      'Gross_Amount': grossAmount,
      'Invoice_Discount_Rate': invoiceDiscountRate,
      'Invoice_Discount_Amount': invoiceDiscountAmount,
      'Invoice_Tax_Rate': invoiceTaxRate,
      'Invoice_Tax_Amount': invoiceTaxAmount,
      'Other_Charges': otherCharges,
      'Net_Amount': netAmount,
      'Added_By': addedBy,
      'Added_Date': addedDate?.toIso8601String(),
      'Voided_By': voidedBy,
      'Voided_Date': voidedDate?.toIso8601String(),
      'Last_Modified_By': lastModifiedBy,
      'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
      'Transfer': transfer,
      'Link_Account': linkAccount,
      'Way_Bill_No': wayBillNo,
      'Delivered_By': deliveredBy,
      'Delivered_Date': deliveredDate?.toIso8601String(),
      'PP_DiscountByRate': ppDiscountByRate,
      'PP_Discount_Rate': ppDiscountRate,
      'PP_Discount_Amount': ppDiscountAmount,
      'PP_Due_Date': ppDueDate?.toIso8601String(),
      'Location_Code': locationCode,
      'Project_Code': projectCode,
      'SY_Location_Code': syLocationCode,
      'Other_Charges_Rate': otherChargesRate,
      'Cancel_Posted': cancelPosted,
      'DueDate_By_Delivered': dueDateByDelivered,
      'PP_DueDate_By_Delivered': ppDueDateByDelivered,
      'Ref5': ref5,
      'Adjustment_Prelabel': adjustmentPrelabel,
      'Allow_Discount_Note': allowDiscountNote,
      'SR_Prelabel': srPrelabel,
      'Source_Location_Code': sourceLocationCode,
      'Web_SI': webSI,
      'Internal_Reference': internalReference,
      'GST_Amount': gstAmount,
      'Total_Amount_B4_GST': totalAmountB4GST,
      'ROUNDING_DISCOUNT': roundingDiscount,
      'Web_Link_Prelabel': webLinkPrelabel,
      'Last_Modified_Date': lastModifiedDate?.toIso8601String(),
      'Total_Edit': totalEdit,
      'Total_Print': totalPrint,
      'App_DL_Prelabel': appDLPrelabel,
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
      'Pick_No': pickNo,
      'ACC_Entry_Reference': accEntryReference,
      'IMS_Posted_By': imsPostedBy,
      'IMS_Posted_Date': imsPostedDate?.toIso8601String(),
      'ACC_Posted_By': accPostedBy,
      'ACC_Posted_Date': accPostedDate?.toIso8601String(),
    };
  }
}

@collection
class InvoiceItem {
  Id id = Isar.autoIncrement;
  
  final int companyCode;
  @Index(composite: [CompositeIndex('companyCode')])
  final String invoicePreLabel;
  final int sequenceNo;
  final DateTime? dueDate;
  final String doPreLabel;
  final int skuNo;
  final String uom;
  final double? factor;
  final String? status;
  final double? quantity;
  final double? quantityLoose;
  final double? foc;
  final double? focLoose;
  final double? unitPrice;
  final double? unitPriceBasic;
  final double? unitDiscountRate;
  final double? unitDiscountAmount;
  final double? grossAmount;
  final double? taxRate;
  final double? taxAmount;
  final double? netAmount;
  final String? pluNo;
  final String? remark;
  final double? instantNormalSellingPrice;
  final double? averageCost;
  final double? standardCost;
  final double? fifoCost;
  final double? lastCost;
  final int? cancelledBy;
  final DateTime? cancelledDate;
  final String? locationCode;
  final String? batchNo;
  final DateTime? addedDate;
  final double? returnQty;
  final String? piInvoiceNo;
  final double? unitDiscountRate2;
  final double? unitDiscountAmount2;
  final String? source;
  final double? unitDiscountRate1;
  final double? unitDiscountAmount1;
  final String? stockType;
  final double? companyCommRate;
  final double? promoterCommRate;
  final String? openPrice;
  final String? projectCode;
  final String? syLocationCode;
  final double? miscCost;
  final String? defaultPlu;
  final String? ctnUom;
  final double? ctnUnitPrice;
  final double? pts3B4AverageCost;
  final double? pts3B4StandardCost;
  final double? pts3B4LastCost;
  final double? pts3B4FifoCost;
  final double? pts3AfAverageCost;
  final double? pts3AfStandardCost;
  final double? pts3AfLastCost;
  final double? pts3AfFifoCost;
  final int? nameNo;
  final String? alternateDescription;
  final int? itemSequence;
  final String? gstCode;
  final double? gstPrice;
  final double? oldStandardCost;
  final double? oldLastCost;
  final double? oldAverageCost;
  final double? oldFifoCost;
  final String? changePriceRemark;
  final double? quantityLoss;
  final double? quantityOriginal;
  final double? nos;

  InvoiceItem({
    required this.companyCode,
    required this.invoicePreLabel,
    required this.sequenceNo,
    this.dueDate,
    required this.doPreLabel,
    required this.skuNo,
    required this.uom,
    this.factor,
    this.status,
    this.quantity,
    this.quantityLoose,
    this.foc,
    this.focLoose,
    this.unitPrice,
    this.unitPriceBasic,
    this.unitDiscountRate,
    this.unitDiscountAmount,
    this.grossAmount,
    this.taxRate,
    this.taxAmount,
    this.netAmount,
    this.pluNo,
    this.remark,
    this.instantNormalSellingPrice,
    this.averageCost,
    this.standardCost,
    this.fifoCost,
    this.lastCost,
    this.cancelledBy,
    this.cancelledDate,
    this.locationCode,
    this.batchNo,
    this.addedDate,
    this.returnQty,
    this.piInvoiceNo,
    this.unitDiscountRate2,
    this.unitDiscountAmount2,
    this.source,
    this.unitDiscountRate1,
    this.unitDiscountAmount1,
    this.stockType,
    this.companyCommRate,
    this.promoterCommRate,
    this.openPrice,
    this.projectCode,
    this.syLocationCode,
    this.miscCost,
    this.defaultPlu,
    this.ctnUom,
    this.ctnUnitPrice,
    this.pts3B4AverageCost,
    this.pts3B4StandardCost,
    this.pts3B4LastCost,
    this.pts3B4FifoCost,
    this.pts3AfAverageCost,
    this.pts3AfStandardCost,
    this.pts3AfLastCost,
    this.pts3AfFifoCost,
    this.nameNo,
    this.alternateDescription,
    this.itemSequence,
    this.gstCode,
    this.gstPrice,
    this.oldStandardCost,
    this.oldLastCost,
    this.oldAverageCost,
    this.oldFifoCost,
    this.changePriceRemark,
    this.quantityLoss,
    this.quantityOriginal,
    this.nos,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      companyCode: _parseInt(json['Company_Code']) ?? 0,
      invoicePreLabel: json['Invoice_PreLabel'] as String,
      sequenceNo: _parseInt(json['Sequence_No']) ?? 0,
      dueDate: json['Due_Date'] != null ? DateTime.parse(json['Due_Date']) : null,
      doPreLabel: json['DO_PreLabel'] as String,
      skuNo: _parseInt(json['Sku_No']) ?? 0,
      uom: json['Uom'] as String,
      factor: (json['Factor'] as num?)?.toDouble(),
      status: json['Status'] as String?,
      quantity: (json['Quantity'] as num?)?.toDouble(),
      quantityLoose: (json['Quantity_Loose'] as num?)?.toDouble(),
      foc: (json['Foc'] as num?)?.toDouble(),
      focLoose: (json['Foc_Loose'] as num?)?.toDouble(),
      unitPrice: (json['Unit_Price'] as num?)?.toDouble(),
      unitPriceBasic: (json['Unit_Price_Basic'] as num?)?.toDouble(),
      unitDiscountRate: (json['Unit_Discount_Rate'] as num?)?.toDouble(),
      unitDiscountAmount: (json['Unit_Discount_Amount'] as num?)?.toDouble(),
      grossAmount: (json['Gross_Amount'] as num?)?.toDouble(),
      taxRate: (json['Tax_Rate'] as num?)?.toDouble(),
      taxAmount: (json['Tax_Amount'] as num?)?.toDouble(),
      netAmount: (json['Net_Amount'] as num?)?.toDouble(),
      pluNo: json['Plu_No'] as String?,
      remark: json['Remark'] as String?,
      instantNormalSellingPrice: (json['Instant_Normal_Selling_Price'] as num?)?.toDouble(),
      averageCost: (json['Average_Cost'] as num?)?.toDouble(),
      standardCost: (json['Standard_Cost'] as num?)?.toDouble(),
      fifoCost: (json['Fifo_Cost'] as num?)?.toDouble(),
      lastCost: (json['Last_Cost'] as num?)?.toDouble(),
      cancelledBy: _parseInt(json['Cancelled_By']),
      cancelledDate: json['Cancelled_Date'] != null ? DateTime.parse(json['Cancelled_Date']) : null,
      locationCode: json['Location_Code'] as String?,
      batchNo: json['Batch_No'] as String?,
      addedDate: json['Added_Date'] != null ? DateTime.parse(json['Added_Date']) : null,
      returnQty: (json['Return_Qty'] as num?)?.toDouble(),
      piInvoiceNo: json['PI_Invoice_No'] as String?,
      unitDiscountRate2: (json['Unit_Discount_Rate2'] as num?)?.toDouble(),
      unitDiscountAmount2: (json['Unit_Discount_Amount2'] as num?)?.toDouble(),
      source: json['Source'] as String?,
      unitDiscountRate1: (json['Unit_Discount_Rate1'] as num?)?.toDouble(),
      unitDiscountAmount1: (json['Unit_Discount_Amount1'] as num?)?.toDouble(),
      stockType: json['Stock_Type'] as String?,
      companyCommRate: (json['Company_Comm_Rate'] as num?)?.toDouble(),
      promoterCommRate: (json['Promoter_Comm_Rate'] as num?)?.toDouble(),
      openPrice: json['Open_Price'] as String?,
      projectCode: json['Project_Code'] as String?,
      syLocationCode: json['SY_Location_Code'] as String?,
      miscCost: (json['Misc_Cost'] as num?)?.toDouble(),
      defaultPlu: json['Default_Plu'] as String?,
      ctnUom: json['CTN_Uom'] as String?,
      ctnUnitPrice: (json['CTN_Unit_Price'] as num?)?.toDouble(),
      pts3B4AverageCost: (json['PTS3_B4_Average_Cost'] as num?)?.toDouble(),
      pts3B4StandardCost: (json['PTS3_B4_Standard_Cost'] as num?)?.toDouble(),
      pts3B4LastCost: (json['PTS3_B4_Last_Cost'] as num?)?.toDouble(),
      pts3B4FifoCost: (json['PTS3_B4_Fifo_Cost'] as num?)?.toDouble(),
      pts3AfAverageCost: (json['PTS3_AF_Average_Cost'] as num?)?.toDouble(),
      pts3AfStandardCost: (json['PTS3_AF_Standard_Cost'] as num?)?.toDouble(),
      pts3AfLastCost: (json['PTS3_AF_Last_Cost'] as num?)?.toDouble(),
      pts3AfFifoCost: (json['PTS3_AF_Fifo_Cost'] as num?)?.toDouble(),
      nameNo: _parseInt(json['Name_No']),
      alternateDescription: json['Alternate_Description'] as String?,
      itemSequence: _parseInt(json['Item_Sequence']),
      gstCode: json['GST_Code'] as String?,
      gstPrice: (json['GST_Price'] as num?)?.toDouble(),
      oldStandardCost: (json['Old_Standard_Cost'] as num?)?.toDouble(),
      oldLastCost: (json['Old_Last_Cost'] as num?)?.toDouble(),
      oldAverageCost: (json['Old_Average_Cost'] as num?)?.toDouble(),
      oldFifoCost: (json['Old_Fifo_Cost'] as num?)?.toDouble(),
      changePriceRemark: json['Change_Price_Remark'] as String?,
      quantityLoss: (json['Quantity_Loss'] as num?)?.toDouble(),
      quantityOriginal: (json['Quantity_Original'] as num?)?.toDouble(),
      nos: (json['Nos'] as num?)?.toDouble(),
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
