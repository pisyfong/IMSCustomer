// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuotationCollection on Isar {
  IsarCollection<Quotation> get quotations => this.collection();
}

const QuotationSchema = CollectionSchema(
  name: r'Quotation',
  id: 2463763974630018153,
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
    r'displayCustomer': PropertySchema(
      id: 18,
      name: r'displayCustomer',
      type: IsarType.string,
    ),
    r'displayNetAmount': PropertySchema(
      id: 19,
      name: r'displayNetAmount',
      type: IsarType.string,
    ),
    r'displayQuoteDate': PropertySchema(
      id: 20,
      name: r'displayQuoteDate',
      type: IsarType.string,
    ),
    r'displayQuotePreLabel': PropertySchema(
      id: 21,
      name: r'displayQuotePreLabel',
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
    r'grossAmount': PropertySchema(
      id: 24,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'gstAmount': PropertySchema(
      id: 25,
      name: r'gstAmount',
      type: IsarType.double,
    ),
    r'internalReference': PropertySchema(
      id: 26,
      name: r'internalReference',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 27,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 28,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastSyncAttempt': PropertySchema(
      id: 29,
      name: r'lastSyncAttempt',
      type: IsarType.dateTime,
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
    r'syLocationCode': PropertySchema(
      id: 63,
      name: r'syLocationCode',
      type: IsarType.string,
    ),
    r'syncError': PropertySchema(
      id: 64,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'term': PropertySchema(
      id: 65,
      name: r'term',
      type: IsarType.string,
    ),
    r'totalAmountB4Gst': PropertySchema(
      id: 66,
      name: r'totalAmountB4Gst',
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
  estimateSize: _quotationEstimateSize,
  serialize: _quotationSerialize,
  deserialize: _quotationDeserialize,
  deserializeProp: _quotationDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_quotePreLabel': IndexSchema(
      id: 466275583628153473,
      name: r'companyCode_quotePreLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'quotePreLabel',
          type: IndexType.hash,
          caseSensitive: true,
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
    ),
    r'isSynced': IndexSchema(
      id: -39763503327887510,
      name: r'isSynced',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isSynced',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _quotationGetId,
  getLinks: _quotationGetLinks,
  attach: _quotationAttach,
  version: '3.1.0+1',
);

int _quotationEstimateSize(
  Quotation object,
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
  bytesCount += 3 + object.displayCustomer.length * 3;
  bytesCount += 3 + object.displayNetAmount.length * 3;
  bytesCount += 3 + object.displayQuoteDate.length * 3;
  bytesCount += 3 + object.displayQuotePreLabel.length * 3;
  bytesCount += 3 + object.displayStatus.length * 3;
  {
    final value = object.downloadPrelabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  bytesCount += 3 + object.quotePreLabel.length * 3;
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
  {
    final value = object.syLocationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.syncError;
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

void _quotationSerialize(
  Quotation object,
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
  writer.writeString(offsets[18], object.displayCustomer);
  writer.writeString(offsets[19], object.displayNetAmount);
  writer.writeString(offsets[20], object.displayQuoteDate);
  writer.writeString(offsets[21], object.displayQuotePreLabel);
  writer.writeString(offsets[22], object.displayStatus);
  writer.writeString(offsets[23], object.downloadPrelabel);
  writer.writeDouble(offsets[24], object.grossAmount);
  writer.writeDouble(offsets[25], object.gstAmount);
  writer.writeString(offsets[26], object.internalReference);
  writer.writeBool(offsets[27], object.isSynced);
  writer.writeLong(offsets[28], object.lastModifiedBy);
  writer.writeDateTime(offsets[29], object.lastSyncAttempt);
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
  writer.writeString(offsets[63], object.syLocationCode);
  writer.writeString(offsets[64], object.syncError);
  writer.writeString(offsets[65], object.term);
  writer.writeDouble(offsets[66], object.totalAmountB4Gst);
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

Quotation _quotationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Quotation();
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
  object.companyCode = reader.readLong(offsets[13]);
  object.currency = reader.readStringOrNull(offsets[14]);
  object.customer = reader.readStringOrNull(offsets[15]);
  object.deliveredBy = reader.readLongOrNull(offsets[16]);
  object.deliveredDate = reader.readDateTimeOrNull(offsets[17]);
  object.downloadPrelabel = reader.readStringOrNull(offsets[23]);
  object.grossAmount = reader.readDoubleOrNull(offsets[24]);
  object.gstAmount = reader.readDoubleOrNull(offsets[25]);
  object.id = id;
  object.internalReference = reader.readStringOrNull(offsets[26]);
  object.isSynced = reader.readBool(offsets[27]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[28]);
  object.lastSyncAttempt = reader.readDateTimeOrNull(offsets[29]);
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
  object.quotePreLabel = reader.readString(offsets[48]);
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
  object.syLocationCode = reader.readStringOrNull(offsets[63]);
  object.syncError = reader.readStringOrNull(offsets[64]);
  object.term = reader.readStringOrNull(offsets[65]);
  object.totalAmountB4Gst = reader.readDoubleOrNull(offsets[66]);
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

P _quotationDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
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
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readBool(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readDateTimeOrNull(offset)) as P;
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
      return (reader.readString(offset)) as P;
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
      return (reader.readStringOrNull(offset)) as P;
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

Id _quotationGetId(Quotation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quotationGetLinks(Quotation object) {
  return [];
}

void _quotationAttach(IsarCollection<dynamic> col, Id id, Quotation object) {
  object.id = id;
}

extension QuotationQueryWhereSort
    on QueryBuilder<Quotation, Quotation, QWhere> {
  QueryBuilder<Quotation, Quotation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhere> anyIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSynced'),
      );
    });
  }
}

extension QuotationQueryWhere
    on QueryBuilder<Quotation, Quotation, QWhereClause> {
  QueryBuilder<Quotation, Quotation, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> idBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeEqualToAnyQuotePreLabel(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_quotePreLabel',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeNotEqualToAnyQuotePreLabel(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeGreaterThanAnyQuotePreLabel(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_quotePreLabel',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeLessThanAnyQuotePreLabel(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_quotePreLabel',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeBetweenAnyQuotePreLabel(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_quotePreLabel',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeQuotePreLabelEqualTo(int companyCode, String quotePreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_quotePreLabel',
        value: [companyCode, quotePreLabel],
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause>
      companyCodeEqualToQuotePreLabelNotEqualTo(
          int companyCode, String quotePreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode],
              upper: [companyCode, quotePreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode, quotePreLabel],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode, quotePreLabel],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_quotePreLabel',
              lower: [companyCode],
              upper: [companyCode, quotePreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> quotePreLabelEqualTo(
      String quotePreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'quotePreLabel',
        value: [quotePreLabel],
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> quotePreLabelNotEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> isSyncedEqualTo(
      bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isSynced',
        value: [isSynced],
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterWhereClause> isSyncedNotEqualTo(
      bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [isSynced],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isSynced',
              lower: [],
              upper: [isSynced],
              includeUpper: false,
            ));
      }
    });
  }
}

extension QuotationQueryFilter
    on QueryBuilder<Quotation, Quotation, QFilterCondition> {
  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternateCompany',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> alternateDocEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> alternateDocBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> alternateDocMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      alternateDocIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      approvedDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> approvedDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1EqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate1',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate1Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2EqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate2',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentDate2Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentPath1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentPath1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attachmentPath2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attachmentPath2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attachmentPath2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attentionRemark',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attentionRemark',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attentionRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attentionRemark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attentionRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      attentionRemarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attentionRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> cancelledByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> cancelledByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> cancelledByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      cancelledDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> companyCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      currencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      customerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> deliveredByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> deliveredByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> deliveredByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      deliveredDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayCustomer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayCustomerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayNetAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayNetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayNetAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayNetAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayNetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayQuoteDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayQuoteDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayQuoteDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuoteDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuoteDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayQuoteDate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayQuotePreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayQuotePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayQuotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayQuotePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayQuotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      displayStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'downloadPrelabel',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'downloadPrelabel',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'downloadPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'downloadPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'downloadPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      downloadPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'downloadPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      grossAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      grossAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> grossAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      grossAmountGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> grossAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> grossAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> gstAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      gstAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> gstAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      gstAmountGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> gstAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> gstAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'internalReference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      internalReferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastModifiedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAttempt',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAttempt',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAttempt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncAttempt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncAttempt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastSyncAttemptBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncAttempt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> latitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      latitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> locationCodeEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> locationCodeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> locationCodeMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      longitudeGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> longitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      longitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'masterPreLabel',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'masterPreLabel',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'masterPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'masterPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masterPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      masterPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'masterPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> netAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      netAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> netAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> netAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> netAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> otherChargesEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> otherChargesBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      otherChargesRateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      packDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> packDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> pickNoBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ppDiscountByRate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountByRateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDiscountRateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ppDueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ppDueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      ppDueDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ppDueDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ppDueDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      projectCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      projectCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> projectCodeMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quoteDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quoteDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quoteExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quoteExpiry',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quoteExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quoteExpiry',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteExpiryEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quoteExpiryGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteExpiryLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quoteExpiryBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quotePreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quotePreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quotePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quotePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quotePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quotedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quotedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      quotedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quotedBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quotedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quotedByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quotedByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> quotedByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> rateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref4',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref4IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ref5',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ref5',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> ref5IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1Contains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      remark1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2EqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2GreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2LessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2Between(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2StartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2EndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2Contains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2Matches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> remark2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      remark2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      representativeIdBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      roundingDiscountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> shipToBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      sourceLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncError',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncError',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syncErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syncError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncError',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncError',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'term',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> termIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmountB4Gst',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmountB4Gst',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmountB4Gst',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmountB4Gst',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmountB4Gst',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalAmountB4GstBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmountB4Gst',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalDiscountAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalDiscountRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalDiscountRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountRateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountRateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalDiscountRateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalEditIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalEditIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalEditEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalEditGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalEditLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalEditBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalPrintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalPrintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalPrintEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrint',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalPrintGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalPrintLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalPrintBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuoteItem',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuoteItem',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuoteItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteItemBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalQuoteQuantity',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalQuoteQuantity',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteQuantityEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteQuantityLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalQuoteQuantityBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTaxAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTaxAmount',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxAmountBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTaxRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTaxRate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalTaxRateEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxRateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      totalTaxRateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> totalTaxRateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      verifyByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyByGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyByLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyByBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      verifyDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      verifyDateGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyDateLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> verifyDateBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      wayBillNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      wayBillNoGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> wayBillNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      wayBillNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      webStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusEqualTo(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      webStatusGreaterThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusLessThan(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusBetween(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusStartsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusEndsWith(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusContains(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusMatches(
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

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition> webStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterFilterCondition>
      webStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webStatus',
        value: '',
      ));
    });
  }
}

extension QuotationQueryObject
    on QueryBuilder<Quotation, Quotation, QFilterCondition> {}

extension QuotationQueryLinks
    on QueryBuilder<Quotation, Quotation, QFilterCondition> {}

extension QuotationQuerySortBy on QueryBuilder<Quotation, Quotation, QSortBy> {
  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByApprovedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttentionRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByAttentionRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByDisplayQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByDisplayQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByDisplayQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByDownloadPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByDownloadPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLastSyncAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAttempt', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLastSyncAttemptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAttempt', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByMasterPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByMasterPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuoteExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByQuotedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalAmountB4Gst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4Gst', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByTotalAmountB4GstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4Gst', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByTotalDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByTotalDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalQuoteItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      sortByTotalQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByTotalTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> sortByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension QuotationQuerySortThenBy
    on QueryBuilder<Quotation, Quotation, QSortThenBy> {
  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByApprovedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByApprovedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttentionRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByAttentionRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attentionRemark', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayCustomer', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByDisplayNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayNetAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByDisplayQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByDisplayQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByDisplayQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayQuotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDisplayStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayStatus', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByDownloadPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByDownloadPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'downloadPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLastSyncAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAttempt', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLastSyncAttemptDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAttempt', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByMasterPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByMasterPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masterPreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuoteDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuoteExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteExpiry', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByQuotedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotedBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalAmountB4Gst() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4Gst', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByTotalAmountB4GstDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4Gst', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByTotalDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByTotalDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalQuoteItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteItem', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy>
      thenByTotalQuoteQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuoteQuantity', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByTotalTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Quotation, Quotation, QAfterSortBy> thenByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension QuotationQueryWhereDistinct
    on QueryBuilder<Quotation, Quotation, QDistinct> {
  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAlternateCompany(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateCompany',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAlternateDoc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateDoc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByApprovedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByApprovedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate1');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate2');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAttachmentPath1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath1',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAttachmentPath2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath2',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByAttentionRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attentionRemark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDisplayCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayCustomer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDisplayNetAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayNetAmount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDisplayQuoteDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayQuoteDate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDisplayQuotePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayQuotePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDisplayStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByDownloadPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'downloadPrelabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByInternalReference(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internalReference',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLastSyncAttempt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAttempt');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByMasterPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masterPreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherCharges');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherChargesRate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickNo');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPpDiscountByRate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountByRate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountRate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDueDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByProjectCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByQuoteDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByQuoteExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteExpiry');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByQuotePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByQuotedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotedBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRef1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRef2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRef3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRef4(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref4', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRef5(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref5', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRemark1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRemark2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'representativeId');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingDiscount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipTo');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctBySourceLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctBySyLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctBySyncError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTerm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'term', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalAmountB4Gst() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmountB4Gst');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct>
      distinctByTotalDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscountAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDiscountRate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEdit');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrint');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalQuoteItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuoteItem');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalQuoteQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuoteQuantity');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTaxAmount');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByTotalTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTaxRate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyBy');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyDate');
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByWayBillNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wayBillNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quotation, Quotation, QDistinct> distinctByWebStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webStatus', caseSensitive: caseSensitive);
    });
  }
}

extension QuotationQueryProperty
    on QueryBuilder<Quotation, Quotation, QQueryProperty> {
  QueryBuilder<Quotation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations>
      alternateCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateCompany');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> alternateDocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateDoc');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> approvedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> approvedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedDate');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations>
      attachmentDate1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate1');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations>
      attachmentDate2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate2');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> attachmentPath1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath1');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> attachmentPath2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath2');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> attentionRemarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attentionRemark');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<Quotation, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> deliveredByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> deliveredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredDate');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations> displayCustomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayCustomer');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations> displayNetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayNetAmount');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations> displayQuoteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayQuoteDate');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations>
      displayQuotePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayQuotePreLabel');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations> displayStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayStatus');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations>
      downloadPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'downloadPrelabel');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> gstAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstAmount');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations>
      internalReferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internalReference');
    });
  }

  QueryBuilder<Quotation, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations>
      lastSyncAttemptProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAttempt');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> masterPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masterPreLabel');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> otherChargesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherCharges');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      otherChargesRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherChargesRate');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> packByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> packDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packDate');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> pickNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickNo');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      ppDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations>
      ppDiscountByRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountByRate');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> ppDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountRate');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> ppDueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDueDate');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> quoteDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteDate');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> quoteExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteExpiry');
    });
  }

  QueryBuilder<Quotation, String, QQueryOperations> quotePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotePreLabel');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> quotedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotedBy');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> ref1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref1');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> ref2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref2');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> ref3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref3');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> ref4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref4');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> ref5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref5');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> remark1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark1');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> remark2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark2');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> representativeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'representativeId');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      roundingDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingDiscount');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> shipToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipTo');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations>
      sourceLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceLocationCode');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> syLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syLocationCode');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> termProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'term');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      totalAmountB4GstProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmountB4Gst');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      totalDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscountAmount');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      totalDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDiscountRate');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> totalEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEdit');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> totalPrintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrint');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> totalQuoteItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuoteItem');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations>
      totalQuoteQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuoteQuantity');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> totalTaxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTaxAmount');
    });
  }

  QueryBuilder<Quotation, double?, QQueryOperations> totalTaxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTaxRate');
    });
  }

  QueryBuilder<Quotation, int?, QQueryOperations> verifyByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyBy');
    });
  }

  QueryBuilder<Quotation, DateTime?, QQueryOperations> verifyDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyDate');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> wayBillNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wayBillNo');
    });
  }

  QueryBuilder<Quotation, String?, QQueryOperations> webStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webStatus');
    });
  }
}
