// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representative.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRepresentativeCollection on Isar {
  IsarCollection<Representative> get representatives => this.collection();
}

const RepresentativeSchema = CollectionSchema(
  name: r'Representative',
  id: 1641174202276212105,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'displayName': PropertySchema(
      id: 1,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 2,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isStaff': PropertySchema(
      id: 3,
      name: r'isStaff',
      type: IsarType.string,
    ),
    r'representativeId': PropertySchema(
      id: 4,
      name: r'representativeId',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.string,
    )
  },
  estimateSize: _representativeEstimateSize,
  serialize: _representativeSerialize,
  deserialize: _representativeDeserialize,
  deserializeProp: _representativeDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_representativeId': IndexSchema(
      id: -5864472103643527839,
      name: r'companyCode_representativeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'representativeId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _representativeGetId,
  getLinks: _representativeGetLinks,
  attach: _representativeAttach,
  version: '3.1.0+1',
);

int _representativeEstimateSize(
  Representative object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayName.length * 3;
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.isStaff;
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

void _representativeSerialize(
  Representative object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.displayName);
  writer.writeString(offsets[2], object.fullName);
  writer.writeString(offsets[3], object.isStaff);
  writer.writeLong(offsets[4], object.representativeId);
  writer.writeString(offsets[5], object.status);
}

Representative _representativeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Representative();
  object.companyCode = reader.readLong(offsets[0]);
  object.fullName = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isStaff = reader.readStringOrNull(offsets[3]);
  object.representativeId = reader.readLong(offsets[4]);
  object.status = reader.readStringOrNull(offsets[5]);
  return object;
}

P _representativeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _representativeGetId(Representative object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _representativeGetLinks(Representative object) {
  return [];
}

void _representativeAttach(
    IsarCollection<dynamic> col, Id id, Representative object) {
  object.id = id;
}

extension RepresentativeByIndex on IsarCollection<Representative> {
  Future<Representative?> getByCompanyCodeRepresentativeId(
      int companyCode, int representativeId) {
    return getByIndex(
        r'companyCode_representativeId', [companyCode, representativeId]);
  }

  Representative? getByCompanyCodeRepresentativeIdSync(
      int companyCode, int representativeId) {
    return getByIndexSync(
        r'companyCode_representativeId', [companyCode, representativeId]);
  }

  Future<bool> deleteByCompanyCodeRepresentativeId(
      int companyCode, int representativeId) {
    return deleteByIndex(
        r'companyCode_representativeId', [companyCode, representativeId]);
  }

  bool deleteByCompanyCodeRepresentativeIdSync(
      int companyCode, int representativeId) {
    return deleteByIndexSync(
        r'companyCode_representativeId', [companyCode, representativeId]);
  }

  Future<List<Representative?>> getAllByCompanyCodeRepresentativeId(
      List<int> companyCodeValues, List<int> representativeIdValues) {
    final len = companyCodeValues.length;
    assert(representativeIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], representativeIdValues[i]]);
    }

    return getAllByIndex(r'companyCode_representativeId', values);
  }

  List<Representative?> getAllByCompanyCodeRepresentativeIdSync(
      List<int> companyCodeValues, List<int> representativeIdValues) {
    final len = companyCodeValues.length;
    assert(representativeIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], representativeIdValues[i]]);
    }

    return getAllByIndexSync(r'companyCode_representativeId', values);
  }

  Future<int> deleteAllByCompanyCodeRepresentativeId(
      List<int> companyCodeValues, List<int> representativeIdValues) {
    final len = companyCodeValues.length;
    assert(representativeIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], representativeIdValues[i]]);
    }

    return deleteAllByIndex(r'companyCode_representativeId', values);
  }

  int deleteAllByCompanyCodeRepresentativeIdSync(
      List<int> companyCodeValues, List<int> representativeIdValues) {
    final len = companyCodeValues.length;
    assert(representativeIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], representativeIdValues[i]]);
    }

    return deleteAllByIndexSync(r'companyCode_representativeId', values);
  }

  Future<Id> putByCompanyCodeRepresentativeId(Representative object) {
    return putByIndex(r'companyCode_representativeId', object);
  }

  Id putByCompanyCodeRepresentativeIdSync(Representative object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'companyCode_representativeId', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyCodeRepresentativeId(
      List<Representative> objects) {
    return putAllByIndex(r'companyCode_representativeId', objects);
  }

  List<Id> putAllByCompanyCodeRepresentativeIdSync(List<Representative> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'companyCode_representativeId', objects,
        saveLinks: saveLinks);
  }
}

