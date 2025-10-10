// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuoteCollection on Isar {
  IsarCollection<Quote> get quotes => this.collection();
}

const QuoteSchema = CollectionSchema(
  name: r'Quote',
  id: 1459993770030070654,
  properties: {
    r'addedBy': PropertySchema(
      id: 0,
      name: r'addedBy',
      type: IsarType.long,
    ),
    r'addedDate': PropertySchema(
      id: 1,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'alternateCompany': PropertySchema(
      id: 2,
      name: r'alternateCompany',
      type: IsarType.string,
    ),
    r'alternateDoc': PropertySchema(
      id: 3,
      name: r'alternateDoc',
      type: IsarType.string,
    ),
    r'approvedBy': PropertySchema(
      id: 4,
      name: r'approvedBy',
      type: IsarType.long,
    ),
    r'approvedDate': PropertySchema(
      id: 5,
      name: r'approvedDate',
      type: IsarType.dateTime,
    ),
    r'attachmentDate1': PropertySchema(
      id: 6,
      name: r'attachmentDate1',
      type: IsarType.dateTime,
    ),
    r'attachmentDate2': PropertySchema(
      id: 7,
      name: r'attachmentDate2',
      type: IsarType.dateTime,
    ),
    r'attachmentPath1': PropertySchema(
      id: 8,
      name: r'attachmentPath1',
      type: IsarType.string,
    ),
    r'attachmentPath2': PropertySchema(
      id: 9,
      name: r'attachmentPath2',
      type: IsarType.string,
    ),
    r'attentionRemark': PropertySchema(
      id: 10,
      name: r'attentionRemark',
      type: IsarType.string,
    ),
    r'cancelledBy': PropertySchema(
      id: 11,
      name: r'cancelledBy',
      type: IsarType.long,
    ),
    r'cancelledDate': PropertySchema(
      id: 12,
      name: r'cancelledDate',
      type: IsarType.dateTime,
    ),
    r'companyCode': PropertySchema(
      id: 13,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'currency': PropertySchema(
      id: 14,
      name: r'currency',
      type: IsarType.string,
    ),
    r'customer': PropertySchema(
      id: 15,
      name: r'customer',
      type: IsarType.string,
    ),
    r'deliveredBy': PropertySchema(
      id: 16,
      name: r'deliveredBy',
      type: IsarType.long,
    ),
    r'deliveredDate': PropertySchema(
      id: 17,
      name: r'deliveredDate',
      type: IsarType.dateTime,
    ),
    r'displayCurrency': PropertySchema(
      id: 18,
      name: r'displayCurrency',
      type: IsarType.string,
    ),
    r'displayCustomer': PropertySchema(
      id: 19,
      name: r'displayCustomer',
      type: IsarType.string,
    ),
    r'displayNetAmount': PropertySchema(
      id: 20,
      name: r'displayNetAmount',
      type: IsarType.double,
    ),
    r'displayQuoteNumber': PropertySchema(
      id: 21,
      name: r'displayQuoteNumber',
      type: IsarType.string,
    ),
    r'displayStatus': PropertySchema(
      id: 22,
      name: r'displayStatus',
      type: IsarType.string,
    ),
    r'downloadPrelabel': PropertySchema(
      id: 23,
      name: r'downloadPrelabel',
      type: IsarType.string,
    ),
    r'formattedNetAmount': PropertySchema(
      id: 24,
      name: r'formattedNetAmount',
      type: IsarType.string,
    ),
    r'formattedQuoteDate': PropertySchema(
      id: 25,
      name: r'formattedQuoteDate',
      type: IsarType.string,
    ),
    r'grossAmount': PropertySchema(
      id: 26,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'gstAmount': PropertySchema(
      id: 27,
      name: r'gstAmount',
      type: IsarType.double,
    ),
    r'internalReference': PropertySchema(
      id: 28,
      name: r'internalReference',
      type: IsarType.string,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 29,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 30,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 31,
      name: r'latitude',
      type: IsarType.string,
    ),
    r'locationCode': PropertySchema(
      id: 32,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 33,
      name: r'longitude',
      type: IsarType.string,
    ),
    r'masterPreLabel': PropertySchema(
      id: 34,
      name: r'masterPreLabel',
      type: IsarType.string,
    ),
    r'netAmount': PropertySchema(
      id: 35,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'otherCharges': PropertySchema(
      id: 36,
      name: r'otherCharges',
      type: IsarType.double,
    ),
    r'otherChargesRate': PropertySchema(
      id: 37,
      name: r'otherChargesRate',
      type: IsarType.double,
    ),
    r'packBy': PropertySchema(
      id: 38,
      name: r'packBy',
      type: IsarType.long,
    ),
    r'packDate': PropertySchema(
      id: 39,
      name: r'packDate',
      type: IsarType.dateTime,
    ),
    r'pickNo': PropertySchema(
      id: 40,
      name: r'pickNo',
      type: IsarType.long,
    ),
    r'ppDiscountAmount': PropertySchema(
      id: 41,
      name: r'ppDiscountAmount',
      type: IsarType.double,
    ),
    r'ppDiscountByRate': PropertySchema(
      id: 42,
      name: r'ppDiscountByRate',
      type: IsarType.string,
    ),
    r'ppDiscountRate': PropertySchema(
      id: 43,
      name: r'ppDiscountRate',
      type: IsarType.double,
    ),
    r'ppDueDate': PropertySchema(
      id: 44,
      name: r'ppDueDate',
      type: IsarType.dateTime,
    ),
    r'projectCode': PropertySchema(
      id: 45,
      name: r'projectCode',
      type: IsarType.string,
    ),
    r'quoteDate': PropertySchema(
      id: 46,
      name: r'quoteDate',
      type: IsarType.dateTime,
    ),
    r'quoteExpiry': PropertySchema(
      id: 47,
      name: r'quoteExpiry',
      type: IsarType.dateTime,
    ),
    r'quotePreLabel': PropertySchema(
      id: 48,
      name: r'quotePreLabel',
      type: IsarType.string,
    ),
    r'quotedBy': PropertySchema(
      id: 49,
      name: r'quotedBy',
      type: IsarType.long,
    ),
    r'rate': PropertySchema(
      id: 50,
      name: r'rate',
      type: IsarType.double,
    ),
    r'ref1': PropertySchema(
      id: 51,
      name: r'ref1',
      type: IsarType.string,
    ),
    r'ref2': PropertySchema(
      id: 52,
      name: r'ref2',
      type: IsarType.string,
    ),
    r'ref3': PropertySchema(
      id: 53,
      name: r'ref3',
      type: IsarType.string,
    ),
    r'ref4': PropertySchema(
      id: 54,
      name: r'ref4',
      type: IsarType.string,
    ),
    r'ref5': PropertySchema(
      id: 55,
      name: r'ref5',
      type: IsarType.string,
    ),
    r'remark1': PropertySchema(
      id: 56,
      name: r'remark1',
      type: IsarType.string,
    ),
    r'remark2': PropertySchema(
      id: 57,
      name: r'remark2',
      type: IsarType.string,
    ),
    r'representativeId': PropertySchema(
      id: 58,
      name: r'representativeId',
      type: IsarType.long,
    ),
    r'roundingDiscount': PropertySchema(
      id: 59,
      name: r'roundingDiscount',
      type: IsarType.double,
    ),
    r'shipTo': PropertySchema(
      id: 60,
      name: r'shipTo',
      type: IsarType.long,
    ),
    r'sourceLocationCode': PropertySchema(
      id: 61,
      name: r'sourceLocationCode',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 62,
      name: r'status',
      type: IsarType.string,
    ),
    r'statusDisplay': PropertySchema(
      id: 63,
      name: r'statusDisplay',
      type: IsarType.string,
    ),
    r'syLocationCode': PropertySchema(
      id: 64,
      name: r'syLocationCode',
      type: IsarType.string,
    ),
    r'term': PropertySchema(
      id: 65,
      name: r'term',
      type: IsarType.string,
    ),
    r'totalAmountB4GST': PropertySchema(
      id: 66,
      name: r'totalAmountB4GST',
      type: IsarType.double,
    ),
    r'totalDiscountAmount': PropertySchema(
      id: 67,
      name: r'totalDiscountAmount',
      type: IsarType.double,
    ),
    r'totalDiscountRate': PropertySchema(
      id: 68,
      name: r'totalDiscountRate',
      type: IsarType.double,
    ),
    r'totalEdit': PropertySchema(
      id: 69,
      name: r'totalEdit',
      type: IsarType.long,
    ),
    r'totalPrint': PropertySchema(
      id: 70,
      name: r'totalPrint',
      type: IsarType.long,
    ),
    r'totalQuoteItem': PropertySchema(
      id: 71,
      name: r'totalQuoteItem',
      type: IsarType.long,
    ),
    r'totalQuoteQuantity': PropertySchema(
      id: 72,
      name: r'totalQuoteQuantity',
      type: IsarType.double,
    ),
    r'totalTaxAmount': PropertySchema(
      id: 73,
      name: r'totalTaxAmount',
      type: IsarType.double,
    ),
    r'totalTaxRate': PropertySchema(
      id: 74,
      name: r'totalTaxRate',
      type: IsarType.double,
    ),
    r'verifyBy': PropertySchema(
      id: 75,
      name: r'verifyBy',
      type: IsarType.long,
    ),
    r'verifyDate': PropertySchema(
      id: 76,
      name: r'verifyDate',
      type: IsarType.dateTime,
    ),
    r'wayBillNo': PropertySchema(
      id: 77,
      name: r'wayBillNo',
      type: IsarType.string,
    ),
    r'webStatus': PropertySchema(
      id: 78,
      name: r'webStatus',
      type: IsarType.string,
    )
  },
  estimateSize: _quoteEstimateSize,
  serialize: _quoteSerialize,
  deserialize: _quoteDeserialize,
  deserializeProp: _quoteDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _quoteGetId,
  getLinks: _quoteGetLinks,
  attach: _quoteAttach,
  version: '3.1.0+1',
);

int _quoteEstimateSize(
  Quote object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.alternateCompany;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.alternateDoc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachmentPath1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attachmentPath2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.attentionRemark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currency;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayCurrency.length * 3;
  bytesCount += 3 + object.displayCustomer.length * 3;
  bytesCount += 3 + object.displayQuoteNumber.length * 3;
  bytesCount += 3 + object.displayStatus.length * 3;
  {
    final value = object.downloadPrelabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.formattedNetAmount.length * 3;
  bytesCount += 3 + object.formattedQuoteDate.length * 3;
  {
    final value = object.internalReference;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.latitude;
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
    final value = object.longitude;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.masterPreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ppDiscountByRate;
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
  {
    final value = object.quotePreLabel;
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
    final value = object.ref2;
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
    final value = object.ref4;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ref5;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remark1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.remark2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceLocationCode;
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
  bytesCount += 3 + object.statusDisplay.length * 3;
  {
    final value = object.syLocationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.term;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wayBillNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _quoteSerialize(
  Quote object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeString(offsets[2], object.alternateCompany);
  writer.writeString(offsets[3], object.alternateDoc);
  writer.writeLong(offsets[4], object.approvedBy);
  writer.writeDateTime(offsets[5], object.approvedDate);
  writer.writeDateTime(offsets[6], object.attachmentDate1);
  writer.writeDateTime(offsets[7], object.attachmentDate2);
  writer.writeString(offsets[8], object.attachmentPath1);
  writer.writeString(offsets[9], object.attachmentPath2);
  writer.writeString(offsets[10], object.attentionRemark);
  writer.writeLong(offsets[11], object.cancelledBy);
  writer.writeDateTime(offsets[12], object.cancelledDate);
  writer.writeLong(offsets[13], object.companyCode);
  writer.writeString(offsets[14], object.currency);
  writer.writeString(offsets[15], object.customer);
  writer.writeLong(offsets[16], object.deliveredBy);
  writer.writeDateTime(offsets[17], object.deliveredDate);
  writer.writeString(offsets[18], object.displayCurrency);
  writer.writeString(offsets[19], object.displayCustomer);
  writer.writeDouble(offsets[20], object.displayNetAmount);
  writer.writeString(offsets[21], object.displayQuoteNumber);
  writer.writeString(offsets[22], object.displayStatus);
  writer.writeString(offsets[23], object.downloadPrelabel);
  writer.writeString(offsets[24], object.formattedNetAmount);
  writer.writeString(offsets[25], object.formattedQuoteDate);
  writer.writeDouble(offsets[26], object.grossAmount);
  writer.writeDouble(offsets[27], object.gstAmount);
  writer.writeString(offsets[28], object.internalReference);
  writer.writeLong(offsets[29], object.lastModifiedBy);
  writer.writeDateTime(offsets[30], object.lastWriteTimeStamp);
  writer.writeString(offsets[31], object.latitude);
  writer.writeString(offsets[32], object.locationCode);
  writer.writeString(offsets[33], object.longitude);
  writer.writeString(offsets[34], object.masterPreLabel);
  writer.writeDouble(offsets[35], object.netAmount);
  writer.writeDouble(offsets[36], object.otherCharges);
  writer.writeDouble(offsets[37], object.otherChargesRate);
  writer.writeLong(offsets[38], object.packBy);
  writer.writeDateTime(offsets[39], object.packDate);
  writer.writeLong(offsets[40], object.pickNo);
  writer.writeDouble(offsets[41], object.ppDiscountAmount);
  writer.writeString(offsets[42], object.ppDiscountByRate);
  writer.writeDouble(offsets[43], object.ppDiscountRate);
  writer.writeDateTime(offsets[44], object.ppDueDate);
  writer.writeString(offsets[45], object.projectCode);
  writer.writeDateTime(offsets[46], object.quoteDate);
  writer.writeDateTime(offsets[47], object.quoteExpiry);
  writer.writeString(offsets[48], object.quotePreLabel);
  writer.writeLong(offsets[49], object.quotedBy);
  writer.writeDouble(offsets[50], object.rate);
  writer.writeString(offsets[51], object.ref1);
  writer.writeString(offsets[52], object.ref2);
  writer.writeString(offsets[53], object.ref3);
  writer.writeString(offsets[54], object.ref4);
  writer.writeString(offsets[55], object.ref5);
  writer.writeString(offsets[56], object.remark1);
  writer.writeString(offsets[57], object.remark2);
  writer.writeLong(offsets[58], object.representativeId);
  writer.writeDouble(offsets[59], object.roundingDiscount);
  writer.writeLong(offsets[60], object.shipTo);
  writer.writeString(offsets[61], object.sourceLocationCode);
  writer.writeString(offsets[62], object.status);
  writer.writeString(offsets[63], object.statusDisplay);
  writer.writeString(offsets[64], object.syLocationCode);
  writer.writeString(offsets[65], object.term);
  writer.writeDouble(offsets[66], object.totalAmountB4GST);
  writer.writeDouble(offsets[67], object.totalDiscountAmount);
  writer.writeDouble(offsets[68], object.totalDiscountRate);
  writer.writeLong(offsets[69], object.totalEdit);
  writer.writeLong(offsets[70], object.totalPrint);
  writer.writeLong(offsets[71], object.totalQuoteItem);
  writer.writeDouble(offsets[72], object.totalQuoteQuantity);
  writer.writeDouble(offsets[73], object.totalTaxAmount);
  writer.writeDouble(offsets[74], object.totalTaxRate);
  writer.writeLong(offsets[75], object.verifyBy);
  writer.writeDateTime(offsets[76], object.verifyDate);
  writer.writeString(offsets[77], object.wayBillNo);
  writer.writeString(offsets[78], object.webStatus);
}

Quote _quoteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Quote();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.alternateCompany = reader.readStringOrNull(offsets[2]);
  object.alternateDoc = reader.readStringOrNull(offsets[3]);
  object.approvedBy = reader.readLongOrNull(offsets[4]);
  object.approvedDate = reader.readDateTimeOrNull(offsets[5]);
  object.attachmentDate1 = reader.readDateTimeOrNull(offsets[6]);
  object.attachmentDate2 = reader.readDateTimeOrNull(offsets[7]);
  object.attachmentPath1 = reader.readStringOrNull(offsets[8]);
  object.attachmentPath2 = reader.readStringOrNull(offsets[9]);
  object.attentionRemark = reader.readStringOrNull(offsets[10]);
  object.cancelledBy = reader.readLongOrNull(offsets[11]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[12]);
  object.companyCode = reader.readLongOrNull(offsets[13]);
  object.currency = reader.readStringOrNull(offsets[14]);
  object.customer = reader.readStringOrNull(offsets[15]);
  object.deliveredBy = reader.readLongOrNull(offsets[16]);
  object.deliveredDate = reader.readDateTimeOrNull(offsets[17]);
  object.downloadPrelabel = reader.readStringOrNull(offsets[23]);
  object.grossAmount = reader.readDoubleOrNull(offsets[26]);
  object.gstAmount = reader.readDoubleOrNull(offsets[27]);
  object.id = id;
  object.internalReference = reader.readStringOrNull(offsets[28]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[29]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[30]);
  object.latitude = reader.readStringOrNull(offsets[31]);
  object.locationCode = reader.readStringOrNull(offsets[32]);
  object.longitude = reader.readStringOrNull(offsets[33]);
  object.masterPreLabel = reader.readStringOrNull(offsets[34]);
  object.netAmount = reader.readDoubleOrNull(offsets[35]);
  object.otherCharges = reader.readDoubleOrNull(offsets[36]);
  object.otherChargesRate = reader.readDoubleOrNull(offsets[37]);
  object.packBy = reader.readLongOrNull(offsets[38]);
  object.packDate = reader.readDateTimeOrNull(offsets[39]);
  object.pickNo = reader.readLongOrNull(offsets[40]);
  object.ppDiscountAmount = reader.readDoubleOrNull(offsets[41]);
  object.ppDiscountByRate = reader.readStringOrNull(offsets[42]);
  object.ppDiscountRate = reader.readDoubleOrNull(offsets[43]);
  object.ppDueDate = reader.readDateTimeOrNull(offsets[44]);
  object.projectCode = reader.readStringOrNull(offsets[45]);
  object.quoteDate = reader.readDateTimeOrNull(offsets[46]);
  object.quoteExpiry = reader.readDateTimeOrNull(offsets[47]);
  object.quotePreLabel = reader.readStringOrNull(offsets[48]);
  object.quotedBy = reader.readLongOrNull(offsets[49]);
  object.rate = reader.readDoubleOrNull(offsets[50]);
  object.ref1 = reader.readStringOrNull(offsets[51]);
  object.ref2 = reader.readStringOrNull(offsets[52]);
  object.ref3 = reader.readStringOrNull(offsets[53]);
  object.ref4 = reader.readStringOrNull(offsets[54]);
  object.ref5 = reader.readStringOrNull(offsets[55]);
  object.remark1 = reader.readStringOrNull(offsets[56]);
  object.remark2 = reader.readStringOrNull(offsets[57]);
  object.representativeId = reader.readLongOrNull(offsets[58]);
  object.roundingDiscount = reader.readDoubleOrNull(offsets[59]);
  object.shipTo = reader.readLongOrNull(offsets[60]);
  object.sourceLocationCode = reader.readStringOrNull(offsets[61]);
  object.status = reader.readStringOrNull(offsets[62]);
  object.syLocationCode = reader.readStringOrNull(offsets[64]);
  object.term = reader.readStringOrNull(offsets[65]);
  object.totalAmountB4GST = reader.readDoubleOrNull(offsets[66]);
  object.totalDiscountAmount = reader.readDoubleOrNull(offsets[67]);
  object.totalDiscountRate = reader.readDoubleOrNull(offsets[68]);
  object.totalEdit = reader.readLongOrNull(offsets[69]);
  object.totalPrint = reader.readLongOrNull(offsets[70]);
  object.totalQuoteItem = reader.readLongOrNull(offsets[71]);
  object.totalQuoteQuantity = reader.readDoubleOrNull(offsets[72]);
  object.totalTaxAmount = reader.readDoubleOrNull(offsets[73]);
  object.totalTaxRate = reader.readDoubleOrNull(offsets[74]);
  object.verifyBy = reader.readLongOrNull(offsets[75]);
  object.verifyDate = reader.readDateTimeOrNull(offsets[76]);
  object.wayBillNo = reader.readStringOrNull(offsets[77]);
  object.webStatus = reader.readStringOrNull(offsets[78]);
  return object;
}

P _quoteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readString(offset)) as P;
    case 25:
      return (reader.readString(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readDoubleOrNull(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    case 29:
      return (reader.readLongOrNull(offset)) as P;
    case 30:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readDoubleOrNull(offset)) as P;
    case 36:
      return (reader.readDoubleOrNull(offset)) as P;
    case 37:
      return (reader.readDoubleOrNull(offset)) as P;
    case 38:
      return (reader.readLongOrNull(offset)) as P;
    case 39:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 40:
      return (reader.readLongOrNull(offset)) as P;
    case 41:
      return (reader.readDoubleOrNull(offset)) as P;
    case 42:
      return (reader.readStringOrNull(offset)) as P;
    case 43:
      return (reader.readDoubleOrNull(offset)) as P;
    case 44:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 45:
      return (reader.readStringOrNull(offset)) as P;
    case 46:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 47:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readLongOrNull(offset)) as P;
    case 50:
      return (reader.readDoubleOrNull(offset)) as P;
    case 51:
      return (reader.readStringOrNull(offset)) as P;
    case 52:
      return (reader.readStringOrNull(offset)) as P;
    case 53:
      return (reader.readStringOrNull(offset)) as P;
    case 54:
      return (reader.readStringOrNull(offset)) as P;
    case 55:
      return (reader.readStringOrNull(offset)) as P;
    case 56:
      return (reader.readStringOrNull(offset)) as P;
    case 57:
      return (reader.readStringOrNull(offset)) as P;
    case 58:
      return (reader.readLongOrNull(offset)) as P;
    case 59:
      return (reader.readDoubleOrNull(offset)) as P;
    case 60:
      return (reader.readLongOrNull(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (reader.readStringOrNull(offset)) as P;
    case 63:
      return (reader.readString(offset)) as P;
    case 64:
      return (reader.readStringOrNull(offset)) as P;
    case 65:
      return (reader.readStringOrNull(offset)) as P;
    case 66:
      return (reader.readDoubleOrNull(offset)) as P;
    case 67:
      return (reader.readDoubleOrNull(offset)) as P;
    case 68:
      return (reader.readDoubleOrNull(offset)) as P;
    case 69:
      return (reader.readLongOrNull(offset)) as P;
    case 70:
      return (reader.readLongOrNull(offset)) as P;
    case 71:
      return (reader.readLongOrNull(offset)) as P;
    case 72:
      return (reader.readDoubleOrNull(offset)) as P;
    case 73:
      return (reader.readDoubleOrNull(offset)) as P;
    case 74:
      return (reader.readDoubleOrNull(offset)) as P;
    case 75:
      return (reader.readLongOrNull(offset)) as P;
    case 76:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 77:
      return (reader.readStringOrNull(offset)) as P;
    case 78:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quoteGetId(Quote object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quoteGetLinks(Quote object) {
  return [];
}

void _quoteAttach(IsarCollection<dynamic> col, Id id, Quote object) {
  object.id = id;
}

extension QuoteQueryWhereSort on QueryBuilder<Quote, Quote, QWhere> {
  QueryBuilder<Quote, Quote, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension QuoteQueryWhere on QueryBuilder<Quote, Quote, QWhereClause> {
  QueryBuilder<Quote, Quote, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Quote, Quote, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> idBetween(
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

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeEqualTo(
      int? companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeNotEqualTo(
      int? companyCode) {
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

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeGreaterThan(
    int? companyCode, {
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

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeLessThan(
    int? companyCode, {
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

  QueryBuilder<Quote, Quote, QAfterWhereClause> companyCodeBetween(
    int? lowerCompanyCode,
    int? upperCompanyCode, {
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
}

extension QuoteQueryFilter on QueryBuilder<Quote, Quote, QFilterCondition> {
  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      alternateCompanyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternateCompany',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternateCompany',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      alternateCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alternateDoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternateDoc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> alternateDocIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> approvedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1EqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate1',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentDate1',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentDate1',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate1Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentDate1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2EqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate2',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2GreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentDate2',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2LessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentDate2',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentDate2Between(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentDate2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentPath1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentPath1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      attachmentPath1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attachmentPath2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentPath2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attachmentPath2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      attachmentPath2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attentionRemark',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attentionRemark',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attentionRemark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attentionRemark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> attentionRemarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attentionRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      attentionRemarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attentionRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledByBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> cancelledDateBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeGreaterThan(
    int? value, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeLessThan(
    int? value, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> companyCodeBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveredBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveredBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveredBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> deliveredDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveredDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCurrency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCurrency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCurrencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayCurrencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCurrency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayCustomer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCustomer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayCustomerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayCustomerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayNetAmountEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayNetAmountGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayNetAmountLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayNetAmountBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayQuoteNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayQuoteNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayQuoteNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayQuoteNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayQuoteNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayQuoteNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayQuoteNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuoteNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      displayQuoteNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayQuoteNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> displayStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadPrelabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      downloadPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadPrelabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'downloadPrelabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> downloadPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      downloadPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedNetAmountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedNetAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedNetAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedNetAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedQuoteDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedQuoteDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedQuoteDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> formattedQuoteDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedQuoteDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedQuoteDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuoteDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      formattedQuoteDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedQuoteDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grossAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> grossAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grossAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gstAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gstAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> gstAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gstAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      internalReferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      internalReferenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'internalReference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'internalReference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> internalReferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      internalReferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastModifiedByBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastWriteTimeStampEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastWriteTimeStampLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> lastWriteTimeStampBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'latitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'latitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> latitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeMatches(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'longitude',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'longitude',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> longitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'masterPreLabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'masterPreLabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'masterPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'masterPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masterPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> masterPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'masterPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> netAmountBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherCharges',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherCharges',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      otherChargesRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherChargesRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherChargesRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherChargesRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> otherChargesRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherChargesRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> packDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> pickNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      ppDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppDiscountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      ppDiscountByRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppDiscountByRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ppDiscountByRate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountByRateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      ppDiscountByRateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDiscountRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppDiscountRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ppDueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppDueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeContains(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeMatches(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteExpiry',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteExpiry',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quoteExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quotePreLabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quotePreLabel',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelEqualTo(
    String? value, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelGreaterThan(
    String? value, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelLessThan(
    String? value, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quotePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quotedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quotedBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quotedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quotedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> quotedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quotedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> rateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1EqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1GreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1LessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1Between(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1StartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1EndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2EqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2GreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2LessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2Between(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2StartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2EndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3EqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3GreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3LessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3Between(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3StartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3EndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4EqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4GreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4LessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4Between(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4StartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4EndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref4',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref4IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ref5',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5Contains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5Matches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref5',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> ref5IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remark1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remark2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> remark2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> representativeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      representativeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> representativeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> representativeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> representativeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> representativeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'representativeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> roundingDiscountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      roundingDiscountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> roundingDiscountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roundingDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> roundingDiscountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roundingDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> roundingDiscountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roundingDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> roundingDiscountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roundingDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shipTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shipTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> shipToBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shipTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      sourceLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      sourceLocationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceLocationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      sourceLocationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> sourceLocationCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      sourceLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      sourceLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusDisplay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusDisplay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusDisplay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusDisplay',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> statusDisplayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusDisplay',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeEqualTo(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeGreaterThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeLessThan(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeBetween(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeStartsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeEndsWith(
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

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> syLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'term',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'term',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> termIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalAmountB4GSTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmountB4GST',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalAmountB4GSTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmountB4GST',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalAmountB4GSTEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmountB4GST',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalAmountB4GSTGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmountB4GST',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalAmountB4GSTLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmountB4GST',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalAmountB4GSTBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmountB4GST',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalDiscountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDiscountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalDiscountRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalDiscountRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalDiscountRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalDiscountRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDiscountRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalEditBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEdit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrint',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrint',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrint',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalPrintBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuoteItem',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuoteItem',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuoteItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuoteItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuoteItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteItemBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuoteItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuoteQuantity',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalQuoteQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuoteQuantity',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition>
      totalQuoteQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuoteQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalQuoteQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuoteQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTaxAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTaxAmount',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTaxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTaxRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTaxRate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> totalTaxRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTaxRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verifyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verifyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verifyBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verifyDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verifyDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> verifyDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verifyDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wayBillNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wayBillNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wayBillNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> wayBillNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quote, Quote, QAfterFilterCondition> webStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webStatus',
        value: '',
      ));
    });
  }
}

extension QuoteQueryObject on QueryBuilder<Quote, Quote, QFilterCondition> {}

extension QuoteQueryLinks on QueryBuilder<Quote, Quote, QFilterCondition> {}

extension QuoteQuerySortBy on QueryBuilder<Quote, Quote, QSortBy> {
  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByApprovedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttentionRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByAttentionRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayQuoteNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteNumber', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayQuoteNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteNumber', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDownloadPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByDownloadPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByFormattedNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByFormattedNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByFormattedQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByFormattedQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByMasterPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByMasterPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuoteExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByQuotedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByStatusDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDisplay', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByStatusDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDisplay', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalAmountB4GSTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalQuoteItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByTotalTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> sortByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension QuoteQuerySortThenBy on QueryBuilder<Quote, Quote, QSortThenBy> {
  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByApprovedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttentionRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByAttentionRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCurrency', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayQuoteNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteNumber', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayQuoteNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteNumber', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDownloadPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByDownloadPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByFormattedNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByFormattedNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByFormattedQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByFormattedQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'formattedQuoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByMasterPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByMasterPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuoteExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByQuotedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByStatusDisplay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDisplay', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByStatusDisplayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDisplay', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalAmountB4GSTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalQuoteItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByTotalTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Quote, Quote, QAfterSortBy> thenByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension QuoteQueryWhereDistinct on QueryBuilder<Quote, Quote, QDistinct> {
  QueryBuilder<Quote, Quote, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAlternateCompany(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateCompany',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAlternateDoc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateDoc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate1');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate2');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAttachmentPath1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath1',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAttachmentPath2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath2',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByAttentionRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attentionRemark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDisplayCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCurrency',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDisplayCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCustomer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayNetAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDisplayQuoteNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayQuoteNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDisplayStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByDownloadPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadPrelabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByFormattedNetAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedNetAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByFormattedQuoteDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'formattedQuoteDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByInternalReference(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internalReference',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByMasterPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masterPreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherCharges');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherChargesRate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickNo');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPpDiscountByRate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountByRate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountRate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDueDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByProjectCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteExpiry');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByQuotePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotedBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRef1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRef2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRef3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRef4(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref4', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRef5(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref5', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRemark1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRemark2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'representativeId');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingDiscount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipTo');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctBySourceLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByStatusDisplay(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusDisplay',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctBySyLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTerm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'term', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmountB4GST');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscountAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscountRate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEdit');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrint');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuoteItem');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuoteQuantity');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTaxAmount');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTaxRate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyBy');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyDate');
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByWayBillNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wayBillNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quote, Quote, QDistinct> distinctByWebStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webStatus', caseSensitive: caseSensitive);
    });
  }
}

extension QuoteQueryProperty on QueryBuilder<Quote, Quote, QQueryProperty> {
  QueryBuilder<Quote, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> alternateCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateCompany');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> alternateDocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateDoc');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> approvedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> approvedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedDate');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> attachmentDate1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate1');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> attachmentDate2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate2');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> attachmentPath1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath1');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> attachmentPath2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath2');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> attentionRemarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attentionRemark');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> deliveredByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> deliveredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredDate');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> displayCurrencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCurrency');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> displayCustomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCustomer');
    });
  }

  QueryBuilder<Quote, double, QQueryOperations> displayNetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayNetAmount');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> displayQuoteNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayQuoteNumber');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> displayStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayStatus');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> downloadPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadPrelabel');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> formattedNetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedNetAmount');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> formattedQuoteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'formattedQuoteDate');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> gstAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstAmount');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> internalReferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internalReference');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> masterPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masterPreLabel');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> otherChargesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherCharges');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> otherChargesRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherChargesRate');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> packByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> packDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packDate');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> pickNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickNo');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> ppDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ppDiscountByRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountByRate');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> ppDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountRate');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> ppDueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDueDate');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> quoteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteDate');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> quoteExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteExpiry');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> quotePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotePreLabel');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> quotedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotedBy');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ref1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref1');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ref2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref2');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ref3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref3');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ref4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref4');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> ref5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref5');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> remark1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark1');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> remark2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark2');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> representativeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'representativeId');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> roundingDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingDiscount');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> shipToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipTo');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> sourceLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceLocationCode');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Quote, String, QQueryOperations> statusDisplayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusDisplay');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> syLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syLocationCode');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> termProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'term');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalAmountB4GSTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmountB4GST');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscountAmount');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscountRate');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> totalEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEdit');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> totalPrintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrint');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> totalQuoteItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuoteItem');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalQuoteQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuoteQuantity');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalTaxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTaxAmount');
    });
  }

  QueryBuilder<Quote, double?, QQueryOperations> totalTaxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTaxRate');
    });
  }

  QueryBuilder<Quote, int?, QQueryOperations> verifyByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyBy');
    });
  }

  QueryBuilder<Quote, DateTime?, QQueryOperations> verifyDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyDate');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> wayBillNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wayBillNo');
    });
  }

  QueryBuilder<Quote, String?, QQueryOperations> webStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webStatus');
    });
  }
}
