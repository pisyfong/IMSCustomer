// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_location.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppLocationCollection on Isar {
  IsarCollection<AppLocation> get appLocations => this.collection();
}

const AppLocationSchema = CollectionSchema(
  name: r'AppLocation',
  id: -1574943334456717629,
  properties: {
    r'address1': PropertySchema(
      id: 0,
      name: r'address1',
      type: IsarType.string,
    ),
    r'address2': PropertySchema(
      id: 1,
      name: r'address2',
      type: IsarType.string,
    ),
    r'address3': PropertySchema(
      id: 2,
      name: r'address3',
      type: IsarType.string,
    ),
    r'city': PropertySchema(
      id: 3,
      name: r'city',
      type: IsarType.string,
    ),
    r'companyCode': PropertySchema(
      id: 4,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'displayName': PropertySchema(
      id: 5,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 6,
      name: r'email',
      type: IsarType.string,
    ),
    r'fax': PropertySchema(
      id: 7,
      name: r'fax',
      type: IsarType.string,
    ),
    r'isDefault': PropertySchema(
      id: 8,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 9,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'letterheadLines': PropertySchema(
      id: 10,
      name: r'letterheadLines',
      type: IsarType.stringList,
    ),
    r'locationCode': PropertySchema(
      id: 11,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 13,
      name: r'phone',
      type: IsarType.string,
    ),
    r'postcode': PropertySchema(
      id: 14,
      name: r'postcode',
      type: IsarType.string,
    ),
    r'registrationNo': PropertySchema(
      id: 15,
      name: r'registrationNo',
      type: IsarType.string,
    ),
    r'state': PropertySchema(
      id: 16,
      name: r'state',
      type: IsarType.string,
    )
  },
  estimateSize: _appLocationEstimateSize,
  serialize: _appLocationSerialize,
  deserialize: _appLocationDeserialize,
  deserializeProp: _appLocationDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyCode_locationCode': IndexSchema(
      id: 180667099473913369,
      name: r'companyCode_locationCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'companyCode',
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
  getId: _appLocationGetId,
  getLinks: _appLocationGetLinks,
  attach: _appLocationAttach,
  version: '3.1.0+1',
);

int _appLocationEstimateSize(
  AppLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayName.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fax;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.letterheadLines.length * 3;
  {
    for (var i = 0; i < object.letterheadLines.length; i++) {
      final value = object.letterheadLines[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.locationCode.length * 3;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.postcode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.registrationNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.state;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _appLocationSerialize(
  AppLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address1);
  writer.writeString(offsets[1], object.address2);
  writer.writeString(offsets[2], object.address3);
  writer.writeString(offsets[3], object.city);
  writer.writeLong(offsets[4], object.companyCode);
  writer.writeString(offsets[5], object.displayName);
  writer.writeString(offsets[6], object.email);
  writer.writeString(offsets[7], object.fax);
  writer.writeBool(offsets[8], object.isDefault);
  writer.writeDateTime(offsets[9], object.lastUpdated);
  writer.writeStringList(offsets[10], object.letterheadLines);
  writer.writeString(offsets[11], object.locationCode);
  writer.writeString(offsets[12], object.name);
  writer.writeString(offsets[13], object.phone);
  writer.writeString(offsets[14], object.postcode);
  writer.writeString(offsets[15], object.registrationNo);
  writer.writeString(offsets[16], object.state);
}

AppLocation _appLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppLocation();
  object.address1 = reader.readStringOrNull(offsets[0]);
  object.address2 = reader.readStringOrNull(offsets[1]);
  object.address3 = reader.readStringOrNull(offsets[2]);
  object.city = reader.readStringOrNull(offsets[3]);
  object.companyCode = reader.readLong(offsets[4]);
  object.email = reader.readStringOrNull(offsets[6]);
  object.fax = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.isDefault = reader.readBool(offsets[8]);
  object.lastUpdated = reader.readDateTimeOrNull(offsets[9]);
  object.locationCode = reader.readString(offsets[11]);
  object.name = reader.readStringOrNull(offsets[12]);
  object.phone = reader.readStringOrNull(offsets[13]);
  object.postcode = reader.readStringOrNull(offsets[14]);
  object.registrationNo = reader.readStringOrNull(offsets[15]);
  object.state = reader.readStringOrNull(offsets[16]);
  return object;
}

P _appLocationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appLocationGetId(AppLocation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appLocationGetLinks(AppLocation object) {
  return [];
}

void _appLocationAttach(
    IsarCollection<dynamic> col, Id id, AppLocation object) {
  object.id = id;
}

extension AppLocationByIndex on IsarCollection<AppLocation> {
  Future<AppLocation?> getByCompanyCodeLocationCode(
      int companyCode, String locationCode) {
    return getByIndex(r'companyCode_locationCode', [companyCode, locationCode]);
  }

  AppLocation? getByCompanyCodeLocationCodeSync(
      int companyCode, String locationCode) {
    return getByIndexSync(
        r'companyCode_locationCode', [companyCode, locationCode]);
  }

  Future<bool> deleteByCompanyCodeLocationCode(
      int companyCode, String locationCode) {
    return deleteByIndex(
        r'companyCode_locationCode', [companyCode, locationCode]);
  }

  bool deleteByCompanyCodeLocationCodeSync(
      int companyCode, String locationCode) {
    return deleteByIndexSync(
        r'companyCode_locationCode', [companyCode, locationCode]);
  }

  Future<List<AppLocation?>> getAllByCompanyCodeLocationCode(
      List<int> companyCodeValues, List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], locationCodeValues[i]]);
    }

    return getAllByIndex(r'companyCode_locationCode', values);
  }

  List<AppLocation?> getAllByCompanyCodeLocationCodeSync(
      List<int> companyCodeValues, List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], locationCodeValues[i]]);
    }

    return getAllByIndexSync(r'companyCode_locationCode', values);
  }

  Future<int> deleteAllByCompanyCodeLocationCode(
      List<int> companyCodeValues, List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], locationCodeValues[i]]);
    }

    return deleteAllByIndex(r'companyCode_locationCode', values);
  }

  int deleteAllByCompanyCodeLocationCodeSync(
      List<int> companyCodeValues, List<String> locationCodeValues) {
    final len = companyCodeValues.length;
    assert(locationCodeValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([companyCodeValues[i], locationCodeValues[i]]);
    }

    return deleteAllByIndexSync(r'companyCode_locationCode', values);
  }

  Future<Id> putByCompanyCodeLocationCode(AppLocation object) {
    return putByIndex(r'companyCode_locationCode', object);
  }

  Id putByCompanyCodeLocationCodeSync(AppLocation object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'companyCode_locationCode', object,
        saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyCodeLocationCode(List<AppLocation> objects) {
    return putAllByIndex(r'companyCode_locationCode', objects);
  }

  List<Id> putAllByCompanyCodeLocationCodeSync(List<AppLocation> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'companyCode_locationCode', objects,
        saveLinks: saveLinks);
  }
}

