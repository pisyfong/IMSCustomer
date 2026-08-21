// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_lookup.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDepartmentLookupCollection on Isar {
  IsarCollection<DepartmentLookup> get departmentLookups => this.collection();
}

const DepartmentLookupSchema = CollectionSchema(
  name: r'DepartmentLookup',
  id: 5534665461990118527,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'departmentCode': PropertySchema(
      id: 1,
      name: r'departmentCode',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'groupCode': PropertySchema(
      id: 3,
      name: r'groupCode',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 4,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'taxonomyMode': PropertySchema(
      id: 5,
      name: r'taxonomyMode',
      type: IsarType.string,
    )
  },
  estimateSize: _departmentLookupEstimateSize,
  serialize: _departmentLookupSerialize,
  deserialize: _departmentLookupDeserialize,
  deserializeProp: _departmentLookupDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_taxonomyMode_departmentCode': IndexSchema(
      id: 7091087888630405022,
      name: r'companyCode_taxonomyMode_departmentCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'taxonomyMode',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'departmentCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _departmentLookupGetId,
  getLinks: _departmentLookupGetLinks,
  attach: _departmentLookupAttach,
  version: '3.1.0+1',
);

int _departmentLookupEstimateSize(
  DepartmentLookup object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.departmentCode.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.groupCode.length * 3;
  bytesCount += 3 + object.taxonomyMode.length * 3;
  return bytesCount;
}

void _departmentLookupSerialize(
  DepartmentLookup object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.departmentCode);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.groupCode);
  writer.writeDateTime(offsets[4], object.lastUpdated);
  writer.writeString(offsets[5], object.taxonomyMode);
}

DepartmentLookup _departmentLookupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DepartmentLookup();
  object.companyCode = reader.readLong(offsets[0]);
  object.departmentCode = reader.readString(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.groupCode = reader.readString(offsets[3]);
  object.id = id;
  object.lastUpdated = reader.readDateTimeOrNull(offsets[4]);
  object.taxonomyMode = reader.readString(offsets[5]);
  return object;
}

P _departmentLookupDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _departmentLookupGetId(DepartmentLookup object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _departmentLookupGetLinks(DepartmentLookup object) {
  return [];
}

void _departmentLookupAttach(
    IsarCollection<dynamic> col, Id id, DepartmentLookup object) {
  object.id = id;
}

extension DepartmentLookupQueryWhereSort
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QWhere> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DepartmentLookupQueryWhere
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QWhereClause> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause> idBetween(
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeEqualToAnyTaxonomyModeDepartmentCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeNotEqualToAnyTaxonomyModeDepartmentCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeGreaterThanAnyTaxonomyModeDepartmentCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeLessThanAnyTaxonomyModeDepartmentCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeBetweenAnyTaxonomyModeDepartmentCode(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeTaxonomyModeEqualToAnyDepartmentCode(
          int companyCode, String taxonomyMode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        value: [companyCode, taxonomyMode],
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeEqualToTaxonomyModeNotEqualToAnyDepartmentCode(
          int companyCode, String taxonomyMode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode],
              upper: [companyCode, taxonomyMode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode],
              upper: [companyCode, taxonomyMode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeTaxonomyModeDepartmentCodeEqualTo(
          int companyCode, String taxonomyMode, String departmentCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_taxonomyMode_departmentCode',
        value: [companyCode, taxonomyMode, departmentCode],
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterWhereClause>
      companyCodeTaxonomyModeEqualToDepartmentCodeNotEqualTo(
          int companyCode, String taxonomyMode, String departmentCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode],
              upper: [companyCode, taxonomyMode, departmentCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode, departmentCode],
              includeLower: false,
              upper: [companyCode, taxonomyMode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode, departmentCode],
              includeLower: false,
              upper: [companyCode, taxonomyMode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_taxonomyMode_departmentCode',
              lower: [companyCode, taxonomyMode],
              upper: [companyCode, taxonomyMode, departmentCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DepartmentLookupQueryFilter
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QFilterCondition> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departmentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'departmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'departmentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departmentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      departmentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'departmentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      groupCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
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

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxonomyMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxonomyMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxonomyMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxonomyMode',
        value: '',
      ));
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterFilterCondition>
      taxonomyModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxonomyMode',
        value: '',
      ));
    });
  }
}

extension DepartmentLookupQueryObject
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QFilterCondition> {}

extension DepartmentLookupQueryLinks
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QFilterCondition> {}

extension DepartmentLookupQuerySortBy
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QSortBy> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByDepartmentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByDepartmentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByTaxonomyMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxonomyMode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      sortByTaxonomyModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxonomyMode', Sort.desc);
    });
  }
}

extension DepartmentLookupQuerySortThenBy
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QSortThenBy> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByDepartmentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByDepartmentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByGroupCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupCode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByGroupCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupCode', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByTaxonomyMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxonomyMode', Sort.asc);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QAfterSortBy>
      thenByTaxonomyModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxonomyMode', Sort.desc);
    });
  }
}

extension DepartmentLookupQueryWhereDistinct
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct> {
  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByDepartmentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departmentCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByGroupCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<DepartmentLookup, DepartmentLookup, QDistinct>
      distinctByTaxonomyMode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxonomyMode', caseSensitive: caseSensitive);
    });
  }
}

extension DepartmentLookupQueryProperty
    on QueryBuilder<DepartmentLookup, DepartmentLookup, QQueryProperty> {
  QueryBuilder<DepartmentLookup, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DepartmentLookup, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<DepartmentLookup, String, QQueryOperations>
      departmentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departmentCode');
    });
  }

  QueryBuilder<DepartmentLookup, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DepartmentLookup, String, QQueryOperations> groupCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupCode');
    });
  }

  QueryBuilder<DepartmentLookup, DateTime?, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<DepartmentLookup, String, QQueryOperations>
      taxonomyModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxonomyMode');
    });
  }
}
