import 'package:isar/isar.dart';

part 'current_login.g.dart';

@Collection()
class CurrentLogin {
  // Singleton ID for the current login
  static const int singletonId = 1;
  
  // Primary key
  Id id = singletonId;
  
  // User information
  int userId;
  String username;
  String fullName;
  String email;
  String? userPhoto;
  String designation;
  int? roleId; // Persist user's Role_ID for role-based filtering
  
  // Login timestamp
  DateTime loginTime;
  
  // Constructor
  CurrentLogin({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.email,
    this.userPhoto,
    required this.designation,
    this.roleId,
    required this.loginTime,
  });
  
  // Factory method to create from user model
  factory CurrentLogin.fromUser(Map<String, dynamic> user) {
    // Safe conversion helpers
    String toStringValue(dynamic value, String fallback) {
      if (value == null) return fallback;
      if (value is String) return value;
      if (value is Map) return fallback; // Handle Map case
      return value.toString();
    }
    
    String? toStringOrNull(dynamic value) {
      if (value == null) return null;
      if (value is String) return value;
      if (value is Map) return null; // Handle Map case
      return value.toString();
    }
    
    int toIntValue(dynamic value, int fallback) {
      if (value == null) return fallback;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? fallback;
      return fallback;
    }
    
    return CurrentLogin(
      userId: toIntValue(user['User_ID'], 0),
      username: toStringValue(user['Login_Name'], 'Unknown'),
      fullName: toStringValue(user['Full_Name'], 'Unknown'),
      email: toStringValue(user['Email'], 'unknown@example.com'),
      userPhoto: toStringOrNull(user['User_Photo']),
      designation: toStringValue(user['Designation'], 'User'),
      roleId: toIntValue(user['Role_ID'], 0),
      loginTime: DateTime.now(),
    );
  }
}
