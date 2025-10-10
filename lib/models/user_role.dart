import 'package:isar/isar.dart';

part 'user_role.g.dart';

@collection
class UserRole {
  Id id = Isar.autoIncrement;
  
  @Index()
  late int roleId;
  
  String? description;
  int? ordering;
  int? addedBy;
  DateTime? addedDate;
  int? lastModifiedBy;
  DateTime? lastWriteTimestamp;

  UserRole();

  factory UserRole.fromJson(Map<String, dynamic> json) {
    return UserRole()
      ..roleId = json['Role_ID'] ?? 0
      ..description = json['Description']
      ..ordering = json['Ordering']
      ..addedBy = json['Added_By']
      ..addedDate = json['Added_Date'] != null ? DateTime.parse(json['Added_Date']) : null
      ..lastModifiedBy = json['Last_Modified_By']
      ..lastWriteTimestamp = json['Lastwritetimestamp'] != null ? DateTime.parse(json['Lastwritetimestamp']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Role_ID': roleId,
      'Description': description,
      'Ordering': ordering,
      'Added_By': addedBy,
      'Added_Date': addedDate?.toIso8601String(),
      'Last_Modified_By': lastModifiedBy,
      'Lastwritetimestamp': lastWriteTimestamp?.toIso8601String(),
    };
  }
}
