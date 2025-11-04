import 'package:isar/isar.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/plu.dart';
import '../models/customer_plu.dart';
import 'auth_service.dart';
import 'signalr_service.dart';
import '../config/app_config.dart';

class PluService {
  final Isar _isar;
  final AuthService _authService = AuthService();
  final SignalRService _signalRService = SignalRService();

  PluService(this._isar);

  // Get PLU by PLU number
  Future<Plu?> getPlu(String pluNo) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Searching for PLU: $pluNo in company: $companyCode');
      
      // Check total PLU count first
      final totalCount = await _isar.plus.where().companyCodeEqualTo(companyCode).count();
      print('🔍 PLU SERVICE: Total PLUs in database for company $companyCode: $totalCount');
      
      // Try exact match
      final result = await _isar.plus
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .pluNoEqualTo(pluNo)
          .findFirst();
      
      print('🔍 PLU SERVICE: Exact match result: $result');
      
      if (result == null) {
        // Try partial match for debugging
        final partialResults = await _isar.plus
            .where()
            .companyCodeEqualTo(companyCode)
            .filter()
            .pluNoContains(pluNo.substring(0, math.min(5, pluNo.length)))
            .findAll();
        print('🔍 PLU SERVICE: Partial matches found: ${partialResults.length}');
        for (final plu in partialResults.take(5)) {
          print('🔍 PLU SERVICE: - PLU: ${plu.pluNo}, SKU: ${plu.skuNo}');
        }
      }
      
