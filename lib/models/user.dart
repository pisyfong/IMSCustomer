class User {
  final int userId;
  final String? userPhoto;
  final String loginName;
  final String fullName;
  final String status;
  final String? accessLevel;
  final String designation;
  final String email;
  final String? phoneNo;
  final int? roleId; // Added for role-based customer access control

  User({
    required this.userId,
    this.userPhoto,
    required this.loginName,
    required this.fullName,
    required this.status,
    this.accessLevel,
    required this.designation,
    required this.email,
    this.phoneNo,
    this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Helper to safely convert values to String
    String? toStringOrNull(dynamic value) {
      if (value == null) return null;
      if (value is String) return value;
      return value.toString();
    }
    
    // Helper to safely convert values to int
    int? toIntOrNull(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    }
    
    return User(
      userId: json['User_ID'] as int,
      userPhoto: toStringOrNull(json['User_Photo']),
      loginName: json['Login_Name'] as String,
      fullName: json['Full_Name'] as String,
      status: json['Status'] as String,
      accessLevel: toStringOrNull(json['Access_Level']),
      designation: json['Designation'] as String,
      email: json['Email'] as String,
      phoneNo: toStringOrNull(json['Phone_No']),
      roleId: toIntOrNull(json['Role_ID']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'User_ID': userId,
      'User_Photo': userPhoto,
      'Login_Name': loginName,
      'Full_Name': fullName,
      'Status': status,
      'Access_Level': accessLevel,
      'Designation': designation,
      'Email': email,
      'Phone_No': phoneNo,
      'Role_ID': roleId,
    };
  }
}
