// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPickListCollection on Isar {
  IsarCollection<PickList> get pickLists => this.collection();
}

const PickListSchema = CollectionSchema(
  name: r'PickList',
  id: 9100585698786702231,
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
    r'assignedTo': PropertySchema(
      id: 2,
      name: r'assignedTo',
      type: IsarType.long,
    ),
    r'batchCount': PropertySchema(
      id: 3,
      name: r'batchCount',
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
    r'pickDate': PropertySchema(
      id: 11,
      name: r'pickDate',
      type: IsarType.dateTime,
    ),
    r'pickPreLabel': PropertySchema(
      id: 12,
      name: r'pickPreLabel',
      type: IsarType.string,
    ),
    r'remark': PropertySchema(
      id: 13,
      name: r'remark',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
    ),
    r'totalPickItem': PropertySchema(
      id: 15,
      name: r'totalPickItem',
      type: IsarType.long,
    ),
    r'totalPickQty': PropertySchema(
      id: 16,
      name: r'totalPickQty',
      type: IsarType.double,
    ),
    r'uploadToken': PropertySchema(
      id: 17,
      name: r'uploadToken',
      type: IsarType.string,
    )
  },
  estimateSize: _pickListEstimateSize,
  serialize: _pickListSerialize,
  deserialize: _pickListDeserialize,
  deserializeProp: _pickListDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _pickListGetId,
  getLinks: _pickListGetLinks,
  attach: _pickListAttach,
  version: '3.1.0+1',
);

int _pickListEstimateSize(
  PickList object,
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
    final value = object.uploadToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pickListSerialize(
  PickList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeLong(offsets[2], object.assignedTo);
  writer.writeLong(offsets[3], object.batchCount);
  writer.writeLong(offsets[4], object.cancelledBy);
  writer.writeDateTime(offsets[5], object.cancelledDate);
  writer.writeLong(offsets[6], object.companyCode);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeLong(offsets[8], object.lastModifiedBy);
  writer.writeDateTime(offsets[9], object.lastWriteTimeStamp);
  writer.writeString(offsets[10], object.locationCode);
  writer.writeDateTime(offsets[11], object.pickDate);
  writer.writeString(offsets[12], object.pickPreLabel);
  writer.writeString(offsets[13], object.remark);
  writer.writeString(offsets[14], object.status);
  writer.writeLong(offsets[15], object.totalPickItem);
  writer.writeDouble(offsets[16], object.totalPickQty);
  writer.writeString(offsets[17], object.uploadToken);
}

PickList _pickListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PickList();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.assignedTo = reader.readLongOrNull(offsets[2]);
  object.batchCount = reader.readLongOrNull(offsets[3]);
  object.cancelledBy = reader.readLongOrNull(offsets[4]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[5]);
  object.companyCode = reader.readLongOrNull(offsets[6]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[7]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[8]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[9]);
  object.locationCode = reader.readStringOrNull(offsets[10]);
  object.pickDate = reader.readDateTimeOrNull(offsets[11]);
  object.pickPreLabel = reader.readStringOrNull(offsets[12]);
  object.remark = reader.readStringOrNull(offsets[13]);
  object.status = reader.readStringOrNull(offsets[14]);
  object.totalPickItem = reader.readLongOrNull(offsets[15]);
  object.totalPickQty = reader.readDoubleOrNull(offsets[16]);
  object.uploadToken = reader.readStringOrNull(offsets[17]);
  return object;
}

