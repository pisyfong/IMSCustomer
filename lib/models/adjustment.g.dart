// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdjustmentCollection on Isar {
  IsarCollection<Adjustment> get adjustments => this.collection();
}

const AdjustmentSchema = CollectionSchema(
  name: r'Adjustment',
  id: -2980164181854294002,
  properties: {
    r'addedBy': PropertySchema(
      id: 0,
      name: r'addedBy',
      type: IsarType.long,
    ),
    r'adjustment': PropertySchema(
      id: 1,
      name: r'adjustment',
      type: IsarType.string,
    ),
    r'adjustmentDescription': PropertySchema(
      id: 2,
      name: r'adjustmentDescription',
      type: IsarType.string,
    ),
    r'batchName': PropertySchema(
      id: 3,
      name: r'batchName',
      type: IsarType.string,
    ),
    r'batchNo': PropertySchema(
      id: 4,
      name: r'batchNo',
      type: IsarType.long,
    ),
    r'companyCode': PropertySchema(
      id: 5,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 6,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isCustomer': PropertySchema(
      id: 7,
      name: r'isCustomer',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 8,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'locationCode': PropertySchema(
      id: 9,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'partyCode': PropertySchema(
      id: 10,
      name: r'partyCode',
      type: IsarType.string,
    ),
    r'partyName': PropertySchema(
      id: 11,
      name: r'partyName',
      type: IsarType.string,
    ),
    r'preLabel': PropertySchema(
      id: 12,
      name: r'preLabel',
      type: IsarType.string,
    ),
    r'reference': PropertySchema(
      id: 13,
      name: r'reference',
      type: IsarType.string,
    ),
    r'remark': PropertySchema(
      id: 14,
      name: r'remark',
      type: IsarType.string,
    ),
    r'representativeId': PropertySchema(
      id: 15,
      name: r'representativeId',
      type: IsarType.long,
    ),
    r'sign': PropertySchema(
      id: 16,
      name: r'sign',
      type: IsarType.long,
    ),
    r'syncError': PropertySchema(
      id: 17,
      name: r'syncError',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 18,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'term': PropertySchema(
      id: 19,
      name: r'term',
      type: IsarType.string,
    ),
    r'termDays': PropertySchema(
      id: 20,
      name: r'termDays',
      type: IsarType.long,
    )
  },
  estimateSize: _adjustmentEstimateSize,
  serialize: _adjustmentSerialize,
  deserialize: _adjustmentDeserialize,
  deserializeProp: _adjustmentDeserializeProp,
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
    r'preLabel': IndexSchema(
      id: -4704031876332709419,
      name: r'preLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'preLabel',
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
  getId: _adjustmentGetId,
  getLinks: _adjustmentGetLinks,
  attach: _adjustmentAttach,
  version: '3.1.0+1',
);

int _adjustmentEstimateSize(
  Adjustment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.adjustment.length * 3;
  {
    final value = object.adjustmentDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.batchName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.isCustomer.length * 3;
  bytesCount += 3 + object.locationCode.length * 3;
  {
    final value = object.partyCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.partyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.preLabel.length * 3;
  {
    final value = object.reference;
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
  return bytesCount;
}

void _adjustmentSerialize(
  Adjustment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeString(offsets[1], object.adjustment);
  writer.writeString(offsets[2], object.adjustmentDescription);
  writer.writeString(offsets[3], object.batchName);
  writer.writeLong(offsets[4], object.batchNo);
  writer.writeLong(offsets[5], object.companyCode);
  writer.writeDateTime(offsets[6], object.createdAt);
  writer.writeString(offsets[7], object.isCustomer);
  writer.writeBool(offsets[8], object.isSynced);
  writer.writeString(offsets[9], object.locationCode);
  writer.writeString(offsets[10], object.partyCode);
  writer.writeString(offsets[11], object.partyName);
  writer.writeString(offsets[12], object.preLabel);
  writer.writeString(offsets[13], object.reference);
  writer.writeString(offsets[14], object.remark);
  writer.writeLong(offsets[15], object.representativeId);
  writer.writeLong(offsets[16], object.sign);
  writer.writeString(offsets[17], object.syncError);
  writer.writeDateTime(offsets[18], object.syncedAt);
  writer.writeString(offsets[19], object.term);
  writer.writeLong(offsets[20], object.termDays);
}

Adjustment _adjustmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Adjustment();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.adjustment = reader.readString(offsets[1]);
  object.adjustmentDescription = reader.readStringOrNull(offsets[2]);
  object.batchName = reader.readStringOrNull(offsets[3]);
  object.batchNo = reader.readLongOrNull(offsets[4]);
  object.companyCode = reader.readLong(offsets[5]);
  object.createdAt = reader.readDateTime(offsets[6]);
  object.id = id;
  object.isCustomer = reader.readString(offsets[7]);
  object.isSynced = reader.readBool(offsets[8]);
  object.locationCode = reader.readString(offsets[9]);
  object.partyCode = reader.readStringOrNull(offsets[10]);
  object.partyName = reader.readStringOrNull(offsets[11]);
  object.preLabel = reader.readString(offsets[12]);
  object.reference = reader.readStringOrNull(offsets[13]);
  object.remark = reader.readStringOrNull(offsets[14]);
  object.representativeId = reader.readLongOrNull(offsets[15]);
  object.sign = reader.readLong(offsets[16]);
  object.syncError = reader.readStringOrNull(offsets[17]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[18]);
  object.term = reader.readStringOrNull(offsets[19]);
  object.termDays = reader.readLongOrNull(offsets[20]);
  return object;
}

P _adjustmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _adjustmentGetId(Adjustment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _adjustmentGetLinks(Adjustment object) {
  return [];
}

void _adjustmentAttach(IsarCollection<dynamic> col, Id id, Adjustment object) {
  object.id = id;
}

extension AdjustmentQueryWhereSort
    on QueryBuilder<Adjustment, Adjustment, QWhere> {
  QueryBuilder<Adjustment, Adjustment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhere> anyIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSynced'),
      );
    });
  }
}

extension AdjustmentQueryWhere
    on QueryBuilder<Adjustment, Adjustment, QWhereClause> {
  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> idBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause>
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> preLabelEqualTo(
      String preLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'preLabel',
        value: [preLabel],
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> preLabelNotEqualTo(
      String preLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preLabel',
              lower: [],
              upper: [preLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preLabel',
              lower: [preLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preLabel',
              lower: [preLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'preLabel',
              lower: [],
              upper: [preLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> isSyncedEqualTo(
      bool isSynced) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isSynced',
        value: [isSynced],
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterWhereClause> isSyncedNotEqualTo(
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

extension AdjustmentQueryFilter
    on QueryBuilder<Adjustment, Adjustment, QFilterCondition> {
  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> adjustmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> adjustmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adjustment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> adjustmentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adjustment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustment',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adjustment',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adjustmentDescription',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adjustmentDescription',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adjustmentDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adjustmentDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adjustmentDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adjustmentDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      adjustmentDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adjustmentDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchName',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchName',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchName',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchName',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchNo',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNo',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      batchNoGreaterThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNoLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> batchNoBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> isCustomerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> isCustomerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isCustomer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> isCustomerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isCustomer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      isCustomerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeEqualTo(
    String value, {
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeGreaterThan(
    String value, {
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeLessThan(
    String value, {
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partyCode',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partyCode',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partyCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partyCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partyCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partyCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'partyName',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'partyName',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> partyNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      partyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partyName',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      preLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      preLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> preLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      preLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      preLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reference',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reference',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reference',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> referenceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reference',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reference',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      referenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reference',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkGreaterThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkStartsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkEndsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkContains(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      representativeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      representativeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'representativeId',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      representativeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> signEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sign',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> signGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sign',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> signLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sign',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> signBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sign',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncError',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncError',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorEqualTo(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncErrorStartsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorEndsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorContains(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncErrorMatches(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncError',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'syncError',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      syncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'term',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termEqualTo(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termGreaterThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termLessThan(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termBetween(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termStartsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termEndsWith(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termContains(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termMatches(
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

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'termDays',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      termDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'termDays',
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termDaysEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'termDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition>
      termDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'termDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'termDays',
        value: value,
      ));
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterFilterCondition> termDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'termDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AdjustmentQueryObject
    on QueryBuilder<Adjustment, Adjustment, QFilterCondition> {}

extension AdjustmentQueryLinks
    on QueryBuilder<Adjustment, Adjustment, QFilterCondition> {}

extension AdjustmentQuerySortBy
    on QueryBuilder<Adjustment, Adjustment, QSortBy> {
  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByAdjustment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustment', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByAdjustmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustment', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      sortByAdjustmentDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentDescription', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      sortByAdjustmentDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentDescription', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByBatchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByBatchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByIsCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomer', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByIsCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomer', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPartyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPartyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPartyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyName', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPartyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyName', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reference', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reference', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      sortByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByTermDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'termDays', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> sortByTermDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'termDays', Sort.desc);
    });
  }
}

extension AdjustmentQuerySortThenBy
    on QueryBuilder<Adjustment, Adjustment, QSortThenBy> {
  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByAdjustment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustment', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByAdjustmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustment', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      thenByAdjustmentDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentDescription', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      thenByAdjustmentDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adjustmentDescription', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByBatchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByBatchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByIsCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomer', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByIsCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomer', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPartyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyCode', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPartyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyCode', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPartyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyName', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPartyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partyName', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByReference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reference', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByReferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reference', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy>
      thenByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncError', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByTermDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'termDays', Sort.asc);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QAfterSortBy> thenByTermDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'termDays', Sort.desc);
    });
  }
}

extension AdjustmentQueryWhereDistinct
    on QueryBuilder<Adjustment, Adjustment, QDistinct> {
  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByAdjustment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct>
      distinctByAdjustmentDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adjustmentDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByBatchName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNo');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByIsCustomer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustomer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByPartyCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partyCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByPartyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByReference(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reference', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'representativeId');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sign');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctBySyncError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByTerm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'term', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Adjustment, Adjustment, QDistinct> distinctByTermDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'termDays');
    });
  }
}

extension AdjustmentQueryProperty
    on QueryBuilder<Adjustment, Adjustment, QQueryProperty> {
  QueryBuilder<Adjustment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Adjustment, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<Adjustment, String, QQueryOperations> adjustmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustment');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations>
      adjustmentDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adjustmentDescription');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> batchNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchName');
    });
  }

  QueryBuilder<Adjustment, int?, QQueryOperations> batchNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNo');
    });
  }

  QueryBuilder<Adjustment, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<Adjustment, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Adjustment, String, QQueryOperations> isCustomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustomer');
    });
  }

  QueryBuilder<Adjustment, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Adjustment, String, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> partyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partyCode');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> partyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partyName');
    });
  }

  QueryBuilder<Adjustment, String, QQueryOperations> preLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preLabel');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> referenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reference');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<Adjustment, int?, QQueryOperations> representativeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'representativeId');
    });
  }

  QueryBuilder<Adjustment, int, QQueryOperations> signProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sign');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> syncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncError');
    });
  }

  QueryBuilder<Adjustment, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<Adjustment, String?, QQueryOperations> termProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'term');
    });
  }

  QueryBuilder<Adjustment, int?, QQueryOperations> termDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'termDays');
    });
  }
}
