import 'package:isar/isar.dart';

part 'company.g.dart';

@Collection()
class Company {
  Id id = Isar.autoIncrement;

  @Name('Company_Logo')
  String? companyLogo;
  @Name('Company_Code')
  late String companyCode;
  @Name('Company_Name')
  late String companyName;
  @Name('Registration_No')
  String? registrationNo;
  @Name('Street1')
  String? street1;
  @Name('Street2')
  String? street2;
  @Name('Street3')
  String? street3;
  @Name('City')
  String? city;
  @Name('State')
  String? state;
  @Name('Country')
  String? country;
  @Name('PostCode')
  String? postCode;
  @Name('Phone')
  String? phone;
  @Name('Fax')
  String? fax;
  @Name('Email')
  String? email;
  @Name('WebPage')
  String? webPage;
  @Name('Contact_Person')
  String? contactPerson;
  @Name('Mobile')
  String? mobile;
  @Name('Currency_Type')
  String? currencyType;

  Company();

  factory Company.fromJson(Map<String, dynamic> json) => Company()
    ..companyLogo = json['Company_Logo']?.toString()
    ..companyCode = json['Company_Code']?.toString() ?? ''
    ..companyName = json['Company_Name']?.toString() ?? ''
    ..registrationNo = json['Registration_No']?.toString()
    ..street1 = json['Street1']?.toString()
    ..street2 = json['Street2']?.toString()
    ..street3 = json['Street3']?.toString()
    ..city = json['City']?.toString()
    ..state = json['State']?.toString()
    ..country = json['Country']?.toString()
    ..postCode = json['PostCode']?.toString()
    ..phone = json['Phone']?.toString()
    ..fax = json['Fax']?.toString()
    ..email = json['Email']?.toString()
    ..webPage = json['WebPage']?.toString()
    ..contactPerson = json['Contact_Person']?.toString()
    ..mobile = json['Mobile']?.toString()
    ..currencyType = json['Currency_Type']?.toString();
}
