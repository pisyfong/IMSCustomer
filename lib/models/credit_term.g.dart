// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_term.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCreditTermCollection on Isar {
  IsarCollection<CreditTerm> get creditTerms => this.collection();
}

const CreditTermSchema = CollectionSchema(
  name: r'CreditTerm',
  id: -6726311390453552198,
  properties: {
    r'companyCode': PropertySchema(
      id: 0,
      name: r'companyCode',
      type: IsarType.long,
    ),
    r'dayOfMonth': PropertySchema(
      id: 1,
      name: r'dayOfMonth',
      type: IsarType.long,
    ),
    r'days': PropertySchema(
      id: 2,
      name: r'days',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'description2': PropertySchema(
      id: 4,
      name: r'description2',
      type: IsarType.string,
    ),
    r'displayDays': PropertySchema(
      id: 5,
      name: r'displayDays',
      type: IsarType.string,
    ),
    r'displayDescription': PropertySchema(
      id: 6,
      name: r'displayDescription',
      type: IsarType.string,
    ),
    r'displayFull': PropertySchema(
      id: 7,
      name: r'displayFull',
      type: IsarType.string,
    ),
    r'displayTerm': PropertySchema(
      id: 8,
      name: r'displayTerm',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 9,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'ordering': PropertySchema(
      id: 10,
      name: r'ordering',
      type: IsarType.long,
    ),
    r'ordering2': PropertySchema(
      id: 11,
      name: r'ordering2',
      type: IsarType.long,
    ),
    r'purchaseLedgerAccount': PropertySchema(
      id: 12,
      name: r'purchaseLedgerAccount',
      type: IsarType.string,
    ),
    r'salesLedgerAccount': PropertySchema(
      id: 13,
      name: r'salesLedgerAccount',
      type: IsarType.string,
    ),
    r'term': PropertySchema(
      id: 14,
      name: r'term',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 15,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _creditTermEstimateSize,
  serialize: _creditTermSerialize,
  deserialize: _creditTermDeserialize,
  deserializeProp: _creditTermDeserializeProp,
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
    r'term': IndexSchema(
      id: 5114652110782333408,
      name: r'term',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'term',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _creditTermGetId,
  getLinks: _creditTermGetLinks,
  attach: _creditTermAttach,
  version: '3.1.0+1',
);

int _creditTermEstimateSize(
  CreditTerm object,
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
  {
    final value = object.description2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayDays.length * 3;
  bytesCount += 3 + object.displayDescription.length * 3;
  bytesCount += 3 + object.displayFull.length * 3;
  bytesCount += 3 + object.displayTerm.length * 3;
  {
    final value = object.purchaseLedgerAccount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.salesLedgerAccount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.term.length * 3;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _creditTermSerialize(
  CreditTerm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.companyCode);
  writer.writeLong(offsets[1], object.dayOfMonth);
  writer.writeLong(offsets[2], object.days);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.description2);
  writer.writeString(offsets[5], object.displayDays);
  writer.writeString(offsets[6], object.displayDescription);
  writer.writeString(offsets[7], object.displayFull);
  writer.writeString(offsets[8], object.displayTerm);
  writer.writeLong(offsets[9], object.hashCode);
  writer.writeLong(offsets[10], object.ordering);
  writer.writeLong(offsets[11], object.ordering2);
  writer.writeString(offsets[12], object.purchaseLedgerAccount);
  writer.writeString(offsets[13], object.salesLedgerAccount);
  writer.writeString(offsets[14], object.term);
  writer.writeString(offsets[15], object.type);
}

CreditTerm _creditTermDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CreditTerm();
  object.companyCode = reader.readLong(offsets[0]);
  object.dayOfMonth = reader.readLongOrNull(offsets[1]);
  object.days = reader.readLongOrNull(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.description2 = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.ordering = reader.readLongOrNull(offsets[10]);
  object.ordering2 = reader.readLongOrNull(offsets[11]);
  object.purchaseLedgerAccount = reader.readStringOrNull(offsets[12]);
  object.salesLedgerAccount = reader.readStringOrNull(offsets[13]);
  object.term = reader.readString(offsets[14]);
  object.type = reader.readStringOrNull(offsets[15]);
  return object;
}

P _creditTermDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _creditTermGetId(CreditTerm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _creditTermGetLinks(CreditTerm object) {
  return [];
}

void _creditTermAttach(IsarCollection<dynamic> col, Id id, CreditTerm object) {
  object.id = id;
}

extension CreditTermQueryWhereSort
    on QueryBuilder<CreditTerm, CreditTerm, QWhere> {
  QueryBuilder<CreditTerm, CreditTerm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension CreditTermQueryWhere
    on QueryBuilder<CreditTerm, CreditTerm, QWhereClause> {
  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> idBetween(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> termEqualTo(
      String term) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'term',
        value: [term],
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterWhereClause> termNotEqualTo(
      String term) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'term',
              lower: [],
              upper: [term],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'term',
              lower: [term],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'term',
              lower: [term],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'term',
              lower: [],
              upper: [term],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CreditTermQueryFilter
    on QueryBuilder<CreditTerm, CreditTerm, QFilterCondition> {
  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      dayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      dayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> dayOfMonthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      dayOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      dayOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> dayOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'days',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> daysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'days',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description2',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description2',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description2',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      description2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description2',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayDays',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayDays',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayDays',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayDays',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayFull',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayFull',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayFull',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayFull',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayFullIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayFull',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayTerm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayTerm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayTerm',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayTerm',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      displayTermIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayTerm',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> orderingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordering',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      orderingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordering',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> orderingEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordering',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      orderingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordering',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> orderingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordering',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> orderingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordering',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      ordering2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ordering2',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      ordering2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ordering2',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> ordering2EqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ordering2',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      ordering2GreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ordering2',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> ordering2LessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ordering2',
        value: value,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> ordering2Between(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ordering2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'purchaseLedgerAccount',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'purchaseLedgerAccount',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseLedgerAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchaseLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchaseLedgerAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseLedgerAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      purchaseLedgerAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchaseLedgerAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salesLedgerAccount',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salesLedgerAccount',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salesLedgerAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'salesLedgerAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'salesLedgerAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesLedgerAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition>
      salesLedgerAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'salesLedgerAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'term',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'term',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'term',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> termIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'term',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension CreditTermQueryObject
    on QueryBuilder<CreditTerm, CreditTerm, QFilterCondition> {}

extension CreditTermQueryLinks
    on QueryBuilder<CreditTerm, CreditTerm, QFilterCondition> {}

extension CreditTermQuerySortBy
    on QueryBuilder<CreditTerm, CreditTerm, QSortBy> {
  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDescription2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDescription2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDays', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDays', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortByDisplayDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortByDisplayDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayFull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFull', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayFullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFull', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayTerm', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByDisplayTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayTerm', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByOrdering() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByOrderingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByOrdering2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering2', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByOrdering2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering2', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortByPurchaseLedgerAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseLedgerAccount', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortByPurchaseLedgerAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseLedgerAccount', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortBySalesLedgerAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesLedgerAccount', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      sortBySalesLedgerAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesLedgerAccount', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CreditTermQuerySortThenBy
    on QueryBuilder<CreditTerm, CreditTerm, QSortThenBy> {
  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'days', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDescription2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDescription2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description2', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDays', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDays', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenByDisplayDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenByDisplayDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayDescription', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayFull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFull', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayFullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayFull', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayTerm', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByDisplayTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayTerm', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByOrdering() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByOrderingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByOrdering2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering2', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByOrdering2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ordering2', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenByPurchaseLedgerAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseLedgerAccount', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenByPurchaseLedgerAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseLedgerAccount', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenBySalesLedgerAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesLedgerAccount', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy>
      thenBySalesLedgerAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesLedgerAccount', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByTerm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByTermDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'term', Sort.desc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension CreditTermQueryWhereDistinct
    on QueryBuilder<CreditTerm, CreditTerm, QDistinct> {
  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfMonth');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'days');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDescription2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDisplayDays(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayDays', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDisplayDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDisplayFull(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayFull', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByDisplayTerm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayTerm', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByOrdering() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ordering');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByOrdering2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ordering2');
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct>
      distinctByPurchaseLedgerAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseLedgerAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctBySalesLedgerAccount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesLedgerAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByTerm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'term', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CreditTerm, CreditTerm, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension CreditTermQueryProperty
    on QueryBuilder<CreditTerm, CreditTerm, QQueryProperty> {
  QueryBuilder<CreditTerm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CreditTerm, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<CreditTerm, int?, QQueryOperations> dayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfMonth');
    });
  }

  QueryBuilder<CreditTerm, int?, QQueryOperations> daysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'days');
    });
  }

  QueryBuilder<CreditTerm, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CreditTerm, String?, QQueryOperations> description2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description2');
    });
  }

  QueryBuilder<CreditTerm, String, QQueryOperations> displayDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayDays');
    });
  }

  QueryBuilder<CreditTerm, String, QQueryOperations>
      displayDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayDescription');
    });
  }

  QueryBuilder<CreditTerm, String, QQueryOperations> displayFullProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayFull');
    });
  }

  QueryBuilder<CreditTerm, String, QQueryOperations> displayTermProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayTerm');
    });
  }

  QueryBuilder<CreditTerm, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<CreditTerm, int?, QQueryOperations> orderingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ordering');
    });
  }

  QueryBuilder<CreditTerm, int?, QQueryOperations> ordering2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ordering2');
    });
  }

  QueryBuilder<CreditTerm, String?, QQueryOperations>
      purchaseLedgerAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseLedgerAccount');
    });
  }

  QueryBuilder<CreditTerm, String?, QQueryOperations>
      salesLedgerAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesLedgerAccount');
    });
  }

  QueryBuilder<CreditTerm, String, QQueryOperations> termProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'term');
    });
  }

  QueryBuilder<CreditTerm, String?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