      return result;
    } catch (e) {
      print('❌ PLU SERVICE: Error getting PLU: $e');
      return null;
    }
  }

  // Search PLUs by partial PLU number
  Future<List<Plu>> searchPlus(String query) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      return await _isar.plus
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .pluNoContains(query, caseSensitive: false)
          .findAll();
    } catch (e) {
      print('Error searching PLUS: $e');
      return [];
    }
  }

  // Get default PLU for an SKU
  Future<Plu?> getDefaultPluForSku(int skuNo) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      return await _isar.plus
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .skuNoEqualTo(skuNo)
          .and()
          .isDefaultEqualTo(true)
          .findFirst();
    } catch (e) {
      print('Error getting default PLU for SKU: $e');
      return null;
    }
  }

  // Get all PLUs for an SKU
  Future<List<Plu>> getPlusForSku(int skuNo) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      return await _isar.plus
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .skuNoEqualTo(skuNo)
          .findAll();
    } catch (e) {
      print('Error getting PLUs for SKU: $e');
      return [];
    }
  }

  // Fetch PLUs from server via SignalR or HTTP fallback
  Future<List<Map<String, dynamic>>> fetchPlusFromServer() async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Fetching PLUs from server for company: $companyCode');
      
      // Try SignalR first if connected
      if (_signalRService.isConnected) {
        try {
          print('📡 PLU SERVICE: Using SignalR...');
          final response = await _signalRService.invoke('getPlu', [companyCode]);
          print('🔍 PLU SERVICE: SignalR response: ${response?.runtimeType}');
          
          if (response is List) {
            print('✅ PLU SERVICE: Received ${response.length} PLUs from SignalR');
            return response.cast<Map<String, dynamic>>();
          }
        } catch (e) {
          print('⚠️ PLU SERVICE: SignalR failed, trying HTTP fallback: $e');
        }
      }
      
      // HTTP Fallback
      print('🌐 PLU SERVICE: Using HTTP fallback...');
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/plu?companyCode=$companyCode');
      print('📡 PLU SERVICE: GET $url');
      
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('✅ PLU SERVICE: Received ${data.length} PLUs from HTTP');
        return data.cast<Map<String, dynamic>>();
      } else {
        print('❌ PLU SERVICE: HTTP error ${response.statusCode}: ${response.body}');
        return [];
      }
    } catch (e) {
      print('❌ PLU SERVICE: Error fetching PLUs from server: $e');
      return [];
    }
  }

  // Sync PLUs from server
  Future<void> syncPlus([List<Map<String, dynamic>>? plus]) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Starting PLU sync for company: $companyCode');
      
      // If no PLUs provided, fetch from server (will try SignalR then HTTP)
      final plusData = plus ?? await fetchPlusFromServer();
      
      if (plusData.isEmpty) {
        print('⚠️ PLU SERVICE: No PLU data to sync - this is OK if company has no PLU records');
        // Don't throw - just return. Empty PLU is valid.
        return;
      }
      
      final plusList = plusData
          .map((e) => Plu.fromMap(e))
          .where((plu) => plu.companyCode == companyCode)
          .toList();

      print('🔍 PLU SERVICE: Converting ${plusData.length} PLUs, ${plusList.length} for company $companyCode');

      if (plusList.isEmpty) {
        print('⚠️ PLU SERVICE: No PLUs for company $companyCode after filtering');
        return;
      }

      await _isar.writeTxn(() async {
        // Delete existing PLUS for this company
        await _isar.plus
            .where()
            .companyCodeEqualTo(companyCode)
            .deleteAll();
        
        // Save new PLUS
        await _isar.plus.putAll(plusList);
      });
      
      print('✅ PLU SERVICE: Successfully synced ${plusList.length} PLUs');
    } catch (e) {
      print('❌ PLU SERVICE: Error syncing PLUs: $e');
      // Don't rethrow - PLU sync failure should not stop other syncs
      print('⚠️ PLU SERVICE: Continuing despite PLU sync error...');
    }
  }

  /// Fetch and cache customer-specific PLU mappings for a set of SKUs
  Future<void> syncCustomerPlusForCustomer({
    required int companyCode,
    required String customerCode,
    required List<int> skuNos,
  }) async {
    try {
      if (skuNos.isEmpty) return;
      
      dynamic response;
      
      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        try {
          await _signalRService.connect().timeout(const Duration(seconds: 3));
        } catch (e) {
          print('📱 PLU SERVICE: Cannot connect SignalR, skipping customer PLU for $customerCode');
          return;
        }
      }
      
      // Try SignalR with timeout
      try {
        response = await _signalRService.invoke('getCustomerPlu', [
          companyCode,
          customerCode,
          skuNos,
        ]).timeout(const Duration(seconds: 10));
      } catch (e) {
        print('⚠️ PLU SERVICE: SignalR invoke failed for customer PLU $customerCode: $e');
        return; // Skip HTTP fallback for customer PLU as it's optional data
      }

      if (response is! List) {
        print('⚠️ PLU SERVICE: Invalid response type for customer PLU $customerCode: ${response.runtimeType}');
        return;
      }

      final records = response
          .cast<Map<String, dynamic>>()
          .map((m) => CustomerPlu.fromMap(m))
          .where((cp) => cp.companyCode == companyCode && cp.customerCode.isNotEmpty)
          .toList();

      if (records.isEmpty) return;

      await _isar.writeTxn(() async {
        final col = _isar.collection<CustomerPlu>();
        // Upsert by (company, customer, sku)
        for (final r in records) {
          final existing = await col
              .where()
              .filter()
              .companyCodeEqualTo(r.companyCode)
              .and()
              .customerCodeEqualTo(r.customerCode)
              .and()
              .skuNoEqualTo(r.skuNo)
              .findFirst();
          if (existing != null) {
            r.id = existing.id;
          }
          await col.put(r);
        }
      });
    } catch (e) {
      print('❌ PLU SERVICE: Error syncing customer PLU for $customerCode: $e');
    }
  }

  /// Lookup cached customer PLU for a given SKU
  Future<CustomerPlu?> getCachedCustomerPlu({
    required int companyCode,
    required String customerCode,
    required int skuNo,
  }) async {
    try {
      final col = _isar.collection<CustomerPlu>();
      return await col
          .where()
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .customerCodeEqualTo(customerCode)
          .and()
          .skuNoEqualTo(skuNo)
          .findFirst();
    } catch (e) {
      return null;
    }
  }

  /// Lookup cached customer PLU by barcode/PLU number
  Future<CustomerPlu?> getCachedCustomerPluByBarcode({
    required int companyCode,
    required String customerCode,
    required String pluNo,
  }) async {
    try {
      final col = _isar.collection<CustomerPlu>();
      return await col
          .where()
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .customerCodeEqualTo(customerCode)
          .and()
          .pluNoEqualTo(pluNo)
          .findFirst();
    } catch (e) {
      print('❌ PLU SERVICE: Error looking up customer PLU by barcode: $e');
      return null;
    }
  }

  Future<int> _getCurrentCompanyCode() async {
    final company = await _authService.getSelectedCompany();
    if (company == null || company['companyCode'] == null) {
      print('⚠️ PLU SERVICE: No company selected, using default company code 1');
      return 1; // Default to company code 1
    }
    return company['companyCode'] is int 
        ? company['companyCode'] as int 
        : int.tryParse(company['companyCode'].toString()) ?? 1;
  }
}