P _pickListDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pickListGetId(PickList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pickListGetLinks(PickList object) {
  return [];
}

void _pickListAttach(IsarCollection<dynamic> col, Id id, PickList object) {
  object.id = id;
}

extension PickListQueryWhereSort on QueryBuilder<PickList, PickList, QWhere> {
  QueryBuilder<PickList, PickList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension PickListQueryWhere on QueryBuilder<PickList, PickList, QWhereClause> {
  QueryBuilder<PickList, PickList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> idBetween(
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeEqualTo(
      int? companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeNotEqualTo(
      int? companyCode) {
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<PickList, PickList, QAfterWhereClause> pickPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pickPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> pickPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'pickPreLabel',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> pickPreLabelEqualTo(
      String? pickPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pickPreLabel',
        value: [pickPreLabel],
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterWhereClause> pickPreLabelNotEqualTo(
      String? pickPreLabel) {
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
}

extension PickListQueryFilter
    on QueryBuilder<PickList, PickList, QFilterCondition> {
  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> assignedToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedTo',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      assignedToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedTo',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> assignedToEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedTo',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> assignedToGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedTo',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> assignedToLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedTo',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> assignedToBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> batchCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchCount',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      batchCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchCount',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> batchCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> batchCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> batchCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchCount',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> batchCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledByLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledByBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledDateLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> cancelledDateBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> companyCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> lastModifiedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> lastModifiedByBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeEqualTo(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeEndsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> locationCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickDate',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickPreLabel',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      pickPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickPreLabel',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelEqualTo(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelEndsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> pickPreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      pickPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      pickPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkStartsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkEndsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remark',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusContains(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      totalPickItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPickItem',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      totalPickItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPickItem',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickItemEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPickItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      totalPickItemGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPickItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickItemLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPickItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickItemBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPickItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPickQty',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      totalPickQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPickQty',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      totalPickQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPickQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> totalPickQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPickQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadToken',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      uploadTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadToken',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      uploadTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uploadToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uploadToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uploadToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition> uploadTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadToken',
        value: '',
      ));
    });
  }

  QueryBuilder<PickList, PickList, QAfterFilterCondition>
      uploadTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uploadToken',
        value: '',
      ));
    });
  }
}

extension PickListQueryObject
    on QueryBuilder<PickList, PickList, QFilterCondition> {}

extension PickListQueryLinks
    on QueryBuilder<PickList, PickList, QFilterCondition> {}

extension PickListQuerySortBy on QueryBuilder<PickList, PickList, QSortBy> {
  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByAssignedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByBatchCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchCount', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByBatchCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchCount', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByPickDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByPickDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByPickPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByPickPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByTotalPickItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickItem', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByTotalPickItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickItem', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByTotalPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickQty', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByTotalPickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickQty', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByUploadToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> sortByUploadTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.desc);
    });
  }
}

extension PickListQuerySortThenBy
    on QueryBuilder<PickList, PickList, QSortThenBy> {
  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByAssignedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByBatchCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchCount', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByBatchCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchCount', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByPickDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickDate', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByPickDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickDate', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByPickPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByPickPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByTotalPickItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickItem', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByTotalPickItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickItem', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByTotalPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickQty', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByTotalPickQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPickQty', Sort.desc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByUploadToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.asc);
    });
  }

  QueryBuilder<PickList, PickList, QAfterSortBy> thenByUploadTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.desc);
    });
  }
}

extension PickListQueryWhereDistinct
    on QueryBuilder<PickList, PickList, QDistinct> {
  QueryBuilder<PickList, PickList, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedTo');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByBatchCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchCount');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByPickDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickDate');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByPickPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickPreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByTotalPickItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPickItem');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByTotalPickQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPickQty');
    });
  }

  QueryBuilder<PickList, PickList, QDistinct> distinctByUploadToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadToken', caseSensitive: caseSensitive);
    });
  }
}

extension PickListQueryProperty
    on QueryBuilder<PickList, PickList, QQueryProperty> {
  QueryBuilder<PickList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<PickList, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> assignedToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedTo');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> batchCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchCount');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<PickList, DateTime?, QQueryOperations> cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<PickList, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<PickList, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PickList, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<PickList, DateTime?, QQueryOperations> pickDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickDate');
    });
  }

  QueryBuilder<PickList, String?, QQueryOperations> pickPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickPreLabel');
    });
  }

  QueryBuilder<PickList, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<PickList, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PickList, int?, QQueryOperations> totalPickItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPickItem');
    });
  }

  QueryBuilder<PickList, double?, QQueryOperations> totalPickQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPickQty');
    });
  }

  QueryBuilder<PickList, String?, QQueryOperations> uploadTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadToken');
    });
  }
}
