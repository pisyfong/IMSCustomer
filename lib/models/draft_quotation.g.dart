// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_quotation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDraftQuotationCollection on Isar {
  IsarCollection<DraftQuotation> get draftQuotations => this.collection();
}

const DraftQuotationSchema = CollectionSchema(
  name: r'DraftQuotation',
  id: 7717740244731617691,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'convertedQuotePreLabel': PropertySchema(
      id: 1,
      name: r'convertedQuotePreLabel',
      type: IsarType.string,
    ),
    r'createdDate': PropertySchema(
      id: 2,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'customerCode': PropertySchema(
      id: 3,
      name: r'customerCode',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 4,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'grossAmount': PropertySchema(
      id: 5,
      name: r'grossAmount',
      type: IsarType.double,
    ),
    r'lastModifiedDate': PropertySchema(
      id: 6,
      name: r'lastModifiedDate',
      type: IsarType.dateTime,
    ),
    r'netAmount': PropertySchema(
      id: 7,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'remarks': PropertySchema(
      id: 8,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'salespersonCode': PropertySchema(
      id: 9,
      name: r'salespersonCode',
      type: IsarType.string,
    ),
    r'salespersonName': PropertySchema(
      id: 10,
      name: r'salespersonName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'totalItems': PropertySchema(
      id: 12,
      name: r'totalItems',
      type: IsarType.long,
    ),
    r'totalQuantity': PropertySchema(
      id: 13,
      name: r'totalQuantity',
      type: IsarType.double,
    )
  },
  estimateSize: _draftQuotationEstimateSize,
  serialize: _draftQuotationSerialize,
  deserialize: _draftQuotationDeserialize,
  deserializeProp: _draftQuotationDeserializeProp,
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
    r'customerCode': IndexSchema(
      id: 7083394596576351214,
      name: r'customerCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'customerCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _draftQuotationGetId,
  getLinks: _draftQuotationGetLinks,
  attach: _draftQuotationAttach,
  version: '3.1.0+1',
);

int _draftQuotationEstimateSize(
  DraftQuotation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.convertedQuotePreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerName;
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
    final value = object.salespersonCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.salespersonName;
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
  return bytesCount;
}

void _draftQuotationSerialize(
  DraftQuotation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.convertedQuotePreLabel);
  writer.writeDateTime(offsets[2], object.createdDate);
  writer.writeString(offsets[3], object.customerCode);
  writer.writeString(offsets[4], object.customerName);
  writer.writeDouble(offsets[5], object.grossAmount);
  writer.writeDateTime(offsets[6], object.lastModifiedDate);
  writer.writeDouble(offsets[7], object.netAmount);
  writer.writeString(offsets[8], object.remarks);
  writer.writeString(offsets[9], object.salespersonCode);
  writer.writeString(offsets[10], object.salespersonName);
  writer.writeString(offsets[11], object.status);
  writer.writeLong(offsets[12], object.totalItems);
  writer.writeDouble(offsets[13], object.totalQuantity);
}

DraftQuotation _draftQuotationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftQuotation();
  object.companyCode = reader.readLong(offsets[0]);
  object.convertedQuotePreLabel = reader.readStringOrNull(offsets[1]);
  object.createdDate = reader.readDateTimeOrNull(offsets[2]);
  object.customerCode = reader.readStringOrNull(offsets[3]);
  object.customerName = reader.readStringOrNull(offsets[4]);
  object.grossAmount = reader.readDouble(offsets[5]);
  object.id = id;
  object.lastModifiedDate = reader.readDateTimeOrNull(offsets[6]);
  object.netAmount = reader.readDouble(offsets[7]);
  object.remarks = reader.readStringOrNull(offsets[8]);
  object.salespersonCode = reader.readStringOrNull(offsets[9]);
  object.salespersonName = reader.readStringOrNull(offsets[10]);
  object.status = reader.readStringOrNull(offsets[11]);
  object.totalItems = reader.readLong(offsets[12]);
  object.totalQuantity = reader.readDouble(offsets[13]);
  return object;
}

P _draftQuotationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _draftQuotationGetId(DraftQuotation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _draftQuotationGetLinks(DraftQuotation object) {
  return [];
}

void _draftQuotationAttach(
    IsarCollection<dynamic> col, Id id, DraftQuotation object) {
  object.id = id;
}

extension DraftQuotationQueryWhereSort
    on QueryBuilder<DraftQuotation, DraftQuotation, QWhere> {
  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension DraftQuotationQueryWhere
    on QueryBuilder<DraftQuotation, DraftQuotation, QWhereClause> {
  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause> idBetween(
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
      customerCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
      customerCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'customerCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
      customerCodeEqualTo(String? customerCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerCode',
        value: [customerCode],
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterWhereClause>
      customerCodeNotEqualTo(String? customerCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerCode',
              lower: [],
              upper: [customerCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerCode',
              lower: [customerCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerCode',
              lower: [customerCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerCode',
              lower: [],
              upper: [customerCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DraftQuotationQueryFilter
    on QueryBuilder<DraftQuotation, DraftQuotation, QFilterCondition> {
  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'convertedQuotePreLabel',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'convertedQuotePreLabel',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'convertedQuotePreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'convertedQuotePreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'convertedQuotePreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'convertedQuotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      convertedQuotePreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'convertedQuotePreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      createdDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerCode',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerCode',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerName',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      grossAmountEqualTo(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      grossAmountGreaterThan(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      grossAmountLessThan(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      grossAmountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      lastModifiedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      lastModifiedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedDate',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      lastModifiedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      netAmountEqualTo(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      netAmountGreaterThan(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      netAmountLessThan(
    double value, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      netAmountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salespersonCode',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salespersonCode',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salespersonCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salespersonCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salespersonCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salespersonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salespersonCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salespersonName',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salespersonName',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salespersonName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salespersonName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salespersonName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salespersonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      salespersonNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salespersonName',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalItemsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalItemsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalItemsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalItems',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalItemsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalItems',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterFilterCondition>
      totalQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DraftQuotationQueryObject
    on QueryBuilder<DraftQuotation, DraftQuotation, QFilterCondition> {}

extension DraftQuotationQueryLinks
    on QueryBuilder<DraftQuotation, DraftQuotation, QFilterCondition> {}

extension DraftQuotationQuerySortBy
    on QueryBuilder<DraftQuotation, DraftQuotation, QSortBy> {
  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByConvertedQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedQuotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByConvertedQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedQuotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortBySalespersonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortBySalespersonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortBySalespersonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonName', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortBySalespersonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonName', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByTotalItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      sortByTotalQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.desc);
    });
  }
}

extension DraftQuotationQuerySortThenBy
    on QueryBuilder<DraftQuotation, DraftQuotation, QSortThenBy> {
  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByConvertedQuotePreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedQuotePreLabel', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByConvertedQuotePreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'convertedQuotePreLabel', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCustomerCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCustomerCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByGrossAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByLastModifiedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenBySalespersonCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenBySalespersonCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenBySalespersonName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonName', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenBySalespersonNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salespersonName', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByTotalItemsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalItems', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QAfterSortBy>
      thenByTotalQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalQuantity', Sort.desc);
    });
  }
}

extension DraftQuotationQueryWhereDistinct
    on QueryBuilder<DraftQuotation, DraftQuotation, QDistinct> {
  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByConvertedQuotePreLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'convertedQuotePreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByCustomerCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByGrossAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossAmount');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByLastModifiedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedDate');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctBySalespersonCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salespersonCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctBySalespersonName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salespersonName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByTotalItems() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalItems');
    });
  }

  QueryBuilder<DraftQuotation, DraftQuotation, QDistinct>
      distinctByTotalQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalQuantity');
    });
  }
}

extension DraftQuotationQueryProperty
    on QueryBuilder<DraftQuotation, DraftQuotation, QQueryProperty> {
  QueryBuilder<DraftQuotation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DraftQuotation, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations>
      convertedQuotePreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'convertedQuotePreLabel');
    });
  }

  QueryBuilder<DraftQuotation, DateTime?, QQueryOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations>
      customerCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCode');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<DraftQuotation, double, QQueryOperations> grossAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossAmount');
    });
  }

  QueryBuilder<DraftQuotation, DateTime?, QQueryOperations>
      lastModifiedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedDate');
    });
  }

  QueryBuilder<DraftQuotation, double, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations>
      salespersonCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salespersonCode');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations>
      salespersonNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salespersonName');
    });
  }

  QueryBuilder<DraftQuotation, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DraftQuotation, int, QQueryOperations> totalItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalItems');
    });
  }

  QueryBuilder<DraftQuotation, double, QQueryOperations>
      totalQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalQuantity');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDraftQuotationItemCollection on Isar {
  IsarCollection<DraftQuotationItem> get draftQuotationItems =>
      this.collection();
}

