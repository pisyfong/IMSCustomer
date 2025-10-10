// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_stock_uom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInStockUomCollection on Isar {
  IsarCollection<InStockUom> get inStockUoms => this.collection();
}

const InStockUomSchema = CollectionSchema(
  name: r'InStockUom',
  id: -4895192639112272781,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'displayFactor': PropertySchema(
      id: 1,
      name: r'displayFactor',
      type: IsarType.string,
    ),
    r'displayPrice': PropertySchema(
      id: 2,
      name: r'displayPrice',
      type: IsarType.string,
    ),
    r'displayPricePerUom': PropertySchema(
      id: 3,
      name: r'displayPricePerUom',
      type: IsarType.string,
    ),
    r'displayUom': PropertySchema(
      id: 4,
      name: r'displayUom',
      type: IsarType.string,
    ),
    r'factor': PropertySchema(
      id: 5,
      name: r'factor',
      type: IsarType.double,
    ),
    r'gstPrice': PropertySchema(
      id: 6,
      name: r'gstPrice',
      type: IsarType.double,
    ),
    r'price': PropertySchema(
      id: 7,
      name: r'price',
      type: IsarType.double,
    ),
    r'skuNo': PropertySchema(
      id: 8,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'uom': PropertySchema(
      id: 9,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _inStockUomEstimateSize,
  serialize: _inStockUomSerialize,
  deserialize: _inStockUomDeserialize,
  deserializeProp: _inStockUomDeserializeProp,
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
    r'skuNo': IndexSchema(
      id: -7548329852756165069,
      name: r'skuNo',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'skuNo',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _inStockUomGetId,
  getLinks: _inStockUomGetLinks,
  attach: _inStockUomAttach,
  version: '3.1.0+1',
);

int _inStockUomEstimateSize(
  InStockUom object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.displayFactor.length * 3;
  bytesCount += 3 + object.displayPrice.length * 3;
  bytesCount += 3 + object.displayPricePerUom.length * 3;
  bytesCount += 3 + object.displayUom.length * 3;
  {
    final value = object.uom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _inStockUomSerialize(
  InStockUom object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.displayFactor);
  writer.writeString(offsets[2], object.displayPrice);
  writer.writeString(offsets[3], object.displayPricePerUom);
  writer.writeString(offsets[4], object.displayUom);
  writer.writeDouble(offsets[5], object.factor);
  writer.writeDouble(offsets[6], object.gstPrice);
  writer.writeDouble(offsets[7], object.price);
  writer.writeLong(offsets[8], object.skuNo);
  writer.writeString(offsets[9], object.uom);
}

InStockUom _inStockUomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InStockUom();
  object.companyCode = reader.readLong(offsets[0]);
  object.factor = reader.readDoubleOrNull(offsets[5]);
  object.gstPrice = reader.readDoubleOrNull(offsets[6]);
  object.id = id;
  object.price = reader.readDoubleOrNull(offsets[7]);
  object.skuNo = reader.readLong(offsets[8]);
  object.uom = reader.readStringOrNull(offsets[9]);
  return object;
}

P _inStockUomDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inStockUomGetId(InStockUom object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inStockUomGetLinks(InStockUom object) {
  return [];
}

void _inStockUomAttach(IsarCollection<dynamic> col, Id id, InStockUom object) {
  object.id = id;
}

extension InStockUomQueryWhereSort
    on QueryBuilder<InStockUom, InStockUom, QWhere> {
  QueryBuilder<InStockUom, InStockUom, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhere> anySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'skuNo'),
      );
    });
  }
}

extension InStockUomQueryWhere
    on QueryBuilder<InStockUom, InStockUom, QWhereClause> {
  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> idBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause>
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> skuNoEqualTo(
      int skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [skuNo],
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> skuNoNotEqualTo(
      int skuNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [],
              upper: [skuNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [skuNo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [skuNo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuNo',
              lower: [],
              upper: [skuNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> skuNoGreaterThan(
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [skuNo],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> skuNoLessThan(
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [],
        upper: [skuNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterWhereClause> skuNoBetween(
    int lowerSkuNo,
    int upperSkuNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [lowerSkuNo],
        includeLower: includeLower,
        upper: [upperSkuNo],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InStockUomQueryFilter
    on QueryBuilder<InStockUom, InStockUom, QFilterCondition> {
  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayFactor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayFactor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayFactor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayFactor',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayFactorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayFactor',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayPricePerUom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayPricePerUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayPricePerUom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayPricePerUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayPricePerUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayPricePerUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> displayUomEqualTo(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayUomLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> displayUomBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayUomEndsWith(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayUomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> displayUomMatches(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      displayUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> factorEqualTo(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> factorGreaterThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> factorLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> factorBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> gstPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
      gstPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> gstPriceEqualTo(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition>
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> gstPriceLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> gstPriceBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> skuNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> skuNoGreaterThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomGreaterThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomContains(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterFilterCondition> uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension InStockUomQueryObject
    on QueryBuilder<InStockUom, InStockUom, QFilterCondition> {}

extension InStockUomQueryLinks
    on QueryBuilder<InStockUom, InStockUom, QFilterCondition> {}

extension InStockUomQuerySortBy
    on QueryBuilder<InStockUom, InStockUom, QSortBy> {
  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFactor', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFactor', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrice', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrice', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy>
      sortByDisplayPricePerUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPricePerUom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy>
      sortByDisplayPricePerUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPricePerUom', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InStockUomQuerySortThenBy
    on QueryBuilder<InStockUom, InStockUom, QSortThenBy> {
  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFactor', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFactor', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrice', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrice', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy>
      thenByDisplayPricePerUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPricePerUom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy>
      thenByDisplayPricePerUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPricePerUom', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InStockUomQueryWhereDistinct
    on QueryBuilder<InStockUom, InStockUom, QDistinct> {
  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByDisplayFactor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayFactor',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByDisplayPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayPrice', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByDisplayPricePerUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayPricePerUom',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByDisplayUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstPrice');
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<InStockUom, InStockUom, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension InStockUomQueryProperty
    on QueryBuilder<InStockUom, InStockUom, QQueryProperty> {
  QueryBuilder<InStockUom, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InStockUom, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<InStockUom, String, QQueryOperations> displayFactorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayFactor');
    });
  }

  QueryBuilder<InStockUom, String, QQueryOperations> displayPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayPrice');
    });
  }

  QueryBuilder<InStockUom, String, QQueryOperations>
      displayPricePerUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayPricePerUom');
    });
  }

  QueryBuilder<InStockUom, String, QQueryOperations> displayUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayUom');
    });
  }

  QueryBuilder<InStockUom, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<InStockUom, double?, QQueryOperations> gstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstPrice');
    });
  }

  QueryBuilder<InStockUom, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<InStockUom, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<InStockUom, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
