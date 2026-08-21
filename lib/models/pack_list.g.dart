// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pack_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPackListCollection on Isar {
  IsarCollection<PackList> get packLists => this.collection();
}

const PackListSchema = CollectionSchema(
  name: r'PackList',
  id: -4333833063740041794,
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
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastModifiedBy': PropertySchema(
      id: 7,
      name: r'lastModifiedBy',
      type: IsarType.long,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 8,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'locationCode': PropertySchema(
      id: 9,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'packPreLabel': PropertySchema(
      id: 10,
      name: r'packPreLabel',
      type: IsarType.string,
    ),
    r'remark': PropertySchema(
      id: 11,
      name: r'remark',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 12,
      name: r'status',
      type: IsarType.string,
    ),
    r'totalPackItem': PropertySchema(
      id: 13,
      name: r'totalPackItem',
      type: IsarType.long,
    ),
    r'totalPackQty': PropertySchema(
      id: 14,
      name: r'totalPackQty',
      type: IsarType.double,
    ),
    r'uploadToken': PropertySchema(
      id: 15,
      name: r'uploadToken',
      type: IsarType.string,
    )
  },
  estimateSize: _packListEstimateSize,
  serialize: _packListSerialize,
  deserialize: _packListDeserialize,
  deserializeProp: _packListDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _packListGetId,
  getLinks: _packListGetLinks,
  attach: _packListAttach,
  version: '3.1.0+1',
);

int _packListEstimateSize(
  PackList object,
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

void _packListSerialize(
  PackList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeLong(offsets[2], object.assignedTo);
  writer.writeLong(offsets[3], object.cancelledBy);
  writer.writeDateTime(offsets[4], object.cancelledDate);
  writer.writeLong(offsets[5], object.companyCode);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeLong(offsets[7], object.lastModifiedBy);
  writer.writeDateTime(offsets[8], object.lastWriteTimeStamp);
  writer.writeString(offsets[9], object.locationCode);
  writer.writeString(offsets[10], object.packPreLabel);
  writer.writeString(offsets[11], object.remark);
  writer.writeString(offsets[12], object.status);
  writer.writeLong(offsets[13], object.totalPackItem);
  writer.writeDouble(offsets[14], object.totalPackQty);
  writer.writeString(offsets[15], object.uploadToken);
}

PackList _packListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PackList();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.assignedTo = reader.readLongOrNull(offsets[2]);
  object.cancelledBy = reader.readLongOrNull(offsets[3]);
  object.cancelledDate = reader.readDateTimeOrNull(offsets[4]);
  object.companyCode = reader.readLongOrNull(offsets[5]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[6]);
  object.lastModifiedBy = reader.readLongOrNull(offsets[7]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[8]);
  object.locationCode = reader.readStringOrNull(offsets[9]);
  object.packPreLabel = reader.readStringOrNull(offsets[10]);
  object.remark = reader.readStringOrNull(offsets[11]);
  object.status = reader.readStringOrNull(offsets[12]);
  object.totalPackItem = reader.readLongOrNull(offsets[13]);
  object.totalPackQty = reader.readDoubleOrNull(offsets[14]);
  object.uploadToken = reader.readStringOrNull(offsets[15]);
  return object;
}

