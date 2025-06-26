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
    required this.loginTime,
  });
  
  // Factory method to create from user model
  factory CurrentLogin.fromUser(Map<String, dynamic> user) {
    return CurrentLogin(
      userId: user['User_ID'],
      username: user['Login_Name'],
      fullName: user['Full_Name'],
      email: user['Email'],
      userPhoto: user['User_Photo'],
      designation: user['Designation'],
      loginTime: DateTime.now(),
    );
  }
}
