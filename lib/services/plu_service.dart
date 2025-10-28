import 'package:isar/isar.dart';
import 'dart:math' as math;
import '../models/plu.dart';
import '../models/customer_plu.dart';
import 'auth_service.dart';
import 'signalr_service.dart';

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

  // Fetch PLUs from server via SignalR
  Future<List<Map<String, dynamic>>> fetchPlusFromServer() async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Fetching PLUs from server for company: $companyCode');
      
      // Call server method to get PLUs
      final response = await _signalRService.invoke('getPlu', [companyCode]);
      print('🔍 PLU SERVICE: Server response: ${response?.runtimeType}');
      
      if (response is List) {
        print('🔍 PLU SERVICE: Received ${response.length} PLUs from server');
        return response.cast<Map<String, dynamic>>();
      } else {
        print('❌ PLU SERVICE: Unexpected response type: ${response?.runtimeType}');
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
      
      // If no PLUs provided, fetch from server
      final plusData = plus ?? await fetchPlusFromServer();
      
      if (plusData.isEmpty) {
        print('⚠️ PLU SERVICE: No PLU data to sync');
        return;
      }
      
      final plusList = plusData
          .map((e) => Plu.fromMap(e))
          .where((plu) => plu.companyCode == companyCode)
          .toList();

      print('🔍 PLU SERVICE: Converting ${plusData.length} PLUs, ${plusList.length} for company $companyCode');

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
      rethrow;
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
      
      // Try SignalR first if connected
      if (_signalRService.isConnected) {
        try {
          response = await _signalRService.invoke('getCustomerPlu', [
            companyCode,
            customerCode,
            skuNos,
          ]);
        } catch (e) {
          print('⚠️ PLU SERVICE: SignalR failed for customer PLU, skipping for $customerCode');
          return; // Skip HTTP fallback for customer PLU as it's optional data
        }
      } else {
        print('📱 PLU SERVICE: SignalR not connected, skipping customer PLU for $customerCode');
        return; // Skip when offline - customer PLU is optional
      }

      if (response is! List) return;

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
