// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_lookup.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBrandLookupCollection on Isar {
  IsarCollection<BrandLookup> get brandLookups => this.collection();
}

const BrandLookupSchema = CollectionSchema(
  name: r'BrandLookup',
  id: -7048378363333282411,
  properties: {
    r'brandCode': PropertySchema(
      id: 0,
      name: r'brandCode',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 1,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 3,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _brandLookupEstimateSize,
  serialize: _brandLookupSerialize,
  deserialize: _brandLookupDeserialize,
  deserializeProp: _brandLookupDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_brandCode': IndexSchema(
      id: 6134310820288154046,
      name: r'companyCode_brandCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'brandCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _brandLookupGetId,
  getLinks: _brandLookupGetLinks,
  attach: _brandLookupAttach,
  version: '3.1.0+1',
);

int _brandLookupEstimateSize(
  BrandLookup object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brandCode.length * 3;
  bytesCount += 3 + object.description.length * 3;
  return bytesCount;
}

void _brandLookupSerialize(
  BrandLookup object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brandCode);
  writer.writeLong(offsets[1], object.companyCode);
  writer.writeString(offsets[2], object.description);
  writer.writeDateTime(offsets[3], object.lastUpdated);
}

BrandLookup _brandLookupDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BrandLookup();
  object.brandCode = reader.readString(offsets[0]);
  object.companyCode = reader.readLong(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.id = id;
  object.lastUpdated = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _brandLookupDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _brandLookupGetId(BrandLookup object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _brandLookupGetLinks(BrandLookup object) {
  return [];
}

void _brandLookupAttach(
    IsarCollection<dynamic> col, Id id, BrandLookup object) {
  object.id = id;
}

extension BrandLookupQueryWhereSort
    on QueryBuilder<BrandLookup, BrandLookup, QWhere> {
  QueryBuilder<BrandLookup, BrandLookup, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BrandLookupQueryWhere
    on QueryBuilder<BrandLookup, BrandLookup, QWhereClause> {
  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause> idBetween(
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeEqualToAnyBrandCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_brandCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeNotEqualToAnyBrandCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeGreaterThanAnyBrandCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_brandCode',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeLessThanAnyBrandCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_brandCode',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeBetweenAnyBrandCode(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_brandCode',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeBrandCodeEqualTo(int companyCode, String brandCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_brandCode',
        value: [companyCode, brandCode],
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterWhereClause>
      companyCodeEqualToBrandCodeNotEqualTo(int companyCode, String brandCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode],
              upper: [companyCode, brandCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode, brandCode],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode, brandCode],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_brandCode',
              lower: [companyCode],
              upper: [companyCode, brandCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BrandLookupQueryFilter
    on QueryBuilder<BrandLookup, BrandLookup, QFilterCondition> {
  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brandCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brandCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brandCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brandCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      brandCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brandCode',
        value: '',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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

  QueryBuilder<BrandLookup, BrandLookup, QAfterFilterCondition>
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
}

extension BrandLookupQueryObject
    on QueryBuilder<BrandLookup, BrandLookup, QFilterCondition> {}

extension BrandLookupQueryLinks
    on QueryBuilder<BrandLookup, BrandLookup, QFilterCondition> {}

extension BrandLookupQuerySortBy
    on QueryBuilder<BrandLookup, BrandLookup, QSortBy> {
  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByBrandCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandCode', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByBrandCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandCode', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension BrandLookupQuerySortThenBy
    on QueryBuilder<BrandLookup, BrandLookup, QSortThenBy> {
  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByBrandCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandCode', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByBrandCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandCode', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension BrandLookupQueryWhereDistinct
    on QueryBuilder<BrandLookup, BrandLookup, QDistinct> {
  QueryBuilder<BrandLookup, BrandLookup, QDistinct> distinctByBrandCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BrandLookup, BrandLookup, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }
}

extension BrandLookupQueryProperty
    on QueryBuilder<BrandLookup, BrandLookup, QQueryProperty> {
  QueryBuilder<BrandLookup, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BrandLookup, String, QQueryOperations> brandCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandCode');
    });
  }

  QueryBuilder<BrandLookup, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<BrandLookup, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<BrandLookup, DateTime?, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }
}
