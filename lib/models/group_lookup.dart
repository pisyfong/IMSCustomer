import 'package:isar/isar.dart';

part 'group_lookup.g.dart';

@collection
class GroupLookup {
  Id id = Isar.autoIncrement;
  
  @Index(composite: [CompositeIndex('grp')])
  late int companyCode;
  
  late String grp;
  late String description;
  
  DateTime? lastUpdated;
  
  GroupLookup();
  
  factory GroupLookup.fromJson(Map<String, dynamic> json, int companyCode) {
    return GroupLookup()
      ..companyCode = companyCode
      ..grp = (json['grp'] ?? json['Grp'] ?? json['GRP'] ?? 
               json['group'] ?? json['Group'] ?? json['code'] ?? '').toString()
      ..description = (json['description'] ?? json['Description'] ?? 
                       json['groupDesc'] ?? json['GroupDesc'] ?? 
                       json['desc'] ?? '').toString()
      ..lastUpdated = DateTime.now();
  }
}
