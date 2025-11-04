// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInventoryItemCollection on Isar {
  IsarCollection<InventoryItem> get inventoryItems => this.collection();
}

const InventoryItemSchema = CollectionSchema(
  name: r'InventoryItem',
  id: -5800758315837643353,
  properties: {
    r'actualSize': PropertySchema(
      id: 0,
      name: r'actualSize',
      type: IsarType.string,
    ),
    r'addedBy': PropertySchema(
      id: 1,
      name: r'addedBy',
      type: IsarType.long,
    ),
    r'addedDate': PropertySchema(
      id: 2,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'allowZeroPrice': PropertySchema(
      id: 3,
      name: r'allowZeroPrice',
      type: IsarType.string,
    ),
    r'altPlu': PropertySchema(
      id: 4,
      name: r'altPlu',
      type: IsarType.string,
    ),
    r'articleDesc': PropertySchema(
      id: 5,
      name: r'articleDesc',
      type: IsarType.string,
    ),
    r'articleNo': PropertySchema(
      id: 6,
      name: r'articleNo',
      type: IsarType.string,
    ),
    r'averageCost': PropertySchema(
      id: 7,
      name: r'averageCost',
      type: IsarType.double,
    ),
    r'batchExpiry': PropertySchema(
      id: 8,
      name: r'batchExpiry',
      type: IsarType.string,
    ),
    r'brand': PropertySchema(
      id: 9,
      name: r'brand',
      type: IsarType.string,
    ),
    r'calculateQtyFromPrice': PropertySchema(
      id: 10,
      name: r'calculateQtyFromPrice',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 11,
      name: r'category',
      type: IsarType.string,
    ),
    r'cgmCode': PropertySchema(
      id: 12,
      name: r'cgmCode',
      type: IsarType.string,
    ),
    r'ckuNo': PropertySchema(
      id: 13,
      name: r'ckuNo',
      type: IsarType.long,
    ),
    r'color': PropertySchema(
      id: 14,
      name: r'color',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 15,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'companyCommRate': PropertySchema(
      id: 16,
      name: r'companyCommRate',
      type: IsarType.double,
    ),
    r'dept': PropertySchema(
      id: 17,
      name: r'dept',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 18,
      name: r'description',
      type: IsarType.string,
    ),
    r'description2': PropertySchema(
      id: 19,
      name: r'description2',
      type: IsarType.string,
    ),
    r'discountable': PropertySchema(
      id: 20,
      name: r'discountable',
      type: IsarType.string,
    ),
    r'displayBrand': PropertySchema(
      id: 21,
      name: r'displayBrand',
      type: IsarType.string,
    ),
    r'displayCategory': PropertySchema(
      id: 22,
      name: r'displayCategory',
      type: IsarType.string,
    ),
    r'displayCode': PropertySchema(
      id: 23,
      name: r'displayCode',
      type: IsarType.string,
    ),
    r'displayLocation': PropertySchema(
      id: 24,
      name: r'displayLocation',
      type: IsarType.string,
    ),
    r'displayName': PropertySchema(
      id: 25,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'displayQtyOnHand': PropertySchema(
      id: 26,
      name: r'displayQtyOnHand',
      type: IsarType.string,
    ),
    r'displayStatus': PropertySchema(
      id: 27,
      name: r'displayStatus',
      type: IsarType.string,
    ),
    r'expiry': PropertySchema(
      id: 28,
      name: r'expiry',
      type: IsarType.string,
    ),
    r'fifoCost': PropertySchema(
      id: 29,
      name: r'fifoCost',
      type: IsarType.double,
    ),
    r'flag3': PropertySchema(
      id: 30,
      name: r'flag3',
      type: IsarType.string,
    ),
    r'givePoint': PropertySchema(
      id: 31,
      name: r'givePoint',
      type: IsarType.string,
    ),
    r'giveRebate': PropertySchema(
      id: 32,
      name: r'giveRebate',
      type: IsarType.string,
    ),
    r'grp': PropertySchema(
      id: 33,
      name: r'grp',
      type: IsarType.string,
    ),
    r'gstPrice': PropertySchema(
      id: 34,
      name: r'gstPrice',
      type: IsarType.double,
    ),
    r'introDate': PropertySchema(
      id: 35,
      name: r'introDate',
      type: IsarType.dateTime,
    ),
    r'introPreLabel': PropertySchema(
      id: 36,
      name: r'introPreLabel',
      type: IsarType.string,
    ),
    r'inventoryItem': PropertySchema(
      id: 37,
      name: r'inventoryItem',
      type: IsarType.string,
    ),
    r'invoicePreLabel': PropertySchema(
      id: 38,
      name: r'invoicePreLabel',
      type: IsarType.string,
    ),
    r'issueNo': PropertySchema(
      id: 39,
      name: r'issueNo',
      type: IsarType.string,
    ),
    r'itemType': PropertySchema(
      id: 40,
      name: r'itemType',
      type: IsarType.string,
    ),
    r'lastCost': PropertySchema(
      id: 41,
      name: r'lastCost',
      type: IsarType.double,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 42,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastModifiedDate': PropertySchema(
      id: 43,
      name: r'lastModifiedDate',
      type: IsarType.dateTime,
    ),
    r'lastPurDate': PropertySchema(
      id: 44,
      name: r'lastPurDate',
      type: IsarType.dateTime,
    ),
    r'lastSalesDate': PropertySchema(
      id: 45,
      name: r'lastSalesDate',
      type: IsarType.dateTime,
    ),
    r'lastVendorDate': PropertySchema(
      id: 46,
      name: r'lastVendorDate',
      type: IsarType.dateTime,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 47,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'location': PropertySchema(
      id: 48,
      name: r'location',
      type: IsarType.string,
    ),
    r'lossPercent': PropertySchema(
      id: 49,
      name: r'lossPercent',
      type: IsarType.double,
    ),
    r'maxStockLevel': PropertySchema(
      id: 50,
      name: r'maxStockLevel',
      type: IsarType.double,
    ),
    r'minStockLevel': PropertySchema(
      id: 51,
      name: r'minStockLevel',
      type: IsarType.double,
    ),
    r'miscCost': PropertySchema(
      id: 52,
      name: r'miscCost',
      type: IsarType.double,
    ),
    r'noCost': PropertySchema(
      id: 53,
      name: r'noCost',
      type: IsarType.string,
    ),
    r'noQty': PropertySchema(
      id: 54,
      name: r'noQty',
      type: IsarType.string,
    ),
    r'nos': PropertySchema(
      id: 55,
      name: r'nos',
      type: IsarType.double,
    ),
    r'nutritionFactsImage': PropertySchema(
      id: 56,
      name: r'nutritionFactsImage',
      type: IsarType.string,
    ),
    r'oldRemarks': PropertySchema(
      id: 57,
      name: r'oldRemarks',
      type: IsarType.string,
    ),
    r'openCode': PropertySchema(
      id: 58,
      name: r'openCode',
      type: IsarType.string,
    ),
    r'openPrice': PropertySchema(
      id: 59,
      name: r'openPrice',
      type: IsarType.string,
    ),
    r'packSize': PropertySchema(
      id: 60,
      name: r'packSize',
      type: IsarType.double,
    ),
    r'packSizeDescription': PropertySchema(
      id: 61,
      name: r'packSizeDescription',
      type: IsarType.string,
    ),
    r'packSizeUom': PropertySchema(
      id: 62,
      name: r'packSizeUom',
      type: IsarType.string,
    ),
    r'pluNo': PropertySchema(
      id: 63,
      name: r'pluNo',
      type: IsarType.long,
    ),
    r'price': PropertySchema(
      id: 64,
      name: r'price',
      type: IsarType.double,
    ),
    r'promoterCommRate': PropertySchema(
      id: 65,
      name: r'promoterCommRate',
      type: IsarType.double,
    ),
    r'qtyOnAdjIn': PropertySchema(
      id: 66,
      name: r'qtyOnAdjIn',
      type: IsarType.double,
    ),
    r'qtyOnAdjKiv': PropertySchema(
      id: 67,
      name: r'qtyOnAdjKiv',
      type: IsarType.double,
    ),
    r'qtyOnAdjOut': PropertySchema(
      id: 68,
      name: r'qtyOnAdjOut',
      type: IsarType.double,
    ),
    r'qtyOnCustomerReturn': PropertySchema(
      id: 69,
      name: r'qtyOnCustomerReturn',
      type: IsarType.double,
    ),
    r'qtyOnExchange': PropertySchema(
      id: 70,
      name: r'qtyOnExchange',
      type: IsarType.double,
    ),
    r'qtyOnHand': PropertySchema(
      id: 71,
      name: r'qtyOnHand',
      type: IsarType.double,
    ),
    r'qtyOnIO': PropertySchema(
      id: 72,
      name: r'qtyOnIO',
      type: IsarType.double,
    ),
    r'qtyOnIR': PropertySchema(
      id: 73,
      name: r'qtyOnIR',
      type: IsarType.double,
    ),
    r'qtyOnOrder': PropertySchema(
      id: 74,
      name: r'qtyOnOrder',
      type: IsarType.double,
    ),
    r'qtyOnQuote': PropertySchema(
      id: 75,
      name: r'qtyOnQuote',
      type: IsarType.double,
    ),
    r'qtyOnReceived': PropertySchema(
      id: 76,
      name: r'qtyOnReceived',
      type: IsarType.double,
    ),
    r'qtyOnRepair': PropertySchema(
      id: 77,
      name: r'qtyOnRepair',
      type: IsarType.double,
    ),
    r'qtyOnRequest': PropertySchema(
      id: 78,
      name: r'qtyOnRequest',
      type: IsarType.double,
    ),
    r'qtyOnReturn': PropertySchema(
      id: 79,
      name: r'qtyOnReturn',
      type: IsarType.double,
    ),
    r'qtyOnSales': PropertySchema(
      id: 80,
      name: r'qtyOnSales',
      type: IsarType.double,
    ),
    r'qtyOnSalesOrder': PropertySchema(
      id: 81,
      name: r'qtyOnSalesOrder',
      type: IsarType.double,
    ),
    r'qtyOnTrading': PropertySchema(
      id: 82,
      name: r'qtyOnTrading',
      type: IsarType.double,
    ),
    r'qtyWithDecimal': PropertySchema(
      id: 83,
      name: r'qtyWithDecimal',
      type: IsarType.string,
    ),
    r'quotaGrp': PropertySchema(
      id: 84,
      name: r'quotaGrp',
      type: IsarType.string,
    ),
    r'ref1': PropertySchema(
      id: 85,
      name: r'ref1',
      type: IsarType.string,
    ),
    r'ref1Text': PropertySchema(
      id: 86,
      name: r'ref1Text',
      type: IsarType.string,
    ),
    r'ref2': PropertySchema(
      id: 87,
      name: r'ref2',
      type: IsarType.string,
    ),
    r'ref2Text': PropertySchema(
      id: 88,
      name: r'ref2Text',
      type: IsarType.string,
    ),
    r'ref3': PropertySchema(
      id: 89,
      name: r'ref3',
      type: IsarType.string,
    ),
    r'ref3Text': PropertySchema(
      id: 90,
      name: r'ref3Text',
      type: IsarType.string,
    ),
    r'ref4': PropertySchema(
      id: 91,
      name: r'ref4',
      type: IsarType.string,
    ),
    r'ref4Text': PropertySchema(
      id: 92,
      name: r'ref4Text',
      type: IsarType.string,
    ),
    r'remarks': PropertySchema(
      id: 93,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'reorderLevel': PropertySchema(
      id: 94,
      name: r'reorderLevel',
      type: IsarType.double,
    ),
    r'returnDue': PropertySchema(
      id: 95,
      name: r'returnDue',
      type: IsarType.string,
    ),
    r'serialNo': PropertySchema(
      id: 96,
      name: r'serialNo',
      type: IsarType.string,
    ),
    r'size': PropertySchema(
      id: 97,
      name: r'size',
      type: IsarType.string,
    ),
    r'skuNo': PropertySchema(
      id: 98,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'standardCost': PropertySchema(
      id: 99,
      name: r'standardCost',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 100,
      name: r'status',
      type: IsarType.string,
    ),
    r'stockFactor': PropertySchema(
      id: 101,
      name: r'stockFactor',
      type: IsarType.double,
    ),
    r'subDept': PropertySchema(
      id: 102,
      name: r'subDept',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 103,
      name: r'type',
      type: IsarType.string,
    ),
    r'uom': PropertySchema(
      id: 104,
      name: r'uom',
      type: IsarType.string,
    ),
    r'uomFactor': PropertySchema(
      id: 105,
      name: r'uomFactor',
      type: IsarType.double,
    ),
    r'warrantyPeriod': PropertySchema(
      id: 106,
      name: r'warrantyPeriod',
      type: IsarType.long,
    ),
    r'warrantyPeriodType': PropertySchema(
      id: 107,
      name: r'warrantyPeriodType',
      type: IsarType.string,
    ),
    r'webCategory': PropertySchema(
      id: 108,
      name: r'webCategory',
      type: IsarType.string,
    ),
    r'webChkDate': PropertySchema(
      id: 109,
      name: r'webChkDate',
      type: IsarType.string,
    ),
    r'webDailyQty': PropertySchema(
      id: 110,
      name: r'webDailyQty',
      type: IsarType.double,
    ),
    r'webDept': PropertySchema(
      id: 111,
      name: r'webDept',
      type: IsarType.string,
    ),
    r'webGrp': PropertySchema(
      id: 112,
      name: r'webGrp',
      type: IsarType.string,
    ),
    r'webImageDetail': PropertySchema(
      id: 113,
      name: r'webImageDetail',
      type: IsarType.string,
    ),
    r'webItemFr': PropertySchema(
      id: 114,
      name: r'webItemFr',
      type: IsarType.dateTime,
    ),
    r'webItemTo': PropertySchema(
      id: 115,
      name: r'webItemTo',
      type: IsarType.dateTime,
    ),
    r'webMixMatch': PropertySchema(
      id: 116,
      name: r'webMixMatch',
      type: IsarType.string,
    ),
    r'webPromoGrp': PropertySchema(
      id: 117,
      name: r'webPromoGrp',
      type: IsarType.string,
    ),
    r'webQtyMethod': PropertySchema(
      id: 118,
      name: r'webQtyMethod',
      type: IsarType.string,
    ),
    r'webSpecialMsg': PropertySchema(
      id: 119,
      name: r'webSpecialMsg',
      type: IsarType.string,
    ),
    r'webSubDept': PropertySchema(
      id: 120,
      name: r'webSubDept',
      type: IsarType.string,
    )
  },
  estimateSize: _inventoryItemEstimateSize,
  serialize: _inventoryItemSerialize,
  deserialize: _inventoryItemDeserialize,
  deserializeProp: _inventoryItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode': IndexSchema(
      id: 6715787695288864042,
      name: r'companyCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'skuNo': IndexSchema(
      id: -7548329852756165069,
      name: r'skuNo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'skuNo',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _inventoryItemGetId,
  getLinks: _inventoryItemGetLinks,
  attach: _inventoryItemAttach,
  version: '3.1.0+1',
);

int _inventoryItemEstimateSize(
  InventoryItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.actualSize;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.allowZeroPrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.altPlu;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.articleDesc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.articleNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.batchExpiry;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.brand;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.calculateQtyFromPrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cgmCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.color;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dept;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.discountable;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayBrand.length * 3;
  bytesCount += 3 + object.displayCategory.length * 3;
  bytesCount += 3 + object.displayCode.length * 3;
  bytesCount += 3 + object.displayLocation.length * 3;
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.displayQtyOnHand.length * 3;
  bytesCount += 3 + object.displayStatus.length * 3;
  {
    final value = object.expiry;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flag3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.givePoint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.giveRebate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.introPreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inventoryItem;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.invoicePreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.issueNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.itemType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.noCost;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.noQty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nutritionFactsImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.oldRemarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.openCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.openPrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.packSizeDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.packSizeUom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.qtyWithDecimal;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.quotaGrp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref1Text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref2Text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref3Text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref4;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref4Text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remarks;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.returnDue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serialNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.size;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subDept;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyPeriodType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webChkDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webDept;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webGrp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webImageDetail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webMixMatch;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webPromoGrp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webQtyMethod;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webSpecialMsg;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webSubDept;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _inventoryItemSerialize(
  InventoryItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.actualSize);
  writer.writeLong(offsets[1], object.addedBy);
  writer.writeDateTime(offsets[2], object.addedDate);
  writer.writeString(offsets[3], object.allowZeroPrice);
  writer.writeString(offsets[4], object.altPlu);
  writer.writeString(offsets[5], object.articleDesc);
  writer.writeString(offsets[6], object.articleNo);
  writer.writeDouble(offsets[7], object.averageCost);
  writer.writeString(offsets[8], object.batchExpiry);
  writer.writeString(offsets[9], object.brand);
  writer.writeString(offsets[10], object.calculateQtyFromPrice);
  writer.writeString(offsets[11], object.category);
  writer.writeString(offsets[12], object.cgmCode);
  writer.writeLong(offsets[13], object.ckuNo);
  writer.writeString(offsets[14], object.color);
  writer.writeLong(offsets[15], object.companyCode);
  writer.writeDouble(offsets[16], object.companyCommRate);
  writer.writeString(offsets[17], object.dept);
  writer.writeString(offsets[18], object.description);
  writer.writeString(offsets[19], object.description2);
  writer.writeString(offsets[20], object.discountable);
  writer.writeString(offsets[21], object.displayBrand);
  writer.writeString(offsets[22], object.displayCategory);
  writer.writeString(offsets[23], object.displayCode);
  writer.writeString(offsets[24], object.displayLocation);
  writer.writeString(offsets[25], object.displayName);
  writer.writeString(offsets[26], object.displayQtyOnHand);
  writer.writeString(offsets[27], object.displayStatus);
  writer.writeString(offsets[28], object.expiry);
  writer.writeDouble(offsets[29], object.fifoCost);
  writer.writeString(offsets[30], object.flag3);
  writer.writeString(offsets[31], object.givePoint);
  writer.writeString(offsets[32], object.giveRebate);
  writer.writeString(offsets[33], object.grp);
  writer.writeDouble(offsets[34], object.gstPrice);
  writer.writeDateTime(offsets[35], object.introDate);
  writer.writeString(offsets[36], object.introPreLabel);
  writer.writeString(offsets[37], object.inventoryItem);
  writer.writeString(offsets[38], object.invoicePreLabel);
  writer.writeString(offsets[39], object.issueNo);
  writer.writeString(offsets[40], object.itemType);
  writer.writeDouble(offsets[41], object.lastCost);
  writer.writeLong(offsets[42], object.lastModifiedBy);
  writer.writeDateTime(offsets[43], object.lastModifiedDate);
  writer.writeDateTime(offsets[44], object.lastPurDate);
  writer.writeDateTime(offsets[45], object.lastSalesDate);
  writer.writeDateTime(offsets[46], object.lastVendorDate);
  writer.writeDateTime(offsets[47], object.lastWriteTimeStamp);
  writer.writeString(offsets[48], object.location);
  writer.writeDouble(offsets[49], object.lossPercent);
  writer.writeDouble(offsets[50], object.maxStockLevel);
  writer.writeDouble(offsets[51], object.minStockLevel);
  writer.writeDouble(offsets[52], object.miscCost);
  writer.writeString(offsets[53], object.noCost);
  writer.writeString(offsets[54], object.noQty);
  writer.writeDouble(offsets[55], object.nos);
  writer.writeString(offsets[56], object.nutritionFactsImage);
  writer.writeString(offsets[57], object.oldRemarks);
  writer.writeString(offsets[58], object.openCode);
  writer.writeString(offsets[59], object.openPrice);
  writer.writeDouble(offsets[60], object.packSize);
  writer.writeString(offsets[61], object.packSizeDescription);
  writer.writeString(offsets[62], object.packSizeUom);
  writer.writeLong(offsets[63], object.pluNo);
  writer.writeDouble(offsets[64], object.price);
  writer.writeDouble(offsets[65], object.promoterCommRate);
  writer.writeDouble(offsets[66], object.qtyOnAdjIn);
  writer.writeDouble(offsets[67], object.qtyOnAdjKiv);
  writer.writeDouble(offsets[68], object.qtyOnAdjOut);
  writer.writeDouble(offsets[69], object.qtyOnCustomerReturn);
  writer.writeDouble(offsets[70], object.qtyOnExchange);
  writer.writeDouble(offsets[71], object.qtyOnHand);
  writer.writeDouble(offsets[72], object.qtyOnIO);
  writer.writeDouble(offsets[73], object.qtyOnIR);
  writer.writeDouble(offsets[74], object.qtyOnOrder);
  writer.writeDouble(offsets[75], object.qtyOnQuote);
  writer.writeDouble(offsets[76], object.qtyOnReceived);
  writer.writeDouble(offsets[77], object.qtyOnRepair);
  writer.writeDouble(offsets[78], object.qtyOnRequest);
  writer.writeDouble(offsets[79], object.qtyOnReturn);
  writer.writeDouble(offsets[80], object.qtyOnSales);
  writer.writeDouble(offsets[81], object.qtyOnSalesOrder);
  writer.writeDouble(offsets[82], object.qtyOnTrading);
  writer.writeString(offsets[83], object.qtyWithDecimal);
  writer.writeString(offsets[84], object.quotaGrp);
  writer.writeString(offsets[85], object.ref1);
  writer.writeString(offsets[86], object.ref1Text);
  writer.writeString(offsets[87], object.ref2);
  writer.writeString(offsets[88], object.ref2Text);
  writer.writeString(offsets[89], object.ref3);
  writer.writeString(offsets[90], object.ref3Text);
  writer.writeString(offsets[91], object.ref4);
  writer.writeString(offsets[92], object.ref4Text);
  writer.writeString(offsets[93], object.remarks);
  writer.writeDouble(offsets[94], object.reorderLevel);
  writer.writeString(offsets[95], object.returnDue);
  writer.writeString(offsets[96], object.serialNo);
  writer.writeString(offsets[97], object.size);
  writer.writeLong(offsets[98], object.skuNo);
  writer.writeDouble(offsets[99], object.standardCost);
  writer.writeString(offsets[100], object.status);
  writer.writeDouble(offsets[101], object.stockFactor);
  writer.writeString(offsets[102], object.subDept);
  writer.writeString(offsets[103], object.type);
  writer.writeString(offsets[104], object.uom);
  writer.writeDouble(offsets[105], object.uomFactor);
  writer.writeLong(offsets[106], object.warrantyPeriod);
  writer.writeString(offsets[107], object.warrantyPeriodType);
  writer.writeString(offsets[108], object.webCategory);
  writer.writeString(offsets[109], object.webChkDate);
  writer.writeDouble(offsets[110], object.webDailyQty);
  writer.writeString(offsets[111], object.webDept);
  writer.writeString(offsets[112], object.webGrp);
  writer.writeString(offsets[113], object.webImageDetail);
  writer.writeDateTime(offsets[114], object.webItemFr);
  writer.writeDateTime(offsets[115], object.webItemTo);
  writer.writeString(offsets[116], object.webMixMatch);
  writer.writeString(offsets[117], object.webPromoGrp);
  writer.writeString(offsets[118], object.webQtyMethod);
  writer.writeString(offsets[119], object.webSpecialMsg);
  writer.writeString(offsets[120], object.webSubDept);
}

InventoryItem _inventoryItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InventoryItem();
  object.actualSize = reader.readStringOrNull(offsets[0]);
  object.addedBy = reader.readLongOrNull(offsets[1]);
  object.addedDate = reader.readDateTimeOrNull(offsets[2]);
  object.allowZeroPrice = reader.readStringOrNull(offsets[3]);
  object.altPlu = reader.readStringOrNull(offsets[4]);
  object.articleDesc = reader.readStringOrNull(offsets[5]);
  object.articleNo = reader.readStringOrNull(offsets[6]);
  object.averageCost = reader.readDoubleOrNull(offsets[7]);
  object.batchExpiry = reader.readStringOrNull(offsets[8]);
  object.brand = reader.readStringOrNull(offsets[9]);
  object.calculateQtyFromPrice = reader.readStringOrNull(offsets[10]);
  object.category = reader.readStringOrNull(offsets[11]);
  object.cgmCode = reader.readStringOrNull(offsets[12]);
  object.ckuNo = reader.readLongOrNull(offsets[13]);
  object.color = reader.readStringOrNull(offsets[14]);
  object.companyCode = reader.readLong(offsets[15]);
  object.companyCommRate = reader.readDoubleOrNull(offsets[16]);
  object.dept = reader.readStringOrNull(offsets[17]);
  object.description = reader.readStringOrNull(offsets[18]);
  object.description2 = reader.readStringOrNull(offsets[19]);
  object.discountable = reader.readStringOrNull(offsets[20]);
  object.expiry = reader.readStringOrNull(offsets[28]);
  object.fifoCost = reader.readDoubleOrNull(offsets[29]);
  object.flag3 = reader.readStringOrNull(offsets[30]);
  object.givePoint = reader.readStringOrNull(offsets[31]);
  object.giveRebate = reader.readStringOrNull(offsets[32]);
  object.grp = reader.readStringOrNull(offsets[33]);
  object.gstPrice = reader.readDoubleOrNull(offsets[34]);
  object.id = id;
  object.introDate = reader.readDateTimeOrNull(offsets[35]);
  object.introPreLabel = reader.readStringOrNull(offsets[36]);
  object.inventoryItem = reader.readStringOrNull(offsets[37]);
  object.invoicePreLabel = reader.readStringOrNull(offsets[38]);
  object.issueNo = reader.readStringOrNull(offsets[39]);
  object.itemType = reader.readStringOrNull(offsets[40]);
  object.lastCost = reader.readDoubleOrNull(offsets[41]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[42]);
  object.lastModifiedDate = reader.readDateTimeOrNull(offsets[43]);
  object.lastPurDate = reader.readDateTimeOrNull(offsets[44]);
  object.lastSalesDate = reader.readDateTimeOrNull(offsets[45]);
  object.lastVendorDate = reader.readDateTimeOrNull(offsets[46]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[47]);
  object.location = reader.readStringOrNull(offsets[48]);
  object.lossPercent = reader.readDoubleOrNull(offsets[49]);
  object.maxStockLevel = reader.readDoubleOrNull(offsets[50]);
  object.minStockLevel = reader.readDoubleOrNull(offsets[51]);
  object.miscCost = reader.readDoubleOrNull(offsets[52]);
  object.noCost = reader.readStringOrNull(offsets[53]);
  object.noQty = reader.readStringOrNull(offsets[54]);
  object.nos = reader.readDoubleOrNull(offsets[55]);
  object.nutritionFactsImage = reader.readStringOrNull(offsets[56]);
  object.oldRemarks = reader.readStringOrNull(offsets[57]);
  object.openCode = reader.readStringOrNull(offsets[58]);
  object.openPrice = reader.readStringOrNull(offsets[59]);
  object.packSize = reader.readDoubleOrNull(offsets[60]);
  object.packSizeDescription = reader.readStringOrNull(offsets[61]);
  object.packSizeUom = reader.readStringOrNull(offsets[62]);
  object.pluNo = reader.readLongOrNull(offsets[63]);
  object.price = reader.readDoubleOrNull(offsets[64]);
  object.promoterCommRate = reader.readDoubleOrNull(offsets[65]);
  object.qtyOnAdjIn = reader.readDoubleOrNull(offsets[66]);
  object.qtyOnAdjKiv = reader.readDoubleOrNull(offsets[67]);
  object.qtyOnAdjOut = reader.readDoubleOrNull(offsets[68]);
  object.qtyOnCustomerReturn = reader.readDoubleOrNull(offsets[69]);
  object.qtyOnExchange = reader.readDoubleOrNull(offsets[70]);
  object.qtyOnHand = reader.readDoubleOrNull(offsets[71]);
  object.qtyOnIO = reader.readDoubleOrNull(offsets[72]);
  object.qtyOnIR = reader.readDoubleOrNull(offsets[73]);
  object.qtyOnOrder = reader.readDoubleOrNull(offsets[74]);
  object.qtyOnQuote = reader.readDoubleOrNull(offsets[75]);
  object.qtyOnReceived = reader.readDoubleOrNull(offsets[76]);
  object.qtyOnRepair = reader.readDoubleOrNull(offsets[77]);
  object.qtyOnRequest = reader.readDoubleOrNull(offsets[78]);
  object.qtyOnReturn = reader.readDoubleOrNull(offsets[79]);
  object.qtyOnSales = reader.readDoubleOrNull(offsets[80]);
  object.qtyOnSalesOrder = reader.readDoubleOrNull(offsets[81]);
  object.qtyOnTrading = reader.readDoubleOrNull(offsets[82]);
  object.qtyWithDecimal = reader.readStringOrNull(offsets[83]);
  object.quotaGrp = reader.readStringOrNull(offsets[84]);
  object.ref1 = reader.readStringOrNull(offsets[85]);
  object.ref1Text = reader.readStringOrNull(offsets[86]);
  object.ref2 = reader.readStringOrNull(offsets[87]);
  object.ref2Text = reader.readStringOrNull(offsets[88]);
  object.ref3 = reader.readStringOrNull(offsets[89]);
  object.ref3Text = reader.readStringOrNull(offsets[90]);
  object.ref4 = reader.readStringOrNull(offsets[91]);
  object.ref4Text = reader.readStringOrNull(offsets[92]);
  object.remarks = reader.readStringOrNull(offsets[93]);
  object.reorderLevel = reader.readDoubleOrNull(offsets[94]);
  object.returnDue = reader.readStringOrNull(offsets[95]);
  object.serialNo = reader.readStringOrNull(offsets[96]);
  object.size = reader.readStringOrNull(offsets[97]);
  object.skuNo = reader.readLong(offsets[98]);
  object.standardCost = reader.readDoubleOrNull(offsets[99]);
  object.status = reader.readStringOrNull(offsets[100]);
  object.stockFactor = reader.readDoubleOrNull(offsets[101]);
  object.subDept = reader.readStringOrNull(offsets[102]);
  object.type = reader.readStringOrNull(offsets[103]);
  object.uom = reader.readStringOrNull(offsets[104]);
  object.uomFactor = reader.readDoubleOrNull(offsets[105]);
  object.warrantyPeriod = reader.readLongOrNull(offsets[106]);
  object.warrantyPeriodType = reader.readStringOrNull(offsets[107]);
  object.webCategory = reader.readStringOrNull(offsets[108]);
  object.webChkDate = reader.readStringOrNull(offsets[109]);
  object.webDailyQty = reader.readDoubleOrNull(offsets[110]);
  object.webDept = reader.readStringOrNull(offsets[111]);
  object.webGrp = reader.readStringOrNull(offsets[112]);
  object.webImageDetail = reader.readStringOrNull(offsets[113]);
  object.webItemFr = reader.readDateTimeOrNull(offsets[114]);
  object.webItemTo = reader.readDateTimeOrNull(offsets[115]);
  object.webMixMatch = reader.readStringOrNull(offsets[116]);
  object.webPromoGrp = reader.readStringOrNull(offsets[117]);
  object.webQtyMethod = reader.readStringOrNull(offsets[118]);
  object.webSpecialMsg = reader.readStringOrNull(offsets[119]);
  object.webSubDept = reader.readStringOrNull(offsets[120]);
  return object;
}

P _inventoryItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readString(offset)) as P;
    case 27:
      return (reader.readString(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readDoubleOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readDoubleOrNull(offset)) as P;
    case 35:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readStringOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (reader.readStringOrNull(offset)) as P;
    case 41:
      return (reader.readDoubleOrNull(offset)) as P;
    case 42:
      return (reader.readLongOrNull(offset)) as P;
    case 43:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 44:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 45:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 46:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 47:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readDoubleOrNull(offset)) as P;
    case 50:
      return (reader.readDoubleOrNull(offset)) as P;
    case 51:
      return (reader.readDoubleOrNull(offset)) as P;
    case 52:
      return (reader.readDoubleOrNull(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readStringOrNull(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readStringOrNull(offset)) as P;
    case 57:
      return (reader.readStringOrNull(offset)) as P;
    case 58:
      return (reader.readStringOrNull(offset)) as P;
    case 59:
      return (reader.readStringOrNull(offset)) as P;
    case 60:
      return (reader.readDoubleOrNull(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (reader.readStringOrNull(offset)) as P;
    case 63:
      return (reader.readLongOrNull(offset)) as P;
    case 64:
      return (reader.readDoubleOrNull(offset)) as P;
    case 65:
      return (reader.readDoubleOrNull(offset)) as P;
    case 66:
      return (reader.readDoubleOrNull(offset)) as P;
    case 67:
      return (reader.readDoubleOrNull(offset)) as P;
    case 68:
      return (reader.readDoubleOrNull(offset)) as P;
    case 69:
      return (reader.readDoubleOrNull(offset)) as P;
    case 70:
      return (reader.readDoubleOrNull(offset)) as P;
    case 71:
      return (reader.readDoubleOrNull(offset)) as P;
    case 72:
      return (reader.readDoubleOrNull(offset)) as P;
    case 73:
      return (reader.readDoubleOrNull(offset)) as P;
    case 74:
      return (reader.readDoubleOrNull(offset)) as P;
    case 75:
      return (reader.readDoubleOrNull(offset)) as P;
    case 76:
      return (reader.readDoubleOrNull(offset)) as P;
    case 77:
      return (reader.readDoubleOrNull(offset)) as P;
    case 78:
      return (reader.readDoubleOrNull(offset)) as P;
    case 79:
      return (reader.readDoubleOrNull(offset)) as P;
    case 80:
      return (reader.readDoubleOrNull(offset)) as P;
    case 81:
      return (reader.readDoubleOrNull(offset)) as P;
    case 82:
      return (reader.readDoubleOrNull(offset)) as P;
    case 83:
      return (reader.readStringOrNull(offset)) as P;
    case 84:
      return (reader.readStringOrNull(offset)) as P;
    case 85:
      return (reader.readStringOrNull(offset)) as P;
    case 86:
      return (reader.readStringOrNull(offset)) as P;
    case 87:
      return (reader.readStringOrNull(offset)) as P;
    case 88:
      return (reader.readStringOrNull(offset)) as P;
    case 89:
      return (reader.readStringOrNull(offset)) as P;
    case 90:
      return (reader.readStringOrNull(offset)) as P;
    case 91:
      return (reader.readStringOrNull(offset)) as P;
    case 92:
      return (reader.readStringOrNull(offset)) as P;
    case 93:
      return (reader.readStringOrNull(offset)) as P;
    case 94:
      return (reader.readDoubleOrNull(offset)) as P;
    case 95:
      return (reader.readStringOrNull(offset)) as P;
    case 96:
      return (reader.readStringOrNull(offset)) as P;
    case 97:
      return (reader.readStringOrNull(offset)) as P;
    case 98:
      return (reader.readLong(offset)) as P;
    case 99:
      return (reader.readDoubleOrNull(offset)) as P;
    case 100:
      return (reader.readStringOrNull(offset)) as P;
    case 101:
      return (reader.readDoubleOrNull(offset)) as P;
    case 102:
      return (reader.readStringOrNull(offset)) as P;
    case 103:
      return (reader.readStringOrNull(offset)) as P;
    case 104:
      return (reader.readStringOrNull(offset)) as P;
    case 105:
      return (reader.readDoubleOrNull(offset)) as P;
    case 106:
      return (reader.readLongOrNull(offset)) as P;
    case 107:
      return (reader.readStringOrNull(offset)) as P;
    case 108:
      return (reader.readStringOrNull(offset)) as P;
    case 109:
      return (reader.readStringOrNull(offset)) as P;
    case 110:
      return (reader.readDoubleOrNull(offset)) as P;
    case 111:
      return (reader.readStringOrNull(offset)) as P;
    case 112:
      return (reader.readStringOrNull(offset)) as P;
    case 113:
      return (reader.readStringOrNull(offset)) as P;
    case 114:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 115:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 116:
      return (reader.readStringOrNull(offset)) as P;
    case 117:
      return (reader.readStringOrNull(offset)) as P;
    case 118:
      return (reader.readStringOrNull(offset)) as P;
    case 119:
      return (reader.readStringOrNull(offset)) as P;
    case 120:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inventoryItemGetId(InventoryItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inventoryItemGetLinks(InventoryItem object) {
  return [];
}

void _inventoryItemAttach(
    IsarCollection<dynamic> col, Id id, InventoryItem object) {
  object.id = id;
}

extension InventoryItemQueryWhereSort
    on QueryBuilder<InventoryItem, InventoryItem, QWhere> {
  QueryBuilder<InventoryItem, InventoryItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhere> anySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'skuNo'),
      );
    });
  }
}

extension InventoryItemQueryWhere
    on QueryBuilder<InventoryItem, InventoryItem, QWhereClause> {
  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      companyCodeNotEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      companyCodeGreaterThan(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      companyCodeLessThan(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      companyCodeBetween(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> skuNoEqualTo(
      int skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [skuNo],
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> skuNoNotEqualTo(
      int skuNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [],
              upper: [skuNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [skuNo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [skuNo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [],
              upper: [skuNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause>
      skuNoGreaterThan(
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [skuNo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> skuNoLessThan(
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [],
        upper: [skuNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterWhereClause> skuNoBetween(
    int lowerSkuNo,
    int upperSkuNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [lowerSkuNo],
        includeLower: includeLower,
        upper: [upperSkuNo],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InventoryItemQueryFilter
    on QueryBuilder<InventoryItem, InventoryItem, QFilterCondition> {
  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualSize',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualSize',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actualSize',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actualSize',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualSize',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      actualSizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actualSize',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      addedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'allowZeroPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'allowZeroPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowZeroPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowZeroPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowZeroPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowZeroPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      allowZeroPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowZeroPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'altPlu',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'altPlu',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'altPlu',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'altPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'altPlu',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'altPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      altPluIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'altPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'articleDesc',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'articleDesc',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'articleDesc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'articleDesc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'articleDesc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleDescIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'articleDesc',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'articleNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'articleNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'articleNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'articleNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'articleNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'articleNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      articleNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'articleNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      averageCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchExpiry',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchExpiry',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchExpiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchExpiry',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchExpiry',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      batchExpiryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchExpiry',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calculateQtyFromPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calculateQtyFromPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calculateQtyFromPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calculateQtyFromPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calculateQtyFromPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calculateQtyFromPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      calculateQtyFromPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calculateQtyFromPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cgmCode',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cgmCode',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cgmCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cgmCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cgmCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cgmCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      cgmCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cgmCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ckuNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ckuNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ckuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ckuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ckuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ckuNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ckuNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'color',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'color',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'color',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'color',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCommRate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCommRate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      companyCommRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyCommRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> deptEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> deptBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dept',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> deptMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dept',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      deptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description2',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description2',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description2',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      description2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description2',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountable',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountable',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountable',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'discountable',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'discountable',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountable',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      discountableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'discountable',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayBrand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayBrand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayBrand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayBrand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayLocation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayLocation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayLocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayQtyOnHand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayQtyOnHand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayQtyOnHand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQtyOnHand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayQtyOnHandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayQtyOnHand',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      displayStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiry',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiry',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expiry',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expiry',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiry',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      expiryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expiry',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      fifoCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fifoCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flag3',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flag3',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flag3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flag3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flag3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flag3',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      flag3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flag3',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'givePoint',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'givePoint',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'givePoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'givePoint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'givePoint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'givePoint',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      givePointIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'givePoint',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'giveRebate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'giveRebate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'giveRebate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'giveRebate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'giveRebate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'giveRebate',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      giveRebateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'giveRebate',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> grpMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      grpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      gstPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gstPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'introDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'introDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'introDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'introDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'introDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'introDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'introPreLabel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'introPreLabel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'introPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'introPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'introPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'introPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      introPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'introPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inventoryItem',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inventoryItem',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inventoryItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inventoryItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inventoryItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      inventoryItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inventoryItem',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoicePreLabel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoicePreLabel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoicePreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoicePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      invoicePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issueNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issueNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issueNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issueNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      issueNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issueNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemType',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemType',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemType',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      itemTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemType',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModifiedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModifiedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModifiedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastModifiedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModifiedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPurDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPurDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPurDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPurDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPurDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastPurDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPurDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSalesDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSalesDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSalesDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSalesDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSalesDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastSalesDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSalesDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastVendorDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastVendorDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastVendorDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastVendorDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastVendorDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastVendorDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastVendorDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lastWriteTimeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastWriteTimeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lossPercent',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lossPercent',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lossPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lossPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lossPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      lossPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lossPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxStockLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxStockLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      maxStockLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStockLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minStockLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minStockLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      minStockLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minStockLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'miscCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'miscCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'miscCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      miscCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'miscCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noCost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noCost',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noCostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noCost',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'noQty',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'noQty',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'noQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'noQty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noQty',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      noQtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'noQty',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> nosEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nosGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> nosLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nos',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> nosBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nutritionFactsImage',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nutritionFactsImage',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nutritionFactsImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nutritionFactsImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nutritionFactsImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nutritionFactsImage',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      nutritionFactsImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nutritionFactsImage',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'oldRemarks',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'oldRemarks',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldRemarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'oldRemarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'oldRemarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      oldRemarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'oldRemarks',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openCode',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openCode',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openPrice',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'openPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      openPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packSize',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packSize',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packSizeDescription',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packSizeDescription',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packSizeDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packSizeDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packSizeDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSizeDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packSizeDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packSizeUom',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packSizeUom',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packSizeUom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packSizeUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packSizeUom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSizeUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      packSizeUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packSizeUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pluNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pluNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      pluNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pluNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promoterCommRate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promoterCommRate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoterCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promoterCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promoterCommRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      promoterCommRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promoterCommRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnAdjIn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnAdjIn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjInBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnAdjIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnAdjKiv',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnAdjKiv',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnAdjKiv',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnAdjKiv',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnAdjKiv',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjKivBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnAdjKiv',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnAdjOut',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnAdjOut',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnAdjOutBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnAdjOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnCustomerReturn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnCustomerReturn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnCustomerReturnBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnCustomerReturn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnExchange',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnExchange',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnExchange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnExchange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnExchange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnExchangeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnExchange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnHand',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnHand',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnHandBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnHand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnIO',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnIO',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnIO',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnIO',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnIO',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIOBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnIO',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIRIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnIR',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIRIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnIR',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIREqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnIR',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIRGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnIR',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIRLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnIR',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnIRBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnIR',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnOrder',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnOrder',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnOrderBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnQuote',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnQuote',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnQuote',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnQuote',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnQuote',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnQuoteBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnQuote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnReceived',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnReceived',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReceivedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnRepair',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnRepair',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnRepair',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnRepair',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnRepair',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRepairBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnRepair',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnRequest',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnRequest',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnRequest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnRequest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnRequest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnRequestBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnRequest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnReturn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnReturn',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnReturnBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnReturn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnSales',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnSales',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnSales',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnSalesOrder',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnSalesOrder',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnSalesOrderBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnSalesOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnTrading',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnTrading',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyOnTradingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnTrading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyWithDecimal',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyWithDecimal',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyWithDecimal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'qtyWithDecimal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'qtyWithDecimal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyWithDecimal',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      qtyWithDecimalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'qtyWithDecimal',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quotaGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quotaGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quotaGrp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quotaGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quotaGrp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotaGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      quotaGrpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quotaGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref1Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref1Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref1Text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref1Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref1Text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref1TextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref1Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref2Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref2Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref2Text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref2Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref2Text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref2TextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref2Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref3Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref3Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref3Text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref3Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref3Text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref3TextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref3Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref4EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref4Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> ref4Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref4',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref4Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref4Text',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref4Text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref4Text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref4Text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      ref4TextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref4Text',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remarks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reorderLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reorderLevel',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      reorderLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reorderLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnDue',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnDue',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnDue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnDue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnDue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDue',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      returnDueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnDue',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serialNo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serialNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serialNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serialNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      serialNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serialNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'size',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> sizeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> sizeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'size',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> sizeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'size',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      sizeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'size',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      skuNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      skuNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      skuNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      skuNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skuNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'standardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'standardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'standardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      standardCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'standardCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockFactor',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockFactor',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      stockFactorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subDept',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subDept',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subDept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      subDeptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subDept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition> uomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uomFactor',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uomFactor',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uomFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uomFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uomFactor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      uomFactorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uomFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyPeriod',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyPeriod',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyPeriod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyPeriodType',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyPeriodType',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyPeriodType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyPeriodType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyPeriodType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyPeriodType',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      warrantyPeriodTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyPeriodType',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webCategory',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webCategory',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webChkDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webChkDate',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webChkDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webChkDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webChkDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webChkDate',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webChkDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webChkDate',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webDailyQty',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webDailyQty',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webDailyQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webDailyQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webDailyQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDailyQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webDailyQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webDept',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webDept',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webDept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webDeptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webDept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webGrp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webGrp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webGrpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webImageDetail',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webImageDetail',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webImageDetail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webImageDetail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webImageDetail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webImageDetail',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webImageDetailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webImageDetail',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webItemFr',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webItemFr',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webItemFr',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webItemFr',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webItemFr',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemFrBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webItemFr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webItemTo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webItemTo',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webItemTo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webItemTo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webItemTo',
        value: value,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webItemToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webItemTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webMixMatch',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webMixMatch',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webMixMatch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webMixMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webMixMatch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webMixMatch',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webMixMatchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webMixMatch',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webPromoGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webPromoGrp',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webPromoGrp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webPromoGrp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webPromoGrp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webPromoGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webPromoGrpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webPromoGrp',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webQtyMethod',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webQtyMethod',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webQtyMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webQtyMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webQtyMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webQtyMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webQtyMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webQtyMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webSpecialMsg',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webSpecialMsg',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webSpecialMsg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webSpecialMsg',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webSpecialMsg',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSpecialMsg',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSpecialMsgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webSpecialMsg',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webSubDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webSubDept',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webSubDept',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webSubDept',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webSubDept',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSubDept',
        value: '',
      ));
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterFilterCondition>
      webSubDeptIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webSubDept',
        value: '',
      ));
    });
  }
}

extension InventoryItemQueryObject
    on QueryBuilder<InventoryItem, InventoryItem, QFilterCondition> {}

extension InventoryItemQueryLinks
    on QueryBuilder<InventoryItem, InventoryItem, QFilterCondition> {}

extension InventoryItemQuerySortBy
    on QueryBuilder<InventoryItem, InventoryItem, QSortBy> {
  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByActualSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualSize', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByActualSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualSize', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByAllowZeroPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowZeroPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByAllowZeroPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowZeroPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAltPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPlu', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAltPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPlu', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByArticleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleDesc', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByArticleDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleDesc', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByArticleNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByArticleNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByBatchExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchExpiry', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByBatchExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchExpiry', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCalculateQtyFromPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculateQtyFromPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCalculateQtyFromPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculateQtyFromPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCgmCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cgmCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCgmCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cgmCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ckuNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ckuNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByCompanyCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDescription2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDescription2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDiscountable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountable', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDiscountableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountable', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayBrand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayBrand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCategory', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCategory', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByDisplayCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLocation', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLocation', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByFlag3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag3', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByFlag3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag3', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByGivePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'givePoint', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByGivePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'givePoint', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByGiveRebate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giveRebate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByGiveRebateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giveRebate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByIntroDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByIntroDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByIntroPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introPreLabel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByIntroPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introPreLabel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByInventoryItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItem', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByInventoryItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItem', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByIssueNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByIssueNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByItemType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemType', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByItemTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemType', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByLastPurDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPurDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastPurDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPurDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastSalesDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSalesDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastSalesDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSalesDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastVendorDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVendorDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastVendorDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVendorDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByLossPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lossPercent', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByLossPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lossPercent', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNoQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noQty', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNoQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noQty', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByNutritionFactsImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionFactsImage', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByNutritionFactsImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionFactsImage', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByOldRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldRemarks', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByOldRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldRemarks', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByOpenCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByOpenCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByOpenPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByOpenPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPackSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSize', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPackSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSize', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPackSizeDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeDescription', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPackSizeDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeDescription', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPackSizeUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeUom', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPackSizeUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeUom', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByPromoterCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnAdjInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnAdjKiv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjKiv', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnAdjKivDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjKiv', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnAdjOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnCustomerReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnExchange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnExchange', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnExchangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnExchange', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnIO() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIO', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnIODesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIO', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnIR() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIR', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnIRDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIR', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnOrder', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnOrder', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnQuote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnQuote', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnQuoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnQuote', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnRepair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRepair', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnRepairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRepair', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnRequest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRequest', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnRequestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRequest', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnSalesOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyOnTradingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyWithDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyWithDecimal', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQtyWithDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyWithDecimal', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByQuotaGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByQuotaGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef1Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByRef1TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef2Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByRef2TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef3Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByRef3TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRef4Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByRef4TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByReorderLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByReturnDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDue', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByReturnDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDue', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByStockFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFactor', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByStockFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFactor', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySubDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortBySubDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subDept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByUomFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uomFactor', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByUomFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uomFactor', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWarrantyPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriod', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWarrantyPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriod', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWarrantyPeriodType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriodType', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWarrantyPeriodTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriodType', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webCategory', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webCategory', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebChkDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webChkDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebChkDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webChkDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebDailyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDailyQty', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebDailyQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDailyQty', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebImageDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webImageDetail', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebImageDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webImageDetail', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebItemFr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemFr', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebItemFrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemFr', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebItemTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemTo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebItemToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemTo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebMixMatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webMixMatch', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebMixMatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webMixMatch', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebPromoGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webPromoGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebPromoGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webPromoGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebQtyMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webQtyMethod', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebQtyMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webQtyMethod', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebSpecialMsg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSpecialMsg', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebSpecialMsgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSpecialMsg', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> sortByWebSubDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSubDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      sortByWebSubDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSubDept', Sort.desc);
    });
  }
}

extension InventoryItemQuerySortThenBy
    on QueryBuilder<InventoryItem, InventoryItem, QSortThenBy> {
  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByActualSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualSize', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByActualSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualSize', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByAllowZeroPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowZeroPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByAllowZeroPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowZeroPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAltPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPlu', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAltPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'altPlu', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByArticleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleDesc', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByArticleDescDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleDesc', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByArticleNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByArticleNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'articleNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByBatchExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchExpiry', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByBatchExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchExpiry', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCalculateQtyFromPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculateQtyFromPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCalculateQtyFromPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calculateQtyFromPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCgmCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cgmCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCgmCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cgmCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ckuNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ckuNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByCompanyCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDescription2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDescription2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDiscountable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountable', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDiscountableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountable', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayBrand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayBrand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCategory', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCategory', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByDisplayCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLocation', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayLocation', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiry', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByFlag3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag3', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByFlag3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flag3', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByGivePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'givePoint', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByGivePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'givePoint', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByGiveRebate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giveRebate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByGiveRebateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'giveRebate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByIntroDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByIntroDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByIntroPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introPreLabel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByIntroPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'introPreLabel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByInventoryItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItem', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByInventoryItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItem', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByIssueNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByIssueNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByItemType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemType', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByItemTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemType', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByLastPurDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPurDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastPurDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPurDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastSalesDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSalesDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastSalesDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSalesDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastVendorDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVendorDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastVendorDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVendorDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByLossPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lossPercent', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByLossPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lossPercent', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNoQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noQty', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNoQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noQty', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByNutritionFactsImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionFactsImage', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByNutritionFactsImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nutritionFactsImage', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByOldRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldRemarks', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByOldRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldRemarks', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByOpenCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openCode', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByOpenCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openCode', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByOpenPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByOpenPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPackSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSize', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPackSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSize', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPackSizeDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeDescription', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPackSizeDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeDescription', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPackSizeUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeUom', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPackSizeUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSizeUom', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByPromoterCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnAdjInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnAdjKiv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjKiv', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnAdjKivDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjKiv', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnAdjOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnCustomerReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnExchange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnExchange', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnExchangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnExchange', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnIO() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIO', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnIODesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIO', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnIR() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIR', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnIRDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnIR', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnOrder', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnOrder', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnQuote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnQuote', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnQuoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnQuote', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnRepair() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRepair', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnRepairDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRepair', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnRequest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRequest', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnRequestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnRequest', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnSalesOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyOnTradingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyWithDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyWithDecimal', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQtyWithDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyWithDecimal', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByQuotaGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByQuotaGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef1Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByRef1TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef2Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByRef2TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef3Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByRef3TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRef4Text() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4Text', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByRef4TextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4Text', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByReorderLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByReturnDue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDue', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByReturnDueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDue', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySerialNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenBySerialNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serialNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'size', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByStockFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFactor', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByStockFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockFactor', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySubDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenBySubDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subDept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByUomFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uomFactor', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByUomFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uomFactor', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWarrantyPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriod', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWarrantyPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriod', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWarrantyPeriodType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriodType', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWarrantyPeriodTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyPeriodType', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webCategory', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webCategory', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebChkDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webChkDate', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebChkDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webChkDate', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebDailyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDailyQty', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebDailyQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDailyQty', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webDept', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebImageDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webImageDetail', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebImageDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webImageDetail', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebItemFr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemFr', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebItemFrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemFr', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebItemTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemTo', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebItemToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webItemTo', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebMixMatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webMixMatch', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebMixMatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webMixMatch', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebPromoGrp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webPromoGrp', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebPromoGrpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webPromoGrp', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebQtyMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webQtyMethod', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebQtyMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webQtyMethod', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebSpecialMsg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSpecialMsg', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebSpecialMsgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSpecialMsg', Sort.desc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy> thenByWebSubDept() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSubDept', Sort.asc);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QAfterSortBy>
      thenByWebSubDeptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSubDept', Sort.desc);
    });
  }
}

extension InventoryItemQueryWhereDistinct
    on QueryBuilder<InventoryItem, InventoryItem, QDistinct> {
  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByActualSize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualSize', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByAllowZeroPrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowZeroPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByAltPlu(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'altPlu', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByArticleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'articleDesc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByArticleNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'articleNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCost');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByBatchExpiry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchExpiry', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByCalculateQtyFromPrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calculateQtyFromPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByCgmCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cgmCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByCkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ckuNo');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByColor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCommRate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDept(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dept', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDescription2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDiscountable(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountable', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDisplayBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayBrand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByDisplayCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCategory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDisplayCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByDisplayLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayLocation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByDisplayQtyOnHand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayQtyOnHand',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByDisplayStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByExpiry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiry', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fifoCost');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByFlag3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flag3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByGivePoint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'givePoint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByGiveRebate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'giveRebate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByGrp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstPrice');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByIntroDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'introDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByIntroPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'introPreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByInventoryItem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inventoryItem',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByInvoicePreLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoicePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByIssueNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByItemType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCost');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastPurDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPurDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastSalesDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSalesDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastVendorDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVendorDate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByLossPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lossPercent');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStockLevel');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStockLevel');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'miscCost');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByNoCost(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noCost', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByNoQty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noQty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nos');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByNutritionFactsImage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nutritionFactsImage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByOldRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldRemarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByOpenCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByOpenPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openPrice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByPackSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packSize');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByPackSizeDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packSizeDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByPackSizeUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packSizeUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promoterCommRate');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnAdjIn');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnAdjKiv() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnAdjKiv');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnAdjOut');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnCustomerReturn');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnExchange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnExchange');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnHand');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnIO() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnIO');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnIR() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnIR');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnOrder');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnQuote() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnQuote');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnReceived');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnRepair() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnRepair');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnRequest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnRequest');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnReturn');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnSales');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnSalesOrder');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnTrading');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByQtyWithDecimal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyWithDecimal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByQuotaGrp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotaGrp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef1Text(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref1Text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef2Text(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref2Text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef3Text(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref3Text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef4(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref4', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRef4Text(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref4Text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reorderLevel');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByReturnDue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDue', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctBySerialNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serialNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctBySize(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'size', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standardCost');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByStockFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockFactor');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctBySubDept(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subDept', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByUomFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uomFactor');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByWarrantyPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyPeriod');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByWarrantyPeriodType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyPeriodType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebChkDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webChkDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByWebDailyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webDailyQty');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebDept(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webDept', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebGrp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webGrp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct>
      distinctByWebImageDetail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webImageDetail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebItemFr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webItemFr');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebItemTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webItemTo');
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebMixMatch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webMixMatch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebPromoGrp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webPromoGrp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebQtyMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webQtyMethod', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebSpecialMsg(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webSpecialMsg',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InventoryItem, InventoryItem, QDistinct> distinctByWebSubDept(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webSubDept', caseSensitive: caseSensitive);
    });
  }
}

