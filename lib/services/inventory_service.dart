import 'package:isar/isar.dart';
import '../models/inventory_item.dart';
import '../models/in_stock_uom.dart';
import '../models/group_lookup.dart';
import '../models/department_lookup.dart';
import '../main.dart';
import 'signalr_service.dart';
import 'auth_service.dart';
import 'offline_first_service.dart';

enum StockStatus { inStock, outOfStock, lowStock, all }

class InventoryFilter {
  StockStatus? stockStatus;
  List<String>? categories;
  List<String>? brands;
  List<String>? departments;
  List<String>? subDepartments;
  List<String>? groups;
  List<String>? itemStatus;
  double? minPrice;
  double? maxPrice;
  
  // Clear all filters
  void clear() {
    stockStatus = null;
    categories = null;
    brands = null;
    departments = null;
    subDepartments = null;
    groups = null;
    itemStatus = null;
    minPrice = null;
    maxPrice = null;
  }
  
  // Check if any filters are active
  bool get hasActiveFilters {
    return stockStatus != null ||
           (categories?.isNotEmpty ?? false) ||
           (brands?.isNotEmpty ?? false) ||
           (departments?.isNotEmpty ?? false) ||
           (subDepartments?.isNotEmpty ?? false) ||
           (groups?.isNotEmpty ?? false) ||
           (itemStatus?.isNotEmpty ?? false) ||
           minPrice != null ||
           maxPrice != null;
  }
}

class InventoryService {
  static final InventoryService _instance = InventoryService._internal();
  factory InventoryService() => _instance;
  InventoryService._internal();

  final SignalRService _signalRService = SignalRService();
  final AuthService _authService = AuthService();
  // Tracks which companies have completed a full catalog sync this app session
  final Set<int> _fullSyncedCompanies = <int>{};
  
  // In-memory cache: companyCode -> { deptCode: description }
  final Map<int, Map<String, String>> _deptDescriptionCache = {};
  // In-memory cache: companyCode -> { grp: description }
  final Map<int, Map<String, String>> _groupDescriptionCache = {};

