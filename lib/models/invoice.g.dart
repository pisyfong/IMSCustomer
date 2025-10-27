// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvoiceCollection on Isar {
  IsarCollection<Invoice> get invoices => this.collection();
}

const InvoiceSchema = CollectionSchema(
  name: r'Invoice',
  id: -341399436017629,
  properties: {
    r'accEntryReference': PropertySchema(
      id: 0,
      name: r'accEntryReference',
      type: IsarType.string,
    ),
    r'accPostedBy': PropertySchema(
      id: 1,
      name: r'accPostedBy',
      type: IsarType.long,
    ),
    r'accPostedDate': PropertySchema(
      id: 2,
      name: r'accPostedDate',
      type: IsarType.dateTime,
    ),
    r'addedBy': PropertySchema(
      id: 3,
      name: r'addedBy',
      type: IsarType.long,
    ),
    r'addedDate': PropertySchema(
      id: 4,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'adjustmentPrelabel': PropertySchema(
      id: 5,
      name: r'adjustmentPrelabel',
      type: IsarType.string,
    ),
    r'allowDiscountNote': PropertySchema(
      id: 6,
      name: r'allowDiscountNote',
      type: IsarType.string,
    ),
    r'alternateCompany': PropertySchema(
      id: 7,
      name: r'alternateCompany',
      type: IsarType.string,
    ),
    r'alternateDoc': PropertySchema(
      id: 8,
      name: r'alternateDoc',
      type: IsarType.string,
    ),
    r'appDLPrelabel': PropertySchema(
      id: 9,
      name: r'appDLPrelabel',
      type: IsarType.string,
    ),
    r'attachmentDate1': PropertySchema(
      id: 10,
      name: r'attachmentDate1',
      type: IsarType.dateTime,
    ),
    r'attachmentDate2': PropertySchema(
      id: 11,
      name: r'attachmentDate2',
      type: IsarType.dateTime,
    ),
    r'attachmentPath1': PropertySchema(
      id: 12,
      name: r'attachmentPath1',
      type: IsarType.string,
    ),
    r'attachmentPath2': PropertySchema(
      id: 13,
      name: r'attachmentPath2',
      type: IsarType.string,
    ),
    r'batchNo': PropertySchema(
      id: 14,
      name: r'batchNo',
      type: IsarType.long,
    ),
    r'cancelPosted': PropertySchema(
      id: 15,
      name: r'cancelPosted',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 16,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'currency': PropertySchema(
      id: 17,
      name: r'currency',
      type: IsarType.string,
    ),
    r'customer': PropertySchema(
      id: 18,
      name: r'customer',
      type: IsarType.string,
    ),
    r'deliveredBy': PropertySchema(
      id: 19,
      name: r'deliveredBy',
      type: IsarType.long,
    ),
    r'deliveredDate': PropertySchema(
      id: 20,
      name: r'deliveredDate',
      type: IsarType.dateTime,
    ),
    r'dueDate': PropertySchema(
      id: 21,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'dueDateByDelivered': PropertySchema(
      id: 22,
      name: r'dueDateByDelivered',
      type: IsarType.string,
    ),
    r'grossAmount': PropertySchema(
      id: 23,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'gstAmount': PropertySchema(
      id: 24,
      name: r'gstAmount',
      type: IsarType.double,
    ),
    r'imsPostedBy': PropertySchema(
      id: 25,
      name: r'imsPostedBy',
      type: IsarType.long,
    ),
    r'imsPostedDate': PropertySchema(
      id: 26,
      name: r'imsPostedDate',
      type: IsarType.dateTime,
    ),
    r'internalReference': PropertySchema(
      id: 27,
      name: r'internalReference',
      type: IsarType.string,
    ),
    r'invoiceDate': PropertySchema(
      id: 28,
      name: r'invoiceDate',
      type: IsarType.dateTime,
    ),
    r'invoiceDiscountAmount': PropertySchema(
      id: 29,
      name: r'invoiceDiscountAmount',
      type: IsarType.double,
    ),
    r'invoiceDiscountRate': PropertySchema(
      id: 30,
      name: r'invoiceDiscountRate',
      type: IsarType.double,
    ),
    r'invoicePreLabel': PropertySchema(
      id: 31,
      name: r'invoicePreLabel',
      type: IsarType.string,
    ),
    r'invoiceTaxAmount': PropertySchema(
      id: 32,
      name: r'invoiceTaxAmount',
      type: IsarType.double,
    ),
    r'invoiceTaxRate': PropertySchema(
      id: 33,
      name: r'invoiceTaxRate',
      type: IsarType.double,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 34,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastModifiedDate': PropertySchema(
      id: 35,
      name: r'lastModifiedDate',
      type: IsarType.dateTime,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 36,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'latitude': PropertySchema(
      id: 37,
      name: r'latitude',
      type: IsarType.string,
    ),
    r'linkAccount': PropertySchema(
      id: 38,
      name: r'linkAccount',
      type: IsarType.string,
    ),
    r'locationCode': PropertySchema(
      id: 39,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'longitude': PropertySchema(
      id: 40,
      name: r'longitude',
      type: IsarType.string,
    ),
    r'netAmount': PropertySchema(
      id: 41,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'otherCharges': PropertySchema(
      id: 42,
      name: r'otherCharges',
      type: IsarType.double,
    ),
    r'otherChargesRate': PropertySchema(
      id: 43,
      name: r'otherChargesRate',
      type: IsarType.double,
    ),
    r'packBy': PropertySchema(
      id: 44,
      name: r'packBy',
      type: IsarType.long,
    ),
    r'packDate': PropertySchema(
      id: 45,
      name: r'packDate',
      type: IsarType.dateTime,
    ),
    r'pickNo': PropertySchema(
      id: 46,
      name: r'pickNo',
      type: IsarType.long,
    ),
    r'ppDiscountAmount': PropertySchema(
      id: 47,
      name: r'ppDiscountAmount',
      type: IsarType.double,
    ),
    r'ppDiscountByRate': PropertySchema(
      id: 48,
      name: r'ppDiscountByRate',
      type: IsarType.string,
    ),
    r'ppDiscountRate': PropertySchema(
      id: 49,
      name: r'ppDiscountRate',
      type: IsarType.double,
    ),
    r'ppDueDate': PropertySchema(
      id: 50,
      name: r'ppDueDate',
      type: IsarType.dateTime,
    ),
    r'ppDueDateByDelivered': PropertySchema(
      id: 51,
      name: r'ppDueDateByDelivered',
      type: IsarType.string,
    ),
    r'projectCode': PropertySchema(
      id: 52,
      name: r'projectCode',
      type: IsarType.string,
    ),
    r'rate': PropertySchema(
      id: 53,
      name: r'rate',
      type: IsarType.double,
    ),
    r'recurDeposit': PropertySchema(
      id: 54,
      name: r'recurDeposit',
      type: IsarType.double,
    ),
    r'recurInvoice': PropertySchema(
      id: 55,
      name: r'recurInvoice',
      type: IsarType.string,
    ),
    r'ref1': PropertySchema(
      id: 56,
      name: r'ref1',
      type: IsarType.string,
    ),
    r'ref2': PropertySchema(
      id: 57,
      name: r'ref2',
      type: IsarType.string,
    ),
    r'ref3': PropertySchema(
      id: 58,
      name: r'ref3',
      type: IsarType.string,
    ),
    r'ref4': PropertySchema(
      id: 59,
      name: r'ref4',
      type: IsarType.string,
    ),
    r'ref5': PropertySchema(
      id: 60,
      name: r'ref5',
      type: IsarType.string,
    ),
    r'remark1': PropertySchema(
      id: 61,
      name: r'remark1',
      type: IsarType.string,
    ),
    r'remark2': PropertySchema(
      id: 62,
      name: r'remark2',
      type: IsarType.string,
    ),
    r'representativeId': PropertySchema(
      id: 63,
      name: r'representativeId',
      type: IsarType.long,
    ),
    r'roundingDiscount': PropertySchema(
      id: 64,
      name: r'roundingDiscount',
      type: IsarType.double,
    ),
    r'shipTo': PropertySchema(
      id: 65,
      name: r'shipTo',
      type: IsarType.long,
    ),
    r'sourceLocationCode': PropertySchema(
      id: 66,
      name: r'sourceLocationCode',
      type: IsarType.string,
    ),
    r'srPrelabel': PropertySchema(
      id: 67,
      name: r'srPrelabel',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 68,
      name: r'status',
      type: IsarType.string,
    ),
    r'syLocationCode': PropertySchema(
      id: 69,
      name: r'syLocationCode',
      type: IsarType.string,
    ),
    r'terms': PropertySchema(
      id: 70,
      name: r'terms',
      type: IsarType.string,
    ),
    r'totalAmountB4GST': PropertySchema(
      id: 71,
      name: r'totalAmountB4GST',
      type: IsarType.double,
    ),
    r'totalEdit': PropertySchema(
      id: 72,
      name: r'totalEdit',
      type: IsarType.long,
    ),
    r'totalInvoiceEntry': PropertySchema(
      id: 73,
      name: r'totalInvoiceEntry',
      type: IsarType.long,
    ),
    r'totalInvoiceQuantity': PropertySchema(
      id: 74,
      name: r'totalInvoiceQuantity',
      type: IsarType.double,
    ),
    r'totalPrint': PropertySchema(
      id: 75,
      name: r'totalPrint',
      type: IsarType.long,
    ),
    r'transfer': PropertySchema(
      id: 76,
      name: r'transfer',
      type: IsarType.string,
    ),
    r'verifyBy': PropertySchema(
      id: 77,
      name: r'verifyBy',
      type: IsarType.long,
    ),
    r'verifyDate': PropertySchema(
      id: 78,
      name: r'verifyDate',
      type: IsarType.dateTime,
    ),
    r'voidedBy': PropertySchema(
      id: 79,
      name: r'voidedBy',
      type: IsarType.long,
    ),
    r'voidedDate': PropertySchema(
      id: 80,
      name: r'voidedDate',
      type: IsarType.dateTime,
    ),
    r'wayBillNo': PropertySchema(
      id: 81,
      name: r'wayBillNo',
      type: IsarType.string,
    ),
    r'webLinkPrelabel': PropertySchema(
      id: 82,
      name: r'webLinkPrelabel',
      type: IsarType.string,
    ),
    r'webSI': PropertySchema(
      id: 83,
      name: r'webSI',
      type: IsarType.string,
    ),
    r'webStatus': PropertySchema(
      id: 84,
      name: r'webStatus',
      type: IsarType.string,
    )
  },
  estimateSize: _invoiceEstimateSize,
  serialize: _invoiceSerialize,
  deserialize: _invoiceDeserialize,
  deserializeProp: _invoiceDeserializeProp,
  idName: r'id',
  indexes: {
    r'invoicePreLabel_companyCode': IndexSchema(
      id: 3321615571119609637,
      name: r'invoicePreLabel_companyCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'invoicePreLabel',
          type: IndexType.hash,
          caseSensitive: true,
        ),
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
  getId: _invoiceGetId,
  getLinks: _invoiceGetLinks,
  attach: _invoiceAttach,
  version: '3.1.0+1',
);

int _invoiceEstimateSize(
  Invoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accEntryReference;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.adjustmentPrelabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.allowDiscountNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.appDLPrelabel;
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
    final value = object.cancelPosted;
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
  {
    final value = object.dueDateByDelivered;
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
  bytesCount += 3 + object.invoicePreLabel.length * 3;
  {
    final value = object.latitude;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.linkAccount;
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
    final value = object.ppDiscountByRate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ppDueDateByDelivered;
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
    final value = object.recurInvoice;
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
    final value = object.srPrelabel;
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
    final value = object.terms;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transfer;
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
    final value = object.webLinkPrelabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webSI;
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

void _invoiceSerialize(
  Invoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accEntryReference);
  writer.writeLong(offsets[1], object.accPostedBy);
  writer.writeDateTime(offsets[2], object.accPostedDate);
  writer.writeLong(offsets[3], object.addedBy);
  writer.writeDateTime(offsets[4], object.addedDate);
  writer.writeString(offsets[5], object.adjustmentPrelabel);
  writer.writeString(offsets[6], object.allowDiscountNote);
  writer.writeString(offsets[7], object.alternateCompany);
  writer.writeString(offsets[8], object.alternateDoc);
  writer.writeString(offsets[9], object.appDLPrelabel);
  writer.writeDateTime(offsets[10], object.attachmentDate1);
  writer.writeDateTime(offsets[11], object.attachmentDate2);
  writer.writeString(offsets[12], object.attachmentPath1);
  writer.writeString(offsets[13], object.attachmentPath2);
  writer.writeLong(offsets[14], object.batchNo);
  writer.writeString(offsets[15], object.cancelPosted);
  writer.writeLong(offsets[16], object.companyCode);
  writer.writeString(offsets[17], object.currency);
  writer.writeString(offsets[18], object.customer);
  writer.writeLong(offsets[19], object.deliveredBy);
  writer.writeDateTime(offsets[20], object.deliveredDate);
  writer.writeDateTime(offsets[21], object.dueDate);
  writer.writeString(offsets[22], object.dueDateByDelivered);
  writer.writeDouble(offsets[23], object.grossAmount);
  writer.writeDouble(offsets[24], object.gstAmount);
  writer.writeLong(offsets[25], object.imsPostedBy);
  writer.writeDateTime(offsets[26], object.imsPostedDate);
  writer.writeString(offsets[27], object.internalReference);
  writer.writeDateTime(offsets[28], object.invoiceDate);
  writer.writeDouble(offsets[29], object.invoiceDiscountAmount);
  writer.writeDouble(offsets[30], object.invoiceDiscountRate);
  writer.writeString(offsets[31], object.invoicePreLabel);
  writer.writeDouble(offsets[32], object.invoiceTaxAmount);
  writer.writeDouble(offsets[33], object.invoiceTaxRate);
  writer.writeLong(offsets[34], object.lastModifiedBy);
  writer.writeDateTime(offsets[35], object.lastModifiedDate);
  writer.writeDateTime(offsets[36], object.lastWriteTimeStamp);
  writer.writeString(offsets[37], object.latitude);
  writer.writeString(offsets[38], object.linkAccount);
  writer.writeString(offsets[39], object.locationCode);
  writer.writeString(offsets[40], object.longitude);
  writer.writeDouble(offsets[41], object.netAmount);
  writer.writeDouble(offsets[42], object.otherCharges);
  writer.writeDouble(offsets[43], object.otherChargesRate);
  writer.writeLong(offsets[44], object.packBy);
  writer.writeDateTime(offsets[45], object.packDate);
  writer.writeLong(offsets[46], object.pickNo);
  writer.writeDouble(offsets[47], object.ppDiscountAmount);
  writer.writeString(offsets[48], object.ppDiscountByRate);
  writer.writeDouble(offsets[49], object.ppDiscountRate);
  writer.writeDateTime(offsets[50], object.ppDueDate);
  writer.writeString(offsets[51], object.ppDueDateByDelivered);
  writer.writeString(offsets[52], object.projectCode);
  writer.writeDouble(offsets[53], object.rate);
  writer.writeDouble(offsets[54], object.recurDeposit);
  writer.writeString(offsets[55], object.recurInvoice);
  writer.writeString(offsets[56], object.ref1);
  writer.writeString(offsets[57], object.ref2);
  writer.writeString(offsets[58], object.ref3);
  writer.writeString(offsets[59], object.ref4);
  writer.writeString(offsets[60], object.ref5);
  writer.writeString(offsets[61], object.remark1);
  writer.writeString(offsets[62], object.remark2);
  writer.writeLong(offsets[63], object.representativeId);
  writer.writeDouble(offsets[64], object.roundingDiscount);
  writer.writeLong(offsets[65], object.shipTo);
  writer.writeString(offsets[66], object.sourceLocationCode);
  writer.writeString(offsets[67], object.srPrelabel);
  writer.writeString(offsets[68], object.status);
  writer.writeString(offsets[69], object.syLocationCode);
  writer.writeString(offsets[70], object.terms);
  writer.writeDouble(offsets[71], object.totalAmountB4GST);
  writer.writeLong(offsets[72], object.totalEdit);
  writer.writeLong(offsets[73], object.totalInvoiceEntry);
  writer.writeDouble(offsets[74], object.totalInvoiceQuantity);
  writer.writeLong(offsets[75], object.totalPrint);
  writer.writeString(offsets[76], object.transfer);
  writer.writeLong(offsets[77], object.verifyBy);
  writer.writeDateTime(offsets[78], object.verifyDate);
  writer.writeLong(offsets[79], object.voidedBy);
  writer.writeDateTime(offsets[80], object.voidedDate);
  writer.writeString(offsets[81], object.wayBillNo);
  writer.writeString(offsets[82], object.webLinkPrelabel);
  writer.writeString(offsets[83], object.webSI);
  writer.writeString(offsets[84], object.webStatus);
}

Invoice _invoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Invoice(
    accEntryReference: reader.readStringOrNull(offsets[0]),
    accPostedBy: reader.readLongOrNull(offsets[1]),
    accPostedDate: reader.readDateTimeOrNull(offsets[2]),
    addedBy: reader.readLongOrNull(offsets[3]),
    addedDate: reader.readDateTimeOrNull(offsets[4]),
    adjustmentPrelabel: reader.readStringOrNull(offsets[5]),
    allowDiscountNote: reader.readStringOrNull(offsets[6]),
    alternateCompany: reader.readStringOrNull(offsets[7]),
    alternateDoc: reader.readStringOrNull(offsets[8]),
    appDLPrelabel: reader.readStringOrNull(offsets[9]),
    attachmentDate1: reader.readDateTimeOrNull(offsets[10]),
    attachmentDate2: reader.readDateTimeOrNull(offsets[11]),
    attachmentPath1: reader.readStringOrNull(offsets[12]),
    attachmentPath2: reader.readStringOrNull(offsets[13]),
    batchNo: reader.readLongOrNull(offsets[14]),
    cancelPosted: reader.readStringOrNull(offsets[15]),
    companyCode: reader.readLong(offsets[16]),
    currency: reader.readStringOrNull(offsets[17]),
    customer: reader.readStringOrNull(offsets[18]),
    deliveredBy: reader.readLongOrNull(offsets[19]),
    deliveredDate: reader.readDateTimeOrNull(offsets[20]),
    dueDate: reader.readDateTimeOrNull(offsets[21]),
    dueDateByDelivered: reader.readStringOrNull(offsets[22]),
    grossAmount: reader.readDoubleOrNull(offsets[23]),
    gstAmount: reader.readDoubleOrNull(offsets[24]),
    imsPostedBy: reader.readLongOrNull(offsets[25]),
    imsPostedDate: reader.readDateTimeOrNull(offsets[26]),
    internalReference: reader.readStringOrNull(offsets[27]),
    invoiceDate: reader.readDateTimeOrNull(offsets[28]),
    invoiceDiscountAmount: reader.readDoubleOrNull(offsets[29]),
    invoiceDiscountRate: reader.readDoubleOrNull(offsets[30]),
    invoicePreLabel: reader.readString(offsets[31]),
    invoiceTaxAmount: reader.readDoubleOrNull(offsets[32]),
    invoiceTaxRate: reader.readDoubleOrNull(offsets[33]),
    lastModifiedBy: reader.readLongOrNull(offsets[34]),
    lastModifiedDate: reader.readDateTimeOrNull(offsets[35]),
    lastWriteTimeStamp: reader.readDateTimeOrNull(offsets[36]),
    latitude: reader.readStringOrNull(offsets[37]),
    linkAccount: reader.readStringOrNull(offsets[38]),
    locationCode: reader.readStringOrNull(offsets[39]),
    longitude: reader.readStringOrNull(offsets[40]),
    netAmount: reader.readDoubleOrNull(offsets[41]),
    otherCharges: reader.readDoubleOrNull(offsets[42]),
    otherChargesRate: reader.readDoubleOrNull(offsets[43]),
    packBy: reader.readLongOrNull(offsets[44]),
    packDate: reader.readDateTimeOrNull(offsets[45]),
    pickNo: reader.readLongOrNull(offsets[46]),
    ppDiscountAmount: reader.readDoubleOrNull(offsets[47]),
    ppDiscountByRate: reader.readStringOrNull(offsets[48]),
    ppDiscountRate: reader.readDoubleOrNull(offsets[49]),
    ppDueDate: reader.readDateTimeOrNull(offsets[50]),
    ppDueDateByDelivered: reader.readStringOrNull(offsets[51]),
    projectCode: reader.readStringOrNull(offsets[52]),
    rate: reader.readDoubleOrNull(offsets[53]),
    recurDeposit: reader.readDoubleOrNull(offsets[54]),
    recurInvoice: reader.readStringOrNull(offsets[55]),
    ref1: reader.readStringOrNull(offsets[56]),
    ref2: reader.readStringOrNull(offsets[57]),
    ref3: reader.readStringOrNull(offsets[58]),
    ref4: reader.readStringOrNull(offsets[59]),
    ref5: reader.readStringOrNull(offsets[60]),
    remark1: reader.readStringOrNull(offsets[61]),
    remark2: reader.readStringOrNull(offsets[62]),
    representativeId: reader.readLongOrNull(offsets[63]),
    roundingDiscount: reader.readDoubleOrNull(offsets[64]),
    shipTo: reader.readLongOrNull(offsets[65]),
    sourceLocationCode: reader.readStringOrNull(offsets[66]),
    srPrelabel: reader.readStringOrNull(offsets[67]),
    status: reader.readStringOrNull(offsets[68]),
    syLocationCode: reader.readStringOrNull(offsets[69]),
    terms: reader.readStringOrNull(offsets[70]),
    totalAmountB4GST: reader.readDoubleOrNull(offsets[71]),
    totalEdit: reader.readLongOrNull(offsets[72]),
    totalInvoiceEntry: reader.readLongOrNull(offsets[73]),
    totalInvoiceQuantity: reader.readDoubleOrNull(offsets[74]),
    totalPrint: reader.readLongOrNull(offsets[75]),
    transfer: reader.readStringOrNull(offsets[76]),
    verifyBy: reader.readLongOrNull(offsets[77]),
    verifyDate: reader.readDateTimeOrNull(offsets[78]),
    voidedBy: reader.readLongOrNull(offsets[79]),
    voidedDate: reader.readDateTimeOrNull(offsets[80]),
    wayBillNo: reader.readStringOrNull(offsets[81]),
    webLinkPrelabel: reader.readStringOrNull(offsets[82]),
    webSI: reader.readStringOrNull(offsets[83]),
    webStatus: reader.readStringOrNull(offsets[84]),
  );
  object.id = id;
  return object;
}

P _invoiceDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readDoubleOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 29:
      return (reader.readDoubleOrNull(offset)) as P;
    case 30:
      return (reader.readDoubleOrNull(offset)) as P;
    case 31:
      return (reader.readString(offset)) as P;
    case 32:
      return (reader.readDoubleOrNull(offset)) as P;
    case 33:
      return (reader.readDoubleOrNull(offset)) as P;
    case 34:
      return (reader.readLongOrNull(offset)) as P;
    case 35:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 36:
      return (reader.readDateTimeOrNull(offset)) as P;
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 43:
      return (reader.readDoubleOrNull(offset)) as P;
    case 44:
      return (reader.readLongOrNull(offset)) as P;
    case 45:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 46:
      return (reader.readLongOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readStringOrNull(offset)) as P;
    case 49:
      return (reader.readDoubleOrNull(offset)) as P;
    case 50:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 51:
      return (reader.readStringOrNull(offset)) as P;
    case 52:
      return (reader.readStringOrNull(offset)) as P;
    case 53:
      return (reader.readDoubleOrNull(offset)) as P;
    case 54:
      return (reader.readDoubleOrNull(offset)) as P;
    case 55:
      return (reader.readStringOrNull(offset)) as P;
    case 56:
      return (reader.readStringOrNull(offset)) as P;
    case 57:
      return (reader.readStringOrNull(offset)) as P;
    case 58:
      return (reader.readStringOrNull(offset)) as P;
    case 59:
      return (reader.readStringOrNull(offset)) as P;
    case 60:
      return (reader.readStringOrNull(offset)) as P;
    case 61:
      return (reader.readStringOrNull(offset)) as P;
    case 62:
      return (reader.readStringOrNull(offset)) as P;
    case 63:
      return (reader.readLongOrNull(offset)) as P;
    case 64:
      return (reader.readDoubleOrNull(offset)) as P;
    case 65:
      return (reader.readLongOrNull(offset)) as P;
    case 66:
      return (reader.readStringOrNull(offset)) as P;
    case 67:
      return (reader.readStringOrNull(offset)) as P;
    case 68:
      return (reader.readStringOrNull(offset)) as P;
    case 69:
      return (reader.readStringOrNull(offset)) as P;
    case 70:
      return (reader.readStringOrNull(offset)) as P;
    case 71:
      return (reader.readDoubleOrNull(offset)) as P;
    case 72:
      return (reader.readLongOrNull(offset)) as P;
    case 73:
      return (reader.readLongOrNull(offset)) as P;
    case 74:
      return (reader.readDoubleOrNull(offset)) as P;
    case 75:
      return (reader.readLongOrNull(offset)) as P;
    case 76:
      return (reader.readStringOrNull(offset)) as P;
    case 77:
      return (reader.readLongOrNull(offset)) as P;
    case 78:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 79:
      return (reader.readLongOrNull(offset)) as P;
    case 80:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 81:
      return (reader.readStringOrNull(offset)) as P;
    case 82:
      return (reader.readStringOrNull(offset)) as P;
    case 83:
      return (reader.readStringOrNull(offset)) as P;
    case 84:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _invoiceGetId(Invoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _invoiceGetLinks(Invoice object) {
  return [];
}

void _invoiceAttach(IsarCollection<dynamic> col, Id id, Invoice object) {
  object.id = id;
}

extension InvoiceQueryWhereSort on QueryBuilder<Invoice, Invoice, QWhere> {
  QueryBuilder<Invoice, Invoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvoiceQueryWhere on QueryBuilder<Invoice, Invoice, QWhereClause> {
  QueryBuilder<Invoice, Invoice, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Invoice, Invoice, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause> idBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelEqualToAnyCompanyCode(String invoicePreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoicePreLabel_companyCode',
        value: [invoicePreLabel],
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelNotEqualToAnyCompanyCode(String invoicePreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [],
              upper: [invoicePreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [],
              upper: [invoicePreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelCompanyCodeEqualTo(
          String invoicePreLabel, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoicePreLabel_companyCode',
        value: [invoicePreLabel, companyCode],
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeNotEqualTo(
          String invoicePreLabel, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              upper: [invoicePreLabel, companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel, companyCode],
              includeLower: false,
              upper: [invoicePreLabel],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel, companyCode],
              includeLower: false,
              upper: [invoicePreLabel],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              upper: [invoicePreLabel, companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeGreaterThan(
    String invoicePreLabel,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel, companyCode],
        includeLower: include,
        upper: [invoicePreLabel],
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeLessThan(
    String invoicePreLabel,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel],
        upper: [invoicePreLabel, companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeBetween(
    String invoicePreLabel,
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel, lowerCompanyCode],
        includeLower: includeLower,
        upper: [invoicePreLabel, upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InvoiceQueryFilter
    on QueryBuilder<Invoice, Invoice, QFilterCondition> {
  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accEntryReference',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accEntryReference',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accEntryReference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accEntryReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accEntryReference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accEntryReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accEntryReferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accEntryReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accPostedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accPostedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accPostedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accPostedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accPostedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accPostedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      accPostedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> accPostedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accPostedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjustmentPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjustmentPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustmentPrelabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adjustmentPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adjustmentPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustmentPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      adjustmentPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adjustmentPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'allowDiscountNote',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'allowDiscountNote',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowDiscountNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allowDiscountNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allowDiscountNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowDiscountNote',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      allowDiscountNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allowDiscountNote',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateCompanyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateCompanyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateCompany',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateCompanyEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateCompanyBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateCompanyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateCompany',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateCompanyMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateCompanyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateCompanyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateCompany',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateDocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateDoc',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> alternateDocIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      alternateDocIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'appDLPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      appDLPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'appDLPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      appDLPrelabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appDLPrelabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appDLPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appDLPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> appDLPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appDLPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      appDLPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appDLPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentDate1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentDate1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate1EqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate1',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate1LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate1Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentDate2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentDate2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentDate2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate2EqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentDate2',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate2LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentDate2Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath1Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attachmentPath2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> attachmentPath2Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      attachmentPath2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attachmentPath2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> batchNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelPosted',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      cancelPostedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelPosted',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelPosted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cancelPosted',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cancelPosted',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> cancelPostedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelPosted',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      cancelPostedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cancelPosted',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> companyCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> companyCodeGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currency',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customer',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> customerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customer',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredByBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      deliveredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredDateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> deliveredDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDateByDelivered',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDateByDelivered',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDateByDelivered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dueDateByDelivered',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDateByDelivered',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      dueDateByDeliveredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dueDateByDelivered',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> grossAmountBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> gstAmountBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imsPostedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imsPostedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imsPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imsPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imsPostedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imsPostedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imsPostedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      imsPostedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imsPostedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imsPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      imsPostedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imsPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imsPostedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> imsPostedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imsPostedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'internalReference',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'internalReference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'internalReference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      internalReferenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'internalReference',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceDiscountAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceDiscountAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDiscountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDiscountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceDiscountRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceDiscountRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDiscountRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceDiscountRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDiscountRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelEqualTo(
    String value, {
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoicePreLabelGreaterThan(
    String value, {
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelLessThan(
    String value, {
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoicePreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoicePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoicePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoicePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceTaxAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceTaxAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceTaxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceTaxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invoiceTaxRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invoiceTaxRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      invoiceTaxRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceTaxRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> invoiceTaxRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceTaxRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedByLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedByBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastModifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastModifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> lastModifiedDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> latitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'linkAccount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'linkAccount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'linkAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'linkAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'linkAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> linkAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'linkAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      linkAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'linkAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> longitudeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitude',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> netAmountBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      otherChargesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherCharges',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      otherChargesRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      otherChargesRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'otherChargesRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesRateEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> otherChargesRateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packByBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> packDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> pickNoBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountAmount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountAmountEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountAmountBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountByRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountByRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountByRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountByRateEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountByRateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountByRateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ppDiscountByRate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountByRateMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountByRateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountByRateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ppDiscountByRate',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDiscountRate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountRateEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountRateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDiscountRateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDueDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ppDueDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ppDueDateByDelivered',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ppDueDateByDelivered',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ppDueDateByDelivered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ppDueDateByDelivered',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ppDueDateByDelivered',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ppDueDateByDelivered',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      ppDueDateByDeliveredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ppDueDateByDelivered',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> rateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurDepositIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurDeposit',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      recurDepositIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurDeposit',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurDepositEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurDeposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurDepositGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurDeposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurDepositLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurDeposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurDepositBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurDeposit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recurInvoice',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      recurInvoiceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recurInvoice',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recurInvoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recurInvoice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recurInvoice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> recurInvoiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recurInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      recurInvoiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recurInvoice',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref3',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref3',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref4',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref4IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref4',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ref5',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> ref5IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ref5',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark1',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark1',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark2',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2EqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2GreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2LessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2Between(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2StartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2EndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2Contains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2Matches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> remark2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark2',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      representativeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      representativeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> representativeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> representativeIdBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      roundingDiscountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      roundingDiscountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'roundingDiscount',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> roundingDiscountEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> roundingDiscountBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shipTo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipTo',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> shipToBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceLocationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      sourceLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'srPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'srPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'srPrelabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'srPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'srPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'srPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> srPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'srPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      syLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> syLocationCodeMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      syLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      syLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'terms',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'terms',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'terms',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'terms',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'terms',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'terms',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> termsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'terms',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalAmountB4GSTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmountB4GST',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalAmountB4GSTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmountB4GST',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalAmountB4GSTEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalAmountB4GSTGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalAmountB4GSTLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalAmountB4GSTBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalEdit',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalEditBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalInvoiceEntry',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalInvoiceEntry',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalInvoiceEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalInvoiceEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalInvoiceEntry',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceEntryBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalInvoiceEntry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalInvoiceQuantity',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalInvoiceQuantity',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalInvoiceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalInvoiceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalInvoiceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      totalInvoiceQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalInvoiceQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPrint',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrint',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> totalPrintBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transfer',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transfer',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transfer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transfer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transfer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transfer',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> transferIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transfer',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyByBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verifyDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifyDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> verifyDateBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voidedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voidedBy',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voidedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voidedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voidedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voidedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voidedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voidedDate',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voidedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voidedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voidedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> voidedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voidedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wayBillNo',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> wayBillNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wayBillNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webLinkPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webLinkPrelabel',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webLinkPrelabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webLinkPrelabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webLinkPrelabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webLinkPrelabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webLinkPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition>
      webLinkPrelabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webLinkPrelabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webSI',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webSI',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSILessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'webSI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'webSI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'webSI',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webSI',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webSIIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webSI',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'webStatus',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusEqualTo(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusGreaterThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusLessThan(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusBetween(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusStartsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusEndsWith(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusContains(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusMatches(
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

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'webStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterFilterCondition> webStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'webStatus',
        value: '',
      ));
    });
  }
}

extension InvoiceQueryObject
    on QueryBuilder<Invoice, Invoice, QFilterCondition> {}

extension InvoiceQueryLinks
    on QueryBuilder<Invoice, Invoice, QFilterCondition> {}

extension InvoiceQuerySortBy on QueryBuilder<Invoice, Invoice, QSortBy> {
  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccEntryReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accEntryReference', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccEntryReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accEntryReference', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccPostedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAccPostedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAdjustmentPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAdjustmentPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAllowDiscountNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDiscountNote', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAllowDiscountNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDiscountNote', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAppDLPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appDLPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAppDLPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appDLPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCancelPosted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelPosted', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCancelPostedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelPosted', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDueDateByDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateByDelivered', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByDueDateByDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateByDelivered', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByImsPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByImsPostedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByImsPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByImsPostedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      sortByInvoiceDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByInvoiceTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLinkAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkAccount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLinkAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkAccount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByPpDueDateByDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDateByDelivered', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      sortByPpDueDateByDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDateByDelivered', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRecurDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurDeposit', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRecurDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurDeposit', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRecurInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurInvoice', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRecurInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurInvoice', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySrPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySrPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalAmountB4GSTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalInvoiceEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceEntry', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalInvoiceEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceEntry', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalInvoiceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceQuantity', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      sortByTotalInvoiceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceQuantity', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTransfer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transfer', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByTransferDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transfer', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVoidedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVoidedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVoidedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByVoidedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebLinkPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLinkPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebLinkPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLinkPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebSI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSI', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebSIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSI', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> sortByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension InvoiceQuerySortThenBy
    on QueryBuilder<Invoice, Invoice, QSortThenBy> {
  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccEntryReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accEntryReference', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccEntryReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accEntryReference', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccPostedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAccPostedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accPostedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAdjustmentPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAdjustmentPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAllowDiscountNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDiscountNote', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAllowDiscountNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowDiscountNote', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAlternateCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAlternateCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateCompany', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAlternateDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAlternateDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDoc', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAppDLPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appDLPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAppDLPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appDLPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentDate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentDate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentDate2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentPath1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentPath1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentPath2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByAttachmentPath2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attachmentPath2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCancelPosted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelPosted', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCancelPostedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelPosted', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customer', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDeliveredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDueDateByDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateByDelivered', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByDueDateByDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDateByDelivered', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByGstAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByImsPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByImsPostedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByImsPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByImsPostedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imsPostedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInternalReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInternalReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalReference', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      thenByInvoiceDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByInvoiceTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceTaxRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLinkAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkAccount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLinkAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'linkAccount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByOtherChargesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherCharges', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByOtherChargesRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherChargesRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPackByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPackDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPickNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountByRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByPpDueDateByDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDateByDelivered', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      thenByPpDueDateByDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ppDueDateByDelivered', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRecurDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurDeposit', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRecurDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurDeposit', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRecurInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurInvoice', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRecurInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recurInvoice', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref3', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef4() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef4Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref4', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef5() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRef5Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ref5', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRemark1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRemark1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark1', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRemark2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRemark2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark2', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByRoundingDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roundingDiscount', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByShipToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipTo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySourceLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySourceLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySrPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySrPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'srPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTerms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTermsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terms', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalAmountB4GSTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmountB4GST', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEdit', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalInvoiceEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceEntry', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalInvoiceEntryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceEntry', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalInvoiceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceQuantity', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy>
      thenByTotalInvoiceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceQuantity', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTotalPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrint', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTransfer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transfer', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByTransferDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transfer', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVerifyByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVerifyDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifyDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVoidedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedBy', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVoidedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedBy', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVoidedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedDate', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByVoidedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voidedDate', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWayBillNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWayBillNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wayBillNo', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebLinkPrelabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLinkPrelabel', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebLinkPrelabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webLinkPrelabel', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebSI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSI', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebSIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webSI', Sort.desc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.asc);
    });
  }

  QueryBuilder<Invoice, Invoice, QAfterSortBy> thenByWebStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'webStatus', Sort.desc);
    });
  }
}

extension InvoiceQueryWhereDistinct
    on QueryBuilder<Invoice, Invoice, QDistinct> {
  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAccEntryReference(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accEntryReference',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAccPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accPostedBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAccPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accPostedDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAdjustmentPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustmentPrelabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAllowDiscountNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowDiscountNote',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAlternateCompany(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateCompany',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAlternateDoc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateDoc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAppDLPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appDLPrelabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAttachmentDate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate1');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAttachmentDate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentDate2');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAttachmentPath1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath1',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByAttachmentPath2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attachmentPath2',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNo');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByCancelPosted(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelPosted', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByDeliveredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByDueDateByDelivered(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDateByDelivered',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByGstAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByImsPostedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imsPostedBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByImsPostedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imsPostedDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInternalReference(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internalReference',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoiceDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDiscountAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoiceDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDiscountRate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoicePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoicePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoiceTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceTaxAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByInvoiceTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceTaxRate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLatitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLinkAccount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'linkAccount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByLongitude(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByOtherCharges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherCharges');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByOtherChargesRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherChargesRate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPackBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPackDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPickNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickNo');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPpDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPpDiscountByRate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountByRate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPpDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDiscountRate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPpDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDueDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByPpDueDateByDelivered(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ppDueDateByDelivered',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByProjectCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRecurDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurDeposit');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRecurInvoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recurInvoice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRef1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRef2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRef3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRef4(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref4', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRef5(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ref5', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRemark1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRemark2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'representativeId');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByRoundingDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roundingDiscount');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByShipTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipTo');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctBySourceLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctBySrPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'srPrelabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctBySyLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTerms(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'terms', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTotalAmountB4GST() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmountB4GST');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTotalEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEdit');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTotalInvoiceEntry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalInvoiceEntry');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTotalInvoiceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalInvoiceQuantity');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTotalPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrint');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByTransfer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transfer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByVerifyBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByVerifyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifyDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByVoidedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voidedBy');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByVoidedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voidedDate');
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByWayBillNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wayBillNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByWebLinkPrelabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webLinkPrelabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByWebSI(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webSI', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Invoice, Invoice, QDistinct> distinctByWebStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'webStatus', caseSensitive: caseSensitive);
    });
  }
}

extension InvoiceQueryProperty
    on QueryBuilder<Invoice, Invoice, QQueryProperty> {
  QueryBuilder<Invoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> accEntryReferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accEntryReference');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> accPostedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accPostedBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> accPostedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accPostedDate');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations>
      adjustmentPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustmentPrelabel');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> allowDiscountNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowDiscountNote');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> alternateCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateCompany');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> alternateDocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateDoc');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> appDLPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appDLPrelabel');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> attachmentDate1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate1');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> attachmentDate2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentDate2');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> attachmentPath1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath1');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> attachmentPath2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attachmentPath2');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> batchNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNo');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> cancelPostedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelPosted');
    });
  }

  QueryBuilder<Invoice, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> customerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customer');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> deliveredByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> deliveredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredDate');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations>
      dueDateByDeliveredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDateByDelivered');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> gstAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstAmount');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> imsPostedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imsPostedBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> imsPostedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imsPostedDate');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> internalReferenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internalReference');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> invoiceDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDate');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations>
      invoiceDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDiscountAmount');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations>
      invoiceDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDiscountRate');
    });
  }

  QueryBuilder<Invoice, String, QQueryOperations> invoicePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoicePreLabel');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> invoiceTaxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceTaxAmount');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> invoiceTaxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceTaxRate');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations>
      lastModifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedDate');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> linkAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'linkAccount');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> otherChargesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherCharges');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> otherChargesRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherChargesRate');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> packByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> packDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packDate');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> pickNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickNo');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> ppDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountAmount');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ppDiscountByRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountByRate');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> ppDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDiscountRate');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> ppDueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDueDate');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations>
      ppDueDateByDeliveredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ppDueDateByDelivered');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> recurDepositProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurDeposit');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> recurInvoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recurInvoice');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ref1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref1');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ref2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref2');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ref3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref3');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ref4Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref4');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> ref5Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ref5');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> remark1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark1');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> remark2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark2');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> representativeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'representativeId');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> roundingDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roundingDiscount');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> shipToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipTo');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations>
      sourceLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceLocationCode');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> srPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'srPrelabel');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> syLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syLocationCode');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> termsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'terms');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations> totalAmountB4GSTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmountB4GST');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> totalEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEdit');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> totalInvoiceEntryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalInvoiceEntry');
    });
  }

  QueryBuilder<Invoice, double?, QQueryOperations>
      totalInvoiceQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalInvoiceQuantity');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> totalPrintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrint');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> transferProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transfer');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> verifyByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> verifyDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifyDate');
    });
  }

  QueryBuilder<Invoice, int?, QQueryOperations> voidedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voidedBy');
    });
  }

  QueryBuilder<Invoice, DateTime?, QQueryOperations> voidedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voidedDate');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> wayBillNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wayBillNo');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> webLinkPrelabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webLinkPrelabel');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> webSIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webSI');
    });
  }

  QueryBuilder<Invoice, String?, QQueryOperations> webStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'webStatus');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInvoiceItemCollection on Isar {
  IsarCollection<InvoiceItem> get invoiceItems => this.collection();
}

