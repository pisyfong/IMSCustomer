import 'package:isar/isar.dart';

part 'inventory_item.g.dart';

@collection
class InventoryItem {
  Id id = Isar.autoIncrement;

  // Primary keys
  @Index()
  late int companyCode;
  
  @Index()
  late int skuNo;

  // Basic item information
  String? uom;
  String? grp;
  String? dept;
  String? subDept;
  String? category;
  String? description;
  String? remarks;
  String? status;
  String? location;
  String? articleNo;

  // Stock levels and quantities
  double? stockFactor;
  double? minStockLevel;
  double? maxStockLevel;
  double? reorderLevel;
  double? qtyOnHand;
  double? qtyOnRequest;
  double? qtyOnSales;
  double? qtyOnOrder;
  double? qtyOnReceived;
  double? qtyOnReturn;
  double? qtyOnSalesOrder;
  double? qtyOnTrading;
  double? qtyOnCustomerReturn;
  double? qtyOnExchange;
  double? qtyOnRepair;
  double? qtyOnAdjIn;
  double? qtyOnAdjOut;
  double? qtyOnAdjKiv;
  double? qtyOnQuote;

  // Flags and settings
  String? givePoint;
  String? giveRebate;
  double? companyCommRate;
  double? promoterCommRate;
  String? inventoryItem;
  String? qtyWithDecimal;
  String? type;
  String? openPrice;
  String? discountable;
  String? calculateQtyFromPrice;
  String? allowZeroPrice;
  String? serialNo;
  String? expiry;
  String? batchExpiry;
  String? returnDue;

  // Reference fields
  String? ref1;
  String? ref2;
  String? ref3;
  String? ref4;
  String? ref1Text;
  String? ref2Text;
  String? ref3Text;
  String? ref4Text;

  // Cost information
  double? averageCost;
  double? standardCost;
  double? lastCost;
  double? fifoCost;
  double? miscCost;

  // Pricing per UOM (from In_Stock_UOM join)
  double? price;      // Unit price (ex-GST)
  double? gstPrice;   // Unit price (incl. GST)
  double? uomFactor;  // Factor for this UOM row

  // Dates
  DateTime? lastPurDate;
  DateTime? lastSalesDate;
  DateTime? addedDate;
  DateTime? lastWriteTimeStamp;
  DateTime? introDate;
  DateTime? lastVendorDate;

  // Additional fields (showing key ones for inventory management)
  String? invoicePreLabel;
  int? lastModifiedBy;
  int? addedBy;
  int? pluNo;
  String? oldRemarks;
  String? cgmCode;
  String? issueNo;
  double? packSize;
  String? packSizeDescription;
  String? openCode;
  String? size;
  String? actualSize;
  String? color;
  String? articleDesc;
  String? introPreLabel;
  int? ckuNo;
  double? qtyOnIR;
  double? qtyOnIO;
  String? description2;
  String? noQty;
  String? noCost;
  String? brand;
  String? packSizeUom;
  int? warrantyPeriod;
  String? warrantyPeriodType;

  // Web and additional fields
  String? webGrp;
  String? webDept;
  String? webSubDept;
  String? webCategory;
  String? webPromoGrp;
  String? quotaGrp;
  String? webMixMatch;
  DateTime? webItemFr;
  DateTime? webItemTo;
  String? webChkDate;
  String? webImageDetail;
  DateTime? lastModifiedDate;
  String? nutritionFactsImage;
  double? webDailyQty;
  String? webQtyMethod;
  String? altPlu;
  String? webSpecialMsg;
  double? lossPercent;
  double? nos;
  String? itemType;

