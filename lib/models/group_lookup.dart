import 'package:isar/isar.dart';

part 'group_lookup.g.dart';

@collection
class GroupLookup {
  Id id = Isar.autoIncrement;
  
  @Index(composite: [CompositeIndex('taxonomyMode'), CompositeIndex('grp')])
  late int companyCode;

  /// 'pi' (legacy PI_Group) or 'web' (Web_Group). Lets both taxonomies live
  /// side-by-side offline so switching modes needs no re-fetch.
  String taxonomyMode = 'pi';

  late String grp;
  late String description;

  DateTime? lastUpdated;

  GroupLookup();

  factory GroupLookup.fromJson(
    Map<String, dynamic> json,
    int companyCode, {
    String taxonomyMode = 'pi',
  }) {
    return GroupLookup()
      ..companyCode = companyCode
      ..taxonomyMode = taxonomyMode
      ..grp = (json['grp'] ?? json['Grp'] ?? json['GRP'] ??
               json['group'] ?? json['Group'] ?? json['code'] ?? '').toString()
      ..description = (json['description'] ?? json['Description'] ?? 
                       json['groupDesc'] ?? json['GroupDesc'] ?? 
                       json['desc'] ?? '').toString()
      ..lastUpdated = DateTime.now();
  }
}
