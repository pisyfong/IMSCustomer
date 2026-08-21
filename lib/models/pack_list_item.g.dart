// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pack_list_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPackListItemCollection on Isar {
  IsarCollection<PackListItem> get packListItems => this.collection();
}

const PackListItemSchema = CollectionSchema(
  name: r'PackListItem',
  id: -4585043245201475743,
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
    r'baselinePackQty': PropertySchema(
      id: 2,
      name: r'baselinePackQty',
      type: IsarType.double,
    ),
    r'cancelledBy': PropertySchema(
      id: 3,
      name: r'cancelledBy',
      type: IsarType.long,
    ),
    r'cancelledDate': PropertySchema(
      id: 4,
      name: r'cancelledDate',
      type: IsarType.dateTime,
    ),
    r'companyCode': PropertySchema(
      id: 5,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'factor': PropertySchema(
      id: 6,
      name: r'factor',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 8,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 9,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'locationCode': PropertySchema(
      id: 10,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'packPreLabel': PropertySchema(
      id: 11,
      name: r'packPreLabel',
      type: IsarType.string,
    ),
    r'packQty': PropertySchema(
      id: 12,
      name: r'packQty',
      type: IsarType.double,
    ),
    r'packQtyDelta': PropertySchema(
      id: 13,
      name: r'packQtyDelta',
      type: IsarType.double,
    ),
    r'parentPreLabel': PropertySchema(
      id: 14,
      name: r'parentPreLabel',
      type: IsarType.string,
    ),
    r'qty': PropertySchema(
      id: 15,
      name: r'qty',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 16,
      name: r'remark',
      type: IsarType.string,
    ),
    r'sequenceNo': PropertySchema(
      id: 17,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 18,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'sourceSi': PropertySchema(
      id: 19,
      name: r'sourceSi',
      type: IsarType.string,
    ),
    r'sourceSq': PropertySchema(
      id: 20,
      name: r'sourceSq',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 21,
      name: r'status',
      type: IsarType.string,
    ),
    r'uom': PropertySchema(
      id: 22,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _packListItemEstimateSize,
  serialize: _packListItemSerialize,
  deserialize: _packListItemDeserialize,
  deserializeProp: _packListItemDeserializeProp,
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
    r'packPreLabel': IndexSchema(
      id: -7700173101443143910,
      name: r'packPreLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'packPreLabel',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'parentPreLabel': IndexSchema(
      id: 8754384827301258491,
      name: r'parentPreLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'parentPreLabel',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'sourceSi': IndexSchema(
      id: -5188173232682427508,
      name: r'sourceSi',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sourceSi',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _packListItemGetId,
  getLinks: _packListItemGetLinks,
  attach: _packListItemAttach,
  version: '3.1.0+1',
);

int _packListItemEstimateSize(
  PackListItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.locationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.packPreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.parentPreLabel;
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
    final value = object.sourceSi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceSq;
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
  {
    final value = object.uom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _packListItemSerialize(
  PackListItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeDouble(offsets[2], object.baselinePackQty);
  writer.writeLong(offsets[3], object.cancelledBy);
  writer.writeDateTime(offsets[4], object.cancelledDate);
  writer.writeLong(offsets[5], object.companyCode);
  writer.writeDouble(offsets[6], object.factor);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeLong(offsets[8], object.lastModifiedBy);
  writer.writeDateTime(offsets[9], object.lastWriteTimeStamp);
  writer.writeString(offsets[10], object.locationCode);
  writer.writeString(offsets[11], object.packPreLabel);
  writer.writeDouble(offsets[12], object.packQty);
  writer.writeDouble(offsets[13], object.packQtyDelta);
  writer.writeString(offsets[14], object.parentPreLabel);
  writer.writeDouble(offsets[15], object.qty);
  writer.writeString(offsets[16], object.remark);
  writer.writeLong(offsets[17], object.sequenceNo);
  writer.writeLong(offsets[18], object.skuNo);
  writer.writeString(offsets[19], object.sourceSi);
  writer.writeString(offsets[20], object.sourceSq);
  writer.writeString(offsets[21], object.status);
  writer.writeString(offsets[22], object.uom);
}

PackListItem _packListItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PackListItem();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.baselinePackQty = reader.readDoubleOrNull(offsets[2]);
  object.cancelledBy = reader.readLongOrNull(offsets[3]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[4]);
  object.companyCode = reader.readLongOrNull(offsets[5]);
  object.factor = reader.readDoubleOrNull(offsets[6]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[7]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[8]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[9]);
  object.locationCode = reader.readStringOrNull(offsets[10]);
  object.packPreLabel = reader.readStringOrNull(offsets[11]);
  object.packQty = reader.readDoubleOrNull(offsets[12]);
  object.parentPreLabel = reader.readStringOrNull(offsets[14]);
  object.qty = reader.readDoubleOrNull(offsets[15]);
  object.remark = reader.readStringOrNull(offsets[16]);
  object.sequenceNo = reader.readLongOrNull(offsets[17]);
  object.skuNo = reader.readLongOrNull(offsets[18]);
  object.sourceSi = reader.readStringOrNull(offsets[19]);
  object.sourceSq = reader.readStringOrNull(offsets[20]);
  object.status = reader.readStringOrNull(offsets[21]);
  object.uom = reader.readStringOrNull(offsets[22]);
  return object;
}

P _packListItemDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _packListItemGetId(PackListItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _packListItemGetLinks(PackListItem object) {
  return [];
}

void _packListItemAttach(
    IsarCollection<dynamic> col, Id id, PackListItem object) {
  object.id = id;
}

extension PackListItemQueryWhereSort
    on QueryBuilder<PackListItem, PackListItem, QWhere> {
  QueryBuilder<PackListItem, PackListItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension PackListItemQueryWhere
    on QueryBuilder<PackListItem, PackListItem, QWhereClause> {
  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeEqualTo(int? companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeNotEqualTo(int? companyCode) {
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeGreaterThan(
    int? companyCode, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeLessThan(
    int? companyCode, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      companyCodeBetween(
    int? lowerCompanyCode,
    int? upperCompanyCode, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      packPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'packPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      packPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'packPreLabel',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      packPreLabelEqualTo(String? packPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'packPreLabel',
        value: [packPreLabel],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      packPreLabelNotEqualTo(String? packPreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packPreLabel',
              lower: [],
              upper: [packPreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packPreLabel',
              lower: [packPreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packPreLabel',
              lower: [packPreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packPreLabel',
              lower: [],
              upper: [packPreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      parentPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      parentPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentPreLabel',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      parentPreLabelEqualTo(String? parentPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentPreLabel',
        value: [parentPreLabel],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      parentPreLabelNotEqualTo(String? parentPreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentPreLabel',
              lower: [],
              upper: [parentPreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentPreLabel',
              lower: [parentPreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentPreLabel',
              lower: [parentPreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentPreLabel',
              lower: [],
              upper: [parentPreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> sourceSiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceSi',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      sourceSiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sourceSi',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause> sourceSiEqualTo(
      String? sourceSi) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sourceSi',
        value: [sourceSi],
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterWhereClause>
      sourceSiNotEqualTo(String? sourceSi) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceSi',
              lower: [],
              upper: [sourceSi],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceSi',
              lower: [sourceSi],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceSi',
              lower: [sourceSi],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sourceSi',
              lower: [],
              upper: [sourceSi],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PackListItemQueryFilter
    on QueryBuilder<PackListItem, PackListItem, QFilterCondition> {
  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedByLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedByBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedDateLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      addedDateBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselinePackQty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselinePackQty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselinePackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselinePackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselinePackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      baselinePackQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselinePackQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledByBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      cancelledDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeGreaterThan(
    int? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeLessThan(
    int? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      companyCodeBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> factorEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      factorGreaterThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      factorLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> factorBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastModifiedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeEqualTo(
    String? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeGreaterThan(
    String? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeLessThan(
    String? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packPreLabel',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packPreLabel',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packQty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packQty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyDeltaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyDeltaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyDeltaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      packQtyDeltaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packQtyDelta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentPreLabel',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentPreLabel',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      parentPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> qtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      qtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> qtyEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      qtyGreaterThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> qtyLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> qtyBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sequenceNo',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sequenceNo',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoGreaterThan(
    int? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoLessThan(
    int? value, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sequenceNoBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      skuNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      skuNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> skuNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      skuNoGreaterThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceSi',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceSi',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceSi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceSi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceSi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceSi',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceSi',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceSq',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceSq',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceSq',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceSq',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceSq',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceSq',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      sourceSqIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceSq',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      uomGreaterThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomContains(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension PackListItemQueryObject
    on QueryBuilder<PackListItem, PackListItem, QFilterCondition> {}

extension PackListItemQueryLinks
    on QueryBuilder<PackListItem, PackListItem, QFilterCondition> {}

extension PackListItemQuerySortBy
    on QueryBuilder<PackListItem, PackListItem, QSortBy> {
  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByBaselinePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePackQty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByBaselinePackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePackQty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByPackPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByPackPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByPackQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQtyDelta', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByPackQtyDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQtyDelta', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByParentPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortByParentPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySourceSi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSi', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySourceSiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSi', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySourceSq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSq', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortBySourceSqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSq', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PackListItemQuerySortThenBy
    on QueryBuilder<PackListItem, PackListItem, QSortThenBy> {
  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByBaselinePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePackQty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByBaselinePackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePackQty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByPackPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByPackPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByPackQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQtyDelta', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByPackQtyDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packQtyDelta', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByParentPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenByParentPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy>
      thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySourceSi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSi', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySourceSiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSi', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySourceSq() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSq', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenBySourceSqDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceSq', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PackListItemQueryWhereDistinct
    on QueryBuilder<PackListItem, PackListItem, QDistinct> {
  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct>
      distinctByBaselinePackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselinePackQty');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct>
      distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct>
      distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct>
      distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByPackPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packPreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packQty');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByPackQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packQtyDelta');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByParentPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentPreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctBySourceSi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceSi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctBySourceSq(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceSq', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackListItem, PackListItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension PackListItemQueryProperty
    on QueryBuilder<PackListItem, PackListItem, QQueryProperty> {
  QueryBuilder<PackListItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<PackListItem, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<PackListItem, double?, QQueryOperations>
      baselinePackQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselinePackQty');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<PackListItem, DateTime?, QQueryOperations>
      cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<PackListItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<PackListItem, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<PackListItem, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> packPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packPreLabel');
    });
  }

  QueryBuilder<PackListItem, double?, QQueryOperations> packQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packQty');
    });
  }

  QueryBuilder<PackListItem, double, QQueryOperations> packQtyDeltaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packQtyDelta');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations>
      parentPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentPreLabel');
    });
  }

  QueryBuilder<PackListItem, double?, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<PackListItem, int?, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> sourceSiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceSi');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> sourceSqProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceSq');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PackListItem, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
