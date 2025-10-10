import 'package:isar/isar.dart';

part 'user_customer.g.dart';

@collection
class UserCustomer {
  Id id = Isar.autoIncrement;
  
  @Index()
  late int userId; // This is actually the role_id from PI_User_Role
  
  @Index()
  late int companyCode;
  
  @Index()
  late String customer;
  
  String? isDefault; // 'Y' or 'N' or null
  
  UserCustomer();

  factory UserCustomer.fromJson(Map<String, dynamic> json) {
    return UserCustomer()
      ..userId = json['User_Id'] ?? 0
      ..companyCode = json['Company_Code'] ?? 0
      ..customer = json['Customer'] ?? ''
      ..isDefault = json['Is_Default'];
  }

  Map<String, dynamic> toJson() {
    return {
      'User_Id': userId,
      'Company_Code': companyCode,
      'Customer': customer,
      'Is_Default': isDefault,
    };
  }

  bool get isDefaultCustomer => isDefault == 'Y';
}
