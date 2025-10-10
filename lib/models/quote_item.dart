import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

part 'quote_item.g.dart';

@collection
class QuoteItem {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  @Index()
  late String quotePreLabel;

  late int sequenceNo;
  late int skuNo;
  late String uom;
  double? factor;
  String? status;
  double? quoteQuantity;
  double? quoteQuantityLoose;
  double? quoteFoc;
  double? quoteFocLoose;
  double? unitPrice;
  double? unitPriceBasic;
  double? approvalUnitPrice;
  double? unitDiscountRate;
  double? unitDiscountAmount;
  double? taxRate;
  double? taxAmount;
  double? netAmount;
  String? pluNo;
  String? remark;
  double? instantNormalSellingPrice;
  double? averageCost;
  double? standardCost;
  double? fifoCost;
  double? lastCost;
  double? balanceQuantity;
  double? balanceQuantityLoose;
  double? balanceFoc;
  double? balanceFocLoose;
  int? cancelledBy;
  DateTime? cancelledDate;
  String? locationCode;
  DateTime? addedDate;
  double? unitDiscountRate2;
  double? unitDiscountAmount2;
  double? unitDiscountRate1;
  double? unitDiscountAmount1;
  String? projectCode;
  String? syLocationCode;
  double? miscCost;
  String? defaultPlu;
  String? ctnUom;
  double? ctnUnitPrice;
  String? alternateDescription;
  int? itemSequence;
  String? gstCode;
  double? gstPrice;
  String? changePriceRemark;
  double? quoteQuantityOri;
  double? quoteQuantityLooseOri;
  double? quoteFocOri;
  double? quoteFocLooseOri;
  double? unitPriceOri;
  double? unitDiscountRateOri;
  double? unitDiscountAmountOri;
  double? quantityLoss;
  double? quantityOriginal;
  double? nos;

  QuoteItem();

