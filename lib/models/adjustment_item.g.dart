// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adjustment_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAdjustmentItemCollection on Isar {
  IsarCollection<AdjustmentItem> get adjustmentItems => this.collection();
}

const AdjustmentItemSchema = CollectionSchema(
  name: r'AdjustmentItem',
  id: -2703251888500634470,
  properties: {
    r'averageCost': PropertySchema(
      id: 0,
      name: r'averageCost',
      type: IsarType.double,
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
    r'factor': PropertySchema(
      id: 3,
      name: r'factor',
      type: IsarType.double,
    ),
    r'focQuantity': PropertySchema(
      id: 4,
      name: r'focQuantity',
      type: IsarType.double,
    ),
    r'lastCost': PropertySchema(
      id: 5,
      name: r'lastCost',
      type: IsarType.double,
    ),
    r'pluNo': PropertySchema(
      id: 6,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'preLabel': PropertySchema(
      id: 7,
      name: r'preLabel',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 8,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 9,
      name: r'remark',
      type: IsarType.string,
    ),
    r'sellingPrice': PropertySchema(
      id: 10,
      name: r'sellingPrice',
      type: IsarType.double,
    ),
    r'sequenceNo': PropertySchema(
      id: 11,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 12,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'standardCost': PropertySchema(
      id: 13,
      name: r'standardCost',
      type: IsarType.double,
    ),
    r'unitCost': PropertySchema(
      id: 14,
      name: r'unitCost',
      type: IsarType.double,
    ),
    r'uom': PropertySchema(
      id: 15,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _adjustmentItemEstimateSize,
  serialize: _adjustmentItemSerialize,
  deserialize: _adjustmentItemDeserialize,
  deserializeProp: _adjustmentItemDeserializeProp,
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
  getId: _adjustmentItemGetId,
  getLinks: _adjustmentItemGetLinks,
  attach: _adjustmentItemAttach,
  version: '3.1.0+1',
);

int _adjustmentItemEstimateSize(
  AdjustmentItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
  bytesCount += 3 + object.preLabel.length * 3;
  {
    final value = object.remark;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uom.length * 3;
  return bytesCount;
}

void _adjustmentItemSerialize(
  AdjustmentItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageCost);
  writer.writeLong(offsets[1], object.companyCode);
  writer.writeString(offsets[2], object.description);
  writer.writeDouble(offsets[3], object.factor);
  writer.writeDouble(offsets[4], object.focQuantity);
  writer.writeDouble(offsets[5], object.lastCost);
  writer.writeString(offsets[6], object.pluNo);
  writer.writeString(offsets[7], object.preLabel);
  writer.writeDouble(offsets[8], object.quantity);
  writer.writeString(offsets[9], object.remark);
  writer.writeDouble(offsets[10], object.sellingPrice);
  writer.writeLong(offsets[11], object.sequenceNo);
  writer.writeLong(offsets[12], object.skuNo);
  writer.writeDouble(offsets[13], object.standardCost);
  writer.writeDouble(offsets[14], object.unitCost);
  writer.writeString(offsets[15], object.uom);
}

AdjustmentItem _adjustmentItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AdjustmentItem();
  object.averageCost = reader.readDouble(offsets[0]);
  object.companyCode = reader.readLong(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.factor = reader.readDouble(offsets[3]);
  object.focQuantity = reader.readDouble(offsets[4]);
  object.id = id;
  object.lastCost = reader.readDouble(offsets[5]);
  object.pluNo = reader.readStringOrNull(offsets[6]);
  object.preLabel = reader.readString(offsets[7]);
  object.quantity = reader.readDouble(offsets[8]);
  object.remark = reader.readStringOrNull(offsets[9]);
  object.sellingPrice = reader.readDouble(offsets[10]);
  object.sequenceNo = reader.readLong(offsets[11]);
  object.skuNo = reader.readLong(offsets[12]);
  object.standardCost = reader.readDouble(offsets[13]);
  object.unitCost = reader.readDouble(offsets[14]);
  object.uom = reader.readString(offsets[15]);
  return object;
}

P _adjustmentItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _adjustmentItemGetId(AdjustmentItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _adjustmentItemGetLinks(AdjustmentItem object) {
  return [];
}

void _adjustmentItemAttach(
    IsarCollection<dynamic> col, Id id, AdjustmentItem object) {
  object.id = id;
}

extension AdjustmentItemQueryWhereSort
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QWhere> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhere> anySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'skuNo'),
      );
    });
  }
}

extension AdjustmentItemQueryWhere
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QWhereClause> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
      preLabelEqualTo(String preLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'preLabel',
        value: [preLabel],
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
      preLabelNotEqualTo(String preLabel) {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> skuNoEqualTo(
      int skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [skuNo],
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
      skuNoNotEqualTo(int skuNo) {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause>
      skuNoGreaterThan(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> skuNoLessThan(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterWhereClause> skuNoBetween(
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

extension AdjustmentItemQueryFilter
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QFilterCondition> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      averageCostEqualTo(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      averageCostGreaterThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      averageCostLessThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      averageCostBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      factorEqualTo(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      factorGreaterThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      factorLessThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      factorBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      focQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      focQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      focQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      focQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      lastCostEqualTo(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      lastCostGreaterThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      lastCostLessThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      lastCostBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pluNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pluNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelEqualTo(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelLessThan(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelBetween(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelEndsWith(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      preLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remark',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      sellingPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      sellingPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      sellingPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellingPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      sellingPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellingPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      sequenceNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      skuNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      standardCostEqualTo(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      standardCostGreaterThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      standardCostLessThan(
    double value, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      standardCostBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      unitCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      unitCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      unitCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      unitCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomEqualTo(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomGreaterThan(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomLessThan(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomBetween(
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
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

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension AdjustmentItemQueryObject
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QFilterCondition> {}

extension AdjustmentItemQueryLinks
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QFilterCondition> {}

extension AdjustmentItemQuerySortBy
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QSortBy> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByFocQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQuantity', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByFocQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQuantity', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      sortByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension AdjustmentItemQuerySortThenBy
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QSortThenBy> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByFocQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQuantity', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByFocQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQuantity', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preLabel', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenBySellingPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellingPrice', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy>
      thenByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension AdjustmentItemQueryWhereDistinct
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> {
  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCost');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctByFocQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focQuantity');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCost');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctBySellingPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellingPrice');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct>
      distinctByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standardCost');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitCost');
    });
  }

  QueryBuilder<AdjustmentItem, AdjustmentItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension AdjustmentItemQueryProperty
    on QueryBuilder<AdjustmentItem, AdjustmentItem, QQueryProperty> {
  QueryBuilder<AdjustmentItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> averageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCost');
    });
  }

  QueryBuilder<AdjustmentItem, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<AdjustmentItem, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> focQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focQuantity');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> lastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCost');
    });
  }

  QueryBuilder<AdjustmentItem, String?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<AdjustmentItem, String, QQueryOperations> preLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preLabel');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<AdjustmentItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations>
      sellingPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellingPrice');
    });
  }

  QueryBuilder<AdjustmentItem, int, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<AdjustmentItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations>
      standardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standardCost');
    });
  }

  QueryBuilder<AdjustmentItem, double, QQueryOperations> unitCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitCost');
    });
  }

  QueryBuilder<AdjustmentItem, String, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
