// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_lookup.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdjustmentCodeRowCollection on Isar {
  IsarCollection<AdjustmentCodeRow> get adjustmentCodeRows => this.collection();
}

const AdjustmentCodeRowSchema = CollectionSchema(
  name: r'AdjustmentCodeRow',
  id: 6461781516361995306,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 1,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'defaultRemark': PropertySchema(
      id: 2,
      name: r'defaultRemark',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'locationCode': PropertySchema(
      id: 4,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'lookupKey': PropertySchema(
      id: 5,
      name: r'lookupKey',
      type: IsarType.string,
    ),
    r'sign': PropertySchema(
      id: 6,
      name: r'sign',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.long,
    ),
    r'vendorCustomer': PropertySchema(
      id: 8,
      name: r'vendorCustomer',
      type: IsarType.string,
    )
  },
  estimateSize: _adjustmentCodeRowEstimateSize,
  serialize: _adjustmentCodeRowSerialize,
  deserialize: _adjustmentCodeRowDeserialize,
  deserializeProp: _adjustmentCodeRowDeserializeProp,
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
    r'locationCode': IndexSchema(
      id: -3269324652395557164,
      name: r'locationCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locationCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lookupKey': IndexSchema(
      id: -734172310848304736,
      name: r'lookupKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'lookupKey',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _adjustmentCodeRowGetId,
  getLinks: _adjustmentCodeRowGetLinks,
  attach: _adjustmentCodeRowAttach,
  version: '3.1.0+1',
);

int _adjustmentCodeRowEstimateSize(
  AdjustmentCodeRow object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.defaultRemark;
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
  bytesCount += 3 + object.locationCode.length * 3;
  bytesCount += 3 + object.lookupKey.length * 3;
  bytesCount += 3 + object.vendorCustomer.length * 3;
  return bytesCount;
}

void _adjustmentCodeRowSerialize(
  AdjustmentCodeRow object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeLong(offsets[1], object.companyCode);
  writer.writeString(offsets[2], object.defaultRemark);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.locationCode);
  writer.writeString(offsets[5], object.lookupKey);
  writer.writeLong(offsets[6], object.sign);
  writer.writeLong(offsets[7], object.type);
  writer.writeString(offsets[8], object.vendorCustomer);
}

AdjustmentCodeRow _adjustmentCodeRowDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdjustmentCodeRow();
  object.code = reader.readString(offsets[0]);
  object.companyCode = reader.readLong(offsets[1]);
  object.defaultRemark = reader.readStringOrNull(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.locationCode = reader.readString(offsets[4]);
  object.sign = reader.readLong(offsets[6]);
  object.type = reader.readLong(offsets[7]);
  object.vendorCustomer = reader.readString(offsets[8]);
  return object;
}

P _adjustmentCodeRowDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _adjustmentCodeRowGetId(AdjustmentCodeRow object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _adjustmentCodeRowGetLinks(
    AdjustmentCodeRow object) {
  return [];
}

void _adjustmentCodeRowAttach(
    IsarCollection<dynamic> col, Id id, AdjustmentCodeRow object) {
  object.id = id;
}

extension AdjustmentCodeRowByIndex on IsarCollection<AdjustmentCodeRow> {
  Future<AdjustmentCodeRow?> getByLookupKey(String lookupKey) {
    return getByIndex(r'lookupKey', [lookupKey]);
  }

  AdjustmentCodeRow? getByLookupKeySync(String lookupKey) {
    return getByIndexSync(r'lookupKey', [lookupKey]);
  }

  Future<bool> deleteByLookupKey(String lookupKey) {
    return deleteByIndex(r'lookupKey', [lookupKey]);
  }

  bool deleteByLookupKeySync(String lookupKey) {
    return deleteByIndexSync(r'lookupKey', [lookupKey]);
  }

  Future<List<AdjustmentCodeRow?>> getAllByLookupKey(
      List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'lookupKey', values);
  }

  List<AdjustmentCodeRow?> getAllByLookupKeySync(List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lookupKey', values);
  }

  Future<int> deleteAllByLookupKey(List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lookupKey', values);
  }

  int deleteAllByLookupKeySync(List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lookupKey', values);
  }

  Future<Id> putByLookupKey(AdjustmentCodeRow object) {
    return putByIndex(r'lookupKey', object);
  }

  Id putByLookupKeySync(AdjustmentCodeRow object, {bool saveLinks = true}) {
    return putByIndexSync(r'lookupKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLookupKey(List<AdjustmentCodeRow> objects) {
    return putAllByIndex(r'lookupKey', objects);
  }

  List<Id> putAllByLookupKeySync(List<AdjustmentCodeRow> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'lookupKey', objects, saveLinks: saveLinks);
  }
}

extension AdjustmentCodeRowQueryWhereSort
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QWhere> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhere>
      anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension AdjustmentCodeRowQueryWhere
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QWhereClause> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      locationCodeEqualTo(String locationCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'locationCode',
        value: [locationCode],
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      locationCodeNotEqualTo(String locationCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [],
              upper: [locationCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [locationCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [locationCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [],
              upper: [locationCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      lookupKeyEqualTo(String lookupKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lookupKey',
        value: [lookupKey],
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterWhereClause>
      lookupKeyNotEqualTo(String lookupKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [],
              upper: [lookupKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [lookupKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [lookupKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [],
              upper: [lookupKey],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AdjustmentCodeRowQueryFilter
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QFilterCondition> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defaultRemark',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defaultRemark',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultRemark',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultRemark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultRemark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      defaultRemarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultRemark',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lookupKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lookupKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupKey',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      lookupKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lookupKey',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      signEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sign',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      signGreaterThan(
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      signLessThan(
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      signBetween(
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

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      typeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      typeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      typeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      typeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vendorCustomer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vendorCustomer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vendorCustomer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vendorCustomer',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterFilterCondition>
      vendorCustomerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vendorCustomer',
        value: '',
      ));
    });
  }
}

extension AdjustmentCodeRowQueryObject
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QFilterCondition> {}

extension AdjustmentCodeRowQueryLinks
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QFilterCondition> {}

extension AdjustmentCodeRowQuerySortBy
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QSortBy> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByDefaultRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultRemark', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByDefaultRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultRemark', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByLookupKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByLookupKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByVendorCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorCustomer', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      sortByVendorCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorCustomer', Sort.desc);
    });
  }
}

extension AdjustmentCodeRowQuerySortThenBy
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QSortThenBy> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByDefaultRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultRemark', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByDefaultRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultRemark', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByLookupKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByLookupKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenBySignDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sign', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByVendorCustomer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorCustomer', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QAfterSortBy>
      thenByVendorCustomerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vendorCustomer', Sort.desc);
    });
  }
}

