import 'package:isar/isar.dart';

part 'department_lookup.g.dart';

@collection
class DepartmentLookup {
  Id id = Isar.autoIncrement;
  
  @Index(composite: [CompositeIndex('taxonomyMode'), CompositeIndex('departmentCode')])
  late int companyCode;

  /// 'pi' (legacy) or 'web' (Web_Dept). Lets both taxonomies live side-by-side
  /// offline so switching modes needs no re-fetch.
  String taxonomyMode = 'pi';

  late String departmentCode;

  /// The group this description belongs to.
  ///
  /// A department code is unique only within its group. In the web taxonomy
  /// AVT is "Aluminium" under HA, "Broom and Mop" under HB and "Sundries"
  /// under HX — seven meanings in total — so a code-only key silently keeps
  /// whichever row was written last. Empty when the source gave no group.
  String groupCode = '';

  late String description;

  DateTime? lastUpdated;

  DepartmentLookup();

  factory DepartmentLookup.fromJson(
    Map<String, dynamic> json,
    int companyCode, {
    String taxonomyMode = 'pi',
  }) {
    return DepartmentLookup()
      ..companyCode = companyCode
      ..taxonomyMode = taxonomyMode
      ..departmentCode = (json['dept'] ?? json['Dept'] ?? json['DEPT'] ??
                          json['department'] ?? json['Department'] ?? 
                          json['departmentCode'] ?? json['code'] ?? '').toString()
      ..description = (json['description'] ?? json['Description'] ?? 
                       json['deptDesc'] ?? json['DeptDesc'] ?? 
                       json['desc'] ?? '').toString()
      ..lastUpdated = DateTime.now();
  }
}
