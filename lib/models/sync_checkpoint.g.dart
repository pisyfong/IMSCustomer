// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_checkpoint.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncCheckpointCollection on Isar {
  IsarCollection<SyncCheckpoint> get syncCheckpoints => this.collection();
}

const SyncCheckpointSchema = CollectionSchema(
  name: r'SyncCheckpoint',
  id: -3362950696409054465,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'lastCursorId': PropertySchema(
      id: 1,
      name: r'lastCursorId',
      type: IsarType.long,
    ),
    r'lastError': PropertySchema(
      id: 2,
      name: r'lastError',
      type: IsarType.string,
    ),
    r'lastErrorAt': PropertySchema(
      id: 3,
      name: r'lastErrorAt',
      type: IsarType.dateTime,
    ),
    r'lastRowCount': PropertySchema(
      id: 4,
      name: r'lastRowCount',
      type: IsarType.long,
    ),
    r'lastSyncedAt': PropertySchema(
      id: 5,
      name: r'lastSyncedAt',
      type: IsarType.dateTime,
    ),
    r'lastWriteTimeStamp': PropertySchema(
      id: 6,
      name: r'lastWriteTimeStamp',
      type: IsarType.dateTime,
    ),
    r'tableName': PropertySchema(
      id: 7,
      name: r'tableName',
      type: IsarType.string,
    )
  },
  estimateSize: _syncCheckpointEstimateSize,
  serialize: _syncCheckpointSerialize,
  deserialize: _syncCheckpointDeserialize,
  deserializeProp: _syncCheckpointDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_tableName': IndexSchema(
      id: 3824471729338757448,
      name: r'companyCode_tableName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'tableName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncCheckpointGetId,
  getLinks: _syncCheckpointGetLinks,
  attach: _syncCheckpointAttach,
  version: '3.1.0+1',
);

int _syncCheckpointEstimateSize(
  SyncCheckpoint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tableName.length * 3;
  return bytesCount;
}

void _syncCheckpointSerialize(
  SyncCheckpoint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeLong(offsets[1], object.lastCursorId);
  writer.writeString(offsets[2], object.lastError);
  writer.writeDateTime(offsets[3], object.lastErrorAt);
  writer.writeLong(offsets[4], object.lastRowCount);
  writer.writeDateTime(offsets[5], object.lastSyncedAt);
  writer.writeDateTime(offsets[6], object.lastWriteTimeStamp);
  writer.writeString(offsets[7], object.tableName);
}

SyncCheckpoint _syncCheckpointDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncCheckpoint();
  object.companyCode = reader.readLong(offsets[0]);
  object.id = id;
  object.lastCursorId = reader.readLongOrNull(offsets[1]);
  object.lastError = reader.readStringOrNull(offsets[2]);
  object.lastErrorAt = reader.readDateTimeOrNull(offsets[3]);
  object.lastRowCount = reader.readLongOrNull(offsets[4]);
  object.lastSyncedAt = reader.readDateTimeOrNull(offsets[5]);
  object.lastWriteTimeStamp = reader.readDateTimeOrNull(offsets[6]);
  object.tableName = reader.readString(offsets[7]);
  return object;
}

P _syncCheckpointDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncCheckpointGetId(SyncCheckpoint object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncCheckpointGetLinks(SyncCheckpoint object) {
  return [];
}

void _syncCheckpointAttach(
    IsarCollection<dynamic> col, Id id, SyncCheckpoint object) {
  object.id = id;
}

extension SyncCheckpointByIndex on IsarCollection<SyncCheckpoint> {
  Future<SyncCheckpoint?> getByCompanyCodeTableName(
      int companyCode, String tableName) {
    return getByIndex(r'companyCode_tableName', [companyCode, tableName]);
  }

  SyncCheckpoint? getByCompanyCodeTableNameSync(
      int companyCode, String tableName) {
    return getByIndexSync(r'companyCode_tableName', [companyCode, tableName]);
  }

  Future<bool> deleteByCompanyCodeTableName(int companyCode, String tableName) {
    return deleteByIndex(r'companyCode_tableName', [companyCode, tableName]);
  }

  bool deleteByCompanyCodeTableNameSync(int companyCode, String tableName) {
    return deleteByIndexSync(
        r'companyCode_tableName', [companyCode, tableName]);
  }

  Future<List<SyncCheckpoint?>> getAllByCompanyCodeTableName(
      List<int> companyCodeValues, List<String> tableNameValues) {
    final len = companyCodeValues.length;
    assert(tableNameValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], tableNameValues[i]]);
    }

    return getAllByIndex(r'companyCode_tableName', values);
  }

  List<SyncCheckpoint?> getAllByCompanyCodeTableNameSync(
      List<int> companyCodeValues, List<String> tableNameValues) {
    final len = companyCodeValues.length;
    assert(tableNameValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], tableNameValues[i]]);
    }

    return getAllByIndexSync(r'companyCode_tableName', values);
  }

  Future<int> deleteAllByCompanyCodeTableName(
      List<int> companyCodeValues, List<String> tableNameValues) {
    final len = companyCodeValues.length;
    assert(tableNameValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], tableNameValues[i]]);
    }

    return deleteAllByIndex(r'companyCode_tableName', values);
  }

  int deleteAllByCompanyCodeTableNameSync(
      List<int> companyCodeValues, List<String> tableNameValues) {
    final len = companyCodeValues.length;
    assert(tableNameValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], tableNameValues[i]]);
    }

    return deleteAllByIndexSync(r'companyCode_tableName', values);
  }

  Future<Id> putByCompanyCodeTableName(SyncCheckpoint object) {
    return putByIndex(r'companyCode_tableName', object);
  }

  Id putByCompanyCodeTableNameSync(SyncCheckpoint object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'companyCode_tableName', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyCodeTableName(List<SyncCheckpoint> objects) {
    return putAllByIndex(r'companyCode_tableName', objects);
  }

  List<Id> putAllByCompanyCodeTableNameSync(List<SyncCheckpoint> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'companyCode_tableName', objects,
        saveLinks: saveLinks);
  }
}

