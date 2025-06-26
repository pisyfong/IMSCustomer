// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompanyCollection on Isar {
  IsarCollection<Company> get companys => this.collection();
}

const CompanySchema = CollectionSchema(
  name: r'Company',
  id: -3921622125198845844,
  properties: {
    r'City': PropertySchema(
      id: 0,
      name: r'City',
      type: IsarType.string,
    ),
    r'Company_Code': PropertySchema(
      id: 1,
      name: r'Company_Code',
      type: IsarType.string,
    ),
    r'Company_Logo': PropertySchema(
      id: 2,
      name: r'Company_Logo',
      type: IsarType.string,
    ),
    r'Company_Name': PropertySchema(
      id: 3,
      name: r'Company_Name',
      type: IsarType.string,
    ),
    r'Contact_Person': PropertySchema(
      id: 4,
      name: r'Contact_Person',
      type: IsarType.string,
    ),
    r'Country': PropertySchema(
      id: 5,
      name: r'Country',
      type: IsarType.string,
    ),
    r'Currency_Type': PropertySchema(
      id: 6,
      name: r'Currency_Type',
      type: IsarType.string,
    ),
    r'Email': PropertySchema(
      id: 7,
      name: r'Email',
      type: IsarType.string,
    ),
    r'Fax': PropertySchema(
      id: 8,
      name: r'Fax',
      type: IsarType.string,
    ),
    r'Mobile': PropertySchema(
      id: 9,
      name: r'Mobile',
      type: IsarType.string,
    ),
    r'Phone': PropertySchema(
      id: 10,
      name: r'Phone',
      type: IsarType.string,
    ),
    r'PostCode': PropertySchema(
      id: 11,
      name: r'PostCode',
      type: IsarType.string,
    ),
    r'Registration_No': PropertySchema(
      id: 12,
      name: r'Registration_No',
      type: IsarType.string,
    ),
    r'State': PropertySchema(
      id: 13,
      name: r'State',
      type: IsarType.string,
    ),
    r'Street1': PropertySchema(
      id: 14,
      name: r'Street1',
      type: IsarType.string,
    ),
    r'Street2': PropertySchema(
      id: 15,
      name: r'Street2',
      type: IsarType.string,
    ),
    r'Street3': PropertySchema(
      id: 16,
      name: r'Street3',
      type: IsarType.string,
    ),
    r'WebPage': PropertySchema(
      id: 17,
      name: r'WebPage',
      type: IsarType.string,
    )
  },
  estimateSize: _companyEstimateSize,
  serialize: _companySerialize,
  deserialize: _companyDeserialize,
  deserializeProp: _companyDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _companyGetId,
  getLinks: _companyGetLinks,
  attach: _companyAttach,
  version: '3.1.0+1',
);

