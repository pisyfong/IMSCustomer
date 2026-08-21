// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrinterSettingsCollection on Isar {
  IsarCollection<PrinterSettings> get printerSettings => this.collection();
}

const PrinterSettingsSchema = CollectionSchema(
  name: r'PrinterSettings',
  id: 4826724461885733644,
  properties: {
    r'autoCut': PropertySchema(
      id: 0,
      name: r'autoCut',
      type: IsarType.bool,
    ),
    r'copies': PropertySchema(
      id: 1,
      name: r'copies',
      type: IsarType.long,
    ),
    r'feedLines': PropertySchema(
      id: 2,
      name: r'feedLines',
      type: IsarType.long,
    ),
    r'host': PropertySchema(
      id: 3,
      name: r'host',
      type: IsarType.string,
    ),
    r'macAddress': PropertySchema(
      id: 4,
      name: r'macAddress',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'paperWidthMm': PropertySchema(
      id: 6,
      name: r'paperWidthMm',
      type: IsarType.long,
    ),
    r'port': PropertySchema(
      id: 7,
      name: r'port',
      type: IsarType.long,
    ),
    r'printBarcode': PropertySchema(
      id: 8,
      name: r'printBarcode',
      type: IsarType.bool,
    ),
    r'transport': PropertySchema(
      id: 9,
      name: r'transport',
      type: IsarType.string,
      enumMap: _PrinterSettingstransportEnumValueMap,
    )
  },
  estimateSize: _printerSettingsEstimateSize,
  serialize: _printerSettingsSerialize,
  deserialize: _printerSettingsDeserialize,
  deserializeProp: _printerSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _printerSettingsGetId,
  getLinks: _printerSettingsGetLinks,
  attach: _printerSettingsAttach,
  version: '3.1.0+1',
);

int _printerSettingsEstimateSize(
  PrinterSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.host.length * 3;
  bytesCount += 3 + object.macAddress.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.transport.name.length * 3;
  return bytesCount;
}

void _printerSettingsSerialize(
  PrinterSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoCut);
  writer.writeLong(offsets[1], object.copies);
  writer.writeLong(offsets[2], object.feedLines);
  writer.writeString(offsets[3], object.host);
  writer.writeString(offsets[4], object.macAddress);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.paperWidthMm);
  writer.writeLong(offsets[7], object.port);
  writer.writeBool(offsets[8], object.printBarcode);
  writer.writeString(offsets[9], object.transport.name);
}

PrinterSettings _printerSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrinterSettings();
  object.autoCut = reader.readBool(offsets[0]);
  object.copies = reader.readLong(offsets[1]);
  object.feedLines = reader.readLong(offsets[2]);
  object.host = reader.readString(offsets[3]);
  object.id = id;
  object.macAddress = reader.readString(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.paperWidthMm = reader.readLong(offsets[6]);
  object.port = reader.readLong(offsets[7]);
  object.printBarcode = reader.readBool(offsets[8]);
  object.transport = _PrinterSettingstransportValueEnumMap[
          reader.readStringOrNull(offsets[9])] ??
      PrinterTransport.bluetooth;
  return object;
}

P _printerSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (_PrinterSettingstransportValueEnumMap[
              reader.readStringOrNull(offset)] ??
          PrinterTransport.bluetooth) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PrinterSettingstransportEnumValueMap = {
  r'bluetooth': r'bluetooth',
  r'network': r'network',
};
const _PrinterSettingstransportValueEnumMap = {
  r'bluetooth': PrinterTransport.bluetooth,
  r'network': PrinterTransport.network,
};