extension SyncCheckpointQueryWhereSort
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QWhere> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncCheckpointQueryWhere
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QWhereClause> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause> idBetween(
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeEqualToAnyTableName(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_tableName',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeNotEqualToAnyTableName(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeGreaterThanAnyTableName(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_tableName',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeLessThanAnyTableName(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_tableName',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeBetweenAnyTableName(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_tableName',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeTableNameEqualTo(int companyCode, String tableName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_tableName',
        value: [companyCode, tableName],
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterWhereClause>
      companyCodeEqualToTableNameNotEqualTo(int companyCode, String tableName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode],
              upper: [companyCode, tableName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode, tableName],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode, tableName],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_tableName',
              lower: [companyCode],
              upper: [companyCode, tableName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncCheckpointQueryFilter
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QFilterCondition> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCursorId',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCursorId',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCursorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCursorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCursorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastCursorIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCursorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastError',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastError',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastError',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastError',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastError',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastErrorAt',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastErrorAt',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastErrorAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastErrorAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastErrorAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastErrorAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastErrorAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastRowCount',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastRowCount',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastRowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastRowCount',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastRowCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastRowCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncedAt',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastSyncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastWriteTimeStampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastWriteTimeStampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimeStamp',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      lastWriteTimeStampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimeStamp',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
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

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableName',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterFilterCondition>
      tableNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableName',
        value: '',
      ));
    });
  }
}

extension SyncCheckpointQueryObject
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QFilterCondition> {}

extension SyncCheckpointQueryLinks
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QFilterCondition> {}

extension SyncCheckpointQuerySortBy
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QSortBy> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastCursorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCursorId', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastCursorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCursorId', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastErrorAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastErrorAt', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastErrorAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastErrorAt', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastRowCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRowCount', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastRowCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRowCount', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> sortByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      sortByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }
}

extension SyncCheckpointQuerySortThenBy
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QSortThenBy> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastCursorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCursorId', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastCursorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCursorId', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastError', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastErrorAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastErrorAt', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastErrorAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastErrorAt', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastRowCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRowCount', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastRowCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRowCount', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastSyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedAt', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByLastWriteTimeStampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimeStamp', Sort.desc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy> thenByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QAfterSortBy>
      thenByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }
}

extension SyncCheckpointQueryWhereDistinct
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct> {
  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByLastCursorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCursorId');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct> distinctByLastError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastError', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByLastErrorAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastErrorAt');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByLastRowCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastRowCount');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByLastSyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedAt');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct>
      distinctByLastWriteTimeStamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<SyncCheckpoint, SyncCheckpoint, QDistinct> distinctByTableName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableName', caseSensitive: caseSensitive);
    });
  }
}

extension SyncCheckpointQueryProperty
    on QueryBuilder<SyncCheckpoint, SyncCheckpoint, QQueryProperty> {
  QueryBuilder<SyncCheckpoint, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncCheckpoint, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<SyncCheckpoint, int?, QQueryOperations> lastCursorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCursorId');
    });
  }

  QueryBuilder<SyncCheckpoint, String?, QQueryOperations> lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastError');
    });
  }

  QueryBuilder<SyncCheckpoint, DateTime?, QQueryOperations>
      lastErrorAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastErrorAt');
    });
  }

  QueryBuilder<SyncCheckpoint, int?, QQueryOperations> lastRowCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastRowCount');
    });
  }

  QueryBuilder<SyncCheckpoint, DateTime?, QQueryOperations>
      lastSyncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedAt');
    });
  }

  QueryBuilder<SyncCheckpoint, DateTime?, QQueryOperations>
      lastWriteTimeStampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimeStamp');
    });
  }

  QueryBuilder<SyncCheckpoint, String, QQueryOperations> tableNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableName');
    });
  }
}
