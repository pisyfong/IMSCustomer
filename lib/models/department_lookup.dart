import 'package:isar/isar.dart';

part 'department_lookup.g.dart';

@collection
class DepartmentLookup {
  Id id = Isar.autoIncrement;
  
  @Index(composite: [CompositeIndex('departmentCode')])
  late int companyCode;
  
  late String departmentCode;
  late String description;
  
  DateTime? lastUpdated;
  
  DepartmentLookup();
  
  factory DepartmentLookup.fromJson(Map<String, dynamic> json, int companyCode) {
    return DepartmentLookup()
      ..companyCode = companyCode
      ..departmentCode = (json['dept'] ?? json['Dept'] ?? json['DEPT'] ?? 
                          json['department'] ?? json['Department'] ?? 
                          json['departmentCode'] ?? json['code'] ?? '').toString()
      ..description = (json['description'] ?? json['Description'] ?? 
                       json['deptDesc'] ?? json['DeptDesc'] ?? 
                       json['desc'] ?? '').toString()
      ..lastUpdated = DateTime.now();
  }
}
