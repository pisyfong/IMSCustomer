// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReceiptTemplateCollection on Isar {
  IsarCollection<ReceiptTemplate> get receiptTemplates => this.collection();
}

const ReceiptTemplateSchema = CollectionSchema(
  name: r'ReceiptTemplate',
  id: -2658631556442252366,
  properties: {
    r'footerNote': PropertySchema(
      id: 0,
      name: r'footerNote',
      type: IsarType.string,
    ),
    r'grouping': PropertySchema(
      id: 1,
      name: r'grouping',
      type: IsarType.string,
      enumMap: _ReceiptTemplategroupingEnumValueMap,
    ),
    r'headerLines': PropertySchema(
      id: 2,
      name: r'headerLines',
      type: IsarType.stringList,
    ),
    r'isDefault': PropertySchema(
      id: 3,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'module': PropertySchema(
      id: 4,
      name: r'module',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'showAssignee': PropertySchema(
      id: 6,
      name: r'showAssignee',
      type: IsarType.bool,
    ),
    r'showBarcode': PropertySchema(
      id: 7,
      name: r'showBarcode',
      type: IsarType.bool,
    ),
    r'showCompanyName': PropertySchema(
      id: 8,
      name: r'showCompanyName',
      type: IsarType.bool,
    ),
    r'showDate': PropertySchema(
      id: 9,
      name: r'showDate',
      type: IsarType.bool,
    ),
    r'showLocation': PropertySchema(
      id: 10,
      name: r'showLocation',
      type: IsarType.bool,
    ),
    r'showPlu': PropertySchema(
      id: 11,
      name: r'showPlu',
      type: IsarType.bool,
    ),
    r'showPrintedAt': PropertySchema(
      id: 12,
      name: r'showPrintedAt',
      type: IsarType.bool,
    ),
    r'showShortQty': PropertySchema(
      id: 13,
      name: r'showShortQty',
      type: IsarType.bool,
    ),
    r'showSource': PropertySchema(
      id: 14,
      name: r'showSource',
      type: IsarType.bool,
    ),
    r'showStatus': PropertySchema(
      id: 15,
      name: r'showStatus',
      type: IsarType.bool,
    ),
    r'showTotals': PropertySchema(
      id: 16,
      name: r'showTotals',
      type: IsarType.bool,
    ),
    r'showUnsyncedWarning': PropertySchema(
      id: 17,
      name: r'showUnsyncedWarning',
      type: IsarType.bool,
    ),
    r'showUom': PropertySchema(
      id: 18,
      name: r'showUom',
      type: IsarType.bool,
    ),
    r'signatures': PropertySchema(
      id: 19,
      name: r'signatures',
      type: IsarType.stringList,
    ),
    r'sortOrder': PropertySchema(
      id: 20,
      name: r'sortOrder',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 21,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _receiptTemplateEstimateSize,
  serialize: _receiptTemplateSerialize,
  deserialize: _receiptTemplateDeserialize,
  deserializeProp: _receiptTemplateDeserializeProp,
  idName: r'id',
  indexes: {
    r'module': IndexSchema(
      id: -8372774152552671714,
      name: r'module',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'module',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _receiptTemplateGetId,
  getLinks: _receiptTemplateGetLinks,
  attach: _receiptTemplateAttach,
  version: '3.1.0+1',
);

int _receiptTemplateEstimateSize(
  ReceiptTemplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.footerNote.length * 3;
  bytesCount += 3 + object.grouping.name.length * 3;
  bytesCount += 3 + object.headerLines.length * 3;
  {
    for (var i = 0; i < object.headerLines.length; i++) {
      final value = object.headerLines[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.module.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.signatures.length * 3;
  {
    for (var i = 0; i < object.signatures.length; i++) {
      final value = object.signatures[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _receiptTemplateSerialize(
  ReceiptTemplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.footerNote);
  writer.writeString(offsets[1], object.grouping.name);
  writer.writeStringList(offsets[2], object.headerLines);
  writer.writeBool(offsets[3], object.isDefault);
  writer.writeString(offsets[4], object.module);
  writer.writeString(offsets[5], object.name);
  writer.writeBool(offsets[6], object.showAssignee);
  writer.writeBool(offsets[7], object.showBarcode);
  writer.writeBool(offsets[8], object.showCompanyName);
  writer.writeBool(offsets[9], object.showDate);
  writer.writeBool(offsets[10], object.showLocation);
  writer.writeBool(offsets[11], object.showPlu);
  writer.writeBool(offsets[12], object.showPrintedAt);
  writer.writeBool(offsets[13], object.showShortQty);
  writer.writeBool(offsets[14], object.showSource);
  writer.writeBool(offsets[15], object.showStatus);
  writer.writeBool(offsets[16], object.showTotals);
  writer.writeBool(offsets[17], object.showUnsyncedWarning);
  writer.writeBool(offsets[18], object.showUom);
  writer.writeStringList(offsets[19], object.signatures);
  writer.writeLong(offsets[20], object.sortOrder);
  writer.writeString(offsets[21], object.title);
}

ReceiptTemplate _receiptTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReceiptTemplate();
  object.footerNote = reader.readString(offsets[0]);
  object.grouping = _ReceiptTemplategroupingValueEnumMap[
          reader.readStringOrNull(offsets[1])] ??
      ReceiptGrouping.none;
  object.headerLines = reader.readStringList(offsets[2]) ?? [];
  object.id = id;
  object.isDefault = reader.readBool(offsets[3]);
  object.module = reader.readString(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.showAssignee = reader.readBool(offsets[6]);
  object.showBarcode = reader.readBool(offsets[7]);
  object.showCompanyName = reader.readBool(offsets[8]);
  object.showDate = reader.readBool(offsets[9]);
  object.showLocation = reader.readBool(offsets[10]);
  object.showPlu = reader.readBool(offsets[11]);
  object.showPrintedAt = reader.readBool(offsets[12]);
  object.showShortQty = reader.readBool(offsets[13]);
  object.showSource = reader.readBool(offsets[14]);
  object.showStatus = reader.readBool(offsets[15]);
  object.showTotals = reader.readBool(offsets[16]);
  object.showUnsyncedWarning = reader.readBool(offsets[17]);
  object.showUom = reader.readBool(offsets[18]);
  object.signatures = reader.readStringList(offsets[19]) ?? [];
  object.sortOrder = reader.readLong(offsets[20]);
  object.title = reader.readString(offsets[21]);
  return object;
}

P _receiptTemplateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_ReceiptTemplategroupingValueEnumMap[
              reader.readStringOrNull(offset)] ??
          ReceiptGrouping.none) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readStringList(offset) ?? []) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ReceiptTemplategroupingEnumValueMap = {
  r'none': r'none',
  r'customer': r'customer',
  r'sq': r'sq',
  r'sourceDoc': r'sourceDoc',
};
const _ReceiptTemplategroupingValueEnumMap = {
  r'none': ReceiptGrouping.none,
  r'customer': ReceiptGrouping.customer,
  r'sq': ReceiptGrouping.sq,
  r'sourceDoc': ReceiptGrouping.sourceDoc,
};

Id _receiptTemplateGetId(ReceiptTemplate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _receiptTemplateGetLinks(ReceiptTemplate object) {
  return [];
}

void _receiptTemplateAttach(
    IsarCollection<dynamic> col, Id id, ReceiptTemplate object) {
  object.id = id;
}

extension ReceiptTemplateQueryWhereSort
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QWhere> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReceiptTemplateQueryWhere
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QWhereClause> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause>
      moduleEqualTo(String module) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'module',
        value: [module],
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterWhereClause>
      moduleNotEqualTo(String module) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'module',
              lower: [],
              upper: [module],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'module',
              lower: [module],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'module',
              lower: [module],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'module',
              lower: [],
              upper: [module],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ReceiptTemplateQueryFilter
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QFilterCondition> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'footerNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'footerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'footerNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerNote',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      footerNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'footerNote',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingEqualTo(
    ReceiptGrouping value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingGreaterThan(
    ReceiptGrouping value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingLessThan(
    ReceiptGrouping value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingBetween(
    ReceiptGrouping lower,
    ReceiptGrouping upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grouping',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grouping',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grouping',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grouping',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      groupingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grouping',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headerLines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'headerLines',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'headerLines',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headerLines',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'headerLines',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      headerLinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'headerLines',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'module',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'module',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'module',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'module',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      moduleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'module',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameEqualTo(
    String value, {
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameLessThan(
    String value, {
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
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

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showAssigneeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showAssignee',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showBarcodeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showBarcode',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showCompanyNameEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showCompanyName',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showDateEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showLocationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showLocation',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showPluEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showPlu',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showPrintedAtEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showPrintedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showShortQtyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showShortQty',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showSourceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showSource',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showTotalsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showTotals',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showUnsyncedWarningEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showUnsyncedWarning',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      showUomEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showUom',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signatures',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signatures',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signatures',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signatures',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signatures',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      signaturesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'signatures',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      sortOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      sortOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      sortOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      sortOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension ReceiptTemplateQueryObject
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QFilterCondition> {}

extension ReceiptTemplateQueryLinks
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QFilterCondition> {}

extension ReceiptTemplateQuerySortBy
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QSortBy> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByFooterNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerNote', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByFooterNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerNote', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByGrouping() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grouping', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByGroupingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grouping', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> sortByModule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'module', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByModuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'module', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowAssignee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showAssignee', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowAssigneeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showAssignee', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBarcode', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBarcode', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCompanyName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCompanyName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLocation', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLocation', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> sortByShowPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPlu', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPlu', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowPrintedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPrintedAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowPrintedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPrintedAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowShortQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showShortQty', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowShortQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showShortQty', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSource', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSource', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStatus', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStatus', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowTotals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTotals', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowTotalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTotals', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowUnsyncedWarning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUnsyncedWarning', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowUnsyncedWarningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUnsyncedWarning', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> sortByShowUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUom', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByShowUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUom', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ReceiptTemplateQuerySortThenBy
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QSortThenBy> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByFooterNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerNote', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByFooterNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerNote', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByGrouping() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grouping', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByGroupingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grouping', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByModule() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'module', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByModuleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'module', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowAssignee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showAssignee', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowAssigneeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showAssignee', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBarcode', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showBarcode', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCompanyName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCompanyName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDate', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDate', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLocation', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLocation', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByShowPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPlu', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowPluDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPlu', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowPrintedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPrintedAt', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowPrintedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPrintedAt', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowShortQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showShortQty', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowShortQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showShortQty', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSource', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSource', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStatus', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStatus', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowTotals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTotals', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowTotalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTotals', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowUnsyncedWarning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUnsyncedWarning', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowUnsyncedWarningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUnsyncedWarning', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByShowUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUom', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByShowUomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showUom', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension ReceiptTemplateQueryWhereDistinct
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct> {
  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByFooterNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footerNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct> distinctByGrouping(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grouping', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByHeaderLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headerLines');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct> distinctByModule(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'module', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowAssignee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showAssignee');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showBarcode');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showCompanyName');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showDate');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showLocation');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowPlu() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showPlu');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowPrintedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showPrintedAt');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowShortQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showShortQty');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showSource');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showStatus');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowTotals() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showTotals');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowUnsyncedWarning() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showUnsyncedWarning');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctByShowUom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showUom');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctBySignatures() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signatures');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct>
      distinctBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptTemplate, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension ReceiptTemplateQueryProperty
    on QueryBuilder<ReceiptTemplate, ReceiptTemplate, QQueryProperty> {
  QueryBuilder<ReceiptTemplate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReceiptTemplate, String, QQueryOperations> footerNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footerNote');
    });
  }

  QueryBuilder<ReceiptTemplate, ReceiptGrouping, QQueryOperations>
      groupingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grouping');
    });
  }

  QueryBuilder<ReceiptTemplate, List<String>, QQueryOperations>
      headerLinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headerLines');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<ReceiptTemplate, String, QQueryOperations> moduleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'module');
    });
  }

  QueryBuilder<ReceiptTemplate, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showAssigneeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showAssignee');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showBarcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showBarcode');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations>
      showCompanyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showCompanyName');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showDate');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showLocation');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showPluProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showPlu');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations>
      showPrintedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showPrintedAt');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showShortQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showShortQty');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showSource');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showStatus');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showTotalsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showTotals');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations>
      showUnsyncedWarningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showUnsyncedWarning');
    });
  }

  QueryBuilder<ReceiptTemplate, bool, QQueryOperations> showUomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showUom');
    });
  }

  QueryBuilder<ReceiptTemplate, List<String>, QQueryOperations>
      signaturesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signatures');
    });
  }

  QueryBuilder<ReceiptTemplate, int, QQueryOperations> sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }

  QueryBuilder<ReceiptTemplate, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