int _companyEstimateSize(
  Company object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.companyCode.length * 3;
  {
    final value = object.companyLogo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.companyName.length * 3;
  {
    final value = object.contactPerson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currencyType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  {
    final value = object.mobile;
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
    final value = object.postCode;
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
  {
    final value = object.street1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.street2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.street3;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.webPage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _companySerialize(
  Company object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.companyCode);
  writer.writeString(offsets[2], object.companyLogo);
  writer.writeString(offsets[3], object.companyName);
  writer.writeString(offsets[4], object.contactPerson);
  writer.writeString(offsets[5], object.country);
  writer.writeString(offsets[6], object.currencyType);
  writer.writeString(offsets[7], object.email);
  writer.writeString(offsets[8], object.fax);
  writer.writeString(offsets[9], object.mobile);
  writer.writeString(offsets[10], object.phone);
  writer.writeString(offsets[11], object.postCode);
  writer.writeString(offsets[12], object.registrationNo);
  writer.writeString(offsets[13], object.state);
  writer.writeString(offsets[14], object.street1);
  writer.writeString(offsets[15], object.street2);
  writer.writeString(offsets[16], object.street3);
  writer.writeString(offsets[17], object.webPage);
}

Company _companyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Company();
  object.city = reader.readStringOrNull(offsets[0]);
  object.companyCode = reader.readString(offsets[1]);
  object.companyLogo = reader.readStringOrNull(offsets[2]);
  object.companyName = reader.readString(offsets[3]);
  object.contactPerson = reader.readStringOrNull(offsets[4]);
  object.country = reader.readStringOrNull(offsets[5]);
  object.currencyType = reader.readStringOrNull(offsets[6]);
  object.email = reader.readStringOrNull(offsets[7]);
  object.fax = reader.readStringOrNull(offsets[8]);
  object.mobile = reader.readStringOrNull(offsets[9]);
  object.phone = reader.readStringOrNull(offsets[10]);
  object.postCode = reader.readStringOrNull(offsets[11]);
  object.registrationNo = reader.readStringOrNull(offsets[12]);
  object.state = reader.readStringOrNull(offsets[13]);
  object.street1 = reader.readStringOrNull(offsets[14]);
  object.street2 = reader.readStringOrNull(offsets[15]);
  object.street3 = reader.readStringOrNull(offsets[16]);
  object.webPage = reader.readStringOrNull(offsets[17]);
  object.id = id;
  return object;
}

P _companyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
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
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _companyGetId(Company object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _companyGetLinks(Company object) {
  return [];
}

void _companyAttach(IsarCollection<dynamic> col, Id id, Company object) {
  object.id = id;
}

extension CompanyQueryWhereSort on QueryBuilder<Company, Company, QWhere> {
  QueryBuilder<Company, Company, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompanyQueryWhere on QueryBuilder<Company, Company, QWhereClause> {
  QueryBuilder<Company, Company, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Company, Company, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Company, Company, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Company, Company, QAfterWhereClause> idBetween(
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

extension CompanyQueryFilter
    on QueryBuilder<Company, Company, QFilterCondition> {
  QueryBuilder<Company, Company, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'City',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'City',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'City',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'City',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'City',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'City',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'City',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Company_Code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Company_Code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Company_Code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Code',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      companyCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Company_Code',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Company_Logo',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Company_Logo',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Company_Logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Company_Logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Company_Logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyLogoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Logo',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      companyLogoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Company_Logo',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Company_Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Company_Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Company_Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Company_Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Company_Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Contact_Person',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      contactPersonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Contact_Person',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      contactPersonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Contact_Person',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Contact_Person',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Contact_Person',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> contactPersonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Contact_Person',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      contactPersonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Contact_Person',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Country',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Country',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Country',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Country',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Currency_Type',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      currencyTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Currency_Type',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Currency_Type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Currency_Type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Currency_Type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> currencyTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Currency_Type',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      currencyTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Currency_Type',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Email',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Email',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Email',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Email',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Fax',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Fax',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Fax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Fax',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Fax',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Fax',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> faxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Fax',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Mobile',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Mobile',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Mobile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Mobile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Mobile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Mobile',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> mobileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Mobile',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Phone',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Phone',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Phone',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Phone',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'PostCode',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'PostCode',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'PostCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'PostCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'PostCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'PostCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> postCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'PostCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Registration_No',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      registrationNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Registration_No',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      registrationNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Registration_No',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      registrationNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Registration_No',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> registrationNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Registration_No',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      registrationNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Registration_No',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition>
      registrationNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Registration_No',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'State',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'State',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'State',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'State',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'State',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'State',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'State',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Street1',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Street1',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Street1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Street1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Street1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street1',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Street1',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Street2',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Street2',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Street2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Street2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Street2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street2',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Street2',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'Street3',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'Street3',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Street3',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Street3',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Street3',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Street3',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> street3IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Street3',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'WebPage',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'WebPage',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'WebPage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'WebPage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'WebPage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'WebPage',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> webPageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'WebPage',
        value: '',
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Company, Company, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Company, Company, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Company, Company, QAfterFilterCondition> idBetween(
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
}

extension CompanyQueryObject
    on QueryBuilder<Company, Company, QFilterCondition> {}

extension CompanyQueryLinks
    on QueryBuilder<Company, Company, QFilterCondition> {}

extension CompanyQuerySortBy on QueryBuilder<Company, Company, QSortBy> {
  QueryBuilder<Company, Company, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'City', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'City', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Code', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Code', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Logo', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Logo', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Name', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Name', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Contact_Person', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Contact_Person', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Country', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Country', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCurrencyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Currency_Type', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByCurrencyTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Currency_Type', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Email', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Email', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByFax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Fax', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByFaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Fax', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByMobile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Mobile', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByMobileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Mobile', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Phone', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Phone', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByPostCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PostCode', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByPostCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PostCode', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByRegistrationNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Registration_No', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByRegistrationNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Registration_No', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'State', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'State', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street1', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street1', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street2', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street2', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street3', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByStreet3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street3', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByWebPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'WebPage', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> sortByWebPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'WebPage', Sort.desc);
    });
  }
}

extension CompanyQuerySortThenBy
    on QueryBuilder<Company, Company, QSortThenBy> {
  QueryBuilder<Company, Company, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'City', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'City', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Code', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Code', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Logo', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Logo', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Name', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Company_Name', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByContactPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Contact_Person', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByContactPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Contact_Person', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Country', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Country', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCurrencyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Currency_Type', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByCurrencyTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Currency_Type', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Email', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Email', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByFax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Fax', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByFaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Fax', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByMobile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Mobile', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByMobileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Mobile', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Phone', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Phone', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByPostCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PostCode', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByPostCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'PostCode', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByRegistrationNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Registration_No', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByRegistrationNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Registration_No', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'State', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'State', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street1', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street1', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street2', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street2', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet3() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street3', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByStreet3Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Street3', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByWebPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'WebPage', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByWebPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'WebPage', Sort.desc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Company, Company, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CompanyQueryWhereDistinct
    on QueryBuilder<Company, Company, QDistinct> {
  QueryBuilder<Company, Company, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'City', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByCompanyCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Company_Code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByCompanyLogo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Company_Logo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByCompanyName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Company_Name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByContactPerson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Contact_Person',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByCurrencyType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Currency_Type',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByFax(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Fax', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByMobile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Mobile', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByPostCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'PostCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByRegistrationNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Registration_No',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'State', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByStreet1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Street1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByStreet2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Street2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByStreet3(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Street3', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Company, Company, QDistinct> distinctByWebPage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'WebPage', caseSensitive: caseSensitive);
    });
  }
}

extension CompanyQueryProperty
    on QueryBuilder<Company, Company, QQueryProperty> {
  QueryBuilder<Company, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'City');
    });
  }

  QueryBuilder<Company, String, QQueryOperations> companyCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Company_Code');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> companyLogoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Company_Logo');
    });
  }

  QueryBuilder<Company, String, QQueryOperations> companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Company_Name');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> contactPersonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Contact_Person');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Country');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> currencyTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Currency_Type');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Email');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> faxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Fax');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> mobileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Mobile');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Phone');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> postCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'PostCode');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> registrationNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Registration_No');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'State');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> street1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Street1');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> street2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Street2');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> street3Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Street3');
    });
  }

  QueryBuilder<Company, String?, QQueryOperations> webPageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'WebPage');
    });
  }
}
