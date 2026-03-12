import 'package:isar/isar.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/plu.dart';
import '../models/customer_plu.dart';
import '../models/in_stock_plu.dart';
import 'auth_service.dart';
import 'signalr_service.dart';
import '../config/app_config.dart';

class PluService {
  final Isar _isar;
  final AuthService _authService = AuthService();
  final SignalRService _signalRService = SignalRService();
  
  // Track last sync time for In_Stock_PLU
  DateTime? _lastInStockPluSync;

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

  // Search PLUs by partial PLU number (local database)
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

  /// Search inventory by PLU number via server's In_Stock_Plu table
  /// Returns list of matching SKUs with inventory details
  /// Multiple PLUs can be assigned to 1 SKU, so this handles that case
  Future<List<Map<String, dynamic>>> searchByPluFromServer(String pluNo) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Searching In_Stock_Plu for PLU: $pluNo in company: $companyCode');
      print('🔍 PLU SERVICE: SignalR connected: ${_signalRService.isConnected}');
      
      // Try SignalR first if connected
      if (_signalRService.isConnected) {
        try {
          print('📡 PLU SERVICE: Using SignalR searchByPlu...');
          final response = await _signalRService.invoke('searchByPlu', [companyCode, pluNo]);
          print('🔍 PLU SERVICE: SignalR searchByPlu response type: ${response?.runtimeType}');
          print('🔍 PLU SERVICE: SignalR searchByPlu response: $response');
          
          if (response is List) {
            print('✅ PLU SERVICE: Found ${response.length} SKUs matching PLU $pluNo');
            final results = response.map((item) {
              if (item is Map) {
                return Map<String, dynamic>.from(item);
              }
              return <String, dynamic>{};
            }).where((m) => m.isNotEmpty).toList();
            print('✅ PLU SERVICE: Converted ${results.length} results');
            return results;
          } else if (response != null) {
            print('⚠️ PLU SERVICE: Unexpected response type: ${response.runtimeType}');
          }
        } catch (e) {
          print('⚠️ PLU SERVICE: SignalR searchByPlu failed: $e');
        }
      } else {
        print('⚠️ PLU SERVICE: SignalR not connected, skipping to HTTP fallback');
      }
      
