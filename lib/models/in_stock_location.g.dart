// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_stock_location.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInStockLocationCollection on Isar {
  IsarCollection<InStockLocation> get inStockLocations => this.collection();
}

const InStockLocationSchema = CollectionSchema(
  name: r'InStockLocation',
  id: 7787877268450283940,
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
    r'fifoCost': PropertySchema(
      id: 2,
      name: r'fifoCost',
      type: IsarType.double,
    ),
    r'lastCost': PropertySchema(
      id: 3,
      name: r'lastCost',
      type: IsarType.double,
    ),
    r'locationCode': PropertySchema(
      id: 4,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'maxStockLevel': PropertySchema(
      id: 5,
      name: r'maxStockLevel',
      type: IsarType.double,
    ),
    r'minStockLevel': PropertySchema(
      id: 6,
      name: r'minStockLevel',
      type: IsarType.double,
    ),
    r'qtyOnAdjIn': PropertySchema(
      id: 7,
      name: r'qtyOnAdjIn',
      type: IsarType.double,
    ),
    r'qtyOnAdjOut': PropertySchema(
      id: 8,
      name: r'qtyOnAdjOut',
      type: IsarType.double,
    ),
    r'qtyOnCustomerReturn': PropertySchema(
      id: 9,
      name: r'qtyOnCustomerReturn',
      type: IsarType.double,
    ),
    r'qtyOnHand': PropertySchema(
      id: 10,
      name: r'qtyOnHand',
      type: IsarType.double,
    ),
    r'qtyOnReceived': PropertySchema(
      id: 11,
      name: r'qtyOnReceived',
      type: IsarType.double,
    ),
    r'qtyOnReturn': PropertySchema(
      id: 12,
      name: r'qtyOnReturn',
      type: IsarType.double,
    ),
    r'qtyOnSales': PropertySchema(
      id: 13,
      name: r'qtyOnSales',
      type: IsarType.double,
    ),
    r'qtyOnSalesOrder': PropertySchema(
      id: 14,
      name: r'qtyOnSalesOrder',
      type: IsarType.double,
    ),
    r'qtyOnTrading': PropertySchema(
      id: 15,
      name: r'qtyOnTrading',
      type: IsarType.double,
    ),
    r'reorderLevel': PropertySchema(
      id: 16,
      name: r'reorderLevel',
      type: IsarType.double,
    ),
    r'shelf': PropertySchema(
      id: 17,
      name: r'shelf',
      type: IsarType.string,
    ),
    r'signedQtyOnHand': PropertySchema(
      id: 18,
      name: r'signedQtyOnHand',
      type: IsarType.double,
    ),
    r'skuNo': PropertySchema(
      id: 19,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'standardCost': PropertySchema(
      id: 20,
      name: r'standardCost',
      type: IsarType.double,
    )
  },
  estimateSize: _inStockLocationEstimateSize,
  serialize: _inStockLocationSerialize,
  deserialize: _inStockLocationDeserialize,
  deserializeProp: _inStockLocationDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_skuNo_locationCode': IndexSchema(
      id: 8973921889317671388,
      name: r'companyCode_skuNo_locationCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'skuNo',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'locationCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _inStockLocationGetId,
  getLinks: _inStockLocationGetLinks,
  attach: _inStockLocationAttach,
  version: '3.1.0+1',
);

int _inStockLocationEstimateSize(
  InStockLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.locationCode.length * 3;
  {
    final value = object.shelf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _inStockLocationSerialize(
  InStockLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.averageCost);
  writer.writeLong(offsets[1], object.companyCode);
  writer.writeDouble(offsets[2], object.fifoCost);
  writer.writeDouble(offsets[3], object.lastCost);
  writer.writeString(offsets[4], object.locationCode);
  writer.writeDouble(offsets[5], object.maxStockLevel);
  writer.writeDouble(offsets[6], object.minStockLevel);
  writer.writeDouble(offsets[7], object.qtyOnAdjIn);
  writer.writeDouble(offsets[8], object.qtyOnAdjOut);
  writer.writeDouble(offsets[9], object.qtyOnCustomerReturn);
  writer.writeDouble(offsets[10], object.qtyOnHand);
  writer.writeDouble(offsets[11], object.qtyOnReceived);
  writer.writeDouble(offsets[12], object.qtyOnReturn);
  writer.writeDouble(offsets[13], object.qtyOnSales);
  writer.writeDouble(offsets[14], object.qtyOnSalesOrder);
  writer.writeDouble(offsets[15], object.qtyOnTrading);
  writer.writeDouble(offsets[16], object.reorderLevel);
  writer.writeString(offsets[17], object.shelf);
  writer.writeDouble(offsets[18], object.signedQtyOnHand);
  writer.writeLong(offsets[19], object.skuNo);
  writer.writeDouble(offsets[20], object.standardCost);
}

InStockLocation _inStockLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InStockLocation();
  object.averageCost = reader.readDoubleOrNull(offsets[0]);
  object.companyCode = reader.readLong(offsets[1]);
  object.fifoCost = reader.readDoubleOrNull(offsets[2]);
  object.id = id;
  object.lastCost = reader.readDoubleOrNull(offsets[3]);
  object.locationCode = reader.readString(offsets[4]);
  object.maxStockLevel = reader.readDoubleOrNull(offsets[5]);
  object.minStockLevel = reader.readDoubleOrNull(offsets[6]);
  object.qtyOnAdjIn = reader.readDoubleOrNull(offsets[7]);
  object.qtyOnAdjOut = reader.readDoubleOrNull(offsets[8]);
  object.qtyOnCustomerReturn = reader.readDoubleOrNull(offsets[9]);
  object.qtyOnHand = reader.readDoubleOrNull(offsets[10]);
  object.qtyOnReceived = reader.readDoubleOrNull(offsets[11]);
  object.qtyOnReturn = reader.readDoubleOrNull(offsets[12]);
  object.qtyOnSales = reader.readDoubleOrNull(offsets[13]);
  object.qtyOnSalesOrder = reader.readDoubleOrNull(offsets[14]);
  object.qtyOnTrading = reader.readDoubleOrNull(offsets[15]);
  object.reorderLevel = reader.readDoubleOrNull(offsets[16]);
  object.shelf = reader.readStringOrNull(offsets[17]);
  object.skuNo = reader.readLong(offsets[19]);
  object.standardCost = reader.readDoubleOrNull(offsets[20]);
  return object;
}

P _inStockLocationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inStockLocationGetId(InStockLocation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inStockLocationGetLinks(InStockLocation object) {
  return [];
}

void _inStockLocationAttach(
    IsarCollection<dynamic> col, Id id, InStockLocation object) {
  object.id = id;
}

extension InStockLocationByIndex on IsarCollection<InStockLocation> {
  Future<InStockLocation?> getByCompanyCodeSkuNoLocationCode(
      int companyCode, int skuNo, String locationCode) {
    return getByIndex(
        r'companyCode_skuNo_locationCode', [companyCode, skuNo, locationCode]);
  }

  InStockLocation? getByCompanyCodeSkuNoLocationCodeSync(
      int companyCode, int skuNo, String locationCode) {
    return getByIndexSync(
        r'companyCode_skuNo_locationCode', [companyCode, skuNo, locationCode]);
  }

  Future<bool> deleteByCompanyCodeSkuNoLocationCode(
      int companyCode, int skuNo, String locationCode) {
    return deleteByIndex(
        r'companyCode_skuNo_locationCode', [companyCode, skuNo, locationCode]);
  }

  bool deleteByCompanyCodeSkuNoLocationCodeSync(
      int companyCode, int skuNo, String locationCode) {
    return deleteByIndexSync(
        r'companyCode_skuNo_locationCode', [companyCode, skuNo, locationCode]);
  }

  Future<List<InStockLocation?>> getAllByCompanyCodeSkuNoLocationCode(
      List<int> companyCodeValues,
      List<int> skuNoValues,
      List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(skuNoValues.length == len && locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], skuNoValues[i], locationCodeValues[i]]);
    }

    return getAllByIndex(r'companyCode_skuNo_locationCode', values);
  }

  List<InStockLocation?> getAllByCompanyCodeSkuNoLocationCodeSync(
      List<int> companyCodeValues,
      List<int> skuNoValues,
      List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(skuNoValues.length == len && locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], skuNoValues[i], locationCodeValues[i]]);
    }

    return getAllByIndexSync(r'companyCode_skuNo_locationCode', values);
  }

  Future<int> deleteAllByCompanyCodeSkuNoLocationCode(
      List<int> companyCodeValues,
      List<int> skuNoValues,
      List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(skuNoValues.length == len && locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], skuNoValues[i], locationCodeValues[i]]);
    }

    return deleteAllByIndex(r'companyCode_skuNo_locationCode', values);
  }

  int deleteAllByCompanyCodeSkuNoLocationCodeSync(List<int> companyCodeValues,
      List<int> skuNoValues, List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(skuNoValues.length == len && locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], skuNoValues[i], locationCodeValues[i]]);
    }

    return deleteAllByIndexSync(r'companyCode_skuNo_locationCode', values);
  }

  Future<Id> putByCompanyCodeSkuNoLocationCode(InStockLocation object) {
    return putByIndex(r'companyCode_skuNo_locationCode', object);
  }

  Id putByCompanyCodeSkuNoLocationCodeSync(InStockLocation object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'companyCode_skuNo_locationCode', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyCodeSkuNoLocationCode(
      List<InStockLocation> objects) {
    return putAllByIndex(r'companyCode_skuNo_locationCode', objects);
  }

  List<Id> putAllByCompanyCodeSkuNoLocationCodeSync(
      List<InStockLocation> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'companyCode_skuNo_locationCode', objects,
        saveLinks: saveLinks);
  }
}

