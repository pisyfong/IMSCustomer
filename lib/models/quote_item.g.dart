// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuoteItemCollection on Isar {
  IsarCollection<QuoteItem> get quoteItems => this.collection();
}

const QuoteItemSchema = CollectionSchema(
  name: r'QuoteItem',
  id: -8702182889892936705,
  properties: {
    r'addedDate': PropertySchema(
      id: 0,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'alternateDescription': PropertySchema(
      id: 1,
      name: r'alternateDescription',
      type: IsarType.string,
    ),
    r'approvalUnitPrice': PropertySchema(
      id: 2,
      name: r'approvalUnitPrice',
      type: IsarType.double,
    ),
    r'averageCost': PropertySchema(
      id: 3,
      name: r'averageCost',
      type: IsarType.double,
    ),
    r'balanceFoc': PropertySchema(
      id: 4,
      name: r'balanceFoc',
      type: IsarType.double,
    ),
    r'balanceFocLoose': PropertySchema(
      id: 5,
      name: r'balanceFocLoose',
      type: IsarType.double,
    ),
    r'balanceQuantity': PropertySchema(
      id: 6,
      name: r'balanceQuantity',
      type: IsarType.double,
    ),
    r'balanceQuantityLoose': PropertySchema(
      id: 7,
      name: r'balanceQuantityLoose',
      type: IsarType.double,
    ),
    r'cancelledBy': PropertySchema(
      id: 8,
      name: r'cancelledBy',
      type: IsarType.long,
    ),
    r'cancelledDate': PropertySchema(
      id: 9,
      name: r'cancelledDate',
      type: IsarType.dateTime,
    ),
    r'changePriceRemark': PropertySchema(
      id: 10,
      name: r'changePriceRemark',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 11,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'ctnUnitPrice': PropertySchema(
      id: 12,
      name: r'ctnUnitPrice',
      type: IsarType.double,
    ),
    r'ctnUom': PropertySchema(
      id: 13,
      name: r'ctnUom',
      type: IsarType.string,
    ),
    r'defaultPlu': PropertySchema(
      id: 14,
      name: r'defaultPlu',
      type: IsarType.string,
    ),
    r'displayCurrency': PropertySchema(
      id: 15,
      name: r'displayCurrency',
      type: IsarType.string,
    ),
    r'displayNetAmount': PropertySchema(
      id: 16,
      name: r'displayNetAmount',
      type: IsarType.double,
    ),
    r'displayQuantity': PropertySchema(
      id: 17,
      name: r'displayQuantity',
      type: IsarType.double,
    ),
    r'displaySkuNo': PropertySchema(
      id: 18,
      name: r'displaySkuNo',
      type: IsarType.string,
    ),
    r'displayUnitPrice': PropertySchema(
      id: 19,
      name: r'displayUnitPrice',
      type: IsarType.double,
    ),
    r'displayUom': PropertySchema(
      id: 20,
      name: r'displayUom',
      type: IsarType.string,
    ),
    r'factor': PropertySchema(
      id: 21,
      name: r'factor',
      type: IsarType.double,
    ),
    r'fifoCost': PropertySchema(
      id: 22,
      name: r'fifoCost',
      type: IsarType.double,
    ),
    r'formattedNetAmount': PropertySchema(
      id: 23,
      name: r'formattedNetAmount',
      type: IsarType.string,
    ),
    r'formattedQuantity': PropertySchema(
      id: 24,
      name: r'formattedQuantity',
      type: IsarType.string,
    ),
    r'formattedUnitPrice': PropertySchema(
      id: 25,
      name: r'formattedUnitPrice',
      type: IsarType.string,
    ),
    r'gstCode': PropertySchema(
      id: 26,
      name: r'gstCode',
      type: IsarType.string,
    ),
    r'gstPrice': PropertySchema(
      id: 27,
      name: r'gstPrice',
      type: IsarType.double,
    ),
    r'instantNormalSellingPrice': PropertySchema(
      id: 28,
      name: r'instantNormalSellingPrice',
      type: IsarType.double,
    ),
    r'itemSequence': PropertySchema(
      id: 29,
      name: r'itemSequence',
      type: IsarType.long,
    ),
    r'lastCost': PropertySchema(
      id: 30,
      name: r'lastCost',
      type: IsarType.double,
    ),
    r'locationCode': PropertySchema(
      id: 31,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'miscCost': PropertySchema(
      id: 32,
      name: r'miscCost',
      type: IsarType.double,
    ),
    r'netAmount': PropertySchema(
      id: 33,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'nos': PropertySchema(
      id: 34,
      name: r'nos',
      type: IsarType.double,
    ),
    r'pluNo': PropertySchema(
      id: 35,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'projectCode': PropertySchema(
      id: 36,
      name: r'projectCode',
      type: IsarType.string,
    ),
    r'quantityLoss': PropertySchema(
      id: 37,
      name: r'quantityLoss',
      type: IsarType.double,
    ),
    r'quantityOriginal': PropertySchema(
      id: 38,
      name: r'quantityOriginal',
      type: IsarType.double,
    ),
    r'quoteFoc': PropertySchema(
      id: 39,
      name: r'quoteFoc',
      type: IsarType.double,
    ),
    r'quoteFocLoose': PropertySchema(
      id: 40,
      name: r'quoteFocLoose',
      type: IsarType.double,
    ),
    r'quoteFocLooseOri': PropertySchema(
      id: 41,
      name: r'quoteFocLooseOri',
      type: IsarType.double,
    ),
    r'quoteFocOri': PropertySchema(
      id: 42,
      name: r'quoteFocOri',
      type: IsarType.double,
    ),
    r'quotePreLabel': PropertySchema(
      id: 43,
      name: r'quotePreLabel',
      type: IsarType.string,
    ),
    r'quoteQuantity': PropertySchema(
      id: 44,
      name: r'quoteQuantity',
      type: IsarType.double,
    ),
    r'quoteQuantityLoose': PropertySchema(
      id: 45,
      name: r'quoteQuantityLoose',
      type: IsarType.double,
    ),
    r'quoteQuantityLooseOri': PropertySchema(
      id: 46,
      name: r'quoteQuantityLooseOri',
      type: IsarType.double,
    ),
    r'quoteQuantityOri': PropertySchema(
      id: 47,
      name: r'quoteQuantityOri',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 48,
      name: r'remark',
      type: IsarType.string,
    ),
    r'sequenceNo': PropertySchema(
      id: 49,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 50,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'standardCost': PropertySchema(
      id: 51,
      name: r'standardCost',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 52,
      name: r'status',
      type: IsarType.string,
    ),
    r'syLocationCode': PropertySchema(
      id: 53,
      name: r'syLocationCode',
      type: IsarType.string,
    ),
    r'taxAmount': PropertySchema(
      id: 54,
      name: r'taxAmount',
      type: IsarType.double,
    ),
    r'taxRate': PropertySchema(
      id: 55,
      name: r'taxRate',
      type: IsarType.double,
    ),
    r'unitDiscountAmount': PropertySchema(
      id: 56,
      name: r'unitDiscountAmount',
      type: IsarType.double,
    ),
    r'unitDiscountAmount1': PropertySchema(
      id: 57,
      name: r'unitDiscountAmount1',
      type: IsarType.double,
    ),
    r'unitDiscountAmount2': PropertySchema(
      id: 58,
      name: r'unitDiscountAmount2',
      type: IsarType.double,
    ),
    r'unitDiscountAmountOri': PropertySchema(
      id: 59,
      name: r'unitDiscountAmountOri',
      type: IsarType.double,
    ),
    r'unitDiscountRate': PropertySchema(
      id: 60,
      name: r'unitDiscountRate',
      type: IsarType.double,
    ),
    r'unitDiscountRate1': PropertySchema(
      id: 61,
      name: r'unitDiscountRate1',
      type: IsarType.double,
    ),
    r'unitDiscountRate2': PropertySchema(
      id: 62,
      name: r'unitDiscountRate2',
      type: IsarType.double,
    ),
    r'unitDiscountRateOri': PropertySchema(
      id: 63,
      name: r'unitDiscountRateOri',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 64,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'unitPriceBasic': PropertySchema(
      id: 65,
      name: r'unitPriceBasic',
      type: IsarType.double,
    ),
    r'unitPriceOri': PropertySchema(
      id: 66,
      name: r'unitPriceOri',
      type: IsarType.double,
    ),
    r'uom': PropertySchema(
      id: 67,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _quoteItemEstimateSize,
  serialize: _quoteItemSerialize,
  deserialize: _quoteItemDeserialize,
  deserializeProp: _quoteItemDeserializeProp,
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
    r'quotePreLabel': IndexSchema(
      id: -3624833288688478028,
      name: r'quotePreLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'quotePreLabel',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _quoteItemGetId,
  getLinks: _quoteItemGetLinks,
  attach: _quoteItemAttach,
  version: '3.1.0+1',
);

int _quoteItemEstimateSize(
  QuoteItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.alternateDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.changePriceRemark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ctnUom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.defaultPlu;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayCurrency.length * 3;
  bytesCount += 3 + object.displaySkuNo.length * 3;
  bytesCount += 3 + object.displayUom.length * 3;
  bytesCount += 3 + object.formattedNetAmount.length * 3;
  bytesCount += 3 + object.formattedQuantity.length * 3;
  bytesCount += 3 + object.formattedUnitPrice.length * 3;
  {
    final value = object.gstCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pluNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.projectCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.quotePreLabel.length * 3;
  {
    final value = object.remark;
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
    final value = object.syLocationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uom.length * 3;
  return bytesCount;
}

void _quoteItemSerialize(
  QuoteItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDate);
  writer.writeString(offsets[1], object.alternateDescription);
  writer.writeDouble(offsets[2], object.approvalUnitPrice);
  writer.writeDouble(offsets[3], object.averageCost);
  writer.writeDouble(offsets[4], object.balanceFoc);
  writer.writeDouble(offsets[5], object.balanceFocLoose);
  writer.writeDouble(offsets[6], object.balanceQuantity);
  writer.writeDouble(offsets[7], object.balanceQuantityLoose);
  writer.writeLong(offsets[8], object.cancelledBy);
  writer.writeDateTime(offsets[9], object.cancelledDate);
  writer.writeString(offsets[10], object.changePriceRemark);
  writer.writeLong(offsets[11], object.companyCode);
  writer.writeDouble(offsets[12], object.ctnUnitPrice);
  writer.writeString(offsets[13], object.ctnUom);
  writer.writeString(offsets[14], object.defaultPlu);
  writer.writeString(offsets[15], object.displayCurrency);
  writer.writeDouble(offsets[16], object.displayNetAmount);
  writer.writeDouble(offsets[17], object.displayQuantity);
  writer.writeString(offsets[18], object.displaySkuNo);
  writer.writeDouble(offsets[19], object.displayUnitPrice);
  writer.writeString(offsets[20], object.displayUom);
  writer.writeDouble(offsets[21], object.factor);
  writer.writeDouble(offsets[22], object.fifoCost);
  writer.writeString(offsets[23], object.formattedNetAmount);
  writer.writeString(offsets[24], object.formattedQuantity);
  writer.writeString(offsets[25], object.formattedUnitPrice);
  writer.writeString(offsets[26], object.gstCode);
  writer.writeDouble(offsets[27], object.gstPrice);
  writer.writeDouble(offsets[28], object.instantNormalSellingPrice);
  writer.writeLong(offsets[29], object.itemSequence);
  writer.writeDouble(offsets[30], object.lastCost);
  writer.writeString(offsets[31], object.locationCode);
  writer.writeDouble(offsets[32], object.miscCost);
  writer.writeDouble(offsets[33], object.netAmount);
  writer.writeDouble(offsets[34], object.nos);
  writer.writeString(offsets[35], object.pluNo);
  writer.writeString(offsets[36], object.projectCode);
  writer.writeDouble(offsets[37], object.quantityLoss);
  writer.writeDouble(offsets[38], object.quantityOriginal);
  writer.writeDouble(offsets[39], object.quoteFoc);
  writer.writeDouble(offsets[40], object.quoteFocLoose);
  writer.writeDouble(offsets[41], object.quoteFocLooseOri);
  writer.writeDouble(offsets[42], object.quoteFocOri);
  writer.writeString(offsets[43], object.quotePreLabel);
  writer.writeDouble(offsets[44], object.quoteQuantity);
  writer.writeDouble(offsets[45], object.quoteQuantityLoose);
  writer.writeDouble(offsets[46], object.quoteQuantityLooseOri);
  writer.writeDouble(offsets[47], object.quoteQuantityOri);
  writer.writeString(offsets[48], object.remark);
  writer.writeLong(offsets[49], object.sequenceNo);
  writer.writeLong(offsets[50], object.skuNo);
  writer.writeDouble(offsets[51], object.standardCost);
  writer.writeString(offsets[52], object.status);
  writer.writeString(offsets[53], object.syLocationCode);
  writer.writeDouble(offsets[54], object.taxAmount);
  writer.writeDouble(offsets[55], object.taxRate);
  writer.writeDouble(offsets[56], object.unitDiscountAmount);
  writer.writeDouble(offsets[57], object.unitDiscountAmount1);
  writer.writeDouble(offsets[58], object.unitDiscountAmount2);
  writer.writeDouble(offsets[59], object.unitDiscountAmountOri);
  writer.writeDouble(offsets[60], object.unitDiscountRate);
  writer.writeDouble(offsets[61], object.unitDiscountRate1);
  writer.writeDouble(offsets[62], object.unitDiscountRate2);
  writer.writeDouble(offsets[63], object.unitDiscountRateOri);
  writer.writeDouble(offsets[64], object.unitPrice);
  writer.writeDouble(offsets[65], object.unitPriceBasic);
  writer.writeDouble(offsets[66], object.unitPriceOri);
  writer.writeString(offsets[67], object.uom);
}

QuoteItem _quoteItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuoteItem();
  object.addedDate = reader.readDateTimeOrNull(offsets[0]);
  object.alternateDescription = reader.readStringOrNull(offsets[1]);
  object.approvalUnitPrice = reader.readDoubleOrNull(offsets[2]);
  object.averageCost = reader.readDoubleOrNull(offsets[3]);
  object.balanceFoc = reader.readDoubleOrNull(offsets[4]);
  object.balanceFocLoose = reader.readDoubleOrNull(offsets[5]);
  object.balanceQuantity = reader.readDoubleOrNull(offsets[6]);
  object.balanceQuantityLoose = reader.readDoubleOrNull(offsets[7]);
  object.cancelledBy = reader.readLongOrNull(offsets[8]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[9]);
  object.changePriceRemark = reader.readStringOrNull(offsets[10]);
  object.companyCode = reader.readLong(offsets[11]);
  object.ctnUnitPrice = reader.readDoubleOrNull(offsets[12]);
  object.ctnUom = reader.readStringOrNull(offsets[13]);
  object.defaultPlu = reader.readStringOrNull(offsets[14]);
  object.factor = reader.readDoubleOrNull(offsets[21]);
  object.fifoCost = reader.readDoubleOrNull(offsets[22]);
  object.gstCode = reader.readStringOrNull(offsets[26]);
  object.gstPrice = reader.readDoubleOrNull(offsets[27]);
  object.id = id;
  object.instantNormalSellingPrice = reader.readDoubleOrNull(offsets[28]);
  object.itemSequence = reader.readLongOrNull(offsets[29]);
  object.lastCost = reader.readDoubleOrNull(offsets[30]);
  object.locationCode = reader.readStringOrNull(offsets[31]);
  object.miscCost = reader.readDoubleOrNull(offsets[32]);
  object.netAmount = reader.readDoubleOrNull(offsets[33]);
  object.nos = reader.readDoubleOrNull(offsets[34]);
  object.pluNo = reader.readStringOrNull(offsets[35]);
  object.projectCode = reader.readStringOrNull(offsets[36]);
  object.quantityLoss = reader.readDoubleOrNull(offsets[37]);
  object.quantityOriginal = reader.readDoubleOrNull(offsets[38]);
  object.quoteFoc = reader.readDoubleOrNull(offsets[39]);
  object.quoteFocLoose = reader.readDoubleOrNull(offsets[40]);
  object.quoteFocLooseOri = reader.readDoubleOrNull(offsets[41]);
  object.quoteFocOri = reader.readDoubleOrNull(offsets[42]);
  object.quotePreLabel = reader.readString(offsets[43]);
  object.quoteQuantity = reader.readDoubleOrNull(offsets[44]);
  object.quoteQuantityLoose = reader.readDoubleOrNull(offsets[45]);
  object.quoteQuantityLooseOri = reader.readDoubleOrNull(offsets[46]);
  object.quoteQuantityOri = reader.readDoubleOrNull(offsets[47]);
  object.remark = reader.readStringOrNull(offsets[48]);
  object.sequenceNo = reader.readLong(offsets[49]);
  object.skuNo = reader.readLong(offsets[50]);
  object.standardCost = reader.readDoubleOrNull(offsets[51]);
  object.status = reader.readStringOrNull(offsets[52]);
  object.syLocationCode = reader.readStringOrNull(offsets[53]);
  object.taxAmount = reader.readDoubleOrNull(offsets[54]);
  object.taxRate = reader.readDoubleOrNull(offsets[55]);
  object.unitDiscountAmount = reader.readDoubleOrNull(offsets[56]);
  object.unitDiscountAmount1 = reader.readDoubleOrNull(offsets[57]);
  object.unitDiscountAmount2 = reader.readDoubleOrNull(offsets[58]);
  object.unitDiscountAmountOri = reader.readDoubleOrNull(offsets[59]);
  object.unitDiscountRate = reader.readDoubleOrNull(offsets[60]);
  object.unitDiscountRate1 = reader.readDoubleOrNull(offsets[61]);
  object.unitDiscountRate2 = reader.readDoubleOrNull(offsets[62]);
  object.unitDiscountRateOri = reader.readDoubleOrNull(offsets[63]);
  object.unitPrice = reader.readDoubleOrNull(offsets[64]);
  object.unitPriceBasic = reader.readDoubleOrNull(offsets[65]);
  object.unitPriceOri = reader.readDoubleOrNull(offsets[66]);
  object.uom = reader.readString(offsets[67]);
  return object;
}

P _quoteItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readDoubleOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readDoubleOrNull(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    case 30:
      return (reader.readDoubleOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readDoubleOrNull(offset)) as P;
    case 33:
      return (reader.readDoubleOrNull(offset)) as P;
    case 34:
      return (reader.readDoubleOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readDoubleOrNull(offset)) as P;
    case 38:
      return (reader.readDoubleOrNull(offset)) as P;
    case 39:
      return (reader.readDoubleOrNull(offset)) as P;
    case 40:
      return (reader.readDoubleOrNull(offset)) as P;
    case 41:
      return (reader.readDoubleOrNull(offset)) as P;
    case 42:
      return (reader.readDoubleOrNull(offset)) as P;
    case 43:
      return (reader.readString(offset)) as P;
    case 44:
      return (reader.readDoubleOrNull(offset)) as P;
    case 45:
      return (reader.readDoubleOrNull(offset)) as P;
    case 46:
      return (reader.readDoubleOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readLong(offset)) as P;
    case 50:
      return (reader.readLong(offset)) as P;
    case 51:
      return (reader.readDoubleOrNull(offset)) as P;
    case 52:
      return (reader.readStringOrNull(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readDoubleOrNull(offset)) as P;
    case 55:
      return (reader.readDoubleOrNull(offset)) as P;
    case 56:
      return (reader.readDoubleOrNull(offset)) as P;
    case 57:
      return (reader.readDoubleOrNull(offset)) as P;
    case 58:
      return (reader.readDoubleOrNull(offset)) as P;
    case 59:
      return (reader.readDoubleOrNull(offset)) as P;
    case 60:
      return (reader.readDoubleOrNull(offset)) as P;
    case 61:
      return (reader.readDoubleOrNull(offset)) as P;
    case 62:
      return (reader.readDoubleOrNull(offset)) as P;
    case 63:
      return (reader.readDoubleOrNull(offset)) as P;
    case 64:
      return (reader.readDoubleOrNull(offset)) as P;
    case 65:
      return (reader.readDoubleOrNull(offset)) as P;
    case 66:
      return (reader.readDoubleOrNull(offset)) as P;
    case 67:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quoteItemGetId(QuoteItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quoteItemGetLinks(QuoteItem object) {
  return [];
}

void _quoteItemAttach(IsarCollection<dynamic> col, Id id, QuoteItem object) {
  object.id = id;
}

extension QuoteItemQueryWhereSort
    on QueryBuilder<QuoteItem, QuoteItem, QWhere> {
  QueryBuilder<QuoteItem, QuoteItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension QuoteItemQueryWhere
    on QueryBuilder<QuoteItem, QuoteItem, QWhereClause> {
  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> companyCodeNotEqualTo(
      int companyCode) {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> companyCodeGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> quotePreLabelEqualTo(
      String quotePreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'quotePreLabel',
        value: [quotePreLabel],
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterWhereClause> quotePreLabelNotEqualTo(
      String quotePreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quotePreLabel',
              lower: [],
              upper: [quotePreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quotePreLabel',
              lower: [quotePreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quotePreLabel',
              lower: [quotePreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'quotePreLabel',
              lower: [],
              upper: [quotePreLabel],
              includeUpper: false,
            ));
      }
    });
  }
}

extension QuoteItemQueryFilter
    on QueryBuilder<QuoteItem, QuoteItem, QFilterCondition> {
  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateDescription',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateDescription',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternateDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternateDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      alternateDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvalUnitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvalUnitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvalUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvalUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvalUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      approvalUnitPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvalUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      averageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      averageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> averageCostEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> averageCostLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> averageCostBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> balanceFocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceFoc',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceFoc',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> balanceFocEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> balanceFocLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> balanceFocBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceFoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceFocLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceFocLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceFocLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceFocLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceQuantity',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceQuantity',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceQuantityLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceQuantityLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      balanceQuantityLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceQuantityLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> cancelledByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> cancelledByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> cancelledByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      cancelledDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'changePriceRemark',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'changePriceRemark',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'changePriceRemark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'changePriceRemark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePriceRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      changePriceRemarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'changePriceRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> companyCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      ctnUnitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctnUnitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      ctnUnitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctnUnitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUnitPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctnUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      ctnUnitPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctnUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      ctnUnitPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctnUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUnitPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctnUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctnUom',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctnUom',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ctnUom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ctnUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ctnUom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctnUom',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> ctnUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ctnUom',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultPlu',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      defaultPluIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultPlu',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      defaultPluGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultPlu',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      defaultPluStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> defaultPluMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultPlu',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      defaultPluIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      defaultPluIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayCurrency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCurrency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayCurrencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayNetAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayNetAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayNetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayNetAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayNetAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayNetAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayNetAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displaySkuNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displaySkuNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displaySkuNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displaySkuNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displaySkuNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displaySkuNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displaySkuNo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displaySkuNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displaySkuNo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUnitPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUnitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUnitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUnitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayUom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> displayUomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayUom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      displayUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> factorBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> fifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      fifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> fifoCostEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> fifoCostGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> fifoCostLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> fifoCostBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedNetAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedNetAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedNetAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedQuantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedQuantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedUnitPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedUnitPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      formattedUnitPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedUnitPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gstCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gstCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gstCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      gstCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gstCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      gstPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstPriceEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstPriceGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstPriceLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> gstPriceBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instantNormalSellingPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instantNormalSellingPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instantNormalSellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instantNormalSellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instantNormalSellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      instantNormalSellingPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instantNormalSellingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      itemSequenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemSequence',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      itemSequenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemSequence',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> itemSequenceEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      itemSequenceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      itemSequenceLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> itemSequenceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemSequence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> lastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      lastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> lastCostEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> lastCostGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> lastCostLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> lastCostBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> locationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> locationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> locationCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> miscCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      miscCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> miscCostEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> miscCostGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> miscCostLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> miscCostBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> netAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      netAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> netAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      netAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> netAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> netAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> nosBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pluNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pluNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'projectCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> projectCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityLossIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityLoss',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityLossIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityLoss',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quantityLossEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityLossGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityLossLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityLoss',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quantityLossBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityLoss',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityOriginal',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityOriginal',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityOriginal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quantityOriginalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityOriginal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteFoc',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteFoc',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteFoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteFocLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteFocLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteFocLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteFocLooseOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteFocLooseOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteFocLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteFocLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteFocLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocLooseOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteFocLooseOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteFocOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteFocOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteFocOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteFocOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteFocOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteFocOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> quoteFocOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteFocOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quotePreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quotePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quotePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteQuantity',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteQuantity',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteQuantityLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteQuantityLoose',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteQuantityLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteQuantityLooseOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteQuantityLooseOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteQuantityLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteQuantityLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteQuantityLooseOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityLooseOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteQuantityLooseOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteQuantityOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteQuantityOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteQuantityOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteQuantityOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteQuantityOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      quoteQuantityOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteQuantityOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> sequenceNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      sequenceNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> sequenceNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> sequenceNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sequenceNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> skuNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> skuNoGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      standardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      standardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> standardCostEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> standardCostBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syLocationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      syLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      taxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      taxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxRate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxRate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> taxRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount1',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount1',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountAmount1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountAmount1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountAmount1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountAmount1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount2',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount2',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountAmount2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountAmount2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountAmount2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmount2Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountAmount2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmountOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmountOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountAmountOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountAmountOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountAmountOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountAmountOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountAmountOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate1',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate1',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountRate1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountRate1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountRate1',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate1Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountRate1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate2',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate2',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountRate2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountRate2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountRate2',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRate2Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountRate2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRateOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRateOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDiscountRateOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDiscountRateOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDiscountRateOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitDiscountRateOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDiscountRateOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPriceBasic',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPriceBasic',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPriceBasic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPriceBasic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPriceBasic',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceBasicBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPriceBasic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceOriIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPriceOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceOriIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPriceOri',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceOriEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPriceOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceOriGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPriceOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition>
      unitPriceOriLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPriceOri',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> unitPriceOriBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPriceOri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomEqualTo(
    String value, {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomGreaterThan(
    String value, {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomLessThan(
    String value, {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomBetween(
    String lower,
    String upper, {
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomContains(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterFilterCondition> uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension QuoteItemQueryObject
    on QueryBuilder<QuoteItem, QuoteItem, QFilterCondition> {}

extension QuoteItemQueryLinks
    on QueryBuilder<QuoteItem, QuoteItem, QFilterCondition> {}

extension QuoteItemQuerySortBy on QueryBuilder<QuoteItem, QuoteItem, QSortBy> {
  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByAlternateDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByAlternateDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByApprovalUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvalUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByApprovalUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvalUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByBalanceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByBalanceQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByChangePriceRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByChangePriceRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCtnUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCtnUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByCtnUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDefaultPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDefaultPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplaySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySkuNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplaySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySkuNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByDisplayUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFormattedNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByFormattedNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFormattedQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByFormattedQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByFormattedUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByFormattedUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByGstCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByGstCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByInstantNormalSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByItemSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuantityLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuantityOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFoc', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFoc', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLooseOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuoteFocLooseOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLooseOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteFocOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuoteQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuoteQuantityLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLooseOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuoteQuantityLooseOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLooseOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByQuoteQuantityOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByQuoteQuantityOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountAmount1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountAmount2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountAmountOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmountOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountAmountOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmountOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountRate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountRate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitDiscountRateOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRateOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      sortByUnitDiscountRateOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRateOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPriceBasicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPriceOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUnitPriceOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension QuoteItemQuerySortThenBy
    on QueryBuilder<QuoteItem, QuoteItem, QSortThenBy> {
  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByAlternateDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByAlternateDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByApprovalUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvalUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByApprovalUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvalUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByBalanceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByBalanceQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByChangePriceRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByChangePriceRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCtnUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCtnUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByCtnUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDefaultPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDefaultPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplaySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySkuNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplaySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySkuNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByDisplayUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFormattedNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByFormattedNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFormattedQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByFormattedQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByFormattedUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByFormattedUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByGstCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByGstCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByInstantNormalSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByItemSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuantityLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuantityOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFoc', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFoc', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLooseOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuoteFocLooseOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocLooseOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteFocOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteFocOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuoteQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuoteQuantityLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLooseOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuoteQuantityLooseOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityLooseOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByQuoteQuantityOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByQuoteQuantityOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteQuantityOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountAmount1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountAmount2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountAmountOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmountOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountAmountOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmountOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountRate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountRate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitDiscountRateOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRateOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy>
      thenByUnitDiscountRateOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRateOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPriceBasicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPriceOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceOri', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUnitPriceOriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceOri', Sort.desc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension QuoteItemQueryWhereDistinct
    on QueryBuilder<QuoteItem, QuoteItem, QDistinct> {
  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByAlternateDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByApprovalUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvalUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCost');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceFoc');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceFocLoose');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceQuantity');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceQuantityLoose');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByChangePriceRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changePriceRemark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctnUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByCtnUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctnUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDefaultPlu(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultPlu', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplayCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCurrency',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayNetAmount');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplayQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayQuantity');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplaySkuNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displaySkuNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplayUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByDisplayUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fifoCost');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByFormattedNetAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedNetAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByFormattedQuantity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedQuantity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByFormattedUnitPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedUnitPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByGstCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instantNormalSellingPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemSequence');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCost');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'miscCost');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nos');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByProjectCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityLoss');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityOriginal');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteFoc');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteFocLoose');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteFocLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteFocLooseOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteFocOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteFocOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuotePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteQuantity');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteQuantityLoose');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByQuoteQuantityLooseOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteQuantityLooseOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByQuoteQuantityOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteQuantityOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standardCost');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctBySyLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAmount');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxRate');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount1');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount2');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByUnitDiscountAmountOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmountOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate1');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate2');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct>
      distinctByUnitDiscountRateOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRateOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPriceBasic');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUnitPriceOri() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPriceOri');
    });
  }

  QueryBuilder<QuoteItem, QuoteItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension QuoteItemQueryProperty
    on QueryBuilder<QuoteItem, QuoteItem, QQueryProperty> {
  QueryBuilder<QuoteItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuoteItem, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations>
      alternateDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateDescription');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      approvalUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvalUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> averageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCost');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> balanceFocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceFoc');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> balanceFocLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceFocLoose');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> balanceQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceQuantity');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      balanceQuantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceQuantityLoose');
    });
  }

  QueryBuilder<QuoteItem, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<QuoteItem, DateTime?, QQueryOperations> cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations>
      changePriceRemarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changePriceRemark');
    });
  }

  QueryBuilder<QuoteItem, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> ctnUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctnUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> ctnUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctnUom');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> defaultPluProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultPlu');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations> displayCurrencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCurrency');
    });
  }

  QueryBuilder<QuoteItem, double, QQueryOperations> displayNetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayNetAmount');
    });
  }

  QueryBuilder<QuoteItem, double, QQueryOperations> displayQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayQuantity');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations> displaySkuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displaySkuNo');
    });
  }

  QueryBuilder<QuoteItem, double, QQueryOperations> displayUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations> displayUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayUom');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> fifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fifoCost');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations>
      formattedNetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedNetAmount');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations>
      formattedQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedQuantity');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations>
      formattedUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedUnitPrice');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> gstCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstCode');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> gstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstPrice');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      instantNormalSellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instantNormalSellingPrice');
    });
  }

  QueryBuilder<QuoteItem, int?, QQueryOperations> itemSequenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemSequence');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> lastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCost');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> miscCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'miscCost');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> nosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nos');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> quantityLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityLoss');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      quantityOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityOriginal');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> quoteFocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteFoc');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> quoteFocLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteFocLoose');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      quoteFocLooseOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteFocLooseOri');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> quoteFocOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteFocOri');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations> quotePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotePreLabel');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> quoteQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteQuantity');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      quoteQuantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteQuantityLoose');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      quoteQuantityLooseOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteQuantityLooseOri');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      quoteQuantityOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteQuantityOri');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<QuoteItem, int, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<QuoteItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> standardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standardCost');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<QuoteItem, String?, QQueryOperations> syLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syLocationCode');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> taxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAmount');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> taxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxRate');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountAmount1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount1');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountAmount2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount2');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountAmountOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmountOri');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountRate1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate1');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountRate2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate2');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations>
      unitDiscountRateOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRateOri');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> unitPriceBasicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPriceBasic');
    });
  }

  QueryBuilder<QuoteItem, double?, QQueryOperations> unitPriceOriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPriceOri');
    });
  }

  QueryBuilder<QuoteItem, String, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
