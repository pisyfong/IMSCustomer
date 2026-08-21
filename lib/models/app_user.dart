import 'package:isar/isar.dart';

part 'app_user.g.dart';

/// Local cache of PI_Users — the directory behind the "Assigned To" picker on
/// picks and packs. Cached so assignment works offline.
@collection
class AppUser {
  /// Deterministic: the PI_Users.User_ID itself, so re-syncing upserts.
  Id id = Isar.autoIncrement;

  @Index()
  late int userId;

  String? loginName;
  String? fullName;
  String? designation;
  String? status;

  DateTime? lastUpdated;

  /// What the picker shows.
  String get displayName {
    final f = (fullName ?? '').trim();
    if (f.isNotEmpty) return f;
    final l = (loginName ?? '').trim();
    return l.isNotEmpty ? l : 'User $userId';
  }

  AppUser();

  factory AppUser.fromJson(Map<String, dynamic> j) {
    int? _i(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toInt();
      return int.tryParse(v.toString());
    }

    final uid = _i(j['User_ID'] ?? j['userId'] ?? j['user_id']) ?? 0;
    return AppUser()
      ..id = uid
      ..userId = uid
      ..loginName = (j['Login_Name'] ?? j['loginName'])?.toString()
      ..fullName = (j['Full_Name'] ?? j['fullName'])?.toString()
      ..designation = (j['Designation'] ?? j['designation'])?.toString()
      ..status = (j['Status'] ?? j['status'])?.toString()
      ..lastUpdated = DateTime.now();
  }
}