      // HTTP Fallback - call REST API endpoint
      print('🌐 PLU SERVICE: Using HTTP fallback for searchByPlu...');
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/plu/search?companyCode=$companyCode&pluNo=${Uri.encodeComponent(pluNo)}');
      print('📡 PLU SERVICE: GET $url');
      
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('✅ PLU SERVICE: HTTP found ${data.length} SKUs matching PLU $pluNo');
        return data.cast<Map<String, dynamic>>();
      } else {
        print('❌ PLU SERVICE: HTTP error ${response.statusCode}: ${response.body}');
        return [];
      }
    } catch (e) {
      print('❌ PLU SERVICE: Error searching by PLU from server: $e');
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

  // ============== In_Stock_PLU Offline Sync Methods ==============

  /// Sync In_Stock_PLU data from server to local database
  Future<void> syncInStockPlu() async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔄 PLU SERVICE: Syncing In_Stock_PLU for company: $companyCode');
      
      // Try SignalR first
      if (_signalRService.isConnected) {
        try {
          print('📡 PLU SERVICE: Using SignalR getInStockPlu...');
          final response = await _signalRService.invoke('getInStockPlu', [companyCode]);
          
          if (response is List) {
            print('✅ PLU SERVICE: Received ${response.length} In_Stock_PLU records from server');
            await _saveInStockPluToLocal(response, companyCode);
            _lastInStockPluSync = DateTime.now();
            return;
          }
        } catch (e) {
          print('⚠️ PLU SERVICE: SignalR getInStockPlu failed: $e');
        }
      }
      
      // HTTP Fallback
      print('🌐 PLU SERVICE: Using HTTP fallback for getInStockPlu...');
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/in-stock-plu?companyCode=$companyCode');
      
      final response = await http.get(url).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print('✅ PLU SERVICE: HTTP received ${data.length} In_Stock_PLU records');
        await _saveInStockPluToLocal(data, companyCode);
        _lastInStockPluSync = DateTime.now();
      } else {
        print('❌ PLU SERVICE: HTTP error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('❌ PLU SERVICE: Error syncing In_Stock_PLU: $e');
    }
  }

  /// Save In_Stock_PLU records to local Isar database
  Future<void> _saveInStockPluToLocal(List<dynamic> records, int companyCode) async {
    try {
      final pluList = records.map((item) {
        final map = item is Map<String, dynamic> 
            ? item 
            : Map<String, dynamic>.from(item as Map);
        return InStockPlu.fromMap(map);
      }).where((plu) => plu.companyCode == companyCode).toList();

      print('🔄 PLU SERVICE: Saving ${pluList.length} In_Stock_PLU records to local database');

      await _isar.writeTxn(() async {
        // Delete existing records for this company
        await _isar.inStockPlus
            .where()
            .companyCodeEqualTo(companyCode)
            .deleteAll();
        
        // Save new records
        await _isar.inStockPlus.putAll(pluList);
      });

      print('✅ PLU SERVICE: Successfully saved ${pluList.length} In_Stock_PLU records');
    } catch (e) {
      print('❌ PLU SERVICE: Error saving In_Stock_PLU to local: $e');
    }
  }

  /// Search In_Stock_PLU by PLU number (offline - local database)
  /// Returns list of matching InStockPlu records (exact match only)
  Future<List<InStockPlu>> searchInStockPluOffline(String pluNo) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Searching offline In_Stock_PLU for exact match: $pluNo in company: $companyCode');
      
      // Exact match only - no partial/similar matches
      final results = await _isar.inStockPlus
          .where()
          .companyCodeEqualTo(companyCode)
          .filter()
          .pluNoEqualTo(pluNo)
          .findAll();
      
      print('✅ PLU SERVICE: Found ${results.length} exact matches for PLU: $pluNo');
      return results;
    } catch (e) {
      print('❌ PLU SERVICE: Error searching offline In_Stock_PLU: $e');
      return [];
    }
  }

  /// Get SKU number from PLU barcode (offline)
  /// Returns the SKU number if found, null otherwise
  Future<int?> getSkuFromPluOffline(String pluNo) async {
    try {
      final results = await searchInStockPluOffline(pluNo);
      if (results.isNotEmpty) {
        // Return the first match's SKU (prefer default PLU if available)
        final defaultPlu = results.where((p) => p.isDefault).firstOrNull;
        return defaultPlu?.skuNo ?? results.first.skuNo;
      }
      return null;
    } catch (e) {
      print('❌ PLU SERVICE: Error getting SKU from PLU offline: $e');
      return null;
    }
  }

  /// Search Customer_PLU by PLU number for a specific customer (offline - local database)
  /// Returns list of matching CustomerPlu records (exact match only)
  Future<List<CustomerPlu>> searchCustomerPluOffline(String pluNo, String customerCode) async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      print('🔍 PLU SERVICE: Searching offline Customer_PLU for exact match: $pluNo, customer: $customerCode in company: $companyCode');
      
      // Exact match only - no partial/similar matches
      final results = await _isar.customerPlus
          .where()
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .customerCodeEqualTo(customerCode)
          .and()
          .pluNoEqualTo(pluNo)
          .findAll();
      
      print('✅ PLU SERVICE: Found ${results.length} exact matches for Customer PLU: $pluNo');
      return results;
    } catch (e) {
      print('❌ PLU SERVICE: Error searching offline Customer_PLU: $e');
      return [];
    }
  }

  /// Get SKU number from Customer PLU barcode (offline)
  /// Returns the SKU number if found, null otherwise
  Future<int?> getSkuFromCustomerPluOffline(String pluNo, String customerCode) async {
    try {
      final results = await searchCustomerPluOffline(pluNo, customerCode);
      if (results.isNotEmpty) {
        return results.first.skuNo;
      }
      return null;
    } catch (e) {
      print('❌ PLU SERVICE: Error getting SKU from Customer PLU offline: $e');
      return null;
    }
  }

  /// Get count of In_Stock_PLU records in local database
  Future<int> getInStockPluCount() async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      return await _isar.inStockPlus
          .where()
          .companyCodeEqualTo(companyCode)
          .count();
    } catch (e) {
      print('❌ PLU SERVICE: Error getting In_Stock_PLU count: $e');
      return 0;
    }
  }

  /// Check if In_Stock_PLU sync is needed
  bool needsInStockPluSync() {
    if (_lastInStockPluSync == null) return true;
    // Re-sync if last sync was more than 1 hour ago
    return DateTime.now().difference(_lastInStockPluSync!).inHours >= 1;
  }

  /// OPTIMIZED: Sync ALL customer PLU records for a company in one go
  /// Instead of fetching customer-by-customer, fetch entire AR_Customer_Item table
  Future<void> syncAllCustomerPlu({required int companyCode}) async {
    try {
      print('🏷️ PLU SERVICE: Syncing ALL customer PLU for company $companyCode...');
      
      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        try {
          await _signalRService.connect().timeout(const Duration(seconds: 5));
        } catch (e) {
          print('📱 PLU SERVICE: Cannot connect SignalR, skipping full customer PLU sync');
          return;
        }
      }

      int totalSynced = 0;
      int offset = 0;
      const int batchSize = 5000;
      
      while (true) {
        print('🏷️ PLU SERVICE: Fetching customer PLU batch at offset $offset...');
        
        dynamic response;
        try {
          response = await _signalRService.invoke('getAllCustomerPlu', [
            companyCode,
            batchSize,
            offset,
          ]).timeout(const Duration(seconds: 30));
        } catch (e) {
          print('❌ PLU SERVICE: getAllCustomerPlu failed at offset $offset: $e');
          break;
        }

        if (response is! List || response.isEmpty) {
          print('🏷️ PLU SERVICE: No more customer PLU records at offset $offset');
          break;
        }

        print('🏷️ PLU SERVICE: Received ${response.length} customer PLU records');

        // Convert and save to local database
        final records = response
            .cast<Map<String, dynamic>>()
            .map((m) => CustomerPlu.fromMap(m))
            .where((cp) => cp.companyCode == companyCode && cp.customerCode.isNotEmpty)
            .toList();

        if (records.isNotEmpty) {
          // Batch upsert to local database
          await _isar.writeTxn(() async {
            final col = _isar.collection<CustomerPlu>();
            // Use putAll for efficiency - Isar handles upsert by id
            for (int i = 0; i < records.length; i += 500) {
              final batch = records.skip(i).take(500).toList();
              for (final r in batch) {
                // Find existing record to preserve ID
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
              }
              await col.putAll(batch);
            }
          });
          totalSynced += records.length;
          print('🏷️ PLU SERVICE: Saved ${records.length} customer PLU records (total: $totalSynced)');
        }

        // Check if we got less than batch size (last page)
        if (response.length < batchSize) {
          break;
        }

        offset += batchSize;
        
        // Small delay to avoid overwhelming the server
        await Future.delayed(const Duration(milliseconds: 100));
      }

      print('✅ PLU SERVICE: Completed full customer PLU sync - total: $totalSynced records');
    } catch (e) {
      print('❌ PLU SERVICE: Error in syncAllCustomerPlu: $e');
    }
  }

  /// Clear all In_Stock_PLU records for current company
  Future<void> clearInStockPlu() async {
    try {
      final companyCode = await _getCurrentCompanyCode();
      await _isar.writeTxn(() async {
        await _isar.inStockPlus
            .where()
            .companyCodeEqualTo(companyCode)
            .deleteAll();
      });
      print('✅ PLU SERVICE: Cleared In_Stock_PLU for company $companyCode');
    } catch (e) {
      print('❌ PLU SERVICE: Error clearing In_Stock_PLU: $e');
    }
  }
}