extension AppLocationQueryWhereSort
    on QueryBuilder<AppLocation, AppLocation, QWhere> {
  QueryBuilder<AppLocation, AppLocation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppLocationQueryWhere
    on QueryBuilder<AppLocation, AppLocation, QWhereClause> {
  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause> idBetween(
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

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeEqualToAnyLocationCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_locationCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeNotEqualToAnyLocationCode(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [],
              upper: [companyCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeGreaterThanAnyLocationCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_locationCode',
        lower: [companyCode],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeLessThanAnyLocationCode(
    int companyCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_locationCode',
        lower: [],
        upper: [companyCode],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeBetweenAnyLocationCode(
    int lowerCompanyCode,
    int upperCompanyCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'companyCode_locationCode',
        lower: [lowerCompanyCode],
        includeLower: includeLower,
        upper: [upperCompanyCode],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeLocationCodeEqualTo(int companyCode, String locationCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode_locationCode',
        value: [companyCode, locationCode],
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterWhereClause>
      companyCodeEqualToLocationCodeNotEqualTo(
          int companyCode, String locationCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode],
              upper: [companyCode, locationCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode, locationCode],
              includeLower: false,
              upper: [companyCode],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode, locationCode],
              includeLower: false,
              upper: [companyCode],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'companyCode_locationCode',
              lower: [companyCode],
              upper: [companyCode, locationCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AppLocationQueryFilter
    on QueryBuilder<AppLocation, AppLocation, QFilterCondition> {
  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address1',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address1',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address1',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address1',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address2',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address2',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address2',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address2',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address3',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address3',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> address3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address3',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      address3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address3',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fax',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fax',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fax',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> faxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fax',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      faxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fax',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'letterheadLines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'letterheadLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'letterheadLines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'letterheadLines',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'letterheadLines',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      letterheadLinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'letterheadLines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
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

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postcode',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postcode',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> postcodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> postcodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'postcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> postcodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'postcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postcode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      postcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'postcode',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'registrationNo',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'registrationNo',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registrationNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'registrationNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'registrationNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registrationNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      registrationNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'registrationNo',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'state',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      stateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'state',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'state',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'state',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'state',
        value: '',
      ));
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterFilterCondition>
      stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'state',
        value: '',
      ));
    });
  }
}

extension AppLocationQueryObject
    on QueryBuilder<AppLocation, AppLocation, QFilterCondition> {}

extension AppLocationQueryLinks
    on QueryBuilder<AppLocation, AppLocation, QFilterCondition> {}

extension AppLocationQuerySortBy
    on QueryBuilder<AppLocation, AppLocation, QSortBy> {
  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address3', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByAddress3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address3', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByFax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fax', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByFaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fax', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByPostcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postcode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByPostcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postcode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByRegistrationNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNo', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy>
      sortByRegistrationNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNo', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension AppLocationQuerySortThenBy
    on QueryBuilder<AppLocation, AppLocation, QSortThenBy> {
  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address1', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address2', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address3', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByAddress3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address3', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByFax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fax', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByFaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fax', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByPostcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postcode', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByPostcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'postcode', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByRegistrationNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNo', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy>
      thenByRegistrationNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registrationNo', Sort.desc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.asc);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'state', Sort.desc);
    });
  }
}

