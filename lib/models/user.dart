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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['User_ID'],
      userPhoto: json['User_Photo'],
      loginName: json['Login_Name'],
      fullName: json['Full_Name'],
      status: json['Status'],
      accessLevel: json['Access_Level'],
      designation: json['Designation'],
      email: json['Email'],
      phoneNo: json['Phone_No'],
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
    };
  }
}