P _packListDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _packListGetId(PackList object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _packListGetLinks(PackList object) {
  return [];
}

void _packListAttach(IsarCollection<dynamic> col, Id id, PackList object) {
  object.id = id;
}

extension PackListQueryWhereSort on QueryBuilder<PackList, PackList, QWhere> {
  QueryBuilder<PackList, PackList, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension PackListQueryWhere on QueryBuilder<PackList, PackList, QWhereClause> {
  QueryBuilder<PackList, PackList, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> idBetween(
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeEqualTo(
      int? companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<PackList, PackList, QAfterWhereClause> packPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'packPreLabel',
        value: [null],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> packPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'packPreLabel',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> packPreLabelEqualTo(
      String? packPreLabel) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'packPreLabel',
        value: [packPreLabel],
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterWhereClause> packPreLabelNotEqualTo(
      String? packPreLabel) {
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
}

extension PackListQueryFilter
    on QueryBuilder<PackList, PackList, QFilterCondition> {
  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> assignedToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedTo',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      assignedToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedTo',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> assignedToEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedTo',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> assignedToGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> assignedToLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> assignedToBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      cancelledByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledByLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledByBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      cancelledDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      cancelledDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledDate',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledDateLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> cancelledDateBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> companyCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      companyCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'companyCode',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> companyCodeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> companyCodeLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> companyCodeBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      lastModifiedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      lastModifiedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModifiedBy',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> lastModifiedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModifiedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> lastModifiedByBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeEndsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeContains(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> locationCodeMatches(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'packPreLabel',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      packPreLabelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'packPreLabel',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelEndsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packPreLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> packPreLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packPreLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      packPreLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      packPreLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packPreLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remark',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkStartsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkEndsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkContains(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkMatches(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> remarkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remark',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusContains(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      totalPackItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPackItem',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      totalPackItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPackItem',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackItemEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPackItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      totalPackItemGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPackItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackItemLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPackItem',
        value: value,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackItemBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPackItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPackQty',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      totalPackQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPackQty',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackQtyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      totalPackQtyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackQtyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPackQty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> totalPackQtyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPackQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uploadToken',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      uploadTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uploadToken',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenEqualTo(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenLessThan(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenBetween(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenStartsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenEndsWith(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenContains(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenMatches(
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

  QueryBuilder<PackList, PackList, QAfterFilterCondition> uploadTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uploadToken',
        value: '',
      ));
    });
  }

  QueryBuilder<PackList, PackList, QAfterFilterCondition>
      uploadTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uploadToken',
        value: '',
      ));
    });
  }
}

extension PackListQueryObject
    on QueryBuilder<PackList, PackList, QFilterCondition> {}

extension PackListQueryLinks
    on QueryBuilder<PackList, PackList, QFilterCondition> {}

extension PackListQuerySortBy on QueryBuilder<PackList, PackList, QSortBy> {
  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByAssignedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByPackPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByPackPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByTotalPackItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackItem', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByTotalPackItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackItem', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByTotalPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackQty', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByTotalPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackQty', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByUploadToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> sortByUploadTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.desc);
    });
  }
}

extension PackListQuerySortThenBy
    on QueryBuilder<PackList, PackList, QSortThenBy> {
  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByAssignedToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedTo', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCancelledByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCancelledDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledDate', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByLastModifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModifiedBy', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByPackPreLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByPackPreLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packPreLabel', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByRemark() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByRemarkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remark', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByTotalPackItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackItem', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByTotalPackItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackItem', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByTotalPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackQty', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByTotalPackQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPackQty', Sort.desc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByUploadToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.asc);
    });
  }

  QueryBuilder<PackList, PackList, QAfterSortBy> thenByUploadTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadToken', Sort.desc);
    });
  }
}

extension PackListQueryWhereDistinct
    on QueryBuilder<PackList, PackList, QDistinct> {
  QueryBuilder<PackList, PackList, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByAssignedTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedTo');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByCancelledBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledBy');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByCancelledDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledDate');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByLastModifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModifiedBy');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByPackPreLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packPreLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByRemark(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remark', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByTotalPackItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPackItem');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByTotalPackQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPackQty');
    });
  }

  QueryBuilder<PackList, PackList, QDistinct> distinctByUploadToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadToken', caseSensitive: caseSensitive);
    });
  }
}

extension PackListQueryProperty
    on QueryBuilder<PackList, PackList, QQueryProperty> {
  QueryBuilder<PackList, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<PackList, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> assignedToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedTo');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> cancelledByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledBy');
    });
  }

  QueryBuilder<PackList, DateTime?, QQueryOperations> cancelledDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledDate');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<PackList, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> lastModifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModifiedBy');
    });
  }

  QueryBuilder<PackList, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<PackList, String?, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<PackList, String?, QQueryOperations> packPreLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packPreLabel');
    });
  }

  QueryBuilder<PackList, String?, QQueryOperations> remarkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remark');
    });
  }

  QueryBuilder<PackList, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PackList, int?, QQueryOperations> totalPackItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPackItem');
    });
  }

  QueryBuilder<PackList, double?, QQueryOperations> totalPackQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPackQty');
    });
  }

  QueryBuilder<PackList, String?, QQueryOperations> uploadTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadToken');
    });
  }
}
