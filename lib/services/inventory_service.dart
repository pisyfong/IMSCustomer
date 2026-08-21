import 'dart:async';

import 'package:isar/isar.dart';

import '../models/inventory_item.dart';

import '../models/in_stock_uom.dart';

import '../models/in_stock_plu.dart';

import '../models/in_stock_location.dart';

import '../models/customer_plu.dart';

import '../models/sync_checkpoint.dart';

import '../models/group_lookup.dart';

import '../models/department_lookup.dart';
import '../models/brand_lookup.dart';

import '../main.dart';

import 'signalr_service.dart';

import 'auth_service.dart';

import 'offline_first_service.dart';

import 'base_inventory_sync_service.dart';

import 'taxonomy_mode_service.dart';



/// Category and sub-department labels for one taxonomy.
///
/// A plain class rather than a record: the analyzer bundled with the code
/// generators in this project predates record syntax, and a record here fails
/// the Isar build with a bare "syntax errors" message that points nowhere.
/// The handful of fields the filter drawer needs from an item.
///
/// Filter options were recomputed by deserialising every InventoryItem —
/// 6,000 rows of 167 columns — on each toggle. Only six short strings matter,
/// so the catalogue is reduced to these once and the toggles run over that.
class TaxonomyRow {
  final String grp;
  final String dept;
  final String subDept;
  final String category;
  final String brand;
  final String status;
  const TaxonomyRow(this.grp, this.dept, this.subDept, this.category,
      this.brand, this.status);
}