const InvoiceItemSchema = CollectionSchema(
  name: r'InvoiceItem',
  id: 3489790213250467162,
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
    r'averageCost': PropertySchema(
      id: 2,
      name: r'averageCost',
      type: IsarType.double,
    ),
    r'batchNo': PropertySchema(
      id: 3,
      name: r'batchNo',
      type: IsarType.string,
    ),
    r'cancelledBy': PropertySchema(
      id: 4,
      name: r'cancelledBy',
      type: IsarType.long,
    ),
    r'cancelledDate': PropertySchema(
      id: 5,
      name: r'cancelledDate',
      type: IsarType.dateTime,
    ),
    r'changePriceRemark': PropertySchema(
      id: 6,
      name: r'changePriceRemark',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 7,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'companyCommRate': PropertySchema(
      id: 8,
      name: r'companyCommRate',
      type: IsarType.double,
    ),
    r'ctnUnitPrice': PropertySchema(
      id: 9,
      name: r'ctnUnitPrice',
      type: IsarType.double,
    ),
    r'ctnUom': PropertySchema(
      id: 10,
      name: r'ctnUom',
      type: IsarType.string,
    ),
    r'defaultPlu': PropertySchema(
      id: 11,
      name: r'defaultPlu',
      type: IsarType.string,
    ),
    r'doPreLabel': PropertySchema(
      id: 12,
      name: r'doPreLabel',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 13,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'factor': PropertySchema(
      id: 14,
      name: r'factor',
      type: IsarType.double,
    ),
    r'fifoCost': PropertySchema(
      id: 15,
      name: r'fifoCost',
      type: IsarType.double,
    ),
    r'foc': PropertySchema(
      id: 16,
      name: r'foc',
      type: IsarType.double,
    ),
    r'focLoose': PropertySchema(
      id: 17,
      name: r'focLoose',
      type: IsarType.double,
    ),
    r'grossAmount': PropertySchema(
      id: 18,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'gstCode': PropertySchema(
      id: 19,
      name: r'gstCode',
      type: IsarType.string,
    ),
    r'gstPrice': PropertySchema(
      id: 20,
      name: r'gstPrice',
      type: IsarType.double,
    ),
    r'instantNormalSellingPrice': PropertySchema(
      id: 21,
      name: r'instantNormalSellingPrice',
      type: IsarType.double,
    ),
    r'invoicePreLabel': PropertySchema(
      id: 22,
      name: r'invoicePreLabel',
      type: IsarType.string,
    ),
    r'itemSequence': PropertySchema(
      id: 23,
      name: r'itemSequence',
      type: IsarType.long,
    ),
    r'lastCost': PropertySchema(
      id: 24,
      name: r'lastCost',
      type: IsarType.double,
    ),
    r'locationCode': PropertySchema(
      id: 25,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'miscCost': PropertySchema(
      id: 26,
      name: r'miscCost',
      type: IsarType.double,
    ),
    r'nameNo': PropertySchema(
      id: 27,
      name: r'nameNo',
      type: IsarType.long,
    ),
    r'netAmount': PropertySchema(
      id: 28,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'nos': PropertySchema(
      id: 29,
      name: r'nos',
      type: IsarType.double,
    ),
    r'oldAverageCost': PropertySchema(
      id: 30,
      name: r'oldAverageCost',
      type: IsarType.double,
    ),
    r'oldFifoCost': PropertySchema(
      id: 31,
      name: r'oldFifoCost',
      type: IsarType.double,
    ),
    r'oldLastCost': PropertySchema(
      id: 32,
      name: r'oldLastCost',
      type: IsarType.double,
    ),
    r'oldStandardCost': PropertySchema(
      id: 33,
      name: r'oldStandardCost',
      type: IsarType.double,
    ),
    r'openPrice': PropertySchema(
      id: 34,
      name: r'openPrice',
      type: IsarType.string,
    ),
    r'piInvoiceNo': PropertySchema(
      id: 35,
      name: r'piInvoiceNo',
      type: IsarType.string,
    ),
    r'pluNo': PropertySchema(
      id: 36,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'projectCode': PropertySchema(
      id: 37,
      name: r'projectCode',
      type: IsarType.string,
    ),
    r'promoterCommRate': PropertySchema(
      id: 38,
      name: r'promoterCommRate',
      type: IsarType.double,
    ),
    r'pts3AfAverageCost': PropertySchema(
      id: 39,
      name: r'pts3AfAverageCost',
      type: IsarType.double,
    ),
    r'pts3AfFifoCost': PropertySchema(
      id: 40,
      name: r'pts3AfFifoCost',
      type: IsarType.double,
    ),
    r'pts3AfLastCost': PropertySchema(
      id: 41,
      name: r'pts3AfLastCost',
      type: IsarType.double,
    ),
    r'pts3AfStandardCost': PropertySchema(
      id: 42,
      name: r'pts3AfStandardCost',
      type: IsarType.double,
    ),
    r'pts3B4AverageCost': PropertySchema(
      id: 43,
      name: r'pts3B4AverageCost',
      type: IsarType.double,
    ),
    r'pts3B4FifoCost': PropertySchema(
      id: 44,
      name: r'pts3B4FifoCost',
      type: IsarType.double,
    ),
    r'pts3B4LastCost': PropertySchema(
      id: 45,
      name: r'pts3B4LastCost',
      type: IsarType.double,
    ),
    r'pts3B4StandardCost': PropertySchema(
      id: 46,
      name: r'pts3B4StandardCost',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 47,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'quantityLoose': PropertySchema(
      id: 48,
      name: r'quantityLoose',
      type: IsarType.double,
    ),
    r'quantityLoss': PropertySchema(
      id: 49,
      name: r'quantityLoss',
      type: IsarType.double,
    ),
    r'quantityOriginal': PropertySchema(
      id: 50,
      name: r'quantityOriginal',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 51,
      name: r'remark',
      type: IsarType.string,
    ),
    r'returnQty': PropertySchema(
      id: 52,
      name: r'returnQty',
      type: IsarType.double,
    ),
    r'sequenceNo': PropertySchema(
      id: 53,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 54,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'source': PropertySchema(
      id: 55,
      name: r'source',
      type: IsarType.string,
    ),
    r'standardCost': PropertySchema(
      id: 56,
      name: r'standardCost',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 57,
      name: r'status',
      type: IsarType.string,
    ),
    r'stockType': PropertySchema(
      id: 58,
      name: r'stockType',
      type: IsarType.string,
    ),
    r'syLocationCode': PropertySchema(
      id: 59,
      name: r'syLocationCode',
      type: IsarType.string,
    ),
    r'taxAmount': PropertySchema(
      id: 60,
      name: r'taxAmount',
      type: IsarType.double,
    ),
    r'taxRate': PropertySchema(
      id: 61,
      name: r'taxRate',
      type: IsarType.double,
    ),
    r'unitDiscountAmount': PropertySchema(
      id: 62,
      name: r'unitDiscountAmount',
      type: IsarType.double,
    ),
    r'unitDiscountAmount1': PropertySchema(
      id: 63,
      name: r'unitDiscountAmount1',
      type: IsarType.double,
    ),
    r'unitDiscountAmount2': PropertySchema(
      id: 64,
      name: r'unitDiscountAmount2',
      type: IsarType.double,
    ),
    r'unitDiscountRate': PropertySchema(
      id: 65,
      name: r'unitDiscountRate',
      type: IsarType.double,
    ),
    r'unitDiscountRate1': PropertySchema(
      id: 66,
      name: r'unitDiscountRate1',
      type: IsarType.double,
    ),
    r'unitDiscountRate2': PropertySchema(
      id: 67,
      name: r'unitDiscountRate2',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 68,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'unitPriceBasic': PropertySchema(
      id: 69,
      name: r'unitPriceBasic',
      type: IsarType.double,
    ),
    r'uom': PropertySchema(
      id: 70,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _invoiceItemEstimateSize,
  serialize: _invoiceItemSerialize,
  deserialize: _invoiceItemDeserialize,
  deserializeProp: _invoiceItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'invoicePreLabel_companyCode': IndexSchema(
      id: 3321615571119609637,
      name: r'invoicePreLabel_companyCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'invoicePreLabel',
          type: IndexType.hash,
          caseSensitive: true,
        ),
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
  getId: _invoiceItemGetId,
  getLinks: _invoiceItemGetLinks,
  attach: _invoiceItemAttach,
  version: '3.1.0+1',
);

int _invoiceItemEstimateSize(
  InvoiceItem object,
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
    final value = object.batchNo;
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
  bytesCount += 3 + object.doPreLabel.length * 3;
  {
    final value = object.gstCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.invoicePreLabel.length * 3;
  {
    final value = object.locationCode;
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
    final value = object.piInvoiceNo;
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
  {
    final value = object.remark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.source;
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
    final value = object.stockType;
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

void _invoiceItemSerialize(
  InvoiceItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDate);
  writer.writeString(offsets[1], object.alternateDescription);
  writer.writeDouble(offsets[2], object.averageCost);
  writer.writeString(offsets[3], object.batchNo);
  writer.writeLong(offsets[4], object.cancelledBy);
  writer.writeDateTime(offsets[5], object.cancelledDate);
  writer.writeString(offsets[6], object.changePriceRemark);
  writer.writeLong(offsets[7], object.companyCode);
  writer.writeDouble(offsets[8], object.companyCommRate);
  writer.writeDouble(offsets[9], object.ctnUnitPrice);
  writer.writeString(offsets[10], object.ctnUom);
  writer.writeString(offsets[11], object.defaultPlu);
  writer.writeString(offsets[12], object.doPreLabel);
  writer.writeDateTime(offsets[13], object.dueDate);
  writer.writeDouble(offsets[14], object.factor);
  writer.writeDouble(offsets[15], object.fifoCost);
  writer.writeDouble(offsets[16], object.foc);
  writer.writeDouble(offsets[17], object.focLoose);
  writer.writeDouble(offsets[18], object.grossAmount);
  writer.writeString(offsets[19], object.gstCode);
  writer.writeDouble(offsets[20], object.gstPrice);
  writer.writeDouble(offsets[21], object.instantNormalSellingPrice);
  writer.writeString(offsets[22], object.invoicePreLabel);
  writer.writeLong(offsets[23], object.itemSequence);
  writer.writeDouble(offsets[24], object.lastCost);
  writer.writeString(offsets[25], object.locationCode);
  writer.writeDouble(offsets[26], object.miscCost);
  writer.writeLong(offsets[27], object.nameNo);
  writer.writeDouble(offsets[28], object.netAmount);
  writer.writeDouble(offsets[29], object.nos);
  writer.writeDouble(offsets[30], object.oldAverageCost);
  writer.writeDouble(offsets[31], object.oldFifoCost);
  writer.writeDouble(offsets[32], object.oldLastCost);
  writer.writeDouble(offsets[33], object.oldStandardCost);
  writer.writeString(offsets[34], object.openPrice);
  writer.writeString(offsets[35], object.piInvoiceNo);
  writer.writeString(offsets[36], object.pluNo);
  writer.writeString(offsets[37], object.projectCode);
  writer.writeDouble(offsets[38], object.promoterCommRate);
  writer.writeDouble(offsets[39], object.pts3AfAverageCost);
  writer.writeDouble(offsets[40], object.pts3AfFifoCost);
  writer.writeDouble(offsets[41], object.pts3AfLastCost);
  writer.writeDouble(offsets[42], object.pts3AfStandardCost);
  writer.writeDouble(offsets[43], object.pts3B4AverageCost);
  writer.writeDouble(offsets[44], object.pts3B4FifoCost);
  writer.writeDouble(offsets[45], object.pts3B4LastCost);
  writer.writeDouble(offsets[46], object.pts3B4StandardCost);
  writer.writeDouble(offsets[47], object.quantity);
  writer.writeDouble(offsets[48], object.quantityLoose);
  writer.writeDouble(offsets[49], object.quantityLoss);
  writer.writeDouble(offsets[50], object.quantityOriginal);
  writer.writeString(offsets[51], object.remark);
  writer.writeDouble(offsets[52], object.returnQty);
  writer.writeLong(offsets[53], object.sequenceNo);
  writer.writeLong(offsets[54], object.skuNo);
  writer.writeString(offsets[55], object.source);
  writer.writeDouble(offsets[56], object.standardCost);
  writer.writeString(offsets[57], object.status);
  writer.writeString(offsets[58], object.stockType);
  writer.writeString(offsets[59], object.syLocationCode);
  writer.writeDouble(offsets[60], object.taxAmount);
  writer.writeDouble(offsets[61], object.taxRate);
  writer.writeDouble(offsets[62], object.unitDiscountAmount);
  writer.writeDouble(offsets[63], object.unitDiscountAmount1);
  writer.writeDouble(offsets[64], object.unitDiscountAmount2);
  writer.writeDouble(offsets[65], object.unitDiscountRate);
  writer.writeDouble(offsets[66], object.unitDiscountRate1);
  writer.writeDouble(offsets[67], object.unitDiscountRate2);
  writer.writeDouble(offsets[68], object.unitPrice);
  writer.writeDouble(offsets[69], object.unitPriceBasic);
  writer.writeString(offsets[70], object.uom);
}

InvoiceItem _invoiceItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InvoiceItem(
    addedDate: reader.readDateTimeOrNull(offsets[0]),
    alternateDescription: reader.readStringOrNull(offsets[1]),
    averageCost: reader.readDoubleOrNull(offsets[2]),
    batchNo: reader.readStringOrNull(offsets[3]),
    cancelledBy: reader.readLongOrNull(offsets[4]),
    cancelledDate: reader.readDateTimeOrNull(offsets[5]),
    changePriceRemark: reader.readStringOrNull(offsets[6]),
    companyCode: reader.readLong(offsets[7]),
    companyCommRate: reader.readDoubleOrNull(offsets[8]),
    ctnUnitPrice: reader.readDoubleOrNull(offsets[9]),
    ctnUom: reader.readStringOrNull(offsets[10]),
    defaultPlu: reader.readStringOrNull(offsets[11]),
    doPreLabel: reader.readString(offsets[12]),
    dueDate: reader.readDateTimeOrNull(offsets[13]),
    factor: reader.readDoubleOrNull(offsets[14]),
    fifoCost: reader.readDoubleOrNull(offsets[15]),
    foc: reader.readDoubleOrNull(offsets[16]),
    focLoose: reader.readDoubleOrNull(offsets[17]),
    grossAmount: reader.readDoubleOrNull(offsets[18]),
    gstCode: reader.readStringOrNull(offsets[19]),
    gstPrice: reader.readDoubleOrNull(offsets[20]),
    instantNormalSellingPrice: reader.readDoubleOrNull(offsets[21]),
    invoicePreLabel: reader.readString(offsets[22]),
    itemSequence: reader.readLongOrNull(offsets[23]),
    lastCost: reader.readDoubleOrNull(offsets[24]),
    locationCode: reader.readStringOrNull(offsets[25]),
    miscCost: reader.readDoubleOrNull(offsets[26]),
    nameNo: reader.readLongOrNull(offsets[27]),
    netAmount: reader.readDoubleOrNull(offsets[28]),
    nos: reader.readDoubleOrNull(offsets[29]),
    oldAverageCost: reader.readDoubleOrNull(offsets[30]),
    oldFifoCost: reader.readDoubleOrNull(offsets[31]),
    oldLastCost: reader.readDoubleOrNull(offsets[32]),
    oldStandardCost: reader.readDoubleOrNull(offsets[33]),
    openPrice: reader.readStringOrNull(offsets[34]),
    piInvoiceNo: reader.readStringOrNull(offsets[35]),
    pluNo: reader.readStringOrNull(offsets[36]),
    projectCode: reader.readStringOrNull(offsets[37]),
    promoterCommRate: reader.readDoubleOrNull(offsets[38]),
    pts3AfAverageCost: reader.readDoubleOrNull(offsets[39]),
    pts3AfFifoCost: reader.readDoubleOrNull(offsets[40]),
    pts3AfLastCost: reader.readDoubleOrNull(offsets[41]),
    pts3AfStandardCost: reader.readDoubleOrNull(offsets[42]),
    pts3B4AverageCost: reader.readDoubleOrNull(offsets[43]),
    pts3B4FifoCost: reader.readDoubleOrNull(offsets[44]),
    pts3B4LastCost: reader.readDoubleOrNull(offsets[45]),
    pts3B4StandardCost: reader.readDoubleOrNull(offsets[46]),
    quantity: reader.readDoubleOrNull(offsets[47]),
    quantityLoose: reader.readDoubleOrNull(offsets[48]),
    quantityLoss: reader.readDoubleOrNull(offsets[49]),
    quantityOriginal: reader.readDoubleOrNull(offsets[50]),
    remark: reader.readStringOrNull(offsets[51]),
    returnQty: reader.readDoubleOrNull(offsets[52]),
    sequenceNo: reader.readLong(offsets[53]),
    skuNo: reader.readLong(offsets[54]),
    source: reader.readStringOrNull(offsets[55]),
    standardCost: reader.readDoubleOrNull(offsets[56]),
    status: reader.readStringOrNull(offsets[57]),
    stockType: reader.readStringOrNull(offsets[58]),
    syLocationCode: reader.readStringOrNull(offsets[59]),
    taxAmount: reader.readDoubleOrNull(offsets[60]),
    taxRate: reader.readDoubleOrNull(offsets[61]),
    unitDiscountAmount: reader.readDoubleOrNull(offsets[62]),
    unitDiscountAmount1: reader.readDoubleOrNull(offsets[63]),
    unitDiscountAmount2: reader.readDoubleOrNull(offsets[64]),
    unitDiscountRate: reader.readDoubleOrNull(offsets[65]),
    unitDiscountRate1: reader.readDoubleOrNull(offsets[66]),
    unitDiscountRate2: reader.readDoubleOrNull(offsets[67]),
    unitPrice: reader.readDoubleOrNull(offsets[68]),
    unitPriceBasic: reader.readDoubleOrNull(offsets[69]),
    uom: reader.readString(offsets[70]),
  );
  object.id = id;
  return object;
}

P _invoiceItemDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readDoubleOrNull(offset)) as P;
    case 27:
      return (reader.readLongOrNull(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    case 29:
      return (reader.readDoubleOrNull(offset)) as P;
    case 30:
      return (reader.readDoubleOrNull(offset)) as P;
    case 31:
      return (reader.readDoubleOrNull(offset)) as P;
    case 32:
      return (reader.readDoubleOrNull(offset)) as P;
    case 33:
      return (reader.readDoubleOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 44:
      return (reader.readDoubleOrNull(offset)) as P;
    case 45:
      return (reader.readDoubleOrNull(offset)) as P;
    case 46:
      return (reader.readDoubleOrNull(offset)) as P;
    case 47:
      return (reader.readDoubleOrNull(offset)) as P;
    case 48:
      return (reader.readDoubleOrNull(offset)) as P;
    case 49:
      return (reader.readDoubleOrNull(offset)) as P;
    case 50:
      return (reader.readDoubleOrNull(offset)) as P;
    case 51:
      return (reader.readStringOrNull(offset)) as P;
    case 52:
      return (reader.readDoubleOrNull(offset)) as P;
    case 53:
      return (reader.readLong(offset)) as P;
    case 54:
      return (reader.readLong(offset)) as P;
    case 55:
      return (reader.readStringOrNull(offset)) as P;
    case 56:
      return (reader.readDoubleOrNull(offset)) as P;
    case 57:
      return (reader.readStringOrNull(offset)) as P;
    case 58:
      return (reader.readStringOrNull(offset)) as P;
    case 59:
      return (reader.readStringOrNull(offset)) as P;
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 68:
      return (reader.readDoubleOrNull(offset)) as P;
    case 69:
      return (reader.readDoubleOrNull(offset)) as P;
    case 70:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _invoiceItemGetId(InvoiceItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _invoiceItemGetLinks(InvoiceItem object) {
  return [];
}

void _invoiceItemAttach(
    IsarCollection<dynamic> col, Id id, InvoiceItem object) {
  object.id = id;
}

extension InvoiceItemQueryWhereSort
    on QueryBuilder<InvoiceItem, InvoiceItem, QWhere> {
  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InvoiceItemQueryWhere
    on QueryBuilder<InvoiceItem, InvoiceItem, QWhereClause> {
  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelEqualToAnyCompanyCode(String invoicePreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoicePreLabel_companyCode',
        value: [invoicePreLabel],
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelNotEqualToAnyCompanyCode(String invoicePreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [],
              upper: [invoicePreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [],
              upper: [invoicePreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelCompanyCodeEqualTo(
          String invoicePreLabel, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'invoicePreLabel_companyCode',
        value: [invoicePreLabel, companyCode],
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeNotEqualTo(
          String invoicePreLabel, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              upper: [invoicePreLabel, companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel, companyCode],
              includeLower: false,
              upper: [invoicePreLabel],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel, companyCode],
              includeLower: false,
              upper: [invoicePreLabel],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'invoicePreLabel_companyCode',
              lower: [invoicePreLabel],
              upper: [invoicePreLabel, companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeGreaterThan(
    String invoicePreLabel,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel, companyCode],
        includeLower: include,
        upper: [invoicePreLabel],
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeLessThan(
    String invoicePreLabel,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel],
        upper: [invoicePreLabel, companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterWhereClause>
      invoicePreLabelEqualToCompanyCodeBetween(
    String invoicePreLabel,
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'invoicePreLabel_companyCode',
        lower: [invoicePreLabel, lowerCompanyCode],
        includeLower: includeLower,
        upper: [invoicePreLabel, upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InvoiceItemQueryFilter
    on QueryBuilder<InvoiceItem, InvoiceItem, QFilterCondition> {
  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      addedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alternateDescription',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alternateDescription',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alternateDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alternateDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alternateDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      alternateDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alternateDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      averageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      averageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> batchNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      batchNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledByLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledByBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      cancelledDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'changePriceRemark',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'changePriceRemark',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'changePriceRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'changePriceRemark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePriceRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      changePriceRemarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'changePriceRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      companyCommRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCommRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      companyCommRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCommRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUnitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctnUnitPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUnitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctnUnitPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUnitPriceEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUnitPriceBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ctnUom',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ctnUom',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUomGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUomStartsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> ctnUomMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ctnUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      ctnUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ctnUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultPlu',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultPlu',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultPlu',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      defaultPluIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'doPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'doPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'doPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'doPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      doPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'doPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> dueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> factorEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      factorGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> factorLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> factorBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      fifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      fifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> fifoCostEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> fifoCostBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      focLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      focLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      focLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      focLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> focLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      grossAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      grossAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grossAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      grossAmountEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      grossAmountLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      grossAmountBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeStartsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstCodeMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gstCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      gstPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstPriceEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> gstPriceBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      instantNormalSellingPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instantNormalSellingPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      instantNormalSellingPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instantNormalSellingPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelEqualTo(
    String value, {
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelGreaterThan(
    String value, {
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelLessThan(
    String value, {
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelBetween(
    String lower,
    String upper, {
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoicePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoicePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      invoicePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoicePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      itemSequenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemSequence',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      itemSequenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemSequence',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      itemSequenceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemSequence',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      itemSequenceBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      lastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      lastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> lastCostEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> lastCostBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      miscCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      miscCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'miscCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> miscCostEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> miscCostBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nameNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      nameNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nameNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      nameNoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nameNoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nameNoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      netAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      netAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'netAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      netAmountEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      netAmountLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      netAmountBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nos',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> nosBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'oldAverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'oldAverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldAverageCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldAverageCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'oldFifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'oldFifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldFifoCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldFifoCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'oldLastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'oldLastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldLastCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldLastCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'oldStandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'oldStandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      oldStandardCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldStandardCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'openPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'openPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'openPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'openPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'openPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      openPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'openPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'piInvoiceNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'piInvoiceNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'piInvoiceNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'piInvoiceNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'piInvoiceNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'piInvoiceNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      piInvoiceNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'piInvoiceNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pluNoGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoStartsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'projectCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'projectCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'projectCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      projectCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'projectCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      promoterCommRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promoterCommRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      promoterCommRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promoterCommRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3AfAverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3AfAverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3AfAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3AfAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3AfAverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfAverageCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3AfAverageCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3AfFifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3AfFifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3AfFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3AfFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3AfFifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfFifoCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3AfFifoCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3AfLastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3AfLastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3AfLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3AfLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3AfLastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfLastCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3AfLastCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3AfStandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3AfStandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3AfStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3AfStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3AfStandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3AfStandardCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3AfStandardCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3B4AverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3B4AverageCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3B4AverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3B4AverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3B4AverageCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4AverageCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3B4AverageCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3B4FifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3B4FifoCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3B4FifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3B4FifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3B4FifoCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4FifoCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3B4FifoCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3B4LastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3B4LastCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3B4LastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3B4LastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3B4LastCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4LastCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3B4LastCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pts3B4StandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pts3B4StandardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pts3B4StandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pts3B4StandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pts3B4StandardCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      pts3B4StandardCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pts3B4StandardCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> quantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> quantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLossIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityLoss',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLossIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityLoss',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLossEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityLossBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityOriginalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityOriginal',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      quantityOriginalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityOriginal',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      remarkGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      remarkStartsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnQty',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnQty',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      returnQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sequenceNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sequenceNoLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sequenceNoBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> skuNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      standardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      standardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stockType',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stockType',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stockType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stockType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stockType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stockType',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      stockTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stockType',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syLocationCode',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'syLocationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'syLocationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      syLocationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syLocationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxAmountEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxAmountLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxAmountBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> taxRateEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      taxRateGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> taxRateLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> taxRateBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmount1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount1',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmount1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount1',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmount2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountAmount2',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountAmount2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountAmount2',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRate1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate1',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRate1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate1',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRate2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitDiscountRate2',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitDiscountRate2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitDiscountRate2',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceBasicIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPriceBasic',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      unitPriceBasicIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPriceBasic',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomGreaterThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomContains(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension InvoiceItemQueryObject
    on QueryBuilder<InvoiceItem, InvoiceItem, QFilterCondition> {}

extension InvoiceItemQueryLinks
    on QueryBuilder<InvoiceItem, InvoiceItem, QFilterCondition> {}

extension InvoiceItemQuerySortBy
    on QueryBuilder<InvoiceItem, InvoiceItem, QSortBy> {
  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByAlternateDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByAlternateDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByChangePriceRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByChangePriceRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByCompanyCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByCtnUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCtnUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByCtnUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDefaultPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDefaultPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDoPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doPreLabel', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDoPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doPreLabel', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGstCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGstCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByInstantNormalSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByItemSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNameNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNameNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByOldAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldFifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldFifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldLastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldLastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOldStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByOldStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOpenPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByOpenPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPiInvoiceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'piInvoiceNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPiInvoiceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'piInvoiceNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPromoterCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfAverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfAverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPts3AfFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfFifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfFifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPts3AfLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfLastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfLastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfStandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3AfStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfStandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4AverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4AverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4AverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4AverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPts3B4FifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4FifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4FifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4FifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByPts3B4LastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4LastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4LastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4LastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4StandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4StandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByPts3B4StandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4StandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByQuantityLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByQuantityOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByReturnQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnQty', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByReturnQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnQty', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByStockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockType', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByStockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockType', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmount1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountAmount2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitDiscountRate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      sortByUnitPriceBasicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InvoiceItemQuerySortThenBy
    on QueryBuilder<InvoiceItem, InvoiceItem, QSortThenBy> {
  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByAlternateDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByAlternateDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alternateDescription', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByChangePriceRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByChangePriceRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePriceRemark', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByCompanyCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCommRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByCtnUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCtnUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByCtnUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ctnUom', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDefaultPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDefaultPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultPlu', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDoPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doPreLabel', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDoPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'doPreLabel', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGstCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGstCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByInstantNormalSellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instantNormalSellingPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByInvoicePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByInvoicePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoicePreLabel', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByItemSequenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemSequence', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByMiscCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'miscCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNameNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNameNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByNosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nos', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByOldAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldAverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldFifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldFifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldLastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldLastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOldStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByOldStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOpenPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByOpenPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'openPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPiInvoiceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'piInvoiceNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPiInvoiceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'piInvoiceNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByProjectCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByProjectCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'projectCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPromoterCommRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterCommRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfAverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfAverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPts3AfFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfFifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfFifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPts3AfLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfLastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfLastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfStandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3AfStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3AfStandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4AverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4AverageCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4AverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4AverageCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPts3B4FifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4FifoCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4FifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4FifoCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByPts3B4LastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4LastCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4LastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4LastCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4StandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4StandardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByPts3B4StandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pts3B4StandardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByQuantityLossDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoss', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByQuantityOriginalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOriginal', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByReturnQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnQty', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByReturnQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnQty', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByStockType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockType', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByStockTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockType', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenBySyLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenBySyLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syLocationCode', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByTaxRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmount1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount1', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountAmount2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountAmount2', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRate1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate1', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitDiscountRate2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitDiscountRate2', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy>
      thenByUnitPriceBasicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPriceBasic', Sort.desc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InvoiceItemQueryWhereDistinct
    on QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> {
  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByAlternateDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alternateDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByBatchNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByChangePriceRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changePriceRemark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByCompanyCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCommRate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByCtnUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctnUnitPrice');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByCtnUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ctnUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByDefaultPlu(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultPlu', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByDoPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'doPreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fifoCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foc');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focLoose');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByGstCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstPrice');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByInstantNormalSellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instantNormalSellingPrice');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByInvoicePreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoicePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByItemSequence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemSequence');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByMiscCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'miscCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByNameNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameNo');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByNos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nos');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByOldAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldAverageCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByOldFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldFifoCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByOldLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldLastCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByOldStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldStandardCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByOpenPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'openPrice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPiInvoiceNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'piInvoiceNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByProjectCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'projectCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByPromoterCommRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promoterCommRate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByPts3AfAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3AfAverageCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPts3AfFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3AfFifoCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPts3AfLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3AfLastCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByPts3AfStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3AfStandardCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByPts3B4AverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3B4AverageCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPts3B4FifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3B4FifoCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByPts3B4LastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3B4LastCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByPts3B4StandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pts3B4StandardCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityLoose');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByQuantityLoss() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityLoss');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByQuantityOriginal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityOriginal');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByReturnQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnQty');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standardCost');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByStockType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctBySyLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syLocationCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAmount');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByTaxRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxRate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountAmount1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount1');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountAmount2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountAmount2');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountRate1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate1');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct>
      distinctByUnitDiscountRate2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitDiscountRate2');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByUnitPriceBasic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPriceBasic');
    });
  }

  QueryBuilder<InvoiceItem, InvoiceItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension InvoiceItemQueryProperty
    on QueryBuilder<InvoiceItem, InvoiceItem, QQueryProperty> {
  QueryBuilder<InvoiceItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InvoiceItem, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations>
      alternateDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alternateDescription');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> averageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCost');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> batchNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNo');
    });
  }

  QueryBuilder<InvoiceItem, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<InvoiceItem, DateTime?, QQueryOperations>
      cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations>
      changePriceRemarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changePriceRemark');
    });
  }

  QueryBuilder<InvoiceItem, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      companyCommRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCommRate');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> ctnUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctnUnitPrice');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> ctnUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ctnUom');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> defaultPluProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultPlu');
    });
  }

  QueryBuilder<InvoiceItem, String, QQueryOperations> doPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'doPreLabel');
    });
  }

  QueryBuilder<InvoiceItem, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> fifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fifoCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> focProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foc');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> focLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focLoose');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> gstCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstCode');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> gstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstPrice');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      instantNormalSellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instantNormalSellingPrice');
    });
  }

  QueryBuilder<InvoiceItem, String, QQueryOperations>
      invoicePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoicePreLabel');
    });
  }

  QueryBuilder<InvoiceItem, int?, QQueryOperations> itemSequenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemSequence');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> lastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCost');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> miscCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'miscCost');
    });
  }

  QueryBuilder<InvoiceItem, int?, QQueryOperations> nameNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameNo');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> nosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nos');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      oldAverageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldAverageCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> oldFifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldFifoCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> oldLastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldLastCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      oldStandardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldStandardCost');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> openPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'openPrice');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> piInvoiceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'piInvoiceNo');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> projectCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'projectCode');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      promoterCommRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promoterCommRate');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3AfAverageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3AfAverageCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3AfFifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3AfFifoCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3AfLastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3AfLastCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3AfStandardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3AfStandardCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3B4AverageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3B4AverageCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3B4FifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3B4FifoCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3B4LastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3B4LastCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      pts3B4StandardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pts3B4StandardCost');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> quantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityLoose');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> quantityLossProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityLoss');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      quantityOriginalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityOriginal');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> returnQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnQty');
    });
  }

  QueryBuilder<InvoiceItem, int, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<InvoiceItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> standardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standardCost');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations> stockTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockType');
    });
  }

  QueryBuilder<InvoiceItem, String?, QQueryOperations>
      syLocationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syLocationCode');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> taxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAmount');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> taxRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxRate');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountAmount1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount1');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountAmount2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountAmount2');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountRate1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate1');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitDiscountRate2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitDiscountRate2');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations> unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<InvoiceItem, double?, QQueryOperations>
      unitPriceBasicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPriceBasic');
    });
  }

  QueryBuilder<InvoiceItem, String, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