extension AdjustmentCodeRowQueryWhereDistinct
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct> {
  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByDefaultRemark({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultRemark',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByLocationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByLookupKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lookupKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctBySign() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sign');
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QDistinct>
      distinctByVendorCustomer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vendorCustomer',
          caseSensitive: caseSensitive);
    });
  }
}

extension AdjustmentCodeRowQueryProperty
    on QueryBuilder<AdjustmentCodeRow, AdjustmentCodeRow, QQueryProperty> {
  QueryBuilder<AdjustmentCodeRow, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<AdjustmentCodeRow, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String?, QQueryOperations>
      defaultRemarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultRemark');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String, QQueryOperations>
      locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String, QQueryOperations>
      lookupKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lookupKey');
    });
  }

  QueryBuilder<AdjustmentCodeRow, int, QQueryOperations> signProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sign');
    });
  }

  QueryBuilder<AdjustmentCodeRow, int, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<AdjustmentCodeRow, String, QQueryOperations>
      vendorCustomerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vendorCustomer');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdjustmentBatchRowCollection on Isar {
  IsarCollection<AdjustmentBatchRow> get adjustmentBatchRows =>
      this.collection();
}

const AdjustmentBatchRowSchema = CollectionSchema(
  name: r'AdjustmentBatchRow',
  id: 2607900155602697682,
  properties: {
    r'batchName': PropertySchema(
      id: 0,
      name: r'batchName',
      type: IsarType.string,
    ),
    r'batchNo': PropertySchema(
      id: 1,
      name: r'batchNo',
      type: IsarType.long,
    ),
    r'companyCode': PropertySchema(
      id: 2,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'locationCode': PropertySchema(
      id: 3,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'lookupKey': PropertySchema(
      id: 4,
      name: r'lookupKey',
      type: IsarType.string,
    )
  },
  estimateSize: _adjustmentBatchRowEstimateSize,
  serialize: _adjustmentBatchRowSerialize,
  deserialize: _adjustmentBatchRowDeserialize,
  deserializeProp: _adjustmentBatchRowDeserializeProp,
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
    r'locationCode': IndexSchema(
      id: -3269324652395557164,
      name: r'locationCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locationCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lookupKey': IndexSchema(
      id: -734172310848304736,
      name: r'lookupKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'lookupKey',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _adjustmentBatchRowGetId,
  getLinks: _adjustmentBatchRowGetLinks,
  attach: _adjustmentBatchRowAttach,
  version: '3.1.0+1',
);

int _adjustmentBatchRowEstimateSize(
  AdjustmentBatchRow object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.batchName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.locationCode.length * 3;
  bytesCount += 3 + object.lookupKey.length * 3;
  return bytesCount;
}

void _adjustmentBatchRowSerialize(
  AdjustmentBatchRow object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.batchName);
  writer.writeLong(offsets[1], object.batchNo);
  writer.writeLong(offsets[2], object.companyCode);
  writer.writeString(offsets[3], object.locationCode);
  writer.writeString(offsets[4], object.lookupKey);
}

AdjustmentBatchRow _adjustmentBatchRowDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdjustmentBatchRow();
  object.batchName = reader.readStringOrNull(offsets[0]);
  object.batchNo = reader.readLong(offsets[1]);
  object.companyCode = reader.readLong(offsets[2]);
  object.id = id;
  object.locationCode = reader.readString(offsets[3]);
  return object;
}

P _adjustmentBatchRowDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _adjustmentBatchRowGetId(AdjustmentBatchRow object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _adjustmentBatchRowGetLinks(
    AdjustmentBatchRow object) {
  return [];
}

void _adjustmentBatchRowAttach(
    IsarCollection<dynamic> col, Id id, AdjustmentBatchRow object) {
  object.id = id;
}

extension AdjustmentBatchRowByIndex on IsarCollection<AdjustmentBatchRow> {
  Future<AdjustmentBatchRow?> getByLookupKey(String lookupKey) {
    return getByIndex(r'lookupKey', [lookupKey]);
  }

  AdjustmentBatchRow? getByLookupKeySync(String lookupKey) {
    return getByIndexSync(r'lookupKey', [lookupKey]);
  }

  Future<bool> deleteByLookupKey(String lookupKey) {
    return deleteByIndex(r'lookupKey', [lookupKey]);
  }

  bool deleteByLookupKeySync(String lookupKey) {
    return deleteByIndexSync(r'lookupKey', [lookupKey]);
  }

  Future<List<AdjustmentBatchRow?>> getAllByLookupKey(
      List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'lookupKey', values);
  }

  List<AdjustmentBatchRow?> getAllByLookupKeySync(
      List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lookupKey', values);
  }

  Future<int> deleteAllByLookupKey(List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lookupKey', values);
  }

  int deleteAllByLookupKeySync(List<String> lookupKeyValues) {
    final values = lookupKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lookupKey', values);
  }

  Future<Id> putByLookupKey(AdjustmentBatchRow object) {
    return putByIndex(r'lookupKey', object);
  }

  Id putByLookupKeySync(AdjustmentBatchRow object, {bool saveLinks = true}) {
    return putByIndexSync(r'lookupKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLookupKey(List<AdjustmentBatchRow> objects) {
    return putAllByIndex(r'lookupKey', objects);
  }

  List<Id> putAllByLookupKeySync(List<AdjustmentBatchRow> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'lookupKey', objects, saveLinks: saveLinks);
  }
}

extension AdjustmentBatchRowQueryWhereSort
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QWhere> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhere>
      anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension AdjustmentBatchRowQueryWhere
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QWhereClause> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      locationCodeEqualTo(String locationCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'locationCode',
        value: [locationCode],
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      locationCodeNotEqualTo(String locationCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [],
              upper: [locationCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [locationCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [locationCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationCode',
              lower: [],
              upper: [locationCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      lookupKeyEqualTo(String lookupKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lookupKey',
        value: [lookupKey],
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterWhereClause>
      lookupKeyNotEqualTo(String lookupKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [],
              upper: [lookupKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [lookupKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [lookupKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lookupKey',
              lower: [],
              upper: [lookupKey],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AdjustmentBatchRowQueryFilter
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QFilterCondition> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchName',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchName',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameEqualTo(
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameLessThan(
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameBetween(
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameEndsWith(
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchName',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchName',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNoGreaterThan(
    int value, {
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNoLessThan(
    int value, {
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      batchNoBetween(
    int lower,
    int upper, {
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lookupKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lookupKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lookupKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lookupKey',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterFilterCondition>
      lookupKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lookupKey',
        value: '',
      ));
    });
  }
}

extension AdjustmentBatchRowQueryObject
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QFilterCondition> {}

extension AdjustmentBatchRowQueryLinks
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QFilterCondition> {}

extension AdjustmentBatchRowQuerySortBy
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QSortBy> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByBatchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByBatchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByLookupKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      sortByLookupKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.desc);
    });
  }
}

extension AdjustmentBatchRowQuerySortThenBy
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QSortThenBy> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByBatchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByBatchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchName', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByBatchNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByLookupKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QAfterSortBy>
      thenByLookupKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lookupKey', Sort.desc);
    });
  }
}

extension AdjustmentBatchRowQueryWhereDistinct
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct> {
  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct>
      distinctByBatchName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct>
      distinctByBatchNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNo');
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct>
      distinctByLocationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QDistinct>
      distinctByLookupKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lookupKey', caseSensitive: caseSensitive);
    });
  }
}

extension AdjustmentBatchRowQueryProperty
    on QueryBuilder<AdjustmentBatchRow, AdjustmentBatchRow, QQueryProperty> {
  QueryBuilder<AdjustmentBatchRow, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AdjustmentBatchRow, String?, QQueryOperations>
      batchNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchName');
    });
  }

  QueryBuilder<AdjustmentBatchRow, int, QQueryOperations> batchNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNo');
    });
  }

  QueryBuilder<AdjustmentBatchRow, int, QQueryOperations>
      companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentBatchRow, String, QQueryOperations>
      locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<AdjustmentBatchRow, String, QQueryOperations>
      lookupKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lookupKey');
    });
  }
}