  // Factory constructor from JSON
  factory QuoteItem.fromJson(Map<String, dynamic> json) {
    final item = QuoteItem();
    
    item.companyCode = int.tryParse(json['Company_Code']?.toString() ?? '') ?? 0;
    item.quotePreLabel = json['Quote_PreLabel']?.toString() ?? '';
    item.sequenceNo = int.tryParse(json['Sequence_No']?.toString() ?? '') ?? 0;
    item.skuNo = int.tryParse(json['Sku_No']?.toString() ?? '') ?? 0;
    item.uom = json['Uom'] ?? '';
    item.factor = json['Factor'] != null ? double.tryParse(json['Factor'].toString()) : null;
    item.status = json['Status'];
    item.quoteQuantity = json['Quote_Quantity'] != null ? double.tryParse(json['Quote_Quantity'].toString()) : null;
    item.quoteQuantityLoose = json['Quote_Quantity_Loose'] != null ? double.tryParse(json['Quote_Quantity_Loose'].toString()) : null;
    item.quoteFoc = json['Quote_Foc'] != null ? double.tryParse(json['Quote_Foc'].toString()) : null;
    item.quoteFocLoose = json['Quote_Foc_Loose'] != null ? double.tryParse(json['Quote_Foc_Loose'].toString()) : null;
    item.unitPrice = json['Unit_Price'] != null ? double.tryParse(json['Unit_Price'].toString()) : null;
    item.unitPriceBasic = json['Unit_Price_Basic'] != null ? double.tryParse(json['Unit_Price_Basic'].toString()) : null;
    item.approvalUnitPrice = json['Approval_Unit_Price'] != null ? double.tryParse(json['Approval_Unit_Price'].toString()) : null;
    item.unitDiscountRate = json['Unit_Discount_Rate'] != null ? double.tryParse(json['Unit_Discount_Rate'].toString()) : null;
    item.unitDiscountAmount = json['Unit_Discount_Amount'] != null ? double.tryParse(json['Unit_Discount_Amount'].toString()) : null;
    item.taxRate = json['Tax_Rate'] != null ? double.tryParse(json['Tax_Rate'].toString()) : null;
    item.taxAmount = json['Tax_Amount'] != null ? double.tryParse(json['Tax_Amount'].toString()) : null;
    item.netAmount = json['Net_Amount'] != null ? double.tryParse(json['Net_Amount'].toString()) : null;
    item.pluNo = json['Plu_No'];
    item.remark = json['Remark'];
    item.instantNormalSellingPrice = json['Instant_Normal_Selling_Price'] != null ? double.tryParse(json['Instant_Normal_Selling_Price'].toString()) : null;
    item.averageCost = json['Average_Cost'] != null ? double.tryParse(json['Average_Cost'].toString()) : null;
    item.standardCost = json['Standard_Cost'] != null ? double.tryParse(json['Standard_Cost'].toString()) : null;
    item.fifoCost = json['Fifo_Cost'] != null ? double.tryParse(json['Fifo_Cost'].toString()) : null;
    item.lastCost = json['Last_Cost'] != null ? double.tryParse(json['Last_Cost'].toString()) : null;
    item.balanceQuantity = json['Balance_Quantity'] != null ? double.tryParse(json['Balance_Quantity'].toString()) : null;
    item.balanceQuantityLoose = json['Balance_Quantity_Loose'] != null ? double.tryParse(json['Balance_Quantity_Loose'].toString()) : null;
    item.balanceFoc = json['Balance_Foc'] != null ? double.tryParse(json['Balance_Foc'].toString()) : null;
    item.balanceFocLoose = json['Balance_Foc_Loose'] != null ? double.tryParse(json['Balance_Foc_Loose'].toString()) : null;
    item.cancelledBy = json['Cancelled_By'] != null ? int.tryParse(json['Cancelled_By'].toString()) : null;
    item.cancelledDate = json['Cancelled_Date'] != null ? DateTime.tryParse(json['Cancelled_Date'].toString()) : null;
    item.locationCode = json['Location_Code'];
    item.addedDate = json['Added_Date'] != null ? DateTime.tryParse(json['Added_Date'].toString()) : null;
    item.unitDiscountRate2 = json['Unit_Discount_Rate2'] != null ? double.tryParse(json['Unit_Discount_Rate2'].toString()) : null;
    item.unitDiscountAmount2 = json['Unit_Discount_Amount2'] != null ? double.tryParse(json['Unit_Discount_Amount2'].toString()) : null;
    item.unitDiscountRate1 = json['Unit_Discount_Rate1'] != null ? double.tryParse(json['Unit_Discount_Rate1'].toString()) : null;
    item.unitDiscountAmount1 = json['Unit_Discount_Amount1'] != null ? double.tryParse(json['Unit_Discount_Amount1'].toString()) : null;
    item.projectCode = json['Project_Code'];
    item.syLocationCode = json['SY_Location_Code'];
    item.miscCost = json['Misc_Cost'] != null ? double.tryParse(json['Misc_Cost'].toString()) : null;
    item.defaultPlu = json['Default_Plu'];
    item.ctnUom = json['CTN_Uom'];
    item.ctnUnitPrice = json['CTN_Unit_Price'] != null ? double.tryParse(json['CTN_Unit_Price'].toString()) : null;
    item.alternateDescription = json['Alternate_Description'];
    item.itemSequence = json['Item_Sequence'] != null ? int.tryParse(json['Item_Sequence'].toString()) : null;
    item.gstCode = json['GST_Code'];
    item.gstPrice = json['GST_Price'] != null ? double.tryParse(json['GST_Price'].toString()) : null;
    item.changePriceRemark = json['Change_Price_Remark'];
    item.quoteQuantityOri = json['Quote_Quantity_Ori'] != null ? double.tryParse(json['Quote_Quantity_Ori'].toString()) : null;
    item.quoteQuantityLooseOri = json['Quote_Quantity_Loose_Ori'] != null ? double.tryParse(json['Quote_Quantity_Loose_Ori'].toString()) : null;
    item.quoteFocOri = json['Quote_Foc_Ori'] != null ? double.tryParse(json['Quote_Foc_Ori'].toString()) : null;
    item.quoteFocLooseOri = json['Quote_Foc_Loose_Ori'] != null ? double.tryParse(json['Quote_Foc_Loose_Ori'].toString()) : null;
    item.unitPriceOri = json['Unit_Price_Ori'] != null ? double.tryParse(json['Unit_Price_Ori'].toString()) : null;
    item.unitDiscountRateOri = json['Unit_Discount_Rate_Ori'] != null ? double.tryParse(json['Unit_Discount_Rate_Ori'].toString()) : null;
    item.unitDiscountAmountOri = json['Unit_Discount_Amount_Ori'] != null ? double.tryParse(json['Unit_Discount_Amount_Ori'].toString()) : null;
    item.quantityLoss = json['Quantity_Loss'] != null ? double.tryParse(json['Quantity_Loss'].toString()) : null;
    item.quantityOriginal = json['Quantity_Original'] != null ? double.tryParse(json['Quantity_Original'].toString()) : null;
    item.nos = json['Nos'] != null ? double.tryParse(json['Nos'].toString()) : null;

    return item;
  }

  // Helper methods for display
  String get displaySkuNo => skuNo.toString();
  String get displayUom => uom;
  double get displayQuantity => quoteQuantity ?? 0.0;
  double get displayUnitPrice => unitPrice ?? 0.0;
  double get displayNetAmount => netAmount ?? 0.0;
  String get displayCurrency => 'MYR'; // You can make this configurable
  
  String get formattedUnitPrice {
    return '$displayCurrency ${displayUnitPrice.toStringAsFixed(2)}';
  }
  
  String get formattedNetAmount {
    return '$displayCurrency ${displayNetAmount.toStringAsFixed(2)}';
  }
  
  String get formattedQuantity {
    return '${displayQuantity.toStringAsFixed(0)} $displayUom';
  }
}
