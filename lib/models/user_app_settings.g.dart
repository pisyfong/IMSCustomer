// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserAppSettingsCollection on Isar {
  IsarCollection<UserAppSettings> get userAppSettings => this.collection();
}

const UserAppSettingsSchema = CollectionSchema(
  name: r'UserAppSettings',
  id: 6302066187644710036,
  properties: {
    r'adDistCreateEvent': PropertySchema(
      id: 0,
      name: r'adDistCreateEvent',
      type: IsarType.string,
    ),
    r'canAddFoc': PropertySchema(
      id: 1,
      name: r'canAddFoc',
      type: IsarType.bool,
    ),
    r'canChangePrice': PropertySchema(
      id: 2,
      name: r'canChangePrice',
      type: IsarType.bool,
    ),
    r'canEditAllOrders': PropertySchema(
      id: 3,
      name: r'canEditAllOrders',
      type: IsarType.bool,
    ),
    r'canExceedQty': PropertySchema(
      id: 4,
      name: r'canExceedQty',
      type: IsarType.bool,
    ),
    r'canSellBelowCost': PropertySchema(
      id: 5,
      name: r'canSellBelowCost',
      type: IsarType.bool,
    ),
    r'canViewAllOrders': PropertySchema(
      id: 6,
      name: r'canViewAllOrders',
      type: IsarType.bool,
    ),
    r'companyCode': PropertySchema(
      id: 7,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'lastWriteTimestamp': PropertySchema(
      id: 8,
      name: r'lastWriteTimestamp',
      type: IsarType.dateTime,
    ),
    r'promoterId': PropertySchema(
      id: 9,
      name: r'promoterId',
      type: IsarType.long,
    ),
    r'selectShop': PropertySchema(
      id: 10,
      name: r'selectShop',
      type: IsarType.string,
    ),
    r'showCost': PropertySchema(
      id: 11,
      name: r'showCost',
      type: IsarType.bool,
    ),
    r'showPI': PropertySchema(
      id: 12,
      name: r'showPI',
      type: IsarType.string,
    ),
    r'showQuantity': PropertySchema(
      id: 13,
      name: r'showQuantity',
      type: IsarType.bool,
    ),
    r'siAllOrderEdit': PropertySchema(
      id: 14,
      name: r'siAllOrderEdit',
      type: IsarType.string,
    ),
    r'siAllOrderView': PropertySchema(
      id: 15,
      name: r'siAllOrderView',
      type: IsarType.string,
    ),
    r'siAllowBelowCost': PropertySchema(
      id: 16,
      name: r'siAllowBelowCost',
      type: IsarType.string,
    ),
    r'siAllowChangePrice': PropertySchema(
      id: 17,
      name: r'siAllowChangePrice',
      type: IsarType.string,
    ),
    r'siAllowExceedQty': PropertySchema(
      id: 18,
      name: r'siAllowExceedQty',
      type: IsarType.string,
    ),
    r'siAllowFoc': PropertySchema(
      id: 19,
      name: r'siAllowFoc',
      type: IsarType.string,
    ),
    r'siBatch': PropertySchema(
      id: 20,
      name: r'siBatch',
      type: IsarType.long,
    ),
    r'siDistCreateEvent': PropertySchema(
      id: 21,
      name: r'siDistCreateEvent',
      type: IsarType.string,
    ),
    r'siShowCost': PropertySchema(
      id: 22,
      name: r'siShowCost',
      type: IsarType.string,
    ),
    r'siShowQty': PropertySchema(
      id: 23,
      name: r'siShowQty',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 24,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _userAppSettingsEstimateSize,
  serialize: _userAppSettingsSerialize,
  deserialize: _userAppSettingsDeserialize,
  deserializeProp: _userAppSettingsDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userAppSettingsGetId,
  getLinks: _userAppSettingsGetLinks,
  attach: _userAppSettingsAttach,
  version: '3.1.0+1',
);

int _userAppSettingsEstimateSize(
  UserAppSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.adDistCreateEvent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.selectShop;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.showPI;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllOrderEdit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllOrderView;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllowBelowCost;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllowChangePrice;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllowExceedQty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siAllowFoc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siDistCreateEvent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siShowCost;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siShowQty;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userAppSettingsSerialize(
  UserAppSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.adDistCreateEvent);
  writer.writeBool(offsets[1], object.canAddFoc);
  writer.writeBool(offsets[2], object.canChangePrice);
  writer.writeBool(offsets[3], object.canEditAllOrders);
  writer.writeBool(offsets[4], object.canExceedQty);
  writer.writeBool(offsets[5], object.canSellBelowCost);
  writer.writeBool(offsets[6], object.canViewAllOrders);
  writer.writeLong(offsets[7], object.companyCode);
  writer.writeDateTime(offsets[8], object.lastWriteTimestamp);
  writer.writeLong(offsets[9], object.promoterId);
  writer.writeString(offsets[10], object.selectShop);
  writer.writeBool(offsets[11], object.showCost);
  writer.writeString(offsets[12], object.showPI);
  writer.writeBool(offsets[13], object.showQuantity);
  writer.writeString(offsets[14], object.siAllOrderEdit);
  writer.writeString(offsets[15], object.siAllOrderView);
  writer.writeString(offsets[16], object.siAllowBelowCost);
  writer.writeString(offsets[17], object.siAllowChangePrice);
  writer.writeString(offsets[18], object.siAllowExceedQty);
  writer.writeString(offsets[19], object.siAllowFoc);
  writer.writeLong(offsets[20], object.siBatch);
  writer.writeString(offsets[21], object.siDistCreateEvent);
  writer.writeString(offsets[22], object.siShowCost);
  writer.writeString(offsets[23], object.siShowQty);
  writer.writeLong(offsets[24], object.userId);
}

UserAppSettings _userAppSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserAppSettings();
  object.adDistCreateEvent = reader.readStringOrNull(offsets[0]);
  object.companyCode = reader.readLong(offsets[7]);
  object.id = id;
  object.lastWriteTimestamp = reader.readDateTimeOrNull(offsets[8]);
  object.promoterId = reader.readLongOrNull(offsets[9]);
  object.selectShop = reader.readStringOrNull(offsets[10]);
  object.showPI = reader.readStringOrNull(offsets[12]);
  object.siAllOrderEdit = reader.readStringOrNull(offsets[14]);
  object.siAllOrderView = reader.readStringOrNull(offsets[15]);
  object.siAllowBelowCost = reader.readStringOrNull(offsets[16]);
  object.siAllowChangePrice = reader.readStringOrNull(offsets[17]);
  object.siAllowExceedQty = reader.readStringOrNull(offsets[18]);
  object.siAllowFoc = reader.readStringOrNull(offsets[19]);
  object.siBatch = reader.readLongOrNull(offsets[20]);
  object.siDistCreateEvent = reader.readStringOrNull(offsets[21]);
  object.siShowCost = reader.readStringOrNull(offsets[22]);
  object.siShowQty = reader.readStringOrNull(offsets[23]);
  object.userId = reader.readLong(offsets[24]);
  return object;
}

P _userAppSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readLongOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userAppSettingsGetId(UserAppSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userAppSettingsGetLinks(UserAppSettings object) {
  return [];
}

void _userAppSettingsAttach(
    IsarCollection<dynamic> col, Id id, UserAppSettings object) {
  object.id = id;
}

extension UserAppSettingsQueryWhereSort
    on QueryBuilder<UserAppSettings, UserAppSettings, QWhere> {
  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension UserAppSettingsQueryWhere
    on QueryBuilder<UserAppSettings, UserAppSettings, QWhereClause> {
  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      userIdEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      userIdNotEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      userIdGreaterThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      userIdLessThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      userIdBetween(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      companyCodeEqualTo(int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      companyCodeNotEqualTo(int companyCode) {
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      companyCodeLessThan(
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterWhereClause>
      companyCodeBetween(
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
}

extension UserAppSettingsQueryFilter
    on QueryBuilder<UserAppSettings, UserAppSettings, QFilterCondition> {
  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'adDistCreateEvent',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'adDistCreateEvent',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adDistCreateEvent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'adDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'adDistCreateEvent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adDistCreateEvent',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      adDistCreateEventIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'adDistCreateEvent',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canAddFocEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canAddFoc',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canChangePriceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canChangePrice',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canEditAllOrdersEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canEditAllOrders',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canExceedQtyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canExceedQty',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canSellBelowCostEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canSellBelowCost',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      canViewAllOrdersEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canViewAllOrders',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
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

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWriteTimestamp',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWriteTimestamp',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWriteTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastWriteTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastWriteTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      lastWriteTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastWriteTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'promoterId',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'promoterId',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoterId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promoterId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promoterId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      promoterIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promoterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'selectShop',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'selectShop',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selectShop',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'selectShop',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'selectShop',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selectShop',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      selectShopIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'selectShop',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showCostEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showCost',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'showPI',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'showPI',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPILessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'showPI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'showPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'showPI',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showPI',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showPIIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'showPI',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      showQuantityEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllOrderEdit',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllOrderEdit',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllOrderEdit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllOrderEdit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllOrderEdit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllOrderEdit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderEditIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllOrderEdit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllOrderView',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllOrderView',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllOrderView',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllOrderView',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllOrderView',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllOrderView',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllOrderViewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllOrderView',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllowBelowCost',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllowBelowCost',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllowBelowCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllowBelowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllowBelowCost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowBelowCost',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowBelowCostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllowBelowCost',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllowChangePrice',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllowChangePrice',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllowChangePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllowChangePrice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllowChangePrice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowChangePrice',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowChangePriceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllowChangePrice',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllowExceedQty',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllowExceedQty',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllowExceedQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllowExceedQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllowExceedQty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowExceedQty',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowExceedQtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllowExceedQty',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siAllowFoc',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siAllowFoc',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siAllowFoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siAllowFoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siAllowFoc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siAllowFoc',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siAllowFocIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siAllowFoc',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siBatch',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siBatch',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siBatch',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siBatch',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siBatch',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siBatchBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siBatch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siDistCreateEvent',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siDistCreateEvent',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siDistCreateEvent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siDistCreateEvent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siDistCreateEvent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siDistCreateEvent',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siDistCreateEventIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siDistCreateEvent',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siShowCost',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siShowCost',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siShowCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siShowCost',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siShowCost',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siShowCost',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowCostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siShowCost',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siShowQty',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siShowQty',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siShowQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siShowQty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siShowQty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siShowQty',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      siShowQtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siShowQty',
        value: '',
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserAppSettingsQueryObject
    on QueryBuilder<UserAppSettings, UserAppSettings, QFilterCondition> {}

extension UserAppSettingsQueryLinks
    on QueryBuilder<UserAppSettings, UserAppSettings, QFilterCondition> {}

extension UserAppSettingsQuerySortBy
    on QueryBuilder<UserAppSettings, UserAppSettings, QSortBy> {
  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByAdDistCreateEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adDistCreateEvent', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByAdDistCreateEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adDistCreateEvent', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanAddFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddFoc', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanAddFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddFoc', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanChangePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canChangePrice', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanChangePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canChangePrice', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanEditAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEditAllOrders', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanEditAllOrdersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEditAllOrders', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanExceedQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canExceedQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanExceedQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canExceedQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanSellBelowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSellBelowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanSellBelowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSellBelowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanViewAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewAllOrders', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCanViewAllOrdersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewAllOrders', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByLastWriteTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimestamp', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByLastWriteTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimestamp', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByPromoterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterId', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByPromoterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterId', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySelectShop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectShop', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySelectShopDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectShop', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByShowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByShowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> sortByShowPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPI', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByShowPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPI', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByShowQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQuantity', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByShowQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQuantity', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllOrderEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderEdit', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllOrderEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderEdit', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllOrderView() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderView', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllOrderViewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderView', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowBelowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowBelowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowBelowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowBelowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowChangePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowChangePrice', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowChangePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowChangePrice', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowExceedQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowExceedQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowExceedQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowExceedQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowFoc', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiAllowFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowFoc', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> sortBySiBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siBatch', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siBatch', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiDistCreateEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siDistCreateEvent', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiDistCreateEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siDistCreateEvent', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiShowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiShowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiShowQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortBySiShowQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserAppSettingsQuerySortThenBy
    on QueryBuilder<UserAppSettings, UserAppSettings, QSortThenBy> {
  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByAdDistCreateEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adDistCreateEvent', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByAdDistCreateEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adDistCreateEvent', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanAddFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddFoc', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanAddFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canAddFoc', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanChangePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canChangePrice', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanChangePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canChangePrice', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanEditAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEditAllOrders', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanEditAllOrdersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canEditAllOrders', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanExceedQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canExceedQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanExceedQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canExceedQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanSellBelowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSellBelowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanSellBelowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canSellBelowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanViewAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewAllOrders', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCanViewAllOrdersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canViewAllOrders', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByLastWriteTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimestamp', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByLastWriteTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWriteTimestamp', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByPromoterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterId', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByPromoterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoterId', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySelectShop() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectShop', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySelectShopDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selectShop', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByShowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByShowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> thenByShowPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPI', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByShowPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPI', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByShowQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQuantity', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByShowQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQuantity', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllOrderEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderEdit', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllOrderEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderEdit', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllOrderView() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderView', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllOrderViewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllOrderView', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowBelowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowBelowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowBelowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowBelowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowChangePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowChangePrice', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowChangePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowChangePrice', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowExceedQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowExceedQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowExceedQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowExceedQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowFoc', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiAllowFocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siAllowFoc', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> thenBySiBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siBatch', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siBatch', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiDistCreateEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siDistCreateEvent', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiDistCreateEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siDistCreateEvent', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiShowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowCost', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiShowCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowCost', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiShowQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowQty', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenBySiShowQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siShowQty', Sort.desc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserAppSettingsQueryWhereDistinct
    on QueryBuilder<UserAppSettings, UserAppSettings, QDistinct> {
  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByAdDistCreateEvent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adDistCreateEvent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanAddFoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canAddFoc');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanChangePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canChangePrice');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanEditAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canEditAllOrders');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanExceedQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canExceedQty');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanSellBelowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canSellBelowCost');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCanViewAllOrders() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canViewAllOrders');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByLastWriteTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWriteTimestamp');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByPromoterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promoterId');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySelectShop({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selectShop', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByShowCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showCost');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct> distinctByShowPI(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showPI', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctByShowQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showQuantity');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllOrderEdit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllOrderEdit',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllOrderView({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllOrderView',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllowBelowCost({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllowBelowCost',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllowChangePrice({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllowChangePrice',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllowExceedQty({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllowExceedQty',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiAllowFoc({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siAllowFoc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siBatch');
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiDistCreateEvent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siDistCreateEvent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct>
      distinctBySiShowCost({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siShowCost', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct> distinctBySiShowQty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siShowQty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserAppSettings, UserAppSettings, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension UserAppSettingsQueryProperty
    on QueryBuilder<UserAppSettings, UserAppSettings, QQueryProperty> {
  QueryBuilder<UserAppSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      adDistCreateEventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adDistCreateEvent');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations> canAddFocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canAddFoc');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations>
      canChangePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canChangePrice');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations>
      canEditAllOrdersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canEditAllOrders');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations> canExceedQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canExceedQty');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations>
      canSellBelowCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canSellBelowCost');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations>
      canViewAllOrdersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canViewAllOrders');
    });
  }

  QueryBuilder<UserAppSettings, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<UserAppSettings, DateTime?, QQueryOperations>
      lastWriteTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWriteTimestamp');
    });
  }

  QueryBuilder<UserAppSettings, int?, QQueryOperations> promoterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promoterId');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      selectShopProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selectShop');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations> showCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showCost');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations> showPIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showPI');
    });
  }

  QueryBuilder<UserAppSettings, bool, QQueryOperations> showQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showQuantity');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllOrderEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllOrderEdit');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllOrderViewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllOrderView');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllowBelowCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllowBelowCost');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllowChangePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllowChangePrice');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllowExceedQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllowExceedQty');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siAllowFocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siAllowFoc');
    });
  }

  QueryBuilder<UserAppSettings, int?, QQueryOperations> siBatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siBatch');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siDistCreateEventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siDistCreateEvent');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations>
      siShowCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siShowCost');
    });
  }

  QueryBuilder<UserAppSettings, String?, QQueryOperations> siShowQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siShowQty');
    });
  }

  QueryBuilder<UserAppSettings, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