extension AppLocationQueryWhereDistinct
    on QueryBuilder<AppLocation, AppLocation, QDistinct> {
  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByAddress1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByAddress2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByAddress3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByDisplayName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByFax(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fax', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct>
      distinctByLetterheadLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'letterheadLines');
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByLocationCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByPostcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'postcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByRegistrationNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registrationNo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppLocation, AppLocation, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'state', caseSensitive: caseSensitive);
    });
  }
}

extension AppLocationQueryProperty
    on QueryBuilder<AppLocation, AppLocation, QQueryProperty> {
  QueryBuilder<AppLocation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> address1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address1');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> address2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address2');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> address3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address3');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<AppLocation, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<AppLocation, String, QQueryOperations> displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> faxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fax');
    });
  }

  QueryBuilder<AppLocation, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<AppLocation, DateTime?, QQueryOperations> lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<AppLocation, List<String>, QQueryOperations>
      letterheadLinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'letterheadLines');
    });
  }

  QueryBuilder<AppLocation, String, QQueryOperations> locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> postcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'postcode');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations>
      registrationNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registrationNo');
    });
  }

  QueryBuilder<AppLocation, String?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'state');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSelectedLocationCollection on Isar {
  IsarCollection<SelectedLocation> get selectedLocations => this.collection();
}

const SelectedLocationSchema = CollectionSchema(
  name: r'SelectedLocation',
  id: -4758836123431875230,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'locationCode': PropertySchema(
      id: 1,
      name: r'locationCode',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'selectedAt': PropertySchema(
      id: 3,
      name: r'selectedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _selectedLocationEstimateSize,
  serialize: _selectedLocationSerialize,
  deserialize: _selectedLocationDeserialize,
  deserializeProp: _selectedLocationDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _selectedLocationGetId,
  getLinks: _selectedLocationGetLinks,
  attach: _selectedLocationAttach,
  version: '3.1.0+1',
);

int _selectedLocationEstimateSize(
  SelectedLocation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.locationCode.length * 3;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _selectedLocationSerialize(
  SelectedLocation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeString(offsets[1], object.locationCode);
  writer.writeString(offsets[2], object.name);
  writer.writeDateTime(offsets[3], object.selectedAt);
}

SelectedLocation _selectedLocationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedLocation();
  object.companyCode = reader.readLong(offsets[0]);
  object.id = id;
  object.locationCode = reader.readString(offsets[1]);
  object.name = reader.readStringOrNull(offsets[2]);
  object.selectedAt = reader.readDateTime(offsets[3]);
  return object;
}

P _selectedLocationDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _selectedLocationGetId(SelectedLocation object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _selectedLocationGetLinks(SelectedLocation object) {
  return [];
}

void _selectedLocationAttach(
    IsarCollection<dynamic> col, Id id, SelectedLocation object) {
  object.id = id;
}

extension SelectedLocationQueryWhereSort
    on QueryBuilder<SelectedLocation, SelectedLocation, QWhere> {
  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SelectedLocationQueryWhere
    on QueryBuilder<SelectedLocation, SelectedLocation, QWhereClause> {
  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhereClause>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterWhereClause> idBetween(
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
}

extension SelectedLocationQueryFilter
    on QueryBuilder<SelectedLocation, SelectedLocation, QFilterCondition> {
  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
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

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      selectedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      selectedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      selectedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterFilterCondition>
      selectedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SelectedLocationQueryObject
    on QueryBuilder<SelectedLocation, SelectedLocation, QFilterCondition> {}

extension SelectedLocationQueryLinks
    on QueryBuilder<SelectedLocation, SelectedLocation, QFilterCondition> {}

extension SelectedLocationQuerySortBy
    on QueryBuilder<SelectedLocation, SelectedLocation, QSortBy> {
  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortBySelectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAt', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      sortBySelectedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAt', Sort.desc);
    });
  }
}

extension SelectedLocationQuerySortThenBy
    on QueryBuilder<SelectedLocation, SelectedLocation, QSortThenBy> {
  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenBySelectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAt', Sort.asc);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QAfterSortBy>
      thenBySelectedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectedAt', Sort.desc);
    });
  }
}

extension SelectedLocationQueryWhereDistinct
    on QueryBuilder<SelectedLocation, SelectedLocation, QDistinct> {
  QueryBuilder<SelectedLocation, SelectedLocation, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QDistinct>
      distinctByLocationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedLocation, SelectedLocation, QDistinct>
      distinctBySelectedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectedAt');
    });
  }
}

extension SelectedLocationQueryProperty
    on QueryBuilder<SelectedLocation, SelectedLocation, QQueryProperty> {
  QueryBuilder<SelectedLocation, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SelectedLocation, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<SelectedLocation, String, QQueryOperations>
      locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }

  QueryBuilder<SelectedLocation, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SelectedLocation, DateTime, QQueryOperations>
      selectedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectedAt');
    });
  }
}