Id _printerSettingsGetId(PrinterSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _printerSettingsGetLinks(PrinterSettings object) {
  return [];
}

void _printerSettingsAttach(
    IsarCollection<dynamic> col, Id id, PrinterSettings object) {
  object.id = id;
}

extension PrinterSettingsQueryWhereSort
    on QueryBuilder<PrinterSettings, PrinterSettings, QWhere> {
  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PrinterSettingsQueryWhere
    on QueryBuilder<PrinterSettings, PrinterSettings, QWhereClause> {
  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhereClause>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterWhereClause> idBetween(
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

extension PrinterSettingsQueryFilter
    on QueryBuilder<PrinterSettings, PrinterSettings, QFilterCondition> {
  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      autoCutEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'autoCut',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      copiesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'copies',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      copiesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'copies',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      copiesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'copies',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      copiesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'copies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      feedLinesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedLines',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      feedLinesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedLines',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      feedLinesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedLines',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      feedLinesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedLines',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'host',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'host',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'host',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'host',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      hostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'host',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'macAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'macAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'macAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'macAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      macAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'macAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
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

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      paperWidthMmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paperWidthMm',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      paperWidthMmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paperWidthMm',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      paperWidthMmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paperWidthMm',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      paperWidthMmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paperWidthMm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      portEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'port',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      portGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'port',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      portLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'port',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      portBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'port',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      printBarcodeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'printBarcode',
        value: value,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportEqualTo(
    PrinterTransport value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportGreaterThan(
    PrinterTransport value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportLessThan(
    PrinterTransport value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportBetween(
    PrinterTransport lower,
    PrinterTransport upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transport',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transport',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transport',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transport',
        value: '',
      ));
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterFilterCondition>
      transportIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transport',
        value: '',
      ));
    });
  }
}

extension PrinterSettingsQueryObject
    on QueryBuilder<PrinterSettings, PrinterSettings, QFilterCondition> {}

extension PrinterSettingsQueryLinks
    on QueryBuilder<PrinterSettings, PrinterSettings, QFilterCondition> {}

extension PrinterSettingsQuerySortBy
    on QueryBuilder<PrinterSettings, PrinterSettings, QSortBy> {
  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> sortByAutoCut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoCut', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByAutoCutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoCut', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> sortByCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copies', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByCopiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copies', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByFeedLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedLines', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByFeedLinesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedLines', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> sortByHost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByHostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByMacAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByMacAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByPaperWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidthMm', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByPaperWidthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidthMm', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> sortByPort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'port', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByPortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'port', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByPrintBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printBarcode', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByPrintBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printBarcode', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transport', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      sortByTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transport', Sort.desc);
    });
  }
}

extension PrinterSettingsQuerySortThenBy
    on QueryBuilder<PrinterSettings, PrinterSettings, QSortThenBy> {
  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByAutoCut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoCut', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByAutoCutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoCut', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copies', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByCopiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'copies', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByFeedLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedLines', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByFeedLinesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedLines', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByHost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByHostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByMacAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByMacAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'macAddress', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByPaperWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidthMm', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByPaperWidthMmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidthMm', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy> thenByPort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'port', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByPortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'port', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByPrintBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printBarcode', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByPrintBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'printBarcode', Sort.desc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transport', Sort.asc);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QAfterSortBy>
      thenByTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transport', Sort.desc);
    });
  }
}

extension PrinterSettingsQueryWhereDistinct
    on QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> {
  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct>
      distinctByAutoCut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoCut');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> distinctByCopies() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'copies');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct>
      distinctByFeedLines() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedLines');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> distinctByHost(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'host', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct>
      distinctByMacAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'macAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct>
      distinctByPaperWidthMm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paperWidthMm');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> distinctByPort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'port');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct>
      distinctByPrintBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'printBarcode');
    });
  }

  QueryBuilder<PrinterSettings, PrinterSettings, QDistinct> distinctByTransport(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transport', caseSensitive: caseSensitive);
    });
  }
}

extension PrinterSettingsQueryProperty
    on QueryBuilder<PrinterSettings, PrinterSettings, QQueryProperty> {
  QueryBuilder<PrinterSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrinterSettings, bool, QQueryOperations> autoCutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoCut');
    });
  }

  QueryBuilder<PrinterSettings, int, QQueryOperations> copiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'copies');
    });
  }

  QueryBuilder<PrinterSettings, int, QQueryOperations> feedLinesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedLines');
    });
  }

  QueryBuilder<PrinterSettings, String, QQueryOperations> hostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'host');
    });
  }

  QueryBuilder<PrinterSettings, String, QQueryOperations> macAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'macAddress');
    });
  }

  QueryBuilder<PrinterSettings, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<PrinterSettings, int, QQueryOperations> paperWidthMmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paperWidthMm');
    });
  }

  QueryBuilder<PrinterSettings, int, QQueryOperations> portProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'port');
    });
  }

  QueryBuilder<PrinterSettings, bool, QQueryOperations> printBarcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'printBarcode');
    });
  }

  QueryBuilder<PrinterSettings, PrinterTransport, QQueryOperations>
      transportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transport');
    });
  }
}
