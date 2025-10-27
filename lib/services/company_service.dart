import 'dart:convert';
import 'dart:async';
import 'signalr_service.dart';

class CompanyService {
  // Singleton pattern
  static final CompanyService _instance = CompanyService._internal();
  factory CompanyService() => _instance;
  CompanyService._internal();
  
  /// Get companies for a specific user via SignalR
  Future<List<Map<String, dynamic>>?> getCompaniesForUser(int userId) async {
    try {
      print('CompanyService: Getting companies for user via SignalR: $userId');
      
      // Get SignalR service instance
      final signalRService = SignalRService();
      
      // Ensure connection (with timeout)
      try {
        await signalRService.connect().timeout(
          const Duration(seconds: 3),
          onTimeout: () {
            throw TimeoutException('Connection timeout');
          },
        );
      } catch (e) {
        print('⚠️ Company service: SignalR connection failed - $e');
        throw Exception('Unable to connect to server');
      }
      
      // Call getCompany via SignalR
      final result = await signalRService.getCompany(userId);
      
      print('CompanyService: SignalR result: $result');
      
      if (result != null) {
        return result; // getCompany already returns List<Map<String, dynamic>>?
      } else {
        print('CompanyService: No company access found for user');
        return [];
      }
    } catch (e) {
      print('CompanyService: Error fetching companies - $e');
      throw Exception('Failed to fetch companies: ${e.toString()}');
    }
  }
}