class TaxonomyLabels {
  final Map<String, String> categories;
  final Map<String, String> subDepartments;
  const TaxonomyLabels(this.categories, this.subDepartments);
}

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

  /// External hook for BaseInventorySyncService (or any other sync surface) to
  /// say "this company has fresh data in Isar already, don't auto-trigger the
  /// old getInventory full-sync". Without this, opening the inventory page after
  /// a base-table sync would still kick off the legacy CTE+joins pull.
  void markCompanyAsFullySynced(int companyCode) {
    _fullSyncedCompanies.add(companyCode);
    // Fresh catalogue — the reduced snapshot the filters read is now stale.
    invalidateFilterOptions(companyCode);
  }

  // Single-flight guard: maps companyCode -> in-flight full-sync future. Prevents
  // concurrent callers from kicking off duplicate full-sync passes (which previously
  // caused the inventory pagination to run twice in parallel and saturate the network).
  final Map<int, Future<void>> _fullSyncInFlight = <int, Future<void>>{};

  

  // In-memory cache: "companyCode|mode" -> { deptCode: description }.
  // Keyed by taxonomy mode so pi and web descriptions coexist and a mode
  // toggle reads the right set without a restart or re-fetch.
  final Map<String, Map<String, String>> _deptDescriptionCache = {};

  // In-memory cache: "companyCode|mode" -> { grp: description }.
  final Map<String, Map<String, String>> _groupDescriptionCache = {};

  /// Cache/partition key combining company and taxonomy mode.
  String _lkKey(int companyCode, TaxonomyMode mode) => '$companyCode|${mode.name}';

  /// One-time upgrade: lookup rows synced before the taxonomyMode field read
  /// back with an empty mode. Everything cached before this feature was the
  /// legacy PI taxonomy, so stamp those rows 'pi' — otherwise the mode-filtered
  /// reads miss them and offline descriptions vanish until the next online sync.
  static Future<void> migrateLegacyLookupModes() async {
    try {
      final legacyGroups =
          await isar.groupLookups.filter().taxonomyModeEqualTo('').findAll();
      final legacyDepts =
          await isar.departmentLookups.filter().taxonomyModeEqualTo('').findAll();
      if (legacyGroups.isEmpty && legacyDepts.isEmpty) return;
      for (final g in legacyGroups) {
        g.taxonomyMode = 'pi';
      }
      for (final d in legacyDepts) {
        d.taxonomyMode = 'pi';
      }
      await isar.writeTxn(() async {
        await isar.groupLookups.putAll(legacyGroups);
        await isar.departmentLookups.putAll(legacyDepts);
      });
      print('🔧 Lookup mode migration: stamped ${legacyGroups.length} groups + '
          '${legacyDepts.length} depts as pi');
    } catch (e) {
      print('❌ Legacy lookup mode migration failed: $e');
    }
  }



  // Fetch inventory items from server via SignalR

  Future<List<InventoryItem>> fetchInventoryFromServer({

    int? companyCode,

    String? searchQuery,

    int limit = 100,

    int offset = 0,

    bool applyFlag3Filter = true,

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

        throw TimeoutException(
          'Inventory fetch timed out after 15s (offset=$offset, limit=$limit)',
          const Duration(seconds: 15),
        );

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

      // Exclude items marked with Flag3 == 'N' from server fetch (caller can opt out
      // for paginated full-syncs, where filtering must happen after all pages are
      // collected so page-size comparisons reflect real server-side pagination).

      if (!applyFlag3Filter) {

        return inventoryItems;

      }

      final before = inventoryItems.length;

      final filtered = inventoryItems

          .where((it) => (it.flag3 == null || it.flag3!.toUpperCase() != 'N'))

          .toList();

      final removed = before - filtered.length;

      if (removed > 0) {

        print('🧹 INVENTORY SERVICE: Filtered out $removed items with Flag3 == N');

      }

      return filtered;



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

    int maxRetriesPerPage = 3,

  }) async {

    final List<InventoryItem> all = [];

    int offset = 0;

    while (true) {

      List<InventoryItem>? page;

      Object? lastError;

      for (int attempt = 1; attempt <= maxRetriesPerPage; attempt++) {

        try {

          page = await fetchInventoryFromServer(

            companyCode: companyCode,

            searchQuery: searchQuery,

            limit: pageSize,

            offset: offset,

          );

          break;

        } catch (e) {

          lastError = e;

          if (attempt >= maxRetriesPerPage) break;

          final backoffMs = 500 * (1 << (attempt - 1));

          print(

            '⚠️ INVENTORY SERVICE: page offset=$offset attempt $attempt/$maxRetriesPerPage failed: $e — retrying in ${backoffMs}ms',

          );

          await Future.delayed(Duration(milliseconds: backoffMs));

        }

      }

      if (page == null) {

        // Persistent failure — surface to caller so it can keep the existing cache

        // instead of overwriting with a partial snapshot.

        throw Exception(

          'Inventory pagination aborted at offset $offset after $maxRetriesPerPage retries: $lastError',

        );

      }

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

  /// companyCode -> reduced catalogue, for filter-option building.
  final Map<int, List<TaxonomyRow>> _taxonomySnapshot = {};

  /// In-flight work, so concurrent callers share one result instead of each
  /// doing the whole job. The filter dialog and the page both ask for the same
  /// lookups at the same moment, which was producing two hub round-trips, two
  /// writes to Isar and two 600ms snapshot builds per open.
  final Map<String, Future<dynamic>> _inFlight = {};

  Future<T> _singleFlight<T>(String key, Future<T> Function() run) {
    final existing = _inFlight[key];
    if (existing != null) return existing.then((v) => v as T);
    final fut = run();
    _inFlight[key] = fut;
    return fut.whenComplete(() => _inFlight.remove(key));
  }

  /// Builds (or reuses) the reduced catalogue.
  ///
  /// Held until the catalogue changes: a sync, a cache clear or a company
  /// switch calls [invalidateFilterOptions]. Everything else — every group,
  /// department or brand tap — reads this list instead of the database.
  Future<List<TaxonomyRow>> _taxonomyRows(int companyCode) async {
    final cached = _taxonomySnapshot[companyCode];
    if (cached != null) return cached;

    return _singleFlight('snapshot|$companyCode',
        () => _buildTaxonomyRows(companyCode));
  }

  Future<List<TaxonomyRow>> _buildTaxonomyRows(int companyCode) async {
    final already = _taxonomySnapshot[companyCode];
    if (already != null) return already;

    final sw = Stopwatch()..start();
    final items = companyCode > 0
        ? await isar.inventoryItems
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll()
        : await isar.inventoryItems.where().findAll();

    final rows = List<TaxonomyRow>.unmodifiable(items.map((it) => TaxonomyRow(
          (it.grp ?? '').trim(),
          (it.dept ?? '').trim(),
          (it.subDept ?? '').trim(),
          (it.category ?? '').trim(),
          (it.brand ?? '').trim(),
          (it.status ?? '').trim(),
        )));
    _taxonomySnapshot[companyCode] = rows;
    sw.stop();
    print('🧮 InventoryService: taxonomy snapshot for company $companyCode — '
        '${rows.length} rows in ${sw.elapsedMilliseconds}ms (cached until next sync)');
    return rows;
  }

  /// Drops the reduced catalogue so the next filter build re-reads Isar.
  void invalidateFilterOptions([int? companyCode]) {
    if (companyCode == null) {
      _taxonomySnapshot.clear();
    } else {
      _taxonomySnapshot.remove(companyCode);
    }
  }

  /// Drops every cached taxonomy label so the next read reflects a changed
  /// mode.
  ///
  /// The caches are keyed by mode and so cannot serve the wrong family, but
  /// they are populated lazily — without this, a device that has already
  /// looked at PI keeps showing PI labels after the switch until something
  /// else happens to evict them, which reads as "the toggle did nothing".
  void clearTaxonomyCaches() {
    _deptDescriptionCache.clear();
    _groupDescriptionCache.clear();
    _categoryDescriptionCache.clear();
    _subDeptDescriptionCache.clear();
    _brandDescriptionCache.clear();
    print('🔄 InventoryService: taxonomy label caches cleared');
  }

  /// Department codes actually present on stock, for the given taxonomy.
  ///
  /// Used to sanity-check a cached lookup: if its keys intersect none of
  /// these, it is keyed on the wrong level and must be discarded. Reads a
  /// bounded sample rather than the whole catalogue — this runs on the way to
  /// drawing a filter drawer, and a few hundred rows settle the question just
  /// as well as six thousand.
  Future<Set<String>> _departmentCodesInUse(
      int companyCode, TaxonomyMode mode) async {
    try {
      final sample = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .limit(500)
          .findAll();
      final codes = <String>{};
      for (final it in sample) {
        // Both taxonomies key departments off the same column; the mode only
        // decides which names are shown.
        final c = (it.dept ?? '').trim().toUpperCase();
        if (c.isEmpty) continue;
        codes.add(c);
        // Departments are cached group-qualified, so the group-qualified form
        // has to be offered too. Checking only bare codes made this guard
        // reject a perfectly good cache and refetch on every single open.
        final g = (it.grp ?? '').trim().toUpperCase();
        if (g.isNotEmpty) codes.add('$g|$c');
      }
      return codes;
    } catch (e) {
      // Never let a sanity check keep the drawer from rendering.
      print('⚠️ InventoryService._departmentCodesInUse: $e');
      return <String>{};
    }
  }

  /// Marks a code whose meaning depends on its parent, so the UI can decline
  /// to guess. Deliberately not a valid description.
  static const String _ambiguousLabel = '::ambiguous::';

  /// True when [code] has more than one meaning and needs a group to resolve.
  static bool isAmbiguousLabel(String? label) => label == _ambiguousLabel;

  /// Whether an item falls under any of the selected departments.
  ///
  /// A selection is normally "GRP|DEPT", which matches only items in that
  /// group — the same department code under another group is a different
  /// department. A bare "DEPT" is still honoured so selections saved before
  /// departments became group-qualified keep working, and so does any caller
  /// that only knows the code.
  static bool matchesDepartmentSelection(
      List<String> selected, InventoryItem item) {
    final dept = (item.dept ?? '').trim().toUpperCase();
    if (dept.isEmpty) return false;
    final grp = (item.grp ?? '').trim().toUpperCase();
    for (final raw in selected) {
      final sel = raw.trim().toUpperCase();
      if (sel.isEmpty) continue;
      final bar = sel.indexOf('|');
      if (bar < 0) {
        if (sel == dept) return true;
      } else if (sel.substring(0, bar) == grp && sel.substring(bar + 1) == dept) {
        return true;
      }
    }
    return false;
  }

  /// Group part of a "GRP|DEPT" key, or '' for a bare code.
  ///
  /// Deliberately two functions rather than one returning a record: the
  /// analyzer bundled with this project's code generators predates record
  /// syntax and fails the Isar build with an unlocated "syntax errors".
  static String groupOfDepartmentKey(String key) {
    final bar = key.indexOf('|');
    return bar < 0 ? '' : key.substring(0, bar).trim();
  }

  /// Department code part of a "GRP|DEPT" key.
  static String codeOfDepartmentKey(String key) {
    final bar = key.indexOf('|');
    return (bar < 0 ? key : key.substring(bar + 1)).trim();
  }

  /// Unwraps `{rows: [...], map: {...}}` into whichever form carries data.
  ///
  /// `rows` wins when present: it names the level it describes and carries the
  /// parent codes, which a flat map cannot. Anything else is passed through
  /// untouched, so older hubs returning a bare map still work.
  /// Codes that are never real taxonomy values — they are the envelope keys a
  /// previous build mistook for data and cached.
  static const Set<String> _envelopeArtefacts = {'rows', 'map'};

  static bool _isEnvelopeArtefact(String code) =>
      _envelopeArtefacts.contains(code.trim().toLowerCase());

  static dynamic _unwrapLookupEnvelope(dynamic result) {
    if (result is! Map) return result;
    final rows = result['rows'];
    if (rows is List && rows.isNotEmpty) return rows;
    final map = result['map'];
    if (map is Map) return map;
    return result;
  }

  /// Brand code → name.
  ///
  /// Always sourced from PI_Brand regardless of taxonomy mode, because
  /// Web_Brand has no Description column — there is no web-side name to
  /// prefer. This is the one deliberate cross-family read; group, department,
  /// sub-department and category all stay strictly within their own family.
  Future<Map<String, String>> getBrandMap({int? companyCode}) async {
    final selectedCompany = await _authService.getSelectedCompany();
    final raw = companyCode ?? selectedCompany?['companyCode'];
    final int effectiveCompanyCode =
        raw is String ? (int.tryParse(raw) ?? 0) : (raw is int ? raw : 0);

    final cached = _brandDescriptionCache[effectiveCompanyCode];
    if (cached != null) return cached;

    // Offline-first: the cached copy answers before the network is consulted.
    final local = await isar.brandLookups
        .filter()
        .companyCodeEqualTo(effectiveCompanyCode)
        .findAll();
    if (local.isNotEmpty) {
      final m = <String, String>{};
      for (final b in local) {
        m[b.brandCode] = b.description;
        m[b.brandCode.toUpperCase()] = b.description;
      }
      _brandDescriptionCache[effectiveCompanyCode] = m;
      return m;
    }

    if (!_signalRService.isConnected) return {};

    try {
      final result = await _signalRService
          .invoke('getBrandLookup', [effectiveCompanyCode]);
      final map = <String, String>{};
      final unwrapped = _unwrapLookupEnvelope(result);
      if (unwrapped is Map) {
        unwrapped.forEach((k, v) {
          final code = k?.toString().trim() ?? '';
          final desc = v?.toString().trim() ?? '';
          if (code.isEmpty || desc.isEmpty) return;
          map[code] = desc;
          map[code.toUpperCase()] = desc;
        });
      }

      if (map.isNotEmpty) {
        await isar.writeTxn(() async {
          await isar.brandLookups
              .filter()
              .companyCodeEqualTo(effectiveCompanyCode)
              .deleteAll();
          final rows = <BrandLookup>[];
          final seen = <String>{};
          map.forEach((code, desc) {
            if (!seen.add(code)) return;
            rows.add(BrandLookup()
              ..companyCode = effectiveCompanyCode
              ..brandCode = code
              ..description = desc
              ..lastUpdated = DateTime.now());
          });
          await isar.brandLookups.putAll(rows);
        });
        print('💾 InventoryService.getBrandMap: cached ${map.length} brand names');
      }

      _brandDescriptionCache[effectiveCompanyCode] = map;
      return map;
    } catch (e) {
      print('❌ InventoryService.getBrandMap: $e');
      return {};
    }
  }

  final Map<int, Map<String, String>> _brandDescriptionCache = {};
  final Map<String, Map<String, String>> _categoryDescriptionCache = {};
  final Map<String, Map<String, String>> _subDeptDescriptionCache = {};

  /// Category and sub-department descriptions for the active taxonomy only.
  ///
  /// PI reads PI_Category (which is also where PI keeps its sub-department
  /// column — there is no PI_Sub_Department table); web reads Web_Category and
  /// Web_Sub_Dept. The families are never blended: the same code means
  /// different things in each, so a miss returns the bare code rather than
  /// borrowing the other family's label.
  ///
  /// Returns both label sets together, since one hub call yields both.
  Future<TaxonomyLabels> getCategoryAndSubDeptMaps({
    int? companyCode,
    TaxonomyMode? mode,
  }) async {
    final selectedCompany = await _authService.getSelectedCompany();
    final raw = companyCode ?? selectedCompany?['companyCode'];
    final int cc = raw is String ? (int.tryParse(raw) ?? 0) : (raw is int ? raw : 0);
    final resolved = mode ?? TaxonomyModeService.instance.modeOrDefault;
    final key = _lkKey(cc, resolved);

    final cachedCat = _categoryDescriptionCache[key];
    final cachedSub = _subDeptDescriptionCache[key];
    if (cachedCat != null && cachedSub != null) {
      return TaxonomyLabels(cachedCat, cachedSub);
    }

    if (!_signalRService.isConnected) {
      return TaxonomyLabels(const {}, const {});
    }

    final categories = <String, String>{};
    final subDepts = <String, String>{};

    Map<String, String> rowsToMap(dynamic rows) {
      final m = <String, String>{};
      if (rows is! List) return m;
      for (final r in rows) {
        if (r is! Map) continue;
        final code = (r['code'] ?? r['category'] ?? r['subdept'] ?? '')
            .toString()
            .trim();
        final desc = (r['description'] ?? '').toString().trim();
        if (code.isEmpty) continue;
        m[code] = desc.isEmpty ? code : desc;
        m[code.toUpperCase()] = m[code]!;
      }
      return m;
    }

    try {
      if (resolved == TaxonomyMode.web) {
        final cat = await _signalRService.invoke('getWebCategoryLookup', [cc]);
        final sub = await _signalRService.invoke('getWebSubDeptLookup', [cc]);
        categories.addAll(rowsToMap(cat is Map ? cat['rows'] : null));
        subDepts.addAll(rowsToMap(sub is Map ? sub['rows'] : null));
      } else {
        final res = await _signalRService.invoke('getPiCategoryLookup', [cc]);
        if (res is Map) {
          categories.addAll(rowsToMap(res['rows']));
          subDepts.addAll(rowsToMap(res['subDepartments']));
        }
      }
    } catch (e) {
      print('❌ InventoryService.getCategoryAndSubDeptMaps (${resolved.name}): $e');
    }

    _categoryDescriptionCache[key] = categories;
    _subDeptDescriptionCache[key] = subDepts;
    print('🟩 Taxonomy ${resolved.name}: ${categories.length} category labels, '
        '${subDepts.length} sub-department labels');
    return TaxonomyLabels(categories, subDepts);
  }

  Future<Map<String, String>> getGroupMap(
      {int? companyCode, TaxonomyMode? mode}) {
    // Concurrent callers share one lookup. The page and the filter dialog
    // ask at the same moment, which produced two hub round-trips and two
    // writes to Isar for the same data.
    final resolved = mode ?? TaxonomyModeService.instance.modeOrDefault;
    return _singleFlight('group|$companyCode|${resolved.name}',
        () => _getGroupMapUncached(companyCode: companyCode, mode: mode));
  }

  Future<Map<String, String>> _getGroupMapUncached({int? companyCode, TaxonomyMode? mode}) async {

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



      final resolvedMode = mode ?? TaxonomyModeService.instance.modeOrDefault;
      final cacheKey = _lkKey(effectiveCompanyCode, resolvedMode);

      // Serve from in-memory cache if present

      final cached = _groupDescriptionCache[cacheKey];

      if (cached != null && cached.isNotEmpty) return cached;



      // OFFLINE-FIRST: Load from local database first

      final map = <String, String>{};

      try {

        final localGroups = await isar.groupLookups

            .filter()

            .companyCodeEqualTo(effectiveCompanyCode)

            .and()

            .taxonomyModeEqualTo(resolvedMode.name)

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

        

        // Same placeholder trap as departments: a local copy in which every
        // description equals its code came from a backend that had no
        // description table, and must not be served as if it were real.
        if (map.isNotEmpty &&
            map.entries.every((e) =>
                e.value.trim().toUpperCase() == e.key.trim().toUpperCase())) {
          print('♻️ InventoryService.getGroupMap: local copy is code-only — refetching');
          map.clear();
        }

        // Evict rows a previous build cached from an unwrapped envelope: it
        // read the keys 'rows' and 'map' as group codes and saved two of them.
        // They are indistinguishable from real data by shape, so they are
        // named explicitly.
        final before = map.length;
        map.removeWhere((k, _) => _isEnvelopeArtefact(k));
        if (map.length != before) {
          // Artefacts present means the whole row set was written by the buggy
          // path, which deletes the mode's rows before inserting — so whatever
          // survived alongside them is a remnant, not a complete taxonomy.
          // Refetch rather than serve a partial list.
          //
          // Keyed on artefacts actually being found, not on a minimum count:
          // a customer with two real groups must not be refetched forever.
          print('♻️ InventoryService.getGroupMap: cache contained envelope '
              'artefacts (${before - map.length} of $before) — refetching');
          map.clear();
        }

        if (map.isNotEmpty) {

          print('📱 InventoryService.getGroupMap: Loaded ${map.length} groups from local database');

          _groupDescriptionCache[cacheKey] = map;



          // Try to sync from server in background (non-blocking)

          _syncGroupsInBackground(effectiveCompanyCode, resolvedMode);

          

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

      final List<String> methodCandidates = resolvedMode == TaxonomyMode.web
          ? const [
              'getWebGroupLookup',
              'getWebGroups',
            ]
          : const [
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



      // Hub lookups now answer with an envelope, `{rows: [...], map: {...}}`,
      // so the level being described can be named explicitly rather than
      // guessed from column order. Unwrap it before the shapes below run —
      // otherwise 'rows' and 'map' are themselves read as taxonomy codes and
      // every label comes back as its own code.
      result = _unwrapLookupEnvelope(result);

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



      // Save to local database for offline use. Persist from serverMap so it
      // works whether the hub returned a list of rows OR a code→desc map.

      if (serverMap.isNotEmpty) {

        try {

          await isar.writeTxn(() async {

            // Clear old groups for this company + mode (leave the other mode).

            await isar.groupLookups

                .filter()

                .companyCodeEqualTo(effectiveCompanyCode)

                .and()

                .taxonomyModeEqualTo(resolvedMode.name)

                .deleteAll();



            // Save new groups

            final groups = <GroupLookup>[];

            serverMap.forEach((code, desc) {

              final c = code.trim();

              if (c.isEmpty) return;

              groups.add(GroupLookup()

                ..companyCode = effectiveCompanyCode

                ..taxonomyMode = resolvedMode.name

                ..grp = c

                ..description = desc.trim().isEmpty ? c : desc.trim()

                ..lastUpdated = DateTime.now());

            });

            await isar.groupLookups.putAll(groups);

            print('💾 InventoryService.getGroupMap: Saved ${groups.length} ${resolvedMode.name} groups to local database');

          });

        } catch (e) {

          print('❌ InventoryService.getGroupMap: Error saving to local: $e');

        }

      }

      

      // Cache and return

      _groupDescriptionCache[cacheKey] = serverMap;

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

  Future<Map<String, String>> getDepartmentMap(
      {int? companyCode, TaxonomyMode? mode}) {
    // Concurrent callers share one lookup. The page and the filter dialog
    // ask at the same moment, which produced two hub round-trips and two
    // writes to Isar for the same data.
    final resolved = mode ?? TaxonomyModeService.instance.modeOrDefault;
    return _singleFlight('dept|$companyCode|${resolved.name}',
        () => _getDepartmentMapUncached(companyCode: companyCode, mode: mode));
  }

  Future<Map<String, String>> _getDepartmentMapUncached({int? companyCode, TaxonomyMode? mode}) async {

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



      final resolvedMode = mode ?? TaxonomyModeService.instance.modeOrDefault;
      final cacheKey = _lkKey(effectiveCompanyCode, resolvedMode);

      // Serve from in-memory cache if present

      final cached = _deptDescriptionCache[cacheKey];

      if (cached != null && cached.isNotEmpty) return cached;



      // OFFLINE-FIRST: Load from local database first

      final map = <String, String>{};

      try {

        final localDepts = await isar.departmentLookups

            .filter()

            .companyCodeEqualTo(effectiveCompanyCode)

            .and()

            .taxonomyModeEqualTo(resolvedMode.name)

            .findAll();

        

        for (final dept in localDepts) {
          if (dept.departmentCode.isEmpty || dept.description.isEmpty) continue;
          final k2 = dept.departmentCode.trim();
          final k3 = k2.toUpperCase();
          // Rebuild the same composite/ambiguous shape the server path
          // produces, so an offline device resolves departments exactly as an
          // online one does.
          if (dept.groupCode.isNotEmpty) {
            map['${dept.groupCode}|$k3'] = dept.description;
          }
          final existing = map[k3];
          if (existing == null) {
            map[dept.departmentCode] = dept.description;
            map[k2] = dept.description;
            map[k3] = dept.description;
          } else if (existing != dept.description &&
              existing != _ambiguousLabel) {
            map[dept.departmentCode] = _ambiguousLabel;
            map[k2] = _ambiguousLabel;
            map[k3] = _ambiguousLabel;
          }
        }

        

        // A cache whose every description is just its own code is not a
        // cache — it is the old backend's placeholder, which returned
        // `map[code] = code`. Serving it pins the drawer to codes forever,
        // because the local copy is never re-read once it exists.
        //
        // Detected rather than versioned, so a device heals itself the first
        // time it reaches a backend with real descriptions — no cache wipe,
        // no reinstall.
        final degenerate = map.isNotEmpty &&
            map.entries.every((e) =>
                e.value.trim().toUpperCase() == e.key.trim().toUpperCase());
        if (degenerate) {
          print('♻️ InventoryService.getDepartmentMap: local copy has no real '
              'descriptions (${map.length} code-only entries) — refetching');
          map.clear();
        }

        // Rows cached before departments became group-qualified carry no
        // group at all, so the rebuild above can only produce bare keys. A
        // code reused across groups then resolves to whichever row was written
        // last — AVT under "Aluminium & Stainless Steel" came out as
        // "Towel and Sock", which is S4's meaning.
        //
        // Detected from the data rather than a schema version: once refetched,
        // every row the server describes carries its group.
        if (localDepts.isNotEmpty &&
            localDepts.every((d) => d.groupCode.trim().isEmpty)) {
          print('♻️ InventoryService.getDepartmentMap: cached departments have '
              'no group (${localDepts.length} rows, pre-upgrade) — refetching');
          map.clear();
        }

        // A second way a cached lookup goes bad, and the one that bites web
        // mode: the descriptions are real but filed under the wrong level.
        // The old hub keyed Web_Dept on Grp, so the cache reads
        // {HA: 'Aluminium'} — genuine text, but never matching a department
        // code, so every chip falls back to showing 'AVT'.
        //
        // The check that catches both: a department lookup whose keys share
        // nothing with the department codes actually on stock is wrong, no
        // matter how plausible its values look.
        if (map.isNotEmpty) {
          final known = await _departmentCodesInUse(
              effectiveCompanyCode, resolvedMode);
          if (known.isNotEmpty) {
            final hits = known.where((c) => map.containsKey(c)).length;
            if (hits == 0) {
              print('♻️ InventoryService.getDepartmentMap: cached keys match no '
                  'department in stock (${map.length} entries, likely keyed on '
                  'the wrong level) — refetching');
              map.clear();
            }
          }
        }

        if (map.isNotEmpty) {

          print('📱 InventoryService.getDepartmentMap: Loaded ${map.length} departments from local database');

          _deptDescriptionCache[cacheKey] = map;



          // Try to sync from server in background (non-blocking)

          _syncDepartmentsInBackground(effectiveCompanyCode, resolvedMode);

          

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

      final List<String> methodCandidates = resolvedMode == TaxonomyMode.web
          ? const [
              'getWebDeptLookup',
              'getWebDepts',
            ]
          : const [
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



      // Hub lookups now answer with an envelope, `{rows: [...], map: {...}}`,
      // so the level being described can be named explicitly rather than
      // guessed from column order. Unwrap it before the shapes below run —
      // otherwise 'rows' and 'map' are themselves read as taxonomy codes and
      // every label comes back as its own code.
      result = _unwrapLookupEnvelope(result);

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
              // Group qualifies the code. Without it the seven web meanings of
              // AVT collapse to whichever row was written last.
              final grp = (row['grp'] ?? row['Grp'] ?? row['GRP'] ??
                      row['group'] ?? row['Group'] ?? '')
                  .toString()
                  .trim();

              final desc = (

                row['description'] ?? row['Description'] ?? row['DESCRIPTION'] ??

                row['deptDesc'] ?? row['DeptDesc'] ?? row['Dept_Desc'] ?? row['DEPT_DESC'] ??

                row['desc'] ?? row['Desc']

              )?.toString();

              if (code != null && code.isNotEmpty && desc != null && desc.isNotEmpty) {

                final k2 = code.trim();
                final k3 = k2.toUpperCase();
                // The composite entry is authoritative.
                if (grp.isNotEmpty) serverMap['$grp|$k3'] = desc;
                // A bare-code entry is kept only while the code means one
                // thing. As soon as a second meaning appears the bare key is
                // marked ambiguous, so a confidently wrong label can never be
                // shown in place of no label.
                final existing = serverMap[k3];
                if (existing == null) {
                  serverMap[code] = desc;
                  serverMap[k2] = desc;
                  serverMap[k3] = desc;
                } else if (existing != desc && existing != _ambiguousLabel) {
                  serverMap[code] = _ambiguousLabel;
                  serverMap[k2] = _ambiguousLabel;
                  serverMap[k3] = _ambiguousLabel;
                }

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



      // Save to local database for offline use. Persist from serverMap so it
      // works whether the hub returned a list of rows OR a code→desc map.

      if (serverMap.isNotEmpty) {

        try {

          await isar.writeTxn(() async {

            // Clear old departments for this company + mode (leave the other).

            await isar.departmentLookups

                .filter()

                .companyCodeEqualTo(effectiveCompanyCode)

                .and()

                .taxonomyModeEqualTo(resolvedMode.name)

                .deleteAll();



            // Save new departments

            final departments = <DepartmentLookup>[];

            serverMap.forEach((code, desc) {

              final c = code.trim();

              if (c.isEmpty) return;

              final parts = c.split('|');
              departments.add(DepartmentLookup()
                ..companyCode = effectiveCompanyCode
                ..taxonomyMode = resolvedMode.name
                ..groupCode = parts.length == 2 ? parts[0] : ''
                ..departmentCode = parts.length == 2 ? parts[1] : c

                ..description = desc.trim().isEmpty ? c : desc.trim()

                ..lastUpdated = DateTime.now());

            });

            await isar.departmentLookups.putAll(departments);

            print('💾 InventoryService.getDepartmentMap: Saved ${departments.length} ${resolvedMode.name} departments to local database');

          });

        } catch (e) {

          print('❌ InventoryService.getDepartmentMap: Error saving to local: $e');

        }

      }

      

      // Cache and return

      _deptDescriptionCache[cacheKey] = serverMap;

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



  // Save inventory items to local database with upsert (insert or update)

  // Uses skuNo + companyCode as unique key to avoid duplicates

  Future<void> saveInventoryToLocal(List<InventoryItem> items, {int? companyCode, bool fullReplace = false}) async {

    try {

      print('💾 INVENTORY SERVICE: Saving ${items.length} items to local database (fullReplace=$fullReplace)...');

      

      int inserted = 0;

      int updated = 0;

      

      await isar.writeTxn(() async {

        // If fullReplace is true, delete all existing items for the company first (legacy behavior)

        if (fullReplace && companyCode != null) {

          await isar.inventoryItems

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

          print('💾 INVENTORY SERVICE: Cleared existing items for company $companyCode (full replace)');

          inserted = items.length;

          await isar.inventoryItems.putAll(items);
          invalidateFilterOptions();

        } else {

          // Upsert pattern: check each item and update if exists, insert if new

          for (final item in items) {

            final existing = await isar.inventoryItems

                .filter()

                .companyCodeEqualTo(item.companyCode)

                .and()

                .skuNoEqualTo(item.skuNo)

                .findFirst();

            

            if (existing != null) {

              // Update existing - preserve Isar ID

              item.id = existing.id;

              updated++;

            } else {

              inserted++;

            }

            

            await isar.inventoryItems.put(item);

          }

        }

      });



      print('💾 INVENTORY SERVICE: Saved ${items.length} items (inserted: $inserted, updated: $updated)');

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

      

      // Catalogue visibility: In_Stock.Flag3 = 'N' means "not for this app",
      // so only Flag3 = 'Y' (or unset) items are browsable.
      //
      // A site that has not flagged its items yet will show an EMPTY list —
      // that is correct behaviour, not a sync fault. Checked at MDS Sarawak
      // on 2026-08-06: 599 of 600 sampled items were 'N', so exactly one item
      // is expected to appear until they flag more.

      allItems = allItems

          .where((it) => (it.flag3 == null || it.flag3!.toUpperCase() != 'N'))

          .toList();



      // Apply filters

      List<InventoryItem> filteredItems = allItems;

      

      // Apply inventory-specific filters

      if (filter != null) {

        filteredItems = _applyInventoryFilter(filteredItems, filter);

      }

      

      // Apply search filter if provided

      if (searchQuery != null && searchQuery.isNotEmpty) {

        // Split search query by spaces for wildcard matching

        final searchTerms = searchQuery.toLowerCase().split(' ').where((term) => term.isNotEmpty).toList();

        

        filteredItems = filteredItems.where((item) {

          // Combine all searchable fields into one string

          final searchableText = [

            item.description?.toLowerCase() ?? '',

            item.articleNo?.toLowerCase() ?? '',

            item.articleDesc?.toLowerCase() ?? '',

            item.brand?.toLowerCase() ?? '',

            item.skuNo.toString(),

          ].join(' ');

          

          // Check if all search terms are present (wildcard matching like %A%BAT%PA%)

          return searchTerms.every((term) => searchableText.contains(term));

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

    

    // Both taxonomies address the SAME item columns.
    //
    // Web_Group and Web_Dept are keyed by the PI codes — every one of the 28
    // Web_Dept rows matches a PI_Department (grp, dept). They are a curated,
    // renamed view of the PI hierarchy, not a separate one: JTC is
    // "JINTYE CORPORATION SDN BHD" in PI and "AppleLady" on the web.
    //
    // In_Stock.Web_Grp / Web_Dept hold a different code set (JT, KW, HW, PVC)
    // that has no description row anywhere in RMS, so filtering on them can
    // only ever produce unlabelled chips. They are not used.
    //
    // The mode therefore selects which NAMES to show and which departments are
    // published, never which column to match on.


    // Group filter
    if (filter.groups != null && filter.groups!.isNotEmpty) {
      filtered = filtered.where((item) =>
        filter.groups!.contains(item.grp)).toList();
    }

    // Department filter
    if (filter.departments != null && filter.departments!.isNotEmpty) {
      filtered = filtered.where((item) =>
        matchesDepartmentSelection(filter.departments!, item)).toList();
    }

    // Sub-Department filter
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
      final rows = await _taxonomyRows(companyCode ?? 0);

      // Both taxonomies address the same item columns; the mode decides which
      // NAMES are shown, not which column is matched. See applyFilters.
      //
      // A department is qualified by its group, because the same code is
      // reused under several groups with a different meaning in each.
      String deptKey(TaxonomyRow r) =>
          r.grp.isEmpty ? r.dept : '${r.grp}|${r.dept}';

      final groupSel = groups == null || groups.isEmpty ? null : groups.toSet();
      final deptSel =
          departments == null || departments.isEmpty ? null : departments.toSet();
      final subSel = subDepartments == null || subDepartments.isEmpty
          ? null
          : subDepartments.toSet();

      final groupsSet = <String>{};
      final departmentsSet = <String>{};
      final subDepartmentsSet = <String>{};
      final categoriesSet = <String>{};
      final brandsSet = <String>{};
      final statusesSet = <String>{};

      // One pass. Each level is gated by the levels above it, and no level
      // filters by its own selection — otherwise choosing one option would
      // hide the others and make the choice impossible to change.
      for (final r in rows) {
        if (r.grp.isNotEmpty) groupsSet.add(r.grp);

        final inGroup = groupSel == null || groupSel.contains(r.grp);
        if (!inGroup) continue;

        final dk = deptKey(r);
        if (r.dept.isNotEmpty) departmentsSet.add(dk);

        final inDept = deptSel == null || deptSel.contains(dk);
        if (!inDept) continue;

        if (r.subDept.isNotEmpty) subDepartmentsSet.add(r.subDept);

        final inSub = subSel == null || subSel.contains(r.subDept);
        if (!inSub) continue;

        if (r.category.isNotEmpty) categoriesSet.add(r.category);
        if (r.brand.isNotEmpty) brandsSet.add(r.brand);
        if (r.status.isNotEmpty) statusesSet.add(r.status);
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
      return const {
        'groups': <String>[],
        'departments': <String>[],
        'subDepartments': <String>[],
        'categories': <String>[],
        'brands': <String>[],
        'statuses': <String>[],
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



      // OFFLINE-FIRST: serve local cache immediately, kick off background
      // sync (fire-and-forget) so the UI never waits on the network.
      //
      // - forceRefresh=true means the caller explicitly wants fresh data
      //   AND will await it (used by the manual "Refresh" buttons).
      // - forceRefresh=false (default, normal page load) returns local
      //   data instantly while a background sync runs to update the cache.
      //   The next page load will see the fresher data.
      //
      // BaseInvSync has its own single-flight guard, so multiple background
      // triggers within a session safely de-duplicate.

      if (forceRefresh) {
        // Explicit refresh: await so the caller sees the fresh result.
        try {
          await BaseInventorySyncService().syncAll(companyCode: effectiveCompanyCode);
        } catch (e) {
          print('⚠️ INVENTORY SERVICE: BaseInvSync (force) failed: $e — using cached data');
        }
        _fullSyncedCompanies.add(effectiveCompanyCode);
      } else if (!_fullSyncedCompanies.contains(effectiveCompanyCode)) {
        // Normal page load: fire and forget. Mark as "in progress" up
        // front so concurrent getInventory calls don't all schedule.
        _fullSyncedCompanies.add(effectiveCompanyCode);
        // ignore: unawaited_futures
        BaseInventorySyncService()
            .syncAll(companyCode: effectiveCompanyCode)
            .catchError((e) {
          // Network failed — leave local cache untouched. Next sync attempt
          // (e.g. Refresh button or app foreground) will retry.
          print('⚠️ INVENTORY SERVICE: background BaseInvSync failed: $e — cache preserved');
          // Allow another attempt next time getInventory is called by removing
          // the in-progress mark on failure.
          _fullSyncedCompanies.remove(effectiveCompanyCode);
        });
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

        // Split search query by spaces for wildcard matching

        final searchTerms = searchQuery.toLowerCase().split(' ').where((term) => term.isNotEmpty).toList();

        

        filteredItems = filteredItems.where((item) {

          // Combine all searchable fields into one string

          final searchableText = [

            item.description?.toLowerCase() ?? '',

            item.articleNo?.toLowerCase() ?? '',

            item.articleDesc?.toLowerCase() ?? '',

            item.brand?.toLowerCase() ?? '',

            item.skuNo.toString(),

          ].join(' ');

          

          // Check if all search terms are present (wildcard matching like %A%BAT%PA%)

          return searchTerms.every((term) => searchableText.contains(term));

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

          await isar.inStockUoms

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

          await isar.inStockPlus

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

          await isar.inStockLocations

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

          await isar.customerPlus

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

          await isar.syncCheckpoints

              .filter()

              .companyCodeEqualTo(companyCode)

              .deleteAll();

        } else {

          await isar.inventoryItems.clear();
        invalidateFilterOptions();
          invalidateFilterOptions();

          await isar.inStockUoms.clear();

          await isar.inStockPlus.clear();

          await isar.inStockLocations.clear();

          await isar.customerPlus.clear();

          await isar.syncCheckpoints.clear();

        }

      });

      print('🗑️ INVENTORY SERVICE: Cleared inventory + UOM + PLU + Location + CustomerPlu + checkpoints');

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

        await isar.inStockUoms.clear();

        await isar.inStockPlus.clear();

        await isar.inStockLocations.clear();

        await isar.customerPlus.clear();

        await isar.syncCheckpoints.clear();

      });

      print('🗑️ INVENTORY SERVICE: Cleared ALL inventory + UOM + PLU + Location + CustomerPlu + checkpoints');

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

  void _syncGroupsInBackground(int companyCode, TaxonomyMode mode) {

    Future.microtask(() async {

      try {

        if (!await OfflineFirstService.isServerReachable()) return;

        if (!_signalRService.isConnected) {

          try { await _signalRService.connect(); } catch (_) { return; }

        }

        if (!_signalRService.isConnected) return;



        // Try to fetch from server — method set matches the taxonomy mode.

        dynamic result;

        final List<String> methodCandidates = mode == TaxonomyMode.web

            ? const ['getWebGroupLookup', 'getWebGroups']

            : const ['getGroupLookup', 'getGroups', 'GetGroups', 'getPiGroups', 'GetPI_Group'];



        for (final method in methodCandidates) {

          try {

            result = await _signalRService.invoke(method, [companyCode]);

            if (result != null) break;

          } catch (_) {}

        }



        if (result == null) return;

        // The hub answers with `{rows: [...], map: {...}}`. Without unwrapping,
        // the two envelope keys are read as taxonomy codes and exactly two bogus
        // rows get cached — which is what "Saved 2 web groups" was.
        result = _unwrapLookupEnvelope(result);



        // Normalize both hub shapes (list of rows OR code→desc map) to code→desc.

        final norm = <String, String>{};

        if (result is List) {

          for (final row in result) {

            if (row is Map) {

              final code = (row['grp'] ?? row['Grp'] ?? row['code'])?.toString();

              final desc = (row['description'] ?? row['Description'] ?? row['desc'])?.toString();

              if (code != null && code.trim().isNotEmpty) {

                norm[code.trim()] = (desc == null || desc.trim().isEmpty) ? code.trim() : desc.trim();

              }

            }

          }

        } else if (result is Map) {

          result.forEach((k, v) {

            final code = k?.toString().trim();

            if (code != null && code.isNotEmpty) {

              norm[code] = (v == null || v.toString().trim().isEmpty) ? code : v.toString().trim();

            }

          });

        }

        if (norm.isEmpty) return;



        // Save to database (this mode's rows only).

        await isar.writeTxn(() async {

          await isar.groupLookups.filter().companyCodeEqualTo(companyCode).and().taxonomyModeEqualTo(mode.name).deleteAll();

          final groups = <GroupLookup>[];

          norm.forEach((code, desc) {

            groups.add(GroupLookup()

              ..companyCode = companyCode

              ..taxonomyMode = mode.name

              ..grp = code

              ..description = desc

              ..lastUpdated = DateTime.now());

          });

          await isar.groupLookups.putAll(groups);

          print('🔄 Background sync: Saved ${groups.length} ${mode.name} groups for company $companyCode');

        });



        // Update in-memory cache (with trim/upper variants for lookups).

        final map = <String, String>{};

        norm.forEach((code, desc) {

          map[code] = desc;

          map[code.trim()] = desc;

          map[code.trim().toUpperCase()] = desc;

        });

        _groupDescriptionCache[_lkKey(companyCode, mode)] = map;

      } catch (e) {

        print('❌ Background group sync failed: $e');

      }

    });

  }

  

  /// Background sync for departments (non-blocking)

  void _syncDepartmentsInBackground(int companyCode, TaxonomyMode mode) {

    Future.microtask(() async {

      try {

        if (!await OfflineFirstService.isServerReachable()) return;

        if (!_signalRService.isConnected) {

          try { await _signalRService.connect(); } catch (_) { return; }

        }

        if (!_signalRService.isConnected) return;

        

        // Try to fetch from server — method set matches the taxonomy mode.

        dynamic result;

        final List<String> methodCandidates = mode == TaxonomyMode.web

            ? const ['getWebDeptLookup', 'getWebDepts']

            : const ['getDepartmentLookup', 'getDepartments', 'GetDepartments', 'getPiDepartments'];



        for (final method in methodCandidates) {

          try {

            result = await _signalRService.invoke(method, [companyCode]);

            if (result != null) break;

          } catch (_) {}

        }



        if (result == null) return;

        // The hub answers with `{rows: [...], map: {...}}`. Without unwrapping,
        // the two envelope keys are read as taxonomy codes and exactly two bogus
        // rows get cached — which is what "Saved 2 web groups" was.
        result = _unwrapLookupEnvelope(result);



        // Normalize both hub shapes (list of rows OR code→desc map) to code→desc.

        final norm = <String, String>{};

        if (result is List) {

          for (final row in result) {

            if (row is Map) {

              final code = (row['dept'] ?? row['Dept'] ?? row['departmentCode'] ?? row['code'])?.toString();

              final desc = (row['description'] ?? row['Description'] ?? row['desc'])?.toString();

              if (code != null && code.trim().isNotEmpty) {

                norm[code.trim()] = (desc == null || desc.trim().isEmpty) ? code.trim() : desc.trim();

              }

            }

          }

        } else if (result is Map) {

          result.forEach((k, v) {

            final code = k?.toString().trim();

            if (code != null && code.isNotEmpty) {

              norm[code] = (v == null || v.toString().trim().isEmpty) ? code : v.toString().trim();

            }

          });

        }

        if (norm.isEmpty) return;



        // Save to database (this mode's rows only).

        await isar.writeTxn(() async {

          await isar.departmentLookups.filter().companyCodeEqualTo(companyCode).and().taxonomyModeEqualTo(mode.name).deleteAll();

          final departments = <DepartmentLookup>[];

          norm.forEach((key, desc) {
            // Keys are "GRP|DEPT" wherever the source supplied a group.
            final parts = key.split('|');

            departments.add(DepartmentLookup()

              ..companyCode = companyCode

              ..taxonomyMode = mode.name

              ..groupCode = parts.length == 2 ? parts[0] : ''
              ..departmentCode = parts.length == 2 ? parts[1] : key

              ..description = desc

              ..lastUpdated = DateTime.now());

          });

          await isar.departmentLookups.putAll(departments);

          print('🔄 Background sync: Saved ${departments.length} ${mode.name} departments for company $companyCode');

        });



        // Update in-memory cache (with trim/upper variants for lookups).

        final map = <String, String>{};

        norm.forEach((code, desc) {

          map[code] = desc;

          map[code.trim()] = desc;

          map[code.trim().toUpperCase()] = desc;

        });

        _deptDescriptionCache[_lkKey(companyCode, mode)] = map;

      } catch (e) {

        print('❌ Background department sync failed: $e');

      }

    });

  }

}