  // Convert from server response
  static InventoryItem fromJson(Map<String, dynamic> json) {
    try {
      final int company = _parseInt(json['Company_Code']) ?? 0;
      final int sku = _parseInt(json['Sku_No']) ?? 0;
      return InventoryItem()
      ..companyCode = company
      ..skuNo = sku
      ..id = _composeId(company, sku)
      ..uom = json['Uom']
      ..grp = json['Grp']
      ..dept = json['Dept']
      ..subDept = json['SubDept']
      ..category = json['Category']
      ..description = json['Description']
      ..remarks = json['Remarks']
      ..status = json['Status']
      ..location = json['Location']
      ..articleNo = json['Article_No']
      ..stockFactor = _parseDouble(json['Stock_Factor'])
      ..minStockLevel = _parseDouble(json['Min_Stock_Level'])
      ..maxStockLevel = _parseDouble(json['Max_Stock_Level'])
      ..reorderLevel = _parseDouble(json['Reorder_Level'])
      ..qtyOnHand = _parseDouble(json['Qty_On_Hand'])
      ..qtyOnRequest = _parseDouble(json['Qty_On_Request'])
      ..qtyOnSales = _parseDouble(json['Qty_On_Sales'])
      ..qtyOnOrder = _parseDouble(json['Qty_On_Order'])
      ..qtyOnReceived = _parseDouble(json['Qty_On_Received'])
      ..qtyOnReturn = _parseDouble(json['Qty_On_Return'])
      ..qtyOnSalesOrder = _parseDouble(json['Qty_On_Sales_Order'])
      ..qtyOnTrading = _parseDouble(json['Qty_On_Trading'])
      ..qtyOnCustomerReturn = _parseDouble(json['Qty_On_Customer_Return'])
      ..qtyOnExchange = _parseDouble(json['Qty_On_Exchange'])
      ..qtyOnRepair = _parseDouble(json['Qty_On_Repair'])
      ..qtyOnAdjIn = _parseDouble(json['Qty_On_Adj_In'])
      ..qtyOnAdjOut = _parseDouble(json['Qty_On_Adj_Out'])
      ..qtyOnAdjKiv = _parseDouble(json['Qty_On_Adj_Kiv'])
      ..qtyOnQuote = _parseDouble(json['Qty_On_Quote'])
      ..givePoint = json['Give_Point']
      ..giveRebate = json['Give_Rebate']
      ..companyCommRate = _parseDouble(json['Company_Comm_Rate'])
      ..promoterCommRate = _parseDouble(json['Promoter_Comm_Rate'])
      ..inventoryItem = json['Inventory_Item']
      ..qtyWithDecimal = json['Qty_With_Decimal']
      ..type = json['Type']
      ..openPrice = _parseString(json['Open_Price'])
      ..discountable = json['Discountable']
      ..calculateQtyFromPrice = json['Calculate_Qty_From_Price']
      ..allowZeroPrice = json['Allow_Zero_Price']
      ..serialNo = json['Serial_No']
      ..expiry = json['Expiry']
      ..batchExpiry = json['Batch_Expiry']
      ..returnDue = json['Return_Due']
      ..ref1 = json['Ref1']
      ..ref2 = json['Ref2']
      ..ref3 = json['Ref3']
      ..ref4 = json['Ref4']
      ..ref1Text = json['Ref1_Text']
      ..ref2Text = json['Ref2_Text']
      ..ref3Text = json['Ref3_Text']
      ..ref4Text = json['Ref4_Text']
      ..averageCost = _parseDouble(json['Average_Cost'])
      ..standardCost = _parseDouble(json['Standard_Cost'])
      ..lastCost = _parseDouble(json['Last_Cost'])
      ..fifoCost = _parseDouble(json['Fifo_Cost'])
      ..miscCost = _parseDouble(json['Misc_Cost'])
      // New pricing fields from API join
      ..price = _parseDouble(json['Price'])
      ..gstPrice = _parseDouble(json['GST_Price'])
      ..uomFactor = _parseDouble(json['Factor'])
      ..lastPurDate = _parseDateTime(json['Last_Pur_Date'])
      ..invoicePreLabel = json['Invoice_PreLabel']
      ..lastSalesDate = _parseDateTime(json['Last_Sales_Date'])
      ..lastModifiedBy = _parseInt(json['Last_Modified_By'])
      ..addedBy = _parseInt(json['Added_By'])
      ..addedDate = _parseDateTime(json['Added_Date'])
      ..pluNo = _parseInt(json['Plu_No'])
      ..lastWriteTimeStamp = _parseDateTime(json['LastWriteTimeStamp'])
      ..oldRemarks = json['OldRemarks']
      ..cgmCode = json['CgmCode']
      ..issueNo = json['Issue_No']
      ..packSize = _parseDouble(json['Pack_Size'])
      ..packSizeDescription = json['Pack_Size_Desc']
      ..openCode = json['Open_Code']
      ..size = json['Size']
      ..actualSize = json['Actual_Size']
      ..color = json['Color']
      ..articleDesc = json['Article_Desc']
      ..introDate = _parseDateTime(json['Intro_Date'])
      ..introPreLabel = json['Intro_PreLabel']
      ..ckuNo = _parseInt(json['CKU_No'])
      ..qtyOnIR = _parseDouble(json['Qty_On_IR'])
      ..qtyOnIO = _parseDouble(json['Qty_On_IO'])
      ..description2 = json['Description2']
      ..noQty = json['No_Qty']
      ..noCost = json['No_Cost']
      ..brand = json['Brand']
      ..packSizeUom = json['Pack_Size_Uom']
      ..warrantyPeriod = _parseInt(json['Warranty_Period'])
      ..warrantyPeriodType = json['Warranty_Period_Type']
      ..webGrp = json['Web_Grp']
      ..webDept = json['Web_Dept']
      ..webSubDept = json['Web_SubDept']
      ..webCategory = json['Web_Category']
      ..webPromoGrp = json['Web_Promo_Grp']
      ..quotaGrp = json['Quota_Grp']
      ..webMixMatch = json['Web_Mix_Match']
      ..webItemFr = _parseDateTime(json['Web_Item_Fr'])
      ..webItemTo = _parseDateTime(json['Web_Item_To'])
      ..webChkDate = json['Web_Chk_Date']
      ..webImageDetail = json['Web_Image_Detail']
      ..lastModifiedDate = _parseDateTime(json['Last_Modified_Date'])
      ..nutritionFactsImage = json['Nutrition_Facts_Image']
      ..webDailyQty = _parseDouble(json['Web_Daily_Qty'])
      ..webQtyMethod = json['Web_Qty_Method']
      ..altPlu = json['Alt_Plu']
      ..webSpecialMsg = json['Web_Special_Msg']
      ..lossPercent = _parseDouble(json['Loss_Percent'])
      ..nos = _parseDouble(json['Nos'])
      ..itemType = json['Item_Type']
      ..lastVendorDate = _parseDateTime(json['Last_Vendor_Date']);
    } catch (e, stackTrace) {
      print('❌ ERROR in InventoryItem.fromJson: $e');
      print('📋 JSON data: $json');
      print('📍 Stack trace: $stackTrace');
      rethrow;
    }
  }

