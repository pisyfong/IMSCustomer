import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../current_login.dart';
import '../selected_company.dart';
import '../main.dart'; // For the global Isar instance

class AuthService {
  static const String baseUrl = 'http://plusintralinkapps.dyndns.org:1194/api';
  
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();
  
  // Store the current user
  User? _currentUser;
  User? get currentUser => _currentUser;
  
  // Login method
  Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      
      final data = jsonDecode(response.body);
      
      if (response.statusCode == 200 && data['success'] == true) {
        _currentUser = User.fromJson(data['user']);
        
        // Save login to Isar database
        await _saveCurrentLogin(data['user']);
        
        return _currentUser;
      } else {
        // Login failed
        final message = data['message'] ?? 'Login failed';
        throw Exception(message);
      }
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
  
  // Save current login to Isar
  Future<void> _saveCurrentLogin(Map<String, dynamic> userData) async {
    try {
      final currentLogin = CurrentLogin.fromUser(userData);
      
      // Use direct collection access method
      await isar.writeTxn(() async {
        await isar.collection<CurrentLogin>().put(currentLogin);
      });
    } catch (e) {
      print('Error saving login: $e');
    }
  }
  
  // Logout method
  Future<void> logout() async {
    _currentUser = null;
    
    // Clear current login from Isar
    try {
      await isar.writeTxn(() async {
        await isar.collection<CurrentLogin>().clear();
      });
    } catch (e) {
      print('Error clearing login: $e');
    }
  }
  
  // Check if user is logged in
  bool isLoggedIn() {
    return _currentUser != null;
  }
  
  // Check if there's a saved login in Isar
  Future<bool> hasSavedLogin() async {
    try {
      final savedLogin = await isar.collection<CurrentLogin>().get(CurrentLogin.singletonId);
      return savedLogin != null;
    } catch (e) {
      print('Error checking saved login: $e');
      return false;
    }
  }
  
  // Load saved login from Isar
  Future<User?> loadSavedLogin() async {
    try {
      final savedLogin = await isar.collection<CurrentLogin>().get(CurrentLogin.singletonId);
      
      if (savedLogin != null) {
        _currentUser = User(
          userId: savedLogin.userId,
          loginName: savedLogin.username,
          fullName: savedLogin.fullName,
          status: 'A', // Assuming active
          designation: savedLogin.designation,
          email: savedLogin.email,
          userPhoto: savedLogin.userPhoto,
        );
        return _currentUser;
      }
    } catch (e) {
      print('Error loading saved login: $e');
    }
    
    return null;
  }

  // Save selected company to Isar
  Future<void> saveSelectedCompany(Map<String, dynamic> company) async {
    try {
      final selectedCompany = SelectedCompany.fromCompany(company);
      
      await isar.writeTxn(() async {
        await isar.collection<SelectedCompany>().put(selectedCompany);
      });
    } catch (e) {
      print('Error saving selected company: $e');
    }
  }
  
  // Get selected company from Isar
  Future<Map<String, dynamic>?> getSelectedCompany() async {
    try {
      final selectedCompany = await isar.collection<SelectedCompany>().get(SelectedCompany.singletonId);
      
      if (selectedCompany != null) {
        return {
          'companyId': selectedCompany.companyId,
          'companyName': selectedCompany.companyName,
          'companyCode': selectedCompany.companyCode,
          'selectedAt': selectedCompany.selectedAt,
        };
      }
    } catch (e) {
      print('Error getting selected company: $e');
    }
    
    return null;
  }
  
  // Clear selected company from Isar
  Future<void> clearSelectedCompany() async {
    try {
      await isar.writeTxn(() async {
        await isar.collection<SelectedCompany>().clear();
      });
    } catch (e) {
      print('Error clearing selected company: $e');
    }
  }
}