extension RepresentativeQueryWhereSort
    on QueryBuilder<Representative, Representative, QWhere> {
  QueryBuilder<Representative, Representative, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhere>
      anyCompanyCodeRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode_representativeId'),
      );
    });
  }
}

extension RepresentativeQueryWhere
    on QueryBuilder<Representative, Representative, QWhereClause> {
  QueryBuilder<Representative, Representative, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<Representative, Representative, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause> idBetween(
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

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeEqualToAnyRepresentativeId(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_representativeId',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeNotEqualToAnyRepresentativeId(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeGreaterThanAnyRepresentativeId(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeLessThanAnyRepresentativeId(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeBetweenAnyRepresentativeId(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeRepresentativeIdEqualTo(
          int companyCode, int representativeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_representativeId',
        value: [companyCode, representativeId],
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeEqualToRepresentativeIdNotEqualTo(
          int companyCode, int representativeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode],
              upper: [companyCode, representativeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode, representativeId],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode, representativeId],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_representativeId',
              lower: [companyCode],
              upper: [companyCode, representativeId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeEqualToRepresentativeIdGreaterThan(
    int companyCode,
    int representativeId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [companyCode, representativeId],
        includeLower: include,
        upper: [companyCode],
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeEqualToRepresentativeIdLessThan(
    int companyCode,
    int representativeId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [companyCode],
        upper: [companyCode, representativeId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterWhereClause>
      companyCodeEqualToRepresentativeIdBetween(
    int companyCode,
    int lowerRepresentativeId,
    int upperRepresentativeId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_representativeId',
        lower: [companyCode, lowerRepresentativeId],
        includeLower: includeLower,
        upper: [companyCode, upperRepresentativeId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RepresentativeQueryFilter
    on QueryBuilder<Representative, Representative, QFilterCondition> {
  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isStaff',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isStaff',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isStaff',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isStaff',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isStaff',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isStaff',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      isStaffIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isStaff',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      representativeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'representativeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      representativeIdGreaterThan(
    int value, {
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      representativeIdLessThan(
    int value, {
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      representativeIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
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

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Representative, Representative, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }
}

extension RepresentativeQueryObject
    on QueryBuilder<Representative, Representative, QFilterCondition> {}

extension RepresentativeQueryLinks
    on QueryBuilder<Representative, Representative, QFilterCondition> {}

extension RepresentativeQuerySortBy
    on QueryBuilder<Representative, Representative, QSortBy> {
  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> sortByIsStaff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStaff', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByIsStaffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStaff', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension RepresentativeQuerySortThenBy
    on QueryBuilder<Representative, Representative, QSortThenBy> {
  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> thenByIsStaff() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStaff', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByIsStaffDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isStaff', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByRepresentativeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'representativeId', Sort.desc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Representative, Representative, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension RepresentativeQueryWhereDistinct
    on QueryBuilder<Representative, Representative, QDistinct> {
  QueryBuilder<Representative, Representative, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<Representative, Representative, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Representative, Representative, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Representative, Representative, QDistinct> distinctByIsStaff(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isStaff', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Representative, Representative, QDistinct>
      distinctByRepresentativeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'representativeId');
    });
  }

  QueryBuilder<Representative, Representative, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }
}

extension RepresentativeQueryProperty
    on QueryBuilder<Representative, Representative, QQueryProperty> {
  QueryBuilder<Representative, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Representative, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<Representative, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<Representative, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<Representative, String?, QQueryOperations> isStaffProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isStaff');
    });
  }

  QueryBuilder<Representative, int, QQueryOperations>
      representativeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'representativeId');
    });
  }

  QueryBuilder<Representative, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