  // Compose a stable unique Id per (companyCode, skuNo)
  static int _composeId(int companyCode, int skuNo) {
    // Use a large multiplier to avoid collisions (supports sku up to < 1e9)
    const int factor = 1000000000; // 1e9
    return companyCode * factor + skuNo;
  }

  // Helper methods for parsing
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  static String? _parseString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is int) return value.toString();
    if (value is double) return value.toString();
    return value.toString();
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  // Convert to JSON for server communication
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'Sku_No': skuNo,
      'Uom': uom,
      'Grp': grp,
      'Dept': dept,
      'SubDept': subDept,
      'Category': category,
      'Description': description,
      'Remarks': remarks,
      'Status': status,
      'Location': location,
      'Article_No': articleNo,
      'Stock_Factor': stockFactor,
      'Min_Stock_Level': minStockLevel,
      'Max_Stock_Level': maxStockLevel,
      'Reorder_Level': reorderLevel,
      'Qty_On_Hand': qtyOnHand,
      'Qty_On_Request': qtyOnRequest,
      'Qty_On_Sales': qtyOnSales,
      'Qty_On_Order': qtyOnOrder,
      'Qty_On_Received': qtyOnReceived,
      'Qty_On_Return': qtyOnReturn,
      'Qty_On_Sales_Order': qtyOnSalesOrder,
      'Qty_On_Trading': qtyOnTrading,
      'Qty_On_Customer_Return': qtyOnCustomerReturn,
      'Qty_On_Exchange': qtyOnExchange,
      'Qty_On_Repair': qtyOnRepair,
      'Qty_On_Adj_In': qtyOnAdjIn,
      'Qty_On_Adj_Out': qtyOnAdjOut,
      'Qty_On_Adj_Kiv': qtyOnAdjKiv,
      'Qty_On_Quote': qtyOnQuote,
      'Give_Point': givePoint,
      'Give_Rebate': giveRebate,
      'Company_Comm_Rate': companyCommRate,
      'Promoter_Comm_Rate': promoterCommRate,
      'Inventory_Item': inventoryItem,
      'Qty_With_Decimal': qtyWithDecimal,
      'Type': type,
      'Open_Price': openPrice,
      'Discountable': discountable,
      'Calculate_Qty_From_Price': calculateQtyFromPrice,
      'Allow_Zero_Price': allowZeroPrice,
      'Serial_No': serialNo,
      'Expiry': expiry,
      'Batch_Expiry': batchExpiry,
      'Return_Due': returnDue,
      'Average_Cost': averageCost,
      'Standard_Cost': standardCost,
      'Last_Cost': lastCost,
      'Fifo_Cost': fifoCost,
      'Misc_Cost': miscCost,
      // New pricing fields
      'Price': price,
      'GST_Price': gstPrice,
      'Factor': uomFactor,
      'Brand': brand,
      'Pack_Size': packSize,
      'Pack_Size_Desc': packSizeDescription,
      'Size': size,
      'Actual_Size': actualSize,
      'Color': color,
      'Article_Desc': articleDesc,
      'Description2': description2,
      'No_Qty': noQty,
      'No_Cost': noCost,
      'Item_Type': itemType,
    };
  }

  // Display helpers
  String get displayName => description ?? articleDesc ?? 'Unknown Item';
  String get displayCode => 'SKU: $skuNo';
  String get displayLocation => location ?? 'No Location';
  String get displayQtyOnHand => qtyOnHand?.toStringAsFixed(2) ?? '0.00';
  String get displayStatus => status ?? 'Unknown';
  String get displayBrand => brand ?? 'No Brand';
  String get displayCategory => category ?? 'No Category';
}
