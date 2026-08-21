// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCartItemCollection on Isar {
  IsarCollection<CartItem> get cartItems => this.collection();
}

const CartItemSchema = CollectionSchema(
  name: r'CartItem',
  id: -8381127435096147183,
  properties: {
    r'addedDate': PropertySchema(
      id: 0,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'balanceFoc': PropertySchema(
      id: 1,
      name: r'balanceFoc',
      type: IsarType.double,
    ),
    r'balanceFocLoose': PropertySchema(
      id: 2,
      name: r'balanceFocLoose',
      type: IsarType.double,
    ),
    r'balanceQuantity': PropertySchema(
      id: 3,
      name: r'balanceQuantity',
      type: IsarType.double,
    ),
    r'balanceQuantityLoose': PropertySchema(
      id: 4,
      name: r'balanceQuantityLoose',
      type: IsarType.double,
    ),
    r'basicGstPrice': PropertySchema(
      id: 5,
      name: r'basicGstPrice',
      type: IsarType.double,
    ),
    r'basicUnitPrice': PropertySchema(
      id: 6,
      name: r'basicUnitPrice',
      type: IsarType.double,
    ),
    r'companyCode': PropertySchema(
      id: 7,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 8,
      name: r'description',
      type: IsarType.string,
    ),
    r'displayDescription': PropertySchema(
      id: 9,
      name: r'displayDescription',
      type: IsarType.string,
    ),
    r'displayGstPrice': PropertySchema(
      id: 10,
      name: r'displayGstPrice',
      type: IsarType.string,
    ),
    r'displayGstSubtotal': PropertySchema(
      id: 11,
      name: r'displayGstSubtotal',
      type: IsarType.string,
    ),
    r'displaySubtotal': PropertySchema(
      id: 12,
      name: r'displaySubtotal',
      type: IsarType.string,
    ),
    r'displayUnitPrice': PropertySchema(
      id: 13,
      name: r'displayUnitPrice',
      type: IsarType.string,
    ),
    r'displayUom': PropertySchema(
      id: 14,
      name: r'displayUom',
      type: IsarType.string,
    ),
    r'factor': PropertySchema(
      id: 15,
      name: r'factor',
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
    r'focLooseQty': PropertySchema(
      id: 18,
      name: r'focLooseQty',
      type: IsarType.double,
    ),
    r'focQty': PropertySchema(
      id: 19,
      name: r'focQty',
      type: IsarType.double,
    ),
    r'gstPrice': PropertySchema(
      id: 20,
      name: r'gstPrice',
      type: IsarType.double,
    ),
    r'gstSubtotal': PropertySchema(
      id: 21,
      name: r'gstSubtotal',
      type: IsarType.double,
    ),
    r'looseQty': PropertySchema(
      id: 22,
      name: r'looseQty',
      type: IsarType.double,
    ),
    r'pluNo': PropertySchema(
      id: 23,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'qty': PropertySchema(
      id: 24,
      name: r'qty',
      type: IsarType.double,
    ),
    r'quantityLoose': PropertySchema(
      id: 25,
      name: r'quantityLoose',
      type: IsarType.double,
    ),
    r'remarks': PropertySchema(
      id: 26,
      name: r'remarks',
      type: IsarType.string,
    ),
    r'skuNo': PropertySchema(
      id: 27,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'sortIndex': PropertySchema(
      id: 28,
      name: r'sortIndex',
      type: IsarType.long,
    ),
    r'subtotal': PropertySchema(
      id: 29,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'totalBaseUnits': PropertySchema(
      id: 30,
      name: r'totalBaseUnits',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 31,
      name: r'unitPrice',
      type: IsarType.double,
    ),
    r'uom': PropertySchema(
      id: 32,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _cartItemEstimateSize,
  serialize: _cartItemSerialize,
  deserialize: _cartItemDeserialize,
  deserializeProp: _cartItemDeserializeProp,
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
  getId: _cartItemGetId,
  getLinks: _cartItemGetLinks,
  attach: _cartItemAttach,
  version: '3.1.0+1',
);

int _cartItemEstimateSize(
  CartItem object,
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
  bytesCount += 3 + object.displayDescription.length * 3;
  bytesCount += 3 + object.displayGstPrice.length * 3;
  bytesCount += 3 + object.displayGstSubtotal.length * 3;
  bytesCount += 3 + object.displaySubtotal.length * 3;
  bytesCount += 3 + object.displayUnitPrice.length * 3;
  bytesCount += 3 + object.displayUom.length * 3;
  {
    final value = object.pluNo;
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
    final value = object.uom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cartItemSerialize(
  CartItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.addedDate);
  writer.writeDouble(offsets[1], object.balanceFoc);
  writer.writeDouble(offsets[2], object.balanceFocLoose);
  writer.writeDouble(offsets[3], object.balanceQuantity);
  writer.writeDouble(offsets[4], object.balanceQuantityLoose);
  writer.writeDouble(offsets[5], object.basicGstPrice);
  writer.writeDouble(offsets[6], object.basicUnitPrice);
  writer.writeLong(offsets[7], object.companyCode);
  writer.writeString(offsets[8], object.description);
  writer.writeString(offsets[9], object.displayDescription);
  writer.writeString(offsets[10], object.displayGstPrice);
  writer.writeString(offsets[11], object.displayGstSubtotal);
  writer.writeString(offsets[12], object.displaySubtotal);
  writer.writeString(offsets[13], object.displayUnitPrice);
  writer.writeString(offsets[14], object.displayUom);
  writer.writeDouble(offsets[15], object.factor);
  writer.writeDouble(offsets[16], object.foc);
  writer.writeDouble(offsets[17], object.focLoose);
  writer.writeDouble(offsets[18], object.focLooseQty);
  writer.writeDouble(offsets[19], object.focQty);
  writer.writeDouble(offsets[20], object.gstPrice);
  writer.writeDouble(offsets[21], object.gstSubtotal);
  writer.writeDouble(offsets[22], object.looseQty);
  writer.writeString(offsets[23], object.pluNo);
  writer.writeDouble(offsets[24], object.qty);
  writer.writeDouble(offsets[25], object.quantityLoose);
  writer.writeString(offsets[26], object.remarks);
  writer.writeLong(offsets[27], object.skuNo);
  writer.writeLong(offsets[28], object.sortIndex);
  writer.writeDouble(offsets[29], object.subtotal);
  writer.writeDouble(offsets[30], object.totalBaseUnits);
  writer.writeDouble(offsets[31], object.unitPrice);
  writer.writeString(offsets[32], object.uom);
}

CartItem _cartItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CartItem();
  object.addedDate = reader.readDateTime(offsets[0]);
  object.balanceFoc = reader.readDoubleOrNull(offsets[1]);
  object.balanceFocLoose = reader.readDoubleOrNull(offsets[2]);
  object.balanceQuantity = reader.readDoubleOrNull(offsets[3]);
  object.balanceQuantityLoose = reader.readDoubleOrNull(offsets[4]);
  object.companyCode = reader.readLong(offsets[7]);
  object.description = reader.readStringOrNull(offsets[8]);
  object.factor = reader.readDoubleOrNull(offsets[15]);
  object.foc = reader.readDoubleOrNull(offsets[16]);
  object.focLoose = reader.readDoubleOrNull(offsets[17]);
  object.gstPrice = reader.readDoubleOrNull(offsets[20]);
  object.id = id;
  object.pluNo = reader.readStringOrNull(offsets[23]);
  object.qty = reader.readDoubleOrNull(offsets[24]);
  object.quantityLoose = reader.readDoubleOrNull(offsets[25]);
  object.remarks = reader.readStringOrNull(offsets[26]);
  object.skuNo = reader.readLong(offsets[27]);
  object.sortIndex = reader.readLongOrNull(offsets[28]);
  object.unitPrice = reader.readDoubleOrNull(offsets[31]);
  object.uom = reader.readStringOrNull(offsets[32]);
  return object;
}

P _cartItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readDoubleOrNull(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readDoubleOrNull(offset)) as P;
    case 25:
      return (reader.readDoubleOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readLongOrNull(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readDoubleOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cartItemGetId(CartItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cartItemGetLinks(CartItem object) {
  return [];
}

void _cartItemAttach(IsarCollection<dynamic> col, Id id, CartItem object) {
  object.id = id;
}

extension CartItemQueryWhereSort on QueryBuilder<CartItem, CartItem, QWhere> {
  QueryBuilder<CartItem, CartItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhere> anySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'skuNo'),
      );
    });
  }
}

extension CartItemQueryWhere on QueryBuilder<CartItem, CartItem, QWhereClause> {
  QueryBuilder<CartItem, CartItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> companyCodeGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> skuNoEqualTo(int skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [skuNo],
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> skuNoNotEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> skuNoGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> skuNoLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterWhereClause> skuNoBetween(
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

extension CartItemQueryFilter
    on QueryBuilder<CartItem, CartItem, QFilterCondition> {
  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> addedDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> addedDateGreaterThan(
    DateTime value, {
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> addedDateLessThan(
    DateTime value, {
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> addedDateBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> balanceFocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceFoc',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceFoc',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> balanceFocEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> balanceFocGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> balanceFocLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceFoc',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> balanceFocBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceFoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceFocLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceFocLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceFocLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceFocLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceFocLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceQuantity',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceQuantity',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balanceQuantityLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balanceQuantityLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceQuantityLoose',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      balanceQuantityLooseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceQuantityLoose',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> basicGstPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basicGstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      basicGstPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basicGstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> basicGstPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basicGstPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> basicGstPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basicGstPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> basicUnitPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basicUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      basicUnitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basicUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      basicUnitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basicUnitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> basicUnitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basicUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> companyCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayGstPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayGstPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayGstPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayGstPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayGstPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayGstSubtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayGstSubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayGstSubtotal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayGstSubtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayGstSubtotalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayGstSubtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displaySubtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displaySubtotal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displaySubtotal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displaySubtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displaySubtotalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displaySubtotal',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayUnitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayUnitPrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayUnitPrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUnitPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUnitPriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayUnitPrice',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomStartsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomEndsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayUom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomMatches(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> displayUomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      displayUomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayUom',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> factorBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'foc',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'focLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseQtyEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseQtyLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focLooseQtyBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focQtyEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focQtyGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focQtyLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> focQtyBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gstPrice',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstPriceBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstSubtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gstSubtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      gstSubtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gstSubtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstSubtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gstSubtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> gstSubtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gstSubtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> looseQtyEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> looseQtyGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> looseQtyLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> looseQtyBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pluNo',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoStartsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoEndsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoContains(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoMatches(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'qty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'qty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'qty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> qtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'qty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      quantityLooseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      quantityLooseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantityLoose',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> quantityLooseEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> quantityLooseLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> quantityLooseBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remarks',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksStartsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksEndsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remarks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remarks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> remarksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remarks',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> skuNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> skuNoGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sortIndex',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sortIndex',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> sortIndexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> totalBaseUnitsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalBaseUnits',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      totalBaseUnitsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalBaseUnits',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition>
      totalBaseUnitsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalBaseUnits',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> totalBaseUnitsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalBaseUnits',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitPrice',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> unitPriceBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomGreaterThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomContains(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterFilterCondition> uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension CartItemQueryObject
    on QueryBuilder<CartItem, CartItem, QFilterCondition> {}

extension CartItemQueryLinks
    on QueryBuilder<CartItem, CartItem, QFilterCondition> {}

extension CartItemQuerySortBy on QueryBuilder<CartItem, CartItem, QSortBy> {
  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      sortByBalanceQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBasicGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicGstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBasicGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicGstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBasicUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByBasicUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      sortByDisplayDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayGstSubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstSubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      sortByDisplayGstSubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstSubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplaySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplaySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByFocQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByGstSubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstSubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByGstSubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstSubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySortIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortIndex', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySortIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortIndex', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByTotalBaseUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBaseUnits', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByTotalBaseUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBaseUnits', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension CartItemQuerySortThenBy
    on QueryBuilder<CartItem, CartItem, QSortThenBy> {
  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFoc', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceFocLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantity', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      thenByBalanceQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceQuantityLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBasicGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicGstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBasicGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicGstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBasicUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByBasicUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basicUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      thenByDisplayDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayGstSubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstSubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy>
      thenByDisplayGstSubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayGstSubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplaySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplaySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displaySubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUnitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByDisplayUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayUom', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foc', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focLooseQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByFocQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByGstPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByGstSubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstSubtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByGstSubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gstSubtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByLooseQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'looseQty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByQuantityLooseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityLoose', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByRemarks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByRemarksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remarks', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySortIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortIndex', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySortIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortIndex', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByTotalBaseUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBaseUnits', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByTotalBaseUnitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBaseUnits', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<CartItem, CartItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension CartItemQueryWhereDistinct
    on QueryBuilder<CartItem, CartItem, QDistinct> {
  QueryBuilder<CartItem, CartItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBalanceFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceFoc');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBalanceFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceFocLoose');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBalanceQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceQuantity');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBalanceQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceQuantityLoose');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBasicGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basicGstPrice');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByBasicUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basicUnitPrice');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplayDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplayGstPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayGstPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplayGstSubtotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayGstSubtotal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplaySubtotal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displaySubtotal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplayUnitPrice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayUnitPrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByDisplayUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayUom', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foc');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByFocLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focLoose');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByFocLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focLooseQty');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByFocQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focQty');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByGstPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstPrice');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByGstSubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gstSubtotal');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByLooseQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'looseQty');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByQuantityLoose() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityLoose');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByRemarks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remarks', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctBySortIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortIndex');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByTotalBaseUnits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBaseUnits');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }

  QueryBuilder<CartItem, CartItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension CartItemQueryProperty
    on QueryBuilder<CartItem, CartItem, QQueryProperty> {
  QueryBuilder<CartItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CartItem, DateTime, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> balanceFocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceFoc');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> balanceFocLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceFocLoose');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> balanceQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceQuantity');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations>
      balanceQuantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceQuantityLoose');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> basicGstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basicGstPrice');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> basicUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basicUnitPrice');
    });
  }

  QueryBuilder<CartItem, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<CartItem, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations>
      displayDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayDescription');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations> displayGstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayGstPrice');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations>
      displayGstSubtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayGstSubtotal');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations> displaySubtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displaySubtotal');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations> displayUnitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayUnitPrice');
    });
  }

  QueryBuilder<CartItem, String, QQueryOperations> displayUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayUom');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> focProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foc');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> focLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focLoose');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> focLooseQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focLooseQty');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> focQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focQty');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> gstPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstPrice');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> gstSubtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gstSubtotal');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> looseQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'looseQty');
    });
  }

  QueryBuilder<CartItem, String?, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> quantityLooseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityLoose');
    });
  }

  QueryBuilder<CartItem, String?, QQueryOperations> remarksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remarks');
    });
  }

  QueryBuilder<CartItem, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<CartItem, int?, QQueryOperations> sortIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortIndex');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<CartItem, double, QQueryOperations> totalBaseUnitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBaseUnits');
    });
  }

  QueryBuilder<CartItem, double?, QQueryOperations> unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }

  QueryBuilder<CartItem, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
