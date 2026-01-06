// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_metadata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncMetadataCollection on Isar {
  IsarCollection<SyncMetadata> get syncMetadatas => this.collection();
}

const SyncMetadataSchema = CollectionSchema(
  name: r'SyncMetadata',
  id: 1560148770299903314,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'entityType': PropertySchema(
      id: 1,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'lastSyncCount': PropertySchema(
      id: 2,
      name: r'lastSyncCount',
      type: IsarType.long,
    ),
    r'lastSyncError': PropertySchema(
      id: 3,
      name: r'lastSyncError',
      type: IsarType.string,
    ),
    r'lastSyncStatus': PropertySchema(
      id: 4,
      name: r'lastSyncStatus',
      type: IsarType.string,
    ),
    r'lastSyncTimestamp': PropertySchema(
      id: 5,
      name: r'lastSyncTimestamp',
      type: IsarType.dateTime,
    ),
    r'uniqueKey': PropertySchema(
      id: 6,
      name: r'uniqueKey',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _syncMetadataEstimateSize,
  serialize: _syncMetadataSerialize,
  deserialize: _syncMetadataDeserialize,
  deserializeProp: _syncMetadataDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_entityType': IndexSchema(
      id: -7510790174493003916,
      name: r'companyCode_entityType',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'entityType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncMetadataGetId,
  getLinks: _syncMetadataGetLinks,
  attach: _syncMetadataAttach,
  version: '3.1.0+1',
);

int _syncMetadataEstimateSize(
  SyncMetadata object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityType.length * 3;
  {
    final value = object.lastSyncError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastSyncStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uniqueKey.length * 3;
  return bytesCount;
}

void _syncMetadataSerialize(
  SyncMetadata object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.entityType);
  writer.writeLong(offsets[2], object.lastSyncCount);
  writer.writeString(offsets[3], object.lastSyncError);
  writer.writeString(offsets[4], object.lastSyncStatus);
  writer.writeDateTime(offsets[5], object.lastSyncTimestamp);
  writer.writeString(offsets[6], object.uniqueKey);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

SyncMetadata _syncMetadataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncMetadata();
  object.companyCode = reader.readLong(offsets[0]);
  object.entityType = reader.readString(offsets[1]);
  object.id = id;
  object.lastSyncCount = reader.readLongOrNull(offsets[2]);
  object.lastSyncError = reader.readStringOrNull(offsets[3]);
  object.lastSyncStatus = reader.readStringOrNull(offsets[4]);
  object.lastSyncTimestamp = reader.readDateTimeOrNull(offsets[5]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _syncMetadataDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncMetadataGetId(SyncMetadata object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncMetadataGetLinks(SyncMetadata object) {
  return [];
}

void _syncMetadataAttach(
    IsarCollection<dynamic> col, Id id, SyncMetadata object) {
  object.id = id;
}

extension SyncMetadataByIndex on IsarCollection<SyncMetadata> {
  Future<SyncMetadata?> getByCompanyCodeEntityType(
      int companyCode, String entityType) {
    return getByIndex(r'companyCode_entityType', [companyCode, entityType]);
  }

  SyncMetadata? getByCompanyCodeEntityTypeSync(
      int companyCode, String entityType) {
    return getByIndexSync(r'companyCode_entityType', [companyCode, entityType]);
  }

  Future<bool> deleteByCompanyCodeEntityType(
      int companyCode, String entityType) {
    return deleteByIndex(r'companyCode_entityType', [companyCode, entityType]);
  }

  bool deleteByCompanyCodeEntityTypeSync(int companyCode, String entityType) {
    return deleteByIndexSync(
        r'companyCode_entityType', [companyCode, entityType]);
  }

  Future<List<SyncMetadata?>> getAllByCompanyCodeEntityType(
      List<int> companyCodeValues, List<String> entityTypeValues) {
    final len = companyCodeValues.length;
    assert(entityTypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], entityTypeValues[i]]);
    }

    return getAllByIndex(r'companyCode_entityType', values);
  }

  List<SyncMetadata?> getAllByCompanyCodeEntityTypeSync(
      List<int> companyCodeValues, List<String> entityTypeValues) {
    final len = companyCodeValues.length;
    assert(entityTypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], entityTypeValues[i]]);
    }

    return getAllByIndexSync(r'companyCode_entityType', values);
  }

  Future<int> deleteAllByCompanyCodeEntityType(
      List<int> companyCodeValues, List<String> entityTypeValues) {
    final len = companyCodeValues.length;
    assert(entityTypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], entityTypeValues[i]]);
    }

    return deleteAllByIndex(r'companyCode_entityType', values);
  }

  int deleteAllByCompanyCodeEntityTypeSync(
      List<int> companyCodeValues, List<String> entityTypeValues) {
    final len = companyCodeValues.length;
    assert(entityTypeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], entityTypeValues[i]]);
    }

    return deleteAllByIndexSync(r'companyCode_entityType', values);
  }

  Future<Id> putByCompanyCodeEntityType(SyncMetadata object) {
    return putByIndex(r'companyCode_entityType', object);
  }

  Id putByCompanyCodeEntityTypeSync(SyncMetadata object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'companyCode_entityType', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyCodeEntityType(List<SyncMetadata> objects) {
    return putAllByIndex(r'companyCode_entityType', objects);
  }

  List<Id> putAllByCompanyCodeEntityTypeSync(List<SyncMetadata> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'companyCode_entityType', objects,
        saveLinks: saveLinks);
  }
}