extension InStockLocationQueryWhereSort
    on QueryBuilder<InStockLocation, InStockLocation, QWhere> {
  QueryBuilder<InStockLocation, InStockLocation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InStockLocationQueryWhere
    on QueryBuilder<InStockLocation, InStockLocation, QWhereClause> {
  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause> idBetween(
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeEqualToAnySkuNoLocationCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_skuNo_locationCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeNotEqualToAnySkuNoLocationCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeGreaterThanAnySkuNoLocationCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeLessThanAnySkuNoLocationCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeBetweenAnySkuNoLocationCode(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeSkuNoEqualToAnyLocationCode(int companyCode, int skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_skuNo_locationCode',
        value: [companyCode, skuNo],
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeEqualToSkuNoNotEqualToAnyLocationCode(
          int companyCode, int skuNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode],
              upper: [companyCode, skuNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode],
              upper: [companyCode, skuNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeEqualToSkuNoGreaterThanAnyLocationCode(
    int companyCode,
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [companyCode, skuNo],
        includeLower: include,
        upper: [companyCode],
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeEqualToSkuNoLessThanAnyLocationCode(
    int companyCode,
    int skuNo, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [companyCode],
        upper: [companyCode, skuNo],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeEqualToSkuNoBetweenAnyLocationCode(
    int companyCode,
    int lowerSkuNo,
    int upperSkuNo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_skuNo_locationCode',
        lower: [companyCode, lowerSkuNo],
        includeLower: includeLower,
        upper: [companyCode, upperSkuNo],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeSkuNoLocationCodeEqualTo(
          int companyCode, int skuNo, String locationCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_skuNo_locationCode',
        value: [companyCode, skuNo, locationCode],
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterWhereClause>
      companyCodeSkuNoEqualToLocationCodeNotEqualTo(
          int companyCode, int skuNo, String locationCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo],
              upper: [companyCode, skuNo, locationCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo, locationCode],
              includeLower: false,
              upper: [companyCode, skuNo],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo, locationCode],
              includeLower: false,
              upper: [companyCode, skuNo],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_skuNo_locationCode',
              lower: [companyCode, skuNo],
              upper: [companyCode, skuNo, locationCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension InStockLocationQueryFilter
    on QueryBuilder<InStockLocation, InStockLocation, QFilterCondition> {
  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      averageCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      averageCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      fifoCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      fifoCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fifoCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      fifoCostEqualTo(
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      fifoCostBetween(
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      lastCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      lastCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      lastCostEqualTo(
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      lastCostBetween(
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxStockLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxStockLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      maxStockLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStockLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minStockLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minStockLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minStockLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      minStockLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minStockLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnAdjIn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnAdjIn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnAdjIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjInBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnAdjIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnAdjOut',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnAdjOut',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnAdjOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnAdjOutBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnAdjOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnCustomerReturn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnCustomerReturn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnCustomerReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnCustomerReturnBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnCustomerReturn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnHand',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnHand',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnHandBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnHand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnReceived',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnReceived',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnReceived',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReceivedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnReceived',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnReturn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnReturn',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnReturn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnReturnBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnReturn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnSales',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnSales',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnSales',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnSales',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnSalesOrder',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnSalesOrder',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnSalesOrder',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnSalesOrderBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnSalesOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qtyOnTrading',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qtyOnTrading',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qtyOnTrading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      qtyOnTradingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qtyOnTrading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reorderLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reorderLevel',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reorderLevel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      reorderLevelBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reorderLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shelf',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shelf',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shelf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shelf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shelf',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      shelfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shelf',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      signedQtyOnHandEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signedQtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      signedQtyOnHandGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signedQtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      signedQtyOnHandLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signedQtyOnHand',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      signedQtyOnHandBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signedQtyOnHand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      skuNoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      standardCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
      standardCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'standardCost',
      ));
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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

  QueryBuilder<InStockLocation, InStockLocation, QAfterFilterCondition>
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
}

extension InStockLocationQueryObject
    on QueryBuilder<InStockLocation, InStockLocation, QFilterCondition> {}

extension InStockLocationQueryLinks
    on QueryBuilder<InStockLocation, InStockLocation, QFilterCondition> {}

extension InStockLocationQuerySortBy
    on QueryBuilder<InStockLocation, InStockLocation, QSortBy> {
  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnAdjInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnAdjOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnCustomerReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnSalesOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByQtyOnTradingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByReorderLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> sortByShelf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByShelfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortBySignedQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signedQtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortBySignedQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signedQtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      sortByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }
}

extension InStockLocationQuerySortThenBy
    on QueryBuilder<InStockLocation, InStockLocation, QSortThenBy> {
  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByAverageCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'averageCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByFifoCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fifoCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByLastCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCost', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByMaxStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByMinStockLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnAdjInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjIn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnAdjOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnAdjOut', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnCustomerReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnCustomerReturn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReceived', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnReturnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnReturn', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnSalesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSales', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnSalesOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnSalesOrder', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByQtyOnTradingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qtyOnTrading', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByReorderLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reorderLevel', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> thenByShelf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByShelfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenBySignedQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signedQtyOnHand', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenBySignedQtyOnHandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signedQtyOnHand', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.asc);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QAfterSortBy>
      thenByStandardCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standardCost', Sort.desc);
    });
  }
}

extension InStockLocationQueryWhereDistinct
    on QueryBuilder<InStockLocation, InStockLocation, QDistinct> {
  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByAverageCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'averageCost');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByFifoCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fifoCost');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByLastCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCost');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByLocationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByMaxStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStockLevel');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByMinStockLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStockLevel');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnAdjIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnAdjIn');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnAdjOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnAdjOut');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnCustomerReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnCustomerReturn');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnHand');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnReceived');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnReturn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnReturn');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnSales() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnSales');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnSalesOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnSalesOrder');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByQtyOnTrading() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qtyOnTrading');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByReorderLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reorderLevel');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct> distinctByShelf(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shelf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctBySignedQtyOnHand() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signedQtyOnHand');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<InStockLocation, InStockLocation, QDistinct>
      distinctByStandardCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standardCost');
    });
  }
}

extension InStockLocationQueryProperty
    on QueryBuilder<InStockLocation, InStockLocation, QQueryProperty> {
  QueryBuilder<InStockLocation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      averageCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'averageCost');
    });
  }

  QueryBuilder<InStockLocation, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations> fifoCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fifoCost');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations> lastCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCost');
    });
  }

  QueryBuilder<InStockLocation, String, QQueryOperations>
      locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      maxStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStockLevel');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      minStockLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStockLevel');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnAdjInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnAdjIn');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnAdjOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnAdjOut');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnCustomerReturnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnCustomerReturn');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations> qtyOnHandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnHand');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnReceived');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnReturnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnReturn');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnSalesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnSales');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnSalesOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnSalesOrder');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      qtyOnTradingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qtyOnTrading');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      reorderLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reorderLevel');
    });
  }

  QueryBuilder<InStockLocation, String?, QQueryOperations> shelfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shelf');
    });
  }

  QueryBuilder<InStockLocation, double, QQueryOperations>
      signedQtyOnHandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signedQtyOnHand');
    });
  }

  QueryBuilder<InStockLocation, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<InStockLocation, double?, QQueryOperations>
      standardCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standardCost');
    });
  }
}