extension InventoryItemQueryProperty
    on QueryBuilder<InventoryItem, InventoryItem, QQueryProperty> {
  QueryBuilder<InventoryItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> actualSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualSize');
    });
  }

  QueryBuilder<InventoryItem, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      allowZeroPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowZeroPrice');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> altPluProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'altPlu');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> articleDescProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'articleDesc');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> articleNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'articleNo');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> averageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCost');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> batchExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchExpiry');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      calculateQtyFromPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calculateQtyFromPrice');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> cgmCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cgmCode');
    });
  }

  QueryBuilder<InventoryItem, int?, QQueryOperations> ckuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ckuNo');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<InventoryItem, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      companyCommRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCommRate');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> deptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dept');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      description2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description2');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      discountableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountable');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations> displayBrandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayBrand');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations>
      displayCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCategory');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations> displayCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCode');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations>
      displayLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayLocation');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations>
      displayQtyOnHandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayQtyOnHand');
    });
  }

  QueryBuilder<InventoryItem, String, QQueryOperations>
      displayStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayStatus');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> expiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiry');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> fifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fifoCost');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> flag3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flag3');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> givePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'givePoint');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> giveRebateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'giveRebate');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> grpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grp');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> gstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstPrice');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations> introDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'introDate');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      introPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'introPreLabel');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      inventoryItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inventoryItem');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      invoicePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoicePreLabel');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> issueNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueNo');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> itemTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemType');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> lastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCost');
    });
  }

  QueryBuilder<InventoryItem, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations>
      lastModifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedDate');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations>
      lastPurDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPurDate');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations>
      lastSalesDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSalesDate');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations>
      lastVendorDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVendorDate');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> lossPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lossPercent');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      maxStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStockLevel');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      minStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStockLevel');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> miscCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'miscCost');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> noCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noCost');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> noQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noQty');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> nosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nos');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      nutritionFactsImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionFactsImage');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> oldRemarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldRemarks');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> openCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openCode');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> openPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openPrice');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> packSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packSize');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      packSizeDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packSizeDescription');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> packSizeUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packSizeUom');
    });
  }

  QueryBuilder<InventoryItem, int?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      promoterCommRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promoterCommRate');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnAdjInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnAdjIn');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnAdjKivProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnAdjKiv');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnAdjOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnAdjOut');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnCustomerReturnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnCustomerReturn');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnExchangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnExchange');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnHandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnHand');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnIOProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnIO');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnIRProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnIR');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnOrder');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnQuoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnQuote');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnReceived');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnRepairProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnRepair');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnRequestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnRequest');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnReturnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnReturn');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> qtyOnSalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnSales');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnSalesOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnSalesOrder');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      qtyOnTradingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnTrading');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      qtyWithDecimalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyWithDecimal');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> quotaGrpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotaGrp');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref1');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref1TextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref1Text');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref2');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref2TextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref2Text');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref3');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref3TextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref3Text');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref4');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> ref4TextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref4Text');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      reorderLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reorderLevel');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> returnDueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDue');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> serialNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serialNo');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> sizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'size');
    });
  }

  QueryBuilder<InventoryItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations>
      standardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standardCost');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> stockFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockFactor');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> subDeptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subDept');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> uomFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uomFactor');
    });
  }

  QueryBuilder<InventoryItem, int?, QQueryOperations> warrantyPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyPeriod');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      warrantyPeriodTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyPeriodType');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webCategory');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webChkDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webChkDate');
    });
  }

  QueryBuilder<InventoryItem, double?, QQueryOperations> webDailyQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webDailyQty');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webDeptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webDept');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webGrpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webGrp');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      webImageDetailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webImageDetail');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations> webItemFrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webItemFr');
    });
  }

  QueryBuilder<InventoryItem, DateTime?, QQueryOperations> webItemToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webItemTo');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webMixMatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webMixMatch');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webPromoGrpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webPromoGrp');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      webQtyMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webQtyMethod');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations>
      webSpecialMsgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webSpecialMsg');
    });
  }

  QueryBuilder<InventoryItem, String?, QQueryOperations> webSubDeptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webSubDept');
    });
  }
}