const DraftQuotationItemSchema = CollectionSchema(
  name: r'DraftQuotationItem',
  id: 7396020301982022353,
  properties: {
    r'addedDate': PropertySchema(
      id: 0,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'brand': PropertySchema(
      id: 1,
      name: r'brand',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 2,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'draftId': PropertySchema(
      id: 4,
      name: r'draftId',
      type: IsarType.long,
    ),
    r'factor': PropertySchema(
      id: 5,
      name: r'factor',
      type: IsarType.double,
    ),
    r'factorOrOne': PropertySchema(
      id: 6,
      name: r'factorOrOne',
      type: IsarType.double,
    ),
    r'foc': PropertySchema(
      id: 7,
      name: r'foc',
      type: IsarType.double,
    ),
    r'focLoose': PropertySchema(
      id: 8,
      name: r'focLoose',
      type: IsarType.double,
    ),
    r'focLooseQty': PropertySchema(
      id: 9,
      name: r'focLooseQty',
      type: IsarType.double,
    ),
    r'focQty': PropertySchema(
      id: 10,
      name: r'focQty',
      type: IsarType.double,
    ),
    r'looseQty': PropertySchema(
      id: 11,
      name: r'looseQty',
      type: IsarType.double,
    ),
    r'netAmount': PropertySchema(
      id: 12,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'pluNo': PropertySchema(
      id: 13,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 14,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'quantityLoose': PropertySchema(
      id: 15,
      name: r'quantityLoose',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 16,
      name: r'remark',
      type: IsarType.string,
    ),
    r'sequenceNo': PropertySchema(
      id: 17,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 18,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'unitPrice': PropertySchema(
      id: 19,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'uom': PropertySchema(
      id: 20,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _draftQuotationItemEstimateSize,
  serialize: _draftQuotationItemSerialize,
  deserialize: _draftQuotationItemDeserialize,
  deserializeProp: _draftQuotationItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'draftId': IndexSchema(
      id: 5577587084572475806,
      name: r'draftId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'draftId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
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
  getId: _draftQuotationItemGetId,
  getLinks: _draftQuotationItemGetLinks,
  attach: _draftQuotationItemAttach,
  version: '3.1.0+1',
);

int _draftQuotationItemEstimateSize(
  DraftQuotationItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.brand;
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
    final value = object.pluNo;
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
    final value = object.uom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _draftQuotationItemSerialize(
  DraftQuotationItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDate);
  writer.writeString(offsets[1], object.brand);
  writer.writeLong(offsets[2], object.companyCode);
  writer.writeString(offsets[3], object.description);
  writer.writeLong(offsets[4], object.draftId);
  writer.writeDouble(offsets[5], object.factor);
  writer.writeDouble(offsets[6], object.factorOrOne);
  writer.writeDouble(offsets[7], object.foc);
  writer.writeDouble(offsets[8], object.focLoose);
  writer.writeDouble(offsets[9], object.focLooseQty);
  writer.writeDouble(offsets[10], object.focQty);
  writer.writeDouble(offsets[11], object.looseQty);
  writer.writeDouble(offsets[12], object.netAmount);
  writer.writeString(offsets[13], object.pluNo);
  writer.writeDouble(offsets[14], object.quantity);
  writer.writeDouble(offsets[15], object.quantityLoose);
  writer.writeString(offsets[16], object.remark);
  writer.writeLong(offsets[17], object.sequenceNo);
  writer.writeLong(offsets[18], object.skuNo);
  writer.writeDouble(offsets[19], object.unitPrice);
  writer.writeString(offsets[20], object.uom);
}

DraftQuotationItem _draftQuotationItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftQuotationItem();
  object.addedDate = reader.readDateTimeOrNull(offsets[0]);
  object.brand = reader.readStringOrNull(offsets[1]);
  object.companyCode = reader.readLong(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.draftId = reader.readLong(offsets[4]);
  object.factor = reader.readDoubleOrNull(offsets[5]);
  object.foc = reader.readDoubleOrNull(offsets[7]);
  object.focLoose = reader.readDoubleOrNull(offsets[8]);
  object.id = id;
  object.netAmount = reader.readDouble(offsets[12]);
  object.pluNo = reader.readStringOrNull(offsets[13]);
  object.quantity = reader.readDouble(offsets[14]);
  object.quantityLoose = reader.readDoubleOrNull(offsets[15]);
  object.remark = reader.readStringOrNull(offsets[16]);
  object.sequenceNo = reader.readLong(offsets[17]);
  object.skuNo = reader.readLong(offsets[18]);
  object.unitPrice = reader.readDouble(offsets[19]);
  object.uom = reader.readStringOrNull(offsets[20]);
  return object;
}

P _draftQuotationItemDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _draftQuotationItemGetId(DraftQuotationItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _draftQuotationItemGetLinks(
    DraftQuotationItem object) {
  return [];
}

void _draftQuotationItemAttach(
    IsarCollection<dynamic> col, Id id, DraftQuotationItem object) {
  object.id = id;
}

extension DraftQuotationItemQueryWhereSort
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QWhere> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhere>
      anyDraftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'draftId'),
      );
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhere>
      anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension DraftQuotationItemQueryWhere
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QWhereClause> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      draftIdEqualTo(int draftId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'draftId',
        value: [draftId],
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      draftIdNotEqualTo(int draftId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'draftId',
              lower: [],
              upper: [draftId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'draftId',
              lower: [draftId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'draftId',
              lower: [draftId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'draftId',
              lower: [],
              upper: [draftId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      draftIdGreaterThan(
    int draftId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'draftId',
        lower: [draftId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      draftIdLessThan(
    int draftId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'draftId',
        lower: [],
        upper: [draftId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      draftIdBetween(
    int lowerDraftId,
    int upperDraftId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'draftId',
        lower: [lowerDraftId],
        includeLower: includeLower,
        upper: [upperDraftId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterWhereClause>
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
}

extension DraftQuotationItemQueryFilter
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QFilterCondition> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      addedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'brand',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      draftIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'draftId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      draftIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'draftId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      draftIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'draftId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      draftIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'draftId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorOrOneEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'factorOrOne',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorOrOneGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'factorOrOne',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorOrOneLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'factorOrOne',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      factorOrOneBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'factorOrOne',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focGreaterThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseQtyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focLooseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseQtyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focLooseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseQtyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focLooseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focLooseQtyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focLooseQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focQtyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focQtyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focQtyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      focQtyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      looseQtyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'looseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      looseQtyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'looseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      looseQtyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'looseQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      looseQtyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'looseQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      netAmountEqualTo(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      netAmountGreaterThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      netAmountLessThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      netAmountBetween(
    double lower,
    double upper, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoStartsWith(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoEndsWith(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pluNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityEqualTo(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityGreaterThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityLessThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityBetween(
    double lower,
    double upper, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      quantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkEndsWith(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      sequenceNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      skuNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      unitPriceEqualTo(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      unitPriceGreaterThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      unitPriceLessThan(
    double value, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      unitPriceBetween(
    double lower,
    double upper, {
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomEqualTo(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomLessThan(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomBetween(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomEndsWith(
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

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension DraftQuotationItemQueryObject
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QFilterCondition> {}

extension DraftQuotationItemQueryLinks
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QFilterCondition> {}

extension DraftQuotationItemQuerySortBy
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QSortBy> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByDraftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'draftId', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByDraftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'draftId', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFactorOrOne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factorOrOne', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFactorOrOneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factorOrOne', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByFocQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension DraftQuotationItemQuerySortThenBy
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QSortThenBy> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByDraftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'draftId', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByDraftIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'draftId', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFactorOrOne() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factorOrOne', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFactorOrOneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factorOrOne', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByFocQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QAfterSortBy>
      thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension DraftQuotationItemQueryWhereDistinct
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct> {
  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByBrand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByDraftId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'draftId');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFactorOrOne() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factorOrOne');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foc');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focLoose');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focLooseQty');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focQty');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'looseQty');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByPluNo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityLoose');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByRemark({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<DraftQuotationItem, DraftQuotationItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension DraftQuotationItemQueryProperty
    on QueryBuilder<DraftQuotationItem, DraftQuotationItem, QQueryProperty> {
  QueryBuilder<DraftQuotationItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DraftQuotationItem, DateTime?, QQueryOperations>
      addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<DraftQuotationItem, String?, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<DraftQuotationItem, int, QQueryOperations>
      companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<DraftQuotationItem, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DraftQuotationItem, int, QQueryOperations> draftIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'draftId');
    });
  }

  QueryBuilder<DraftQuotationItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      factorOrOneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factorOrOne');
    });
  }

  QueryBuilder<DraftQuotationItem, double?, QQueryOperations> focProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foc');
    });
  }

  QueryBuilder<DraftQuotationItem, double?, QQueryOperations>
      focLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focLoose');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      focLooseQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focLooseQty');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations> focQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focQty');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      looseQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'looseQty');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<DraftQuotationItem, String?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<DraftQuotationItem, double?, QQueryOperations>
      quantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityLoose');
    });
  }

  QueryBuilder<DraftQuotationItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<DraftQuotationItem, int, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<DraftQuotationItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<DraftQuotationItem, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<DraftQuotationItem, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
