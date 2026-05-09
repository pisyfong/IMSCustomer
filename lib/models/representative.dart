import 'package:isar/isar.dart';

part 'representative.g.dart';

@collection
class Representative {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('representativeId')], unique: true, replace: true)
  late int companyCode;

  late int representativeId;

  String? fullName;
  String? status;
  String? isStaff;

  static Representative fromJson(Map<String, dynamic> json) {
    return Representative()
      ..companyCode = _parseInt(json['Company_Code']) ?? 0
      ..representativeId = _parseInt(json['Representative_ID']) ?? 0
      ..fullName = json['Full_Name'] as String?
      ..status = json['Status'] as String?
      ..isStaff = json['IsStaff'] as String?;
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  Map<String, dynamic> toJson() => {
        'Company_Code': companyCode,
        'Representative_ID': representativeId,
        'Full_Name': fullName,
        'Status': status,
        'IsStaff': isStaff,
      };

  String get displayName => (fullName?.trim().isNotEmpty == true)
      ? fullName!.trim()
      : 'Rep #$representativeId';
}
