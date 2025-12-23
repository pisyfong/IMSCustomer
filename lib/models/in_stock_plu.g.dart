// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_stock_plu.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInStockPluCollection on Isar {
  IsarCollection<InStockPlu> get inStockPlus => this.collection();
}

const InStockPluSchema = CollectionSchema(
  name: r'InStockPlu',
  id: 829795905439436074,
  properties: {
    r'addedBy': PropertySchema(
      id: 0,
      name: r'addedBy',
      type: IsarType.long,
    ),
    r'addedDate': PropertySchema(
      id: 1,
      name: r'addedDate',
      type: IsarType.dateTime,
    ),
    r'companyCode': PropertySchema(
      id: 2,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'creationDate': PropertySchema(
      id: 3,
      name: r'creationDate',
      type: IsarType.dateTime,
    ),
    r'defPlu': PropertySchema(
      id: 4,
      name: r'defPlu',
      type: IsarType.string,
    ),
    r'desc1': PropertySchema(
      id: 5,
      name: r'desc1',
      type: IsarType.string,
    ),
    r'desc2': PropertySchema(
      id: 6,
      name: r'desc2',
      type: IsarType.string,
    ),
    r'isDefault': PropertySchema(
      id: 7,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'lastEditDate': PropertySchema(
      id: 8,
      name: r'lastEditDate',
      type: IsarType.dateTime,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 9,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 10,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'pluNo': PropertySchema(
      id: 11,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'skuNo': PropertySchema(
      id: 12,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 13,
      name: r'status',
      type: IsarType.string,
    ),
    r'uom': PropertySchema(
      id: 14,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _inStockPluEstimateSize,
  serialize: _inStockPluSerialize,
  deserialize: _inStockPluDeserialize,
  deserializeProp: _inStockPluDeserializeProp,
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
    r'pluNo_companyCode': IndexSchema(
      id: -2235247671275897076,
      name: r'pluNo_companyCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pluNo',
          type: IndexType.hash,
          caseSensitive: true,
        ),
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
  getId: _inStockPluGetId,
  getLinks: _inStockPluGetLinks,
  attach: _inStockPluAttach,
  version: '3.1.0+1',
);

int _inStockPluEstimateSize(
  InStockPlu object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.defPlu;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.desc1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.desc2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.pluNo.length * 3;
  {
    final value = object.status;
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

void _inStockPluSerialize(
  InStockPlu object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeLong(offsets[2], object.companyCode);
  writer.writeDateTime(offsets[3], object.creationDate);
  writer.writeString(offsets[4], object.defPlu);
  writer.writeString(offsets[5], object.desc1);
  writer.writeString(offsets[6], object.desc2);
  writer.writeBool(offsets[7], object.isDefault);
  writer.writeDateTime(offsets[8], object.lastEditDate);
  writer.writeLong(offsets[9], object.lastModifiedBy);
  writer.writeDateTime(offsets[10], object.lastWriteTimeStamp);
  writer.writeString(offsets[11], object.pluNo);
  writer.writeLong(offsets[12], object.skuNo);
  writer.writeString(offsets[13], object.status);
  writer.writeString(offsets[14], object.uom);
}

InStockPlu _inStockPluDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InStockPlu(
    addedBy: reader.readLongOrNull(offsets[0]),
    addedDate: reader.readDateTimeOrNull(offsets[1]),
    companyCode: reader.readLong(offsets[2]),
    creationDate: reader.readDateTimeOrNull(offsets[3]),
    defPlu: reader.readStringOrNull(offsets[4]),
    desc1: reader.readStringOrNull(offsets[5]),
    desc2: reader.readStringOrNull(offsets[6]),
    lastEditDate: reader.readDateTimeOrNull(offsets[8]),
    lastModifiedBy: reader.readLongOrNull(offsets[9]),
    lastWriteTimeStamp: reader.readDateTimeOrNull(offsets[10]),
    pluNo: reader.readString(offsets[11]),
    skuNo: reader.readLongOrNull(offsets[12]),
    status: reader.readStringOrNull(offsets[13]),
    uom: reader.readStringOrNull(offsets[14]),
  );
  object.id = id;
  return object;
}

P _inStockPluDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _inStockPluGetId(InStockPlu object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inStockPluGetLinks(InStockPlu object) {
  return [];
}

void _inStockPluAttach(IsarCollection<dynamic> col, Id id, InStockPlu object) {
  object.id = id;
}

extension InStockPluQueryWhereSort
    on QueryBuilder<InStockPlu, InStockPlu, QWhere> {
  QueryBuilder<InStockPlu, InStockPlu, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhere> anySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'skuNo'),
      );
    });
  }
}

extension InStockPluQueryWhere
    on QueryBuilder<InStockPlu, InStockPlu, QWhereClause> {
  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> idBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoEqualToAnyCompanyCode(String pluNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pluNo_companyCode',
        value: [pluNo],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoNotEqualToAnyCompanyCode(String pluNo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [],
              upper: [pluNo],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [],
              upper: [pluNo],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoCompanyCodeEqualTo(String pluNo, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pluNo_companyCode',
        value: [pluNo, companyCode],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoEqualToCompanyCodeNotEqualTo(String pluNo, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo],
              upper: [pluNo, companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo, companyCode],
              includeLower: false,
              upper: [pluNo],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo, companyCode],
              includeLower: false,
              upper: [pluNo],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pluNo_companyCode',
              lower: [pluNo],
              upper: [pluNo, companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoEqualToCompanyCodeGreaterThan(
    String pluNo,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pluNo_companyCode',
        lower: [pluNo, companyCode],
        includeLower: include,
        upper: [pluNo],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoEqualToCompanyCodeLessThan(
    String pluNo,
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pluNo_companyCode',
        lower: [pluNo],
        upper: [pluNo, companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause>
      pluNoEqualToCompanyCodeBetween(
    String pluNo,
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pluNo_companyCode',
        lower: [pluNo, lowerCompanyCode],
        includeLower: includeLower,
        upper: [pluNo, upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [null],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'skuNo',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoEqualTo(
      int? skuNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuNo',
        value: [skuNo],
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoNotEqualTo(
      int? skuNo) {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoGreaterThan(
    int? skuNo, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoLessThan(
    int? skuNo, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterWhereClause> skuNoBetween(
    int? lowerSkuNo,
    int? upperSkuNo, {
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

extension InStockPluQueryFilter
    on QueryBuilder<InStockPlu, InStockPlu, QFilterCondition> {
  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creationDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      creationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'defPlu',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      defPluIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'defPlu',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defPlu',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defPlu',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defPlu',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> defPluIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      defPluIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defPlu',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desc1',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desc1',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc1',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      desc1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc1',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desc2',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desc2',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desc2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desc2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desc2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> desc2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desc2',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      desc2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desc2',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> isDefaultEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastEditDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastEditDate',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastEditDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastEditDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastEditDate',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastEditDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastEditDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastModifiedByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModifiedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      lastWriteTimeStampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastWriteTimeStamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoEqualTo(
    String value, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoGreaterThan(
    String value, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoLessThan(
    String value, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoBetween(
    String lower,
    String upper, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoStartsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoEndsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoContains(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoMatches(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoGreaterThan(
    int? value, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoLessThan(
    int? value, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> skuNoBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomGreaterThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomContains(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterFilterCondition> uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension InStockPluQueryObject
    on QueryBuilder<InStockPlu, InStockPlu, QFilterCondition> {}

extension InStockPluQueryLinks
    on QueryBuilder<InStockPlu, InStockPlu, QFilterCondition> {}

extension InStockPluQuerySortBy
    on QueryBuilder<InStockPlu, InStockPlu, QSortBy> {
  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDefPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defPlu', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDefPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defPlu', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDesc1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc1', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDesc1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc1', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDesc2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc2', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByDesc2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc2', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByLastEditDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByLastEditDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InStockPluQuerySortThenBy
    on QueryBuilder<InStockPlu, InStockPlu, QSortThenBy> {
  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDefPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defPlu', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDefPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defPlu', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDesc1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc1', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDesc1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc1', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDesc2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc2', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByDesc2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desc2', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByLastEditDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditDate', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByLastEditDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditDate', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension InStockPluQueryWhereDistinct
    on QueryBuilder<InStockPlu, InStockPlu, QDistinct> {
  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationDate');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByDefPlu(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defPlu', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByDesc1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByDesc2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desc2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByLastEditDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastEditDate');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct>
      distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InStockPlu, InStockPlu, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension InStockPluQueryProperty
    on QueryBuilder<InStockPlu, InStockPlu, QQueryProperty> {
  QueryBuilder<InStockPlu, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InStockPlu, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<InStockPlu, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<InStockPlu, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<InStockPlu, DateTime?, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationDate');
    });
  }

  QueryBuilder<InStockPlu, String?, QQueryOperations> defPluProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defPlu');
    });
  }

  QueryBuilder<InStockPlu, String?, QQueryOperations> desc1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc1');
    });
  }

  QueryBuilder<InStockPlu, String?, QQueryOperations> desc2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desc2');
    });
  }

  QueryBuilder<InStockPlu, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<InStockPlu, DateTime?, QQueryOperations> lastEditDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastEditDate');
    });
  }

  QueryBuilder<InStockPlu, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<InStockPlu, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<InStockPlu, String, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<InStockPlu, int?, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<InStockPlu, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<InStockPlu, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
