// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_list_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPickListItemCollection on Isar {
  IsarCollection<PickListItem> get pickListItems => this.collection();
}

const PickListItemSchema = CollectionSchema(
  name: r'PickListItem',
  id: 8231864648079749469,
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
    r'baselinePickQty': PropertySchema(
      id: 2,
      name: r'baselinePickQty',
      type: IsarType.double,
    ),
    r'batch': PropertySchema(
      id: 3,
      name: r'batch',
      type: IsarType.long,
    ),
    r'cancelledBy': PropertySchema(
      id: 4,
      name: r'cancelledBy',
      type: IsarType.long,
    ),
    r'cancelledDate': PropertySchema(
      id: 5,
      name: r'cancelledDate',
      type: IsarType.dateTime,
    ),
    r'companyCode': PropertySchema(
      id: 6,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'factor': PropertySchema(
      id: 7,
      name: r'factor',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 8,
      name: r'isSynced',
      type: IsarType.bool,
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
    r'locationCode': PropertySchema(
      id: 11,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'parentPreLabel': PropertySchema(
      id: 12,
      name: r'parentPreLabel',
      type: IsarType.string,
    ),
    r'pickPreLabel': PropertySchema(
      id: 13,
      name: r'pickPreLabel',
      type: IsarType.string,
    ),
    r'pickQty': PropertySchema(
      id: 14,
      name: r'pickQty',
      type: IsarType.double,
    ),
    r'pickQtyDelta': PropertySchema(
      id: 15,
      name: r'pickQtyDelta',
      type: IsarType.double,
    ),
    r'qty': PropertySchema(
      id: 16,
      name: r'qty',
      type: IsarType.double,
    ),
    r'remark': PropertySchema(
      id: 17,
      name: r'remark',
      type: IsarType.string,
    ),
    r'sequenceNo': PropertySchema(
      id: 18,
      name: r'sequenceNo',
      type: IsarType.long,
    ),
    r'skuNo': PropertySchema(
      id: 19,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 20,
      name: r'status',
      type: IsarType.string,
    ),
    r'uom': PropertySchema(
      id: 21,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _pickListItemEstimateSize,
  serialize: _pickListItemSerialize,
  deserialize: _pickListItemDeserialize,
  deserializeProp: _pickListItemDeserializeProp,
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
    r'pickPreLabel': IndexSchema(
      id: -5493173511852005800,
      name: r'pickPreLabel',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'pickPreLabel',
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _pickListItemGetId,
  getLinks: _pickListItemGetLinks,
  attach: _pickListItemAttach,
  version: '3.1.0+1',
);

int _pickListItemEstimateSize(
  PickListItem object,
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
    final value = object.parentPreLabel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pickPreLabel;
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

void _pickListItemSerialize(
  PickListItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeDouble(offsets[2], object.baselinePickQty);
  writer.writeLong(offsets[3], object.batch);
  writer.writeLong(offsets[4], object.cancelledBy);
  writer.writeDateTime(offsets[5], object.cancelledDate);
  writer.writeLong(offsets[6], object.companyCode);
  writer.writeDouble(offsets[7], object.factor);
  writer.writeBool(offsets[8], object.isSynced);
  writer.writeLong(offsets[9], object.lastModifiedBy);
  writer.writeDateTime(offsets[10], object.lastWriteTimeStamp);
  writer.writeString(offsets[11], object.locationCode);
  writer.writeString(offsets[12], object.parentPreLabel);
  writer.writeString(offsets[13], object.pickPreLabel);
  writer.writeDouble(offsets[14], object.pickQty);
  writer.writeDouble(offsets[15], object.pickQtyDelta);
  writer.writeDouble(offsets[16], object.qty);
  writer.writeString(offsets[17], object.remark);
  writer.writeLong(offsets[18], object.sequenceNo);
  writer.writeLong(offsets[19], object.skuNo);
  writer.writeString(offsets[20], object.status);
  writer.writeString(offsets[21], object.uom);
}

PickListItem _pickListItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PickListItem();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.baselinePickQty = reader.readDoubleOrNull(offsets[2]);
  object.batch = reader.readLongOrNull(offsets[3]);
  object.cancelledBy = reader.readLongOrNull(offsets[4]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[5]);
  object.companyCode = reader.readLongOrNull(offsets[6]);
  object.factor = reader.readDoubleOrNull(offsets[7]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[8]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[9]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[10]);
  object.locationCode = reader.readStringOrNull(offsets[11]);
  object.parentPreLabel = reader.readStringOrNull(offsets[12]);
  object.pickPreLabel = reader.readStringOrNull(offsets[13]);
  object.pickQty = reader.readDoubleOrNull(offsets[14]);
  object.qty = reader.readDoubleOrNull(offsets[16]);
  object.remark = reader.readStringOrNull(offsets[17]);
  object.sequenceNo = reader.readLongOrNull(offsets[18]);
  object.skuNo = reader.readLongOrNull(offsets[19]);
  object.status = reader.readStringOrNull(offsets[20]);
  object.uom = reader.readStringOrNull(offsets[21]);
  return object;
}

P _pickListItemDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pickListItemGetId(PickListItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pickListItemGetLinks(PickListItem object) {
  return [];
}

void _pickListItemAttach(
    IsarCollection<dynamic> col, Id id, PickListItem object) {
  object.id = id;
}

extension PickListItemQueryWhereSort
    on QueryBuilder<PickListItem, PickListItem, QWhere> {
  QueryBuilder<PickListItem, PickListItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension PickListItemQueryWhere
    on QueryBuilder<PickListItem, PickListItem, QWhereClause> {
  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      companyCodeEqualTo(int? companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      pickPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pickPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      pickPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pickPreLabel',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      pickPreLabelEqualTo(String? pickPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pickPreLabel',
        value: [pickPreLabel],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      pickPreLabelNotEqualTo(String? pickPreLabel) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickPreLabel',
              lower: [],
              upper: [pickPreLabel],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickPreLabel',
              lower: [pickPreLabel],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickPreLabel',
              lower: [pickPreLabel],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pickPreLabel',
              lower: [],
              upper: [pickPreLabel],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      parentPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
      parentPreLabelEqualTo(String? parentPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentPreLabel',
        value: [parentPreLabel],
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterWhereClause>
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
}

extension PickListItemQueryFilter
    on QueryBuilder<PickListItem, PickListItem, QFilterCondition> {
  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      addedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselinePickQty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselinePickQty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselinePickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselinePickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselinePickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      baselinePickQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselinePickQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      batchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batch',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      batchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batch',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> batchEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batch',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      batchGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batch',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> batchLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batch',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> batchBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      cancelledDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      companyCodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      factorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      factorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'factor',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> factorEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> factorBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastModifiedByEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentPreLabel',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentPreLabel',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      parentPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickPreLabel',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickPreLabel',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickPreLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickQty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickQty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyDeltaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyDeltaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyDeltaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickQtyDelta',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      pickQtyDeltaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickQtyDelta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> qtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      qtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'qty',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> qtyEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> qtyLessThan(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> qtyBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      remarkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      sequenceNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sequenceNo',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      sequenceNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sequenceNo',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      sequenceNoEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequenceNo',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      skuNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      skuNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skuNo',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> skuNoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> skuNoLessThan(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> skuNoBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      uomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uom',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomEqualTo(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomLessThan(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomBetween(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomContains(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterFilterCondition>
      uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension PickListItemQueryObject
    on QueryBuilder<PickListItem, PickListItem, QFilterCondition> {}

extension PickListItemQueryLinks
    on QueryBuilder<PickListItem, PickListItem, QFilterCondition> {}

extension PickListItemQuerySortBy
    on QueryBuilder<PickListItem, PickListItem, QSortBy> {
  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByBaselinePickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePickQty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByBaselinePickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePickQty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByParentPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByParentPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByPickPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByPickPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByPickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByPickQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQtyDelta', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortByPickQtyDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQtyDelta', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      sortBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PickListItemQuerySortThenBy
    on QueryBuilder<PickListItem, PickListItem, QSortThenBy> {
  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByBaselinePickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePickQty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByBaselinePickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselinePickQty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByFactorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'factor', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByParentPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByParentPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByPickPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByPickPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByPickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByPickQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQtyDelta', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenByPickQtyDeltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickQtyDelta', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qty', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy>
      thenBySequenceNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequenceNo', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PickListItemQueryWhereDistinct
    on QueryBuilder<PickListItem, PickListItem, QDistinct> {
  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct>
      distinctByBaselinePickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselinePickQty');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batch');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct>
      distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByFactor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'factor');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct>
      distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct>
      distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByParentPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentPreLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByPickPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickPreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickQty');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByPickQtyDelta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickQtyDelta');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qty');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctBySequenceNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequenceNo');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickListItem, PickListItem, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension PickListItemQueryProperty
    on QueryBuilder<PickListItem, PickListItem, QQueryProperty> {
  QueryBuilder<PickListItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<PickListItem, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<PickListItem, double?, QQueryOperations>
      baselinePickQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselinePickQty');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> batchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batch');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<PickListItem, DateTime?, QQueryOperations>
      cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<PickListItem, double?, QQueryOperations> factorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'factor');
    });
  }

  QueryBuilder<PickListItem, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<PickListItem, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations>
      parentPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentPreLabel');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations> pickPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickPreLabel');
    });
  }

  QueryBuilder<PickListItem, double?, QQueryOperations> pickQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickQty');
    });
  }

  QueryBuilder<PickListItem, double, QQueryOperations> pickQtyDeltaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickQtyDelta');
    });
  }

  QueryBuilder<PickListItem, double?, QQueryOperations> qtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qty');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> sequenceNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequenceNo');
    });
  }

  QueryBuilder<PickListItem, int?, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PickListItem, String?, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