extension SyncMetadataQueryWhereSort
    on QueryBuilder<SyncMetadata, SyncMetadata, QWhere> {
  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncMetadataQueryWhere
    on QueryBuilder<SyncMetadata, SyncMetadata, QWhereClause> {
  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause> idBetween(
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeEqualToAnyEntityType(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_entityType',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeNotEqualToAnyEntityType(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeGreaterThanAnyEntityType(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_entityType',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeLessThanAnyEntityType(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_entityType',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeBetweenAnyEntityType(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_entityType',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeEntityTypeEqualTo(int companyCode, String entityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_entityType',
        value: [companyCode, entityType],
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterWhereClause>
      companyCodeEqualToEntityTypeNotEqualTo(
          int companyCode, String entityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode],
              upper: [companyCode, entityType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode, entityType],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode, entityType],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_entityType',
              lower: [companyCode],
              upper: [companyCode, entityType],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncMetadataQueryFilter
    on QueryBuilder<SyncMetadata, SyncMetadata, QFilterCondition> {
  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncCount',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncCount',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncError',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncError',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSyncError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSyncError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSyncError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncStatus',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncStatus',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSyncStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSyncStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSyncStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncTimestamp',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      lastSyncTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uniqueKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uniqueKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uniqueKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uniqueKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      uniqueKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uniqueKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncMetadataQueryObject
    on QueryBuilder<SyncMetadata, SyncMetadata, QFilterCondition> {}

extension SyncMetadataQueryLinks
    on QueryBuilder<SyncMetadata, SyncMetadata, QFilterCondition> {}

extension SyncMetadataQuerySortBy
    on QueryBuilder<SyncMetadata, SyncMetadata, QSortBy> {
  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByLastSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByLastSyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncError', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncError', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      sortByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SyncMetadataQuerySortThenBy
    on QueryBuilder<SyncMetadata, SyncMetadata, QSortThenBy> {
  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByLastSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncCount', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncCount', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByLastSyncError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncError', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncError', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStatus', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncStatus', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy>
      thenByLastSyncTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTimestamp', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByUniqueKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByUniqueKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uniqueKey', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SyncMetadataQueryWhereDistinct
    on QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> {
  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByEntityType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct>
      distinctByLastSyncCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncCount');
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByLastSyncError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncError',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByLastSyncStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct>
      distinctByLastSyncTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByUniqueKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uniqueKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadata, SyncMetadata, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SyncMetadataQueryProperty
    on QueryBuilder<SyncMetadata, SyncMetadata, QQueryProperty> {
  QueryBuilder<SyncMetadata, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncMetadata, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<SyncMetadata, String, QQueryOperations> entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<SyncMetadata, int?, QQueryOperations> lastSyncCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncCount');
    });
  }

  QueryBuilder<SyncMetadata, String?, QQueryOperations>
      lastSyncErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncError');
    });
  }

  QueryBuilder<SyncMetadata, String?, QQueryOperations>
      lastSyncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncStatus');
    });
  }

  QueryBuilder<SyncMetadata, DateTime?, QQueryOperations>
      lastSyncTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTimestamp');
    });
  }

  QueryBuilder<SyncMetadata, String, QQueryOperations> uniqueKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uniqueKey');
    });
  }

  QueryBuilder<SyncMetadata, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