  // Fetch inventory items from server via SignalR
  Future<List<InventoryItem>> fetchInventoryFromServer({
    int? companyCode,
    String? searchQuery,
    int limit = 100,
    int offset = 0,
  }) async {
    try {
      print('🔍 INVENTORY SERVICE: Fetching inventory from server...');
      
      // Get user info for company context
      final user = await _authService.loadSavedLogin();
      final selectedCompany = await _authService.getSelectedCompany();
      
      if (user == null) {
        throw Exception('User not logged in');
      }

      final effectiveCompanyCode = companyCode ?? selectedCompany?['companyCode'] ?? 0;
      
      print('🔍 INVENTORY SERVICE: Using company code: $effectiveCompanyCode');
      print('🔍 INVENTORY SERVICE: Search query: $searchQuery');
      print('🔍 INVENTORY SERVICE: Limit: $limit, Offset: $offset');

      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        print('🔍 INVENTORY SERVICE: SignalR not connected, attempting to connect...');
        await _signalRService.connect();
      }

      if (!_signalRService.isConnected) {
        throw Exception('Unable to establish SignalR connection');
      }

      // Call server method to get inventory (with timeout)
      final response = await _signalRService.invoke('getInventory', [
        user.userId,
        effectiveCompanyCode,
        searchQuery ?? '',
        limit,
        offset,
      ]).timeout(const Duration(seconds: 15), onTimeout: () {
        print('⏰ INVENTORY SERVICE: Inventory fetch request timed out');
        return null;
      });

      print('🔍 INVENTORY SERVICE: Server response received');
      
      if (response == null) {
        print('🔍 INVENTORY SERVICE: No data received from server');
        return [];
      }

      List<dynamic> inventoryData;
      if (response is List) {
        inventoryData = response;
      } else if (response is Map && response.containsKey('data')) {
        inventoryData = response['data'] as List? ?? [];
      } else {
        print('🔍 INVENTORY SERVICE: Unexpected response format: ${response.runtimeType}');
        return [];
      }

      print('🔍 INVENTORY SERVICE: Converting ${inventoryData.length} items...');

      // Convert server response to InventoryItem objects
      final List<InventoryItem> inventoryItems = [];
      final List<dynamic> responseList = inventoryData; // Use normalized data list
      
      for (int i = 0; i < responseList.length; i++) {
        try {
          final raw = responseList[i];
          final Map<String, dynamic> itemData = raw is Map<String, dynamic>
              ? raw
              : Map<String, dynamic>.from(raw as Map);
          final item = InventoryItem.fromJson(itemData);
          
          // Debug logging for SKU 8 specifically
          if (item.skuNo == 8) {
            print('🔍 SERVER DATA DEBUG - SKU 8: Received UOM "${itemData['Uom']}" from server');
            print('🔍 SERVER DATA DEBUG - SKU 8: Full item data: $itemData');
            print('🔍 SERVER DATA DEBUG - SKU 8: Parsed item.uom = "${item.uom}"');
          }
          
          inventoryItems.add(item);
        } catch (e, stackTrace) {
          print('❌ ERROR converting inventory item $i: $e');
          print('📋 Item data: ${responseList[i]}');
          print('📍 Stack trace: $stackTrace');
          // Continue processing other items instead of failing completely
        }
      }

      print('🔍 INVENTORY SERVICE: Successfully converted ${inventoryItems.length} inventory items');
      return inventoryItems;

    } catch (e) {
      print('❌ INVENTORY SERVICE ERROR: $e');
      rethrow;
    }
  }

  /// Fetch ALL inventory from server by paging through until completion.
  Future<List<InventoryItem>> fetchAllInventoryFromServer({
    int? companyCode,
    String? searchQuery,
    int pageSize = 1000,
  }) async {
    final List<InventoryItem> all = [];
    int offset = 0;
    while (true) {
      final page = await fetchInventoryFromServer(
        companyCode: companyCode,
        searchQuery: searchQuery,
        limit: pageSize,
        offset: offset,
      );
      if (page.isEmpty) break;
      all.addAll(page);
      if (page.length < pageSize) break;
      offset += pageSize;
    }
    print('🔍 INVENTORY SERVICE: Fetched ALL inventory from server: ${all.length} items');
    return all;
  }

  /// Fetch all UOM pricing options for a specific SKU
  Future<List<InStockUom>> getUomPricing({
    required int companyCode,
    required int skuNo,
    bool forceRefresh = false,
  }) async {
    try {
      print('🔍 INVENTORY SERVICE: Getting UOM pricing for SKU $skuNo...');

      // Check local cache first (unless forcing refresh)
      if (!forceRefresh) {
        final cached = await getLocalUomPricing(companyCode: companyCode, skuNo: skuNo);
        if (cached.isNotEmpty) {
          print('📱 INVENTORY SERVICE: Found ${cached.length} cached UOM options for SKU $skuNo');
          return cached;
        }
      }

      // Fetch from server if online
      if (!_signalRService.isConnected) {
        try { await _signalRService.connect(); } catch (_) {}
      }

      if (!_signalRService.isConnected) {
        print('📱 INVENTORY SERVICE: Offline - returning cached UOM data');
        return await getLocalUomPricing(companyCode: companyCode, skuNo: skuNo);
      }

      // Call server method to get all UOM options for this SKU (with timeout)
      final response = await _signalRService.invoke('getInStockUom', [companyCode, skuNo])
          .timeout(const Duration(seconds: 10), onTimeout: () {
        print('⏰ INVENTORY SERVICE: UOM pricing request timed out for SKU $skuNo');
        return null;
      });

      if (response == null) {
        print('⚠️ INVENTORY SERVICE: No UOM data received from server');
        return await getLocalUomPricing(companyCode: companyCode, skuNo: skuNo);
      }

      List<dynamic> uomData;
      if (response is List) {
        uomData = response;
      } else {
        print('⚠️ INVENTORY SERVICE: Unexpected UOM response format: $response');
        return await getLocalUomPricing(companyCode: companyCode, skuNo: skuNo);
      }

      // Debug: Log raw server response for SKU 555 to see field names
      if (skuNo == 555 && uomData.isNotEmpty) {
        print('🔍 INVENTORY SERVICE SKU 555: Raw server response:');
        for (int i = 0; i < uomData.length && i < 3; i++) {
          final record = uomData[i];
          print('🔍 INVENTORY SERVICE SKU 555: Record $i: $record');
        }
      }

      final uomOptions = uomData.map((data) => InStockUom.fromJson(data as Map<String, dynamic>)).toList();
      
      // Cache the results
      await saveUomPricingToLocal(uomOptions);
      
      print('✅ INVENTORY SERVICE: Fetched ${uomOptions.length} UOM options for SKU $skuNo');
      return uomOptions;
    } catch (e) {
      print('❌ INVENTORY SERVICE UOM ERROR: $e');
      // Fallback to local cache on error
      return await getLocalUomPricing(companyCode: companyCode, skuNo: skuNo);
    }
  }

  /// Get UOM pricing from local database
  Future<List<InStockUom>> getLocalUomPricing({
    required int companyCode,
    required int skuNo,
  }) async {
    try {
      final uomOptions = await isar.inStockUoms
          .filter()
          .companyCodeEqualTo(companyCode)
          .skuNoEqualTo(skuNo)
          .statusEqualTo('A') // Only get active UOMs (status A)
          .findAll();
      
      print('📦 INVENTORY SERVICE: Found ${uomOptions.length} active UOMs for SKU $skuNo (filtered out status C)');
      
      // Keep UOM options in their natural order (no sorting by lowest factor)
      
      return uomOptions;
    } catch (e) {
      print('❌ INVENTORY SERVICE: Error getting local UOM data: $e');
      return [];
    }
  }

  /// Save UOM pricing to local database
  Future<void> saveUomPricingToLocal(List<InStockUom> uomOptions) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing UOM data for this SKU to avoid duplicates
        if (uomOptions.isNotEmpty) {
          final companyCode = uomOptions.first.companyCode;
          final skuNo = uomOptions.first.skuNo;
          
          final existingIds = await isar.inStockUoms
              .filter()
              .companyCodeEqualTo(companyCode)
              .skuNoEqualTo(skuNo)
              .idProperty()
              .findAll();
          
          if (existingIds.isNotEmpty) {
            await isar.inStockUoms.deleteAll(existingIds);
          }
        }
        
        // Save new UOM options
        await isar.inStockUoms.putAll(uomOptions);
      });
      print('💾 INVENTORY SERVICE: Saved ${uomOptions.length} UOM options to local database');
    } catch (e) {
      print('❌ INVENTORY SERVICE: Error saving UOM data: $e');
    }
  }

  /// Get group (GRP) code -> description map for a company (OFFLINE-FIRST).
  /// Tries local database first, then syncs from server if online.
  Future<Map<String, String>> getGroupMap({int? companyCode}) async {
    try {
      // Resolve effective company code
      final selectedCompany = await _authService.getSelectedCompany();
      final int effectiveCompanyCode;
      final raw = companyCode ?? selectedCompany?['companyCode'];
      if (raw is String) {
        effectiveCompanyCode = int.tryParse(raw) ?? 0;
      } else if (raw is int) {
        effectiveCompanyCode = raw;
      } else {
        effectiveCompanyCode = 0;
      }

      // Serve from in-memory cache if present
      final cached = _groupDescriptionCache[effectiveCompanyCode];
      if (cached != null && cached.isNotEmpty) return cached;

      // OFFLINE-FIRST: Load from local database first
      final map = <String, String>{};
      try {
        final localGroups = await isar.groupLookups
            .filter()
            .companyCodeEqualTo(effectiveCompanyCode)
            .findAll();
        
        for (final group in localGroups) {
          if (group.grp.isNotEmpty && group.description.isNotEmpty) {
            final k1 = group.grp;
            final k2 = group.grp.trim();
            final k3 = k2.toUpperCase();
            map[k1] = group.description;
            map[k2] = group.description;
            map[k3] = group.description;
          }
        }
        
        if (map.isNotEmpty) {
          print('📱 InventoryService.getGroupMap: Loaded ${map.length} groups from local database');
          _groupDescriptionCache[effectiveCompanyCode] = map;
          
          // Try to sync from server in background (non-blocking)
          _syncGroupsInBackground(effectiveCompanyCode);
          
          return map;
        }
      } catch (e) {
        print('❌ InventoryService.getGroupMap: Error loading from local: $e');
      }

      // No local data, try server if online
      if (!await OfflineFirstService.isServerReachable()) {
        print('📱 InventoryService.getGroupMap: Offline and no local data');
        return {};
      }

      // Ensure SignalR connection (best-effort)
      if (!_signalRService.isConnected) {
        try { await _signalRService.connect(); } catch (_) {}
      }

      if (!_signalRService.isConnected) {
        print('📱 InventoryService.getGroupMap: Cannot connect to server');
        return {};
      }

      dynamic result;
      // Try a few likely hub method names to maximize compatibility
      // Target SQL: SELECT DISTINCT company_code, grp, description FROM RMS.dbo.PI_Group
      final List<String> methodCandidates = [
        'getGroupLookup',
        'getGroups',
        'GetGroups',
        'getPiGroups',
        'GetPI_Group',
      ];
      // First, try with company code argument
      for (final method in methodCandidates) {
        try {
          result = await _signalRService.invoke(method, [effectiveCompanyCode]);
          if (result != null) {
            print('🟦 InventoryService.getGroupMap: Received result from "$method" with companyCode');
            break;
          }
        } catch (e) {
          // try next candidate
        }
      }
      // If still null, try without arguments
      if (result == null) {
        for (final method in methodCandidates) {
          try {
            result = await _signalRService.invoke(method, []);
            if (result != null) {
              print('🟦 InventoryService.getGroupMap: Received result from "$method" without args');
              break;
            }
          } catch (e) {
            // try next candidate
          }
        }
      }

      final serverMap = <String, String>{};
      if (result is List) {
        // Expect list of objects with fields like {'grp': 'XX', 'description': '...'}
        for (final row in result) {
          try {
            if (row is Map) {
              final code = (
                row['grp'] ?? row['Grp'] ?? row['GRP'] ??
                row['group'] ?? row['Group'] ?? row['GROUP'] ??
                row['code'] ?? row['Code']
              )?.toString();
              final desc = (
                row['description'] ?? row['Description'] ?? row['DESCRIPTION'] ??
                row['groupDesc'] ?? row['GroupDesc'] ?? row['GROUP_DESC'] ??
                row['desc'] ?? row['Desc']
              )?.toString();
              if (code != null && code.isNotEmpty && desc != null && desc.isNotEmpty) {
                final k1 = code;
                final k2 = code.trim();
                final k3 = k2.toUpperCase();
                serverMap[k1] = desc;
                serverMap[k2] = desc;
                serverMap[k3] = desc;
              }
            }
          } catch (_) {}
        }
      } else if (result is Map) {
        // Could be a direct map of code->description
        result.forEach((k, v) {
          final code = k?.toString();
          final desc = v?.toString();
          if (code != null && code.isNotEmpty && desc != null && desc.isNotEmpty) {
            final k1 = code;
            final k2 = code.trim();
            final k3 = k2.toUpperCase();
            serverMap[k1] = desc;
            serverMap[k2] = desc;
            serverMap[k3] = desc;
          }
        });
      }

      // Save to local database for offline use
      if (serverMap.isNotEmpty && result is List) {
        try {
          await isar.writeTxn(() async {
            // Clear old groups for this company
            await isar.groupLookups
                .filter()
                .companyCodeEqualTo(effectiveCompanyCode)
                .deleteAll();
            
            // Save new groups
            final groups = <GroupLookup>[];
            for (final row in result) {
              if (row is Map<String, dynamic>) {
                try {
                  final group = GroupLookup.fromJson(row, effectiveCompanyCode);
                  if (group.grp.isNotEmpty && group.description.isNotEmpty) {
                    groups.add(group);
                  }
                } catch (e) {
                  print('❌ Error parsing group: $e');
                }
              }
            }
            await isar.groupLookups.putAll(groups);
            print('💾 InventoryService.getGroupMap: Saved ${groups.length} groups to local database');
          });
        } catch (e) {
          print('❌ InventoryService.getGroupMap: Error saving to local: $e');
        }
      }
      
      // Cache and return
      _groupDescriptionCache[effectiveCompanyCode] = serverMap;
      if (serverMap.isEmpty) {
        print('🟨 InventoryService.getGroupMap: No group descriptions received for company $effectiveCompanyCode');
      } else {
        print('🟩 InventoryService.getGroupMap: Cached ${serverMap.length} group descriptions for company $effectiveCompanyCode');
      }
      return serverMap;
    } catch (e) {
      print('❌ INVENTORY SERVICE getGroupMap error: $e');
      return {};
    }
  }

  /// Get department code -> description map for a company (OFFLINE-FIRST).
  /// Tries local database first, then syncs from server if online.
  Future<Map<String, String>> getDepartmentMap({int? companyCode}) async {
    try {
      // Resolve effective company code
      final selectedCompany = await _authService.getSelectedCompany();
      final int effectiveCompanyCode;
      final raw = companyCode ?? selectedCompany?['companyCode'];
      if (raw is String) {
        effectiveCompanyCode = int.tryParse(raw) ?? 0;
      } else if (raw is int) {
        effectiveCompanyCode = raw;
      } else {
        effectiveCompanyCode = 0;
      }

      // Serve from in-memory cache if present
      final cached = _deptDescriptionCache[effectiveCompanyCode];
      if (cached != null && cached.isNotEmpty) return cached;

      // OFFLINE-FIRST: Load from local database first
      final map = <String, String>{};
      try {
        final localDepts = await isar.departmentLookups
            .filter()
            .companyCodeEqualTo(effectiveCompanyCode)
            .findAll();
        
        for (final dept in localDepts) {
          if (dept.departmentCode.isNotEmpty && dept.description.isNotEmpty) {
            final k1 = dept.departmentCode;
            final k2 = dept.departmentCode.trim();
            final k3 = k2.toUpperCase();
            map[k1] = dept.description;
            map[k2] = dept.description;
            map[k3] = dept.description;
          }
        }
        
        if (map.isNotEmpty) {
          print('📱 InventoryService.getDepartmentMap: Loaded ${map.length} departments from local database');
          _deptDescriptionCache[effectiveCompanyCode] = map;
          
          // Try to sync from server in background (non-blocking)
          _syncDepartmentsInBackground(effectiveCompanyCode);
          
          return map;
        }
      } catch (e) {
        print('❌ InventoryService.getDepartmentMap: Error loading from local: $e');
      }

      // No local data, try server if online
      if (!await OfflineFirstService.isServerReachable()) {
        print('📱 InventoryService.getDepartmentMap: Offline and no local data');
        return {};
      }

      // Ensure SignalR connection (best-effort)
      if (!_signalRService.isConnected) {
        try { await _signalRService.connect(); } catch (_) {}
      }

      if (!_signalRService.isConnected) {
        print('📱 InventoryService.getDepartmentMap: Cannot connect to server');
        return {};
      }

      dynamic result;
      // Try a few likely hub method names to maximize compatibility
      final List<String> methodCandidates = [
        'getDepartmentLookup',
        'getDepartments',
        'GetDepartments',
        'getDeptDescriptions',
      ];
      // First, try with company code argument
      for (final method in methodCandidates) {
        try {
          result = await _signalRService.invoke(method, [effectiveCompanyCode]);
          if (result != null) {
            print('🟦 InventoryService.getDepartmentMap: Received result from "$method" with companyCode');
            break;
          }
        } catch (e) {
          // try next candidate
        }
      }
      // If still null, try without arguments
      if (result == null) {
        for (final method in methodCandidates) {
          try {
            result = await _signalRService.invoke(method, []);
            if (result != null) {
              print('🟦 InventoryService.getDepartmentMap: Received result from "$method" without args');
              break;
            }
          } catch (e) {
            // try next candidate
          }
        }
      }

      final serverMap = <String, String>{};
      if (result is List) {
        // Expect list of objects with fields like {'dept': 'XX', 'description': '...'}
        for (final row in result) {
          try {
            if (row is Map) {
              final code = (
                row['dept'] ?? row['Dept'] ?? row['DEPT'] ??
                row['deptCode'] ?? row['DeptCode'] ?? row['Dept_Code'] ?? row['DEPT_CODE'] ??
                row['code'] ?? row['Code']
              )?.toString();
              final desc = (
                row['description'] ?? row['Description'] ?? row['DESCRIPTION'] ??
                row['deptDesc'] ?? row['DeptDesc'] ?? row['Dept_Desc'] ?? row['DEPT_DESC'] ??
                row['desc'] ?? row['Desc']
              )?.toString();
              if (code != null && code.isNotEmpty && desc != null && desc.isNotEmpty) {
                final k1 = code;
                final k2 = code.trim();
                final k3 = k2.toUpperCase();
                serverMap[k1] = desc;
                serverMap[k2] = desc;
                serverMap[k3] = desc;
              }
            }
          } catch (_) {}
        }
      } else if (result is Map) {
        // Could be a direct map of code->description
        result.forEach((k, v) {
          final code = k?.toString();
          final desc = v?.toString();
          if (code != null && code.isNotEmpty && desc != null && desc.isNotEmpty) {
            final k1 = code;
            final k2 = code.trim();
            final k3 = k2.toUpperCase();
            serverMap[k1] = desc;
            serverMap[k2] = desc;
            serverMap[k3] = desc;
          }
        });
      }

      // Save to local database for offline use
      if (serverMap.isNotEmpty && result is List) {
        try {
          await isar.writeTxn(() async {
            // Clear old departments for this company
            await isar.departmentLookups
                .filter()
                .companyCodeEqualTo(effectiveCompanyCode)
                .deleteAll();
            
            // Save new departments
            final departments = <DepartmentLookup>[];
            for (final row in result) {
              if (row is Map<String, dynamic>) {
                try {
                  final dept = DepartmentLookup.fromJson(row, effectiveCompanyCode);
                  if (dept.departmentCode.isNotEmpty && dept.description.isNotEmpty) {
                    departments.add(dept);
                  }
                } catch (e) {
                  print('❌ Error parsing department: $e');
                }
              }
            }
            await isar.departmentLookups.putAll(departments);
            print('💾 InventoryService.getDepartmentMap: Saved ${departments.length} departments to local database');
          });
        } catch (e) {
          print('❌ InventoryService.getDepartmentMap: Error saving to local: $e');
        }
      }
      
      // Cache and return
      _deptDescriptionCache[effectiveCompanyCode] = serverMap;
      if (serverMap.isEmpty) {
        print('🟨 InventoryService.getDepartmentMap: No dept descriptions received for company $effectiveCompanyCode');
      } else {
        print('🟩 InventoryService.getDepartmentMap: Cached ${serverMap.length} dept descriptions for company $effectiveCompanyCode');
      }
      return serverMap;
    } catch (e) {
      print('❌ INVENTORY SERVICE getDepartmentMap error: $e');
      return {};
    }
  }

  // Save inventory items to local database
  Future<void> saveInventoryToLocal(List<InventoryItem> items, {int? companyCode}) async {
    try {
      print('💾 INVENTORY SERVICE: Saving ${items.length} items to local database...');
      
      await isar.writeTxn(() async {
        // If companyCode is provided, clear existing items for that company first
        if (companyCode != null) {
          await isar.inventoryItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .deleteAll();
          print('💾 INVENTORY SERVICE: Cleared existing items for company $companyCode');
        }
        
        // Save new items
        await isar.inventoryItems.putAll(items);
      });

      print('💾 INVENTORY SERVICE: Successfully saved ${items.length} items to local database');
    } catch (e) {
      print('❌ INVENTORY SERVICE SAVE ERROR: $e');
      rethrow;
    }
  }

  // Get single inventory item by SKU and company code
  Future<InventoryItem?> getInventoryItemBySku(int companyCode, int skuNo) async {
    try {
      print('🔍 INVENTORY SERVICE: Looking up SKU $skuNo for company $companyCode');
      
      final item = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .skuNoEqualTo(skuNo)
          .findFirst();
      
      if (item != null) {
        print('✅ INVENTORY SERVICE: Found item: ${item.description}');
      } else {
        print('❌ INVENTORY SERVICE: No item found for SKU $skuNo');
      }
      
      return item;
    } catch (e) {
      print('❌ INVENTORY SERVICE LOOKUP ERROR: $e');
      return null;
    }
  }

  // Load inventory items from local database
  Future<List<InventoryItem>> loadInventoryFromLocal({
    int? companyCode,
    String? searchQuery,
    InventoryFilter? filter,
    int limit = 100,
    int offset = 0,
  }) async {
    try {
      print('📱 INVENTORY SERVICE: Loading inventory from local database...');
      
      // Get all items first, then apply filters
      List<InventoryItem> allItems;
      if (companyCode != null) {
        allItems = await isar.inventoryItems.filter().companyCodeEqualTo(companyCode).findAll();
      } else {
        allItems = await isar.inventoryItems.where().findAll();
      }
      
      // Apply filters
      List<InventoryItem> filteredItems = allItems;
      
      // Apply inventory-specific filters
      if (filter != null) {
        filteredItems = _applyInventoryFilter(filteredItems, filter);
      }
      
      // Apply search filter if provided
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final searchLower = searchQuery.toLowerCase();
        filteredItems = filteredItems.where((item) {
          return (item.description?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.articleNo?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.articleDesc?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.brand?.toLowerCase().contains(searchLower) ?? false) ||
                 item.skuNo.toString().contains(searchQuery);
        }).toList();
      }

      // Apply pagination to filtered results
      final startIndex = offset;
      final endIndex = (startIndex + limit).clamp(0, filteredItems.length);
      
      final paginatedItems = filteredItems.sublist(
        startIndex.clamp(0, filteredItems.length),
        endIndex,
      );

      print('📱 INVENTORY SERVICE: Found ${paginatedItems.length} items locally (filtered from ${filteredItems.length})');
      return paginatedItems;
    } catch (e) {
      print('❌ INVENTORY SERVICE LOAD ERROR: $e');
      return [];
    }
  }

  // Apply inventory-specific filters
  List<InventoryItem> _applyInventoryFilter(List<InventoryItem> items, InventoryFilter filter) {
    List<InventoryItem> filtered = items;
    
    // Stock status filter
    if (filter.stockStatus != null) {
      switch (filter.stockStatus!) {
        case StockStatus.inStock:
          filtered = filtered.where((item) => (item.qtyOnHand ?? 0) > 0).toList();
          break;
        case StockStatus.outOfStock:
          filtered = filtered.where((item) => (item.qtyOnHand ?? 0) <= 0).toList();
          break;
        case StockStatus.lowStock:
          // Consider low stock as items with qty > 0 but <= reorder level
          filtered = filtered.where((item) {
            final qty = item.qtyOnHand ?? 0;
            final reorderLevel = item.reorderLevel ?? 0;
            return qty > 0 && qty <= reorderLevel;
          }).toList();
          break;
        case StockStatus.all:
          // No filtering needed
          break;
      }
    }
    
    // Group filter (Grp)
    if (filter.groups != null && filter.groups!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.groups!.contains(item.grp)).toList();
    }
    
    // Department filter (Dept)
    if (filter.departments != null && filter.departments!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.departments!.contains(item.dept)).toList();
    }
    
    // Sub-Department filter (SubDept)
    if (filter.subDepartments != null && filter.subDepartments!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.subDepartments!.contains(item.subDept)).toList();
    }
    
    // Category filter
    if (filter.categories != null && filter.categories!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.categories!.contains(item.category)).toList();
    }
    
    // Brand filter
    if (filter.brands != null && filter.brands!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.brands!.contains(item.brand)).toList();
    }
    
    // Status filter (Active/Inactive)
    if (filter.itemStatus != null && filter.itemStatus!.isNotEmpty) {
      filtered = filtered.where((item) => 
        filter.itemStatus!.contains(item.status)).toList();
    }
    
    // Price range filter
    if (filter.minPrice != null || filter.maxPrice != null) {
      filtered = filtered.where((item) {
        final cost = item.standardCost ?? item.averageCost ?? item.lastCost ?? 0;
        if (filter.minPrice != null && cost < filter.minPrice!) return false;
        if (filter.maxPrice != null && cost > filter.maxPrice!) return false;
        return true;
      }).toList();
    }
    
    // TODO: Add lookup table filters here when ready
    // Example: Location-based filters, supplier filters, etc.
    
    return filtered;
  }

  // Get unique filter values for dropdowns, interlocking by current selections
  Future<Map<String, List<String>>> getFilterOptions({
    int? companyCode,
    List<String>? groups,
    List<String>? departments,
    List<String>? subDepartments,
  }) async {
    try {
      List<InventoryItem> allItems;
      if (companyCode != null) {
        allItems = await isar.inventoryItems.filter().companyCodeEqualTo(companyCode).findAll();
      } else {
        allItems = await isar.inventoryItems.where().findAll();
      }

      // Bases for each level (do not filter a level by its own selection)
      final Iterable<InventoryItem> baseForGroups = allItems; // company-level only
      Iterable<InventoryItem> baseForDepartments = allItems;
      if (groups != null && groups.isNotEmpty) {
        baseForDepartments = baseForDepartments.where((it) => it.grp != null && groups.contains(it.grp));
      }
      Iterable<InventoryItem> baseForSubDepartments = baseForDepartments;
      if (departments != null && departments.isNotEmpty) {
        baseForSubDepartments = baseForSubDepartments.where((it) => it.dept != null && departments.contains(it.dept));
      }
      Iterable<InventoryItem> baseForCategories = baseForSubDepartments;
      if (subDepartments != null && subDepartments.isNotEmpty) {
        baseForCategories = baseForCategories.where((it) => it.subDept != null && subDepartments.contains(it.subDept));
      }

      final groupsSet = <String>{};
      final departmentsSet = <String>{};
      final subDepartmentsSet = <String>{};
      final categoriesSet = <String>{};
      final brandsSet = <String>{};
      final statusesSet = <String>{};

      for (final item in baseForGroups) {
        if (item.grp?.isNotEmpty == true) groupsSet.add(item.grp!);
      }
      for (final item in baseForDepartments) {
        if (item.dept?.isNotEmpty == true) departmentsSet.add(item.dept!);
      }
      for (final item in baseForSubDepartments) {
        if (item.subDept?.isNotEmpty == true) subDepartmentsSet.add(item.subDept!);
      }
      for (final item in baseForCategories) {
        if (item.category?.isNotEmpty == true) categoriesSet.add(item.category!);
        if (item.brand?.isNotEmpty == true) brandsSet.add(item.brand!);
        if (item.status?.isNotEmpty == true) statusesSet.add(item.status!);
      }

      return {
        'groups': groupsSet.toList()..sort(),
        'departments': departmentsSet.toList()..sort(),
        'subDepartments': subDepartmentsSet.toList()..sort(),
        'categories': categoriesSet.toList()..sort(),
        'brands': brandsSet.toList()..sort(),
        'statuses': statusesSet.toList()..sort(),
      };
    } catch (e) {
      print('❌ INVENTORY SERVICE FILTER OPTIONS ERROR: $e');
      return {
        'groups': [],
        'departments': [],
        'subDepartments': [],
        'categories': [],
        'brands': [],
        'statuses': [],
      };
    }
  }

  // Sync inventory (fetch from server and save locally)
  Future<List<InventoryItem>> syncInventory({
    int? companyCode,
    String? searchQuery,
    InventoryFilter? filter,
    int limit = 100,
    int offset = 0,
  }) async {
    try {
      print('🔄 INVENTORY SERVICE: Starting inventory sync...');
      
      // Always perform FULL sync from server (page through all results)
      final serverItems = await fetchAllInventoryFromServer(
        companyCode: companyCode,
        // Always fetch the full catalog; apply search locally below
        searchQuery: null,
      );

      // Save to local database
      if (serverItems.isNotEmpty) {
        // Full sync is always true here; clear-and-replace the company's cache
        final isFullSync = true;
        if (isFullSync) {
          await saveInventoryToLocal(serverItems, companyCode: companyCode);
        } else {
          await saveInventoryToLocal(serverItems);
        }
      }

      // Apply local search and filters to server results
      List<InventoryItem> filteredItems = serverItems;
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final q = searchQuery.toLowerCase();
        filteredItems = filteredItems.where((it) {
          return (it.description?.toLowerCase().contains(q) ?? false) ||
                 (it.articleNo?.toLowerCase().contains(q) ?? false) ||
                 (it.articleDesc?.toLowerCase().contains(q) ?? false) ||
                 (it.brand?.toLowerCase().contains(q) ?? false) ||
                 it.skuNo.toString().contains(searchQuery);
        }).toList();
      }
      if (filter != null) {
        filteredItems = _applyInventoryFilter(filteredItems, filter);
      }

      print('🔄 INVENTORY SERVICE: Sync completed successfully');
      return filteredItems;

    } catch (e) {
      print('❌ INVENTORY SERVICE SYNC ERROR: $e');
      
      // Fallback to local data
      print('🔄 INVENTORY SERVICE: Falling back to local data...');
      return await loadInventoryFromLocal(
        companyCode: companyCode,
        searchQuery: searchQuery,
        filter: filter,
        limit: limit,
        offset: offset,
      );
    }
  }

  // Get inventory with offline-first approach
  Future<List<InventoryItem>> getInventory({
    int? companyCode,
    String? searchQuery,
    InventoryFilter? filter,
    int limit = 100,
    int offset = 0,
    bool forceRefresh = false,
  }) async {
    try {
      // Determine effective company code
      final selectedCompany = await _authService.getSelectedCompany();
      final int effectiveCompanyCode = companyCode ?? (selectedCompany?['companyCode'] is String
          ? int.tryParse(selectedCompany?['companyCode']) ?? 0
          : (selectedCompany?['companyCode'] as int?) ?? 0);

      // Full sync only once per company (or when explicitly forced)
      if (forceRefresh || !_fullSyncedCompanies.contains(effectiveCompanyCode)) {
        print('📱 INVENTORY SERVICE: Performing initial FULL sync for company $effectiveCompanyCode');
        final all = await fetchAllInventoryFromServer(
          companyCode: effectiveCompanyCode,
          // fetch full catalog; search applied locally after
          searchQuery: null,
        );
        if (all.isNotEmpty) {
          await saveInventoryToLocal(all, companyCode: effectiveCompanyCode);
        }
        _fullSyncedCompanies.add(effectiveCompanyCode);
      }

      // Always serve from local DB with local search/filter + pagination
      return await loadInventoryFromLocal(
        companyCode: effectiveCompanyCode,
        searchQuery: searchQuery,
        filter: filter,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      print('❌ INVENTORY SERVICE GET ERROR: $e');
      
      // Fallback to local data
      return await loadInventoryFromLocal(
        companyCode: companyCode,
        searchQuery: searchQuery,
        filter: filter,
        limit: limit,
        offset: offset,
      );
    }
  }

  // Get inventory count for pagination
  Future<int> getInventoryCount({
    int? companyCode,
    String? searchQuery,
    InventoryFilter? filter,
  }) async {
    try {
      // Get all items first
      List<InventoryItem> allItems;
      if (companyCode != null) {
        allItems = await isar.inventoryItems.filter().companyCodeEqualTo(companyCode).findAll();
      } else {
        allItems = await isar.inventoryItems.where().findAll();
      }
      
      // Apply filters
      List<InventoryItem> filteredItems = allItems;
      
      if (filter != null) {
        filteredItems = _applyInventoryFilter(filteredItems, filter);
      }
      
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final searchLower = searchQuery.toLowerCase();
        filteredItems = filteredItems.where((item) {
          return (item.description?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.articleNo?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.articleDesc?.toLowerCase().contains(searchLower) ?? false) ||
                 (item.brand?.toLowerCase().contains(searchLower) ?? false) ||
                 item.skuNo.toString().contains(searchQuery);
        }).toList();
      }
      
      return filteredItems.length;
    } catch (e) {
      print('❌ INVENTORY SERVICE COUNT ERROR: $e');
      return 0;
    }
  }

  // Clear local inventory data
  Future<void> clearLocalInventory({int? companyCode}) async {
    try {
      await isar.writeTxn(() async {
        if (companyCode != null) {
          await isar.inventoryItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .deleteAll();
        } else {
          await isar.inventoryItems.clear();
        }
      });
      print('🗑️ INVENTORY SERVICE: Cleared local inventory data');
    } catch (e) {
      print('❌ INVENTORY SERVICE CLEAR ERROR: $e');
    }
  }

  // Force refresh inventory from server (clear cache + fetch fresh data)
  Future<List<InventoryItem>> forceRefreshInventory({
    int? companyCode,
    String? searchQuery,
    InventoryFilter? filter,
    int limit = 100,
    int offset = 0,
  }) async {
    try {
      print('🔄 INVENTORY SERVICE: Force refreshing inventory...');
      
      // Step 1: Clear local cache for this company
      await clearLocalInventory(companyCode: companyCode);
      
      // Step 2: Fetch fresh data from server
      final freshItems = await fetchInventoryFromServer(
        companyCode: companyCode,
        searchQuery: searchQuery,
        limit: limit,
        offset: offset,
      );
      
      // Step 3: Save fresh data to local cache
      await saveInventoryToLocal(freshItems);
      
      // Step 4: Apply filters
      List<InventoryItem> filteredItems = freshItems;
      if (filter != null) {
        filteredItems = _applyInventoryFilter(freshItems, filter);
      }
      
      print('✅ INVENTORY SERVICE: Force refresh completed - ${filteredItems.length} items updated');
      return filteredItems;
    } catch (e) {
      print('❌ INVENTORY SERVICE FORCE REFRESH ERROR: $e');
      throw Exception('Failed to force refresh inventory: $e');
    }
  }

  // Clear all inventory cache (for all companies)
  Future<void> clearAllInventoryCache() async {
    try {
      await isar.writeTxn(() async {
        await isar.inventoryItems.clear();
      });
      print('🗑️ INVENTORY SERVICE: Cleared ALL inventory cache');
    } catch (e) {
      print('❌ INVENTORY SERVICE CLEAR ALL ERROR: $e');
    }
  }

  // Get cache statistics
  Future<Map<String, dynamic>> getInventoryCacheStats({int? companyCode}) async {
    try {
      int totalItems;
      
      if (companyCode != null) {
        totalItems = await isar.inventoryItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .count();
      } else {
        totalItems = await isar.inventoryItems.where().count();
      }
      
      return {
        'totalCachedItems': totalItems,
        'companyCode': companyCode,
        'hasCache': totalItems > 0,
        'lastUpdated': 'Cache statistics available',
      };
    } catch (e) {
      print('❌ INVENTORY SERVICE CACHE STATS ERROR: $e');
      return {
        'totalCachedItems': 0,
        'companyCode': companyCode,
        'hasCache': false,
        'lastUpdated': 'Error',
        'error': e.toString(),
      };
    }
  }
  
  /// Background sync for groups (non-blocking)
  void _syncGroupsInBackground(int companyCode) {
    Future.microtask(() async {
      try {
        if (!await OfflineFirstService.isServerReachable()) return;
        if (!_signalRService.isConnected) {
          try { await _signalRService.connect(); } catch (_) { return; }
        }
        if (!_signalRService.isConnected) return;
        
        // Try to fetch from server
        dynamic result;
        final List<String> methodCandidates = [
          'getGroupLookup', 'getGroups', 'GetGroups', 'getPiGroups', 'GetPI_Group',
        ];
        
        for (final method in methodCandidates) {
          try {
            result = await _signalRService.invoke(method, [companyCode]);
            if (result != null) break;
          } catch (_) {}
        }
        
        if (result == null || result is! List) return;
        
        // Save to database
        await isar.writeTxn(() async {
          await isar.groupLookups.filter().companyCodeEqualTo(companyCode).deleteAll();
          final groups = <GroupLookup>[];
          for (final row in result) {
            if (row is Map<String, dynamic>) {
              try {
                final group = GroupLookup.fromJson(row, companyCode);
                if (group.grp.isNotEmpty && group.description.isNotEmpty) {
                  groups.add(group);
                }
              } catch (_) {}
            }
          }
          await isar.groupLookups.putAll(groups);
          print('🔄 Background sync: Saved ${groups.length} groups for company $companyCode');
        });
        
        // Update in-memory cache
        final map = <String, String>{};
        for (final row in result) {
          if (row is Map) {
            final code = (row['grp'] ?? row['Grp'] ?? row['code'])?.toString();
            final desc = (row['description'] ?? row['Description'] ?? row['desc'])?.toString();
            if (code != null && desc != null && code.isNotEmpty && desc.isNotEmpty) {
              map[code] = desc;
              map[code.trim()] = desc;
              map[code.trim().toUpperCase()] = desc;
            }
          }
        }
        _groupDescriptionCache[companyCode] = map;
      } catch (e) {
        print('❌ Background group sync failed: $e');
      }
    });
  }
  
  /// Background sync for departments (non-blocking)
  void _syncDepartmentsInBackground(int companyCode) {
    Future.microtask(() async {
      try {
        if (!await OfflineFirstService.isServerReachable()) return;
        if (!_signalRService.isConnected) {
          try { await _signalRService.connect(); } catch (_) { return; }
        }
        if (!_signalRService.isConnected) return;
        
        // Try to fetch from server
        dynamic result;
        final List<String> methodCandidates = [
          'getDepartmentLookup', 'getDepartments', 'GetDepartments', 'getPiDepartments',
        ];
        
        for (final method in methodCandidates) {
          try {
            result = await _signalRService.invoke(method, [companyCode]);
            if (result != null) break;
          } catch (_) {}
        }
        
        if (result == null || result is! List) return;
        
        // Save to database
        await isar.writeTxn(() async {
          await isar.departmentLookups.filter().companyCodeEqualTo(companyCode).deleteAll();
          final departments = <DepartmentLookup>[];
          for (final row in result) {
            if (row is Map<String, dynamic>) {
              try {
                final dept = DepartmentLookup.fromJson(row, companyCode);
                if (dept.departmentCode.isNotEmpty && dept.description.isNotEmpty) {
                  departments.add(dept);
                }
              } catch (_) {}
            }
          }
          await isar.departmentLookups.putAll(departments);
          print('🔄 Background sync: Saved ${departments.length} departments for company $companyCode');
        });
        
        // Update in-memory cache
        final map = <String, String>{};
        for (final row in result) {
          if (row is Map) {
            final code = (row['dept'] ?? row['Dept'] ?? row['departmentCode'] ?? row['code'])?.toString();
            final desc = (row['description'] ?? row['Description'] ?? row['desc'])?.toString();
            if (code != null && desc != null && code.isNotEmpty && desc.isNotEmpty) {
              map[code] = desc;
              map[code.trim()] = desc;
              map[code.trim().toUpperCase()] = desc;
            }
          }
        }
        _deptDescriptionCache[companyCode] = map;
      } catch (e) {
        print('❌ Background department sync failed: $e');
      }
    });
  }
}
