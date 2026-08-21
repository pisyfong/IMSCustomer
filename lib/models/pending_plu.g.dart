// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_plu.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPendingPluCollection on Isar {
  IsarCollection<PendingPlu> get pendingPlus => this.collection();
}

const PendingPluSchema = CollectionSchema(
  name: r'PendingPlu',
  id: -4057914546135246545,
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
    r'pluNo': PropertySchema(
      id: 3,
      name: r'pluNo',
      type: IsarType.string,
    ),
    r'skuNo': PropertySchema(
      id: 4,
      name: r'skuNo',
      type: IsarType.long,
    ),
    r'sourceDoc': PropertySchema(
      id: 5,
      name: r'sourceDoc',
      type: IsarType.string,
    ),
    r'uom': PropertySchema(
      id: 6,
      name: r'uom',
      type: IsarType.string,
    )
  },
  estimateSize: _pendingPluEstimateSize,
  serialize: _pendingPluSerialize,
  deserialize: _pendingPluDeserialize,
  deserializeProp: _pendingPluDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _pendingPluGetId,
  getLinks: _pendingPluGetLinks,
  attach: _pendingPluAttach,
  version: '3.1.0+1',
);

int _pendingPluEstimateSize(
  PendingPlu object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pluNo.length * 3;
  {
    final value = object.sourceDoc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uom.length * 3;
  return bytesCount;
}

void _pendingPluSerialize(
  PendingPlu object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.addedBy);
  writer.writeDateTime(offsets[1], object.addedDate);
  writer.writeLong(offsets[2], object.companyCode);
  writer.writeString(offsets[3], object.pluNo);
  writer.writeLong(offsets[4], object.skuNo);
  writer.writeString(offsets[5], object.sourceDoc);
  writer.writeString(offsets[6], object.uom);
}

PendingPlu _pendingPluDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PendingPlu();
  object.addedBy = reader.readLongOrNull(offsets[0]);
  object.addedDate = reader.readDateTimeOrNull(offsets[1]);
  object.companyCode = reader.readLong(offsets[2]);
  object.id = id;
  object.pluNo = reader.readString(offsets[3]);
  object.skuNo = reader.readLong(offsets[4]);
  object.sourceDoc = reader.readStringOrNull(offsets[5]);
  object.uom = reader.readString(offsets[6]);
  return object;
}

P _pendingPluDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pendingPluGetId(PendingPlu object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pendingPluGetLinks(PendingPlu object) {
  return [];
}

void _pendingPluAttach(IsarCollection<dynamic> col, Id id, PendingPlu object) {
  object.id = id;
}

extension PendingPluQueryWhereSort
    on QueryBuilder<PendingPlu, PendingPlu, QWhere> {
  QueryBuilder<PendingPlu, PendingPlu, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhere> anyCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'companyCode'),
      );
    });
  }
}

extension PendingPluQueryWhere
    on QueryBuilder<PendingPlu, PendingPlu, QWhereClause> {
  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> idBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> companyCodeEqualTo(
      int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'companyCode',
        value: [companyCode],
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> companyCodeNotEqualTo(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> companyCodeLessThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause> companyCodeBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
      pluNoEqualToAnyCompanyCode(String pluNo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pluNo_companyCode',
        value: [pluNo],
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
      pluNoCompanyCodeEqualTo(String pluNo, int companyCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pluNo_companyCode',
        value: [pluNo, companyCode],
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterWhereClause>
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
}

extension PendingPluQueryFilter
    on QueryBuilder<PendingPlu, PendingPlu, QFilterCondition> {
  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      addedByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedBy',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedByEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedBy',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedByLessThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedByBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      addedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      addedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addedDate',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedDateLessThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> addedDateBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      companyCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyCode',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoEqualTo(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoGreaterThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoLessThan(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoBetween(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoStartsWith(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoEndsWith(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoContains(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoMatches(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> pluNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      pluNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pluNo',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> skuNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuNo',
        value: value,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> skuNoGreaterThan(
    int value, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> skuNoLessThan(
    int value, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> skuNoBetween(
    int lower,
    int upper, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceDoc',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceDoc',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceDoc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceDoc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> sourceDocMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceDoc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition>
      sourceDocIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceDoc',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomEqualTo(
    String value, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomGreaterThan(
    String value, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomLessThan(
    String value, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomBetween(
    String lower,
    String upper, {
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomStartsWith(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomEndsWith(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomContains(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomMatches(
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

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uom',
        value: '',
      ));
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterFilterCondition> uomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uom',
        value: '',
      ));
    });
  }
}

extension PendingPluQueryObject
    on QueryBuilder<PendingPlu, PendingPlu, QFilterCondition> {}

extension PendingPluQueryLinks
    on QueryBuilder<PendingPlu, PendingPlu, QFilterCondition> {}

extension PendingPluQuerySortBy
    on QueryBuilder<PendingPlu, PendingPlu, QSortBy> {
  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortBySourceDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDoc', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortBySourceDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDoc', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> sortByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PendingPluQuerySortThenBy
    on QueryBuilder<PendingPlu, PendingPlu, QSortThenBy> {
  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByAddedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedBy', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByAddedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'addedDate', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyCode', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByPluNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByPluNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pluNo', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenBySkuNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuNo', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenBySourceDoc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDoc', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenBySourceDocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceDoc', Sort.desc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.asc);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QAfterSortBy> thenByUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uom', Sort.desc);
    });
  }
}

extension PendingPluQueryWhereDistinct
    on QueryBuilder<PendingPlu, PendingPlu, QDistinct> {
  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctByAddedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedBy');
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctByAddedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'addedDate');
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyCode');
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctByPluNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pluNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctBySkuNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuNo');
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctBySourceDoc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceDoc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PendingPlu, PendingPlu, QDistinct> distinctByUom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uom', caseSensitive: caseSensitive);
    });
  }
}

extension PendingPluQueryProperty
    on QueryBuilder<PendingPlu, PendingPlu, QQueryProperty> {
  QueryBuilder<PendingPlu, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PendingPlu, int?, QQueryOperations> addedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedBy');
    });
  }

  QueryBuilder<PendingPlu, DateTime?, QQueryOperations> addedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'addedDate');
    });
  }

  QueryBuilder<PendingPlu, int, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyCode');
    });
  }

  QueryBuilder<PendingPlu, String, QQueryOperations> pluNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pluNo');
    });
  }

  QueryBuilder<PendingPlu, int, QQueryOperations> skuNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuNo');
    });
  }

  QueryBuilder<PendingPlu, String?, QQueryOperations> sourceDocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceDoc');
    });
  }

  QueryBuilder<PendingPlu, String, QQueryOperations> uomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uom');
    });
  }
}
