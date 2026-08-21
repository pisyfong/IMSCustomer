import 'package:isar/isar.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/plu.dart';
import '../models/customer_plu.dart';
import '../models/in_stock_plu.dart';
import '../models/pack_list_item.dart';
import '../models/pick_list_item.dart';
import '../models/in_stock_uom.dart';
import '../models/uom_master.dart';
import '../models/pending_plu.dart';
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

  /// The company's UOM master list, from the local cache.
  ///
  /// Read from Isar, never the network, so the "units this item doesn't have
  /// yet" half of the barcode screen works on the warehouse floor. That is the
  /// case the screen exists for — a new case code usually arrives BECAUSE the
  /// item just gained a pack size nobody had recorded — so requiring a signal
  /// for it made the feature useless exactly when it was needed.
  ///
  /// [refreshUomMaster] keeps it current; 22 rows, so it is replaced whole.
  Future<List<({String uom, String description})>> uomMaster(
      int companyCode) async {
    final rows = await _isar.uomMasters
        .filter()
        .companyCodeEqualTo(companyCode)
        .findAll();
    rows.sort((a, b) => a.uom.compareTo(b.uom));
    return [
      for (final r in rows)
        (uom: r.uom, description: (r.description ?? '').trim()),
    ];
  }

  /// Pulls the UOM master and replaces the cache. Never throws — a stale unit
  /// list degrades to "the units this item already has", which still links a
  /// barcode.
  Future<void> refreshUomMaster(int companyCode) async {
    try {
      final res = await http
          .get(
            Uri.parse('${AppConfig.apiBaseUrl}/api/uoms?companyCode=$companyCode'),
            headers: AppConfig.apiHeaders,
          )
          .timeout(const Duration(seconds: 20));
      if (res.statusCode != 200) return;
      final body = json.decode(res.body) as Map<String, dynamic>;
      final rows = <UomMaster>[];
      for (final u in (body['uoms'] as List? ?? [])) {
        final uom = (u['Uom'] ?? '').toString().trim();
        if (uom.isEmpty) continue;
        rows.add(UomMaster.of(
          companyCode: companyCode,
          uom: uom,
          description: (u['Description'] ?? '').toString().trim(),
        ));
      }
      if (rows.isEmpty) return; // never blank a working cache on an odd reply
      await _isar.writeTxn(() async {
        final old = await _isar.uomMasters
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
        await _isar.uomMasters.deleteAll(old.map((e) => e.id).toList());
        await _isar.uomMasters.putAll(rows);
      });
    } catch (_) {
      // Offline. The cache stands.
    }
  }

  /// Gives a SKU a unit it doesn't have yet, with its pack factor — offline.
  ///
  /// Written locally and queued, like a barcode. The unit is usable on this
  /// device immediately so the picker can carry straight on to the barcode
  /// step and keep working.
  ///
  /// The factor cannot be guessed: it says how many base units are in one of
  /// these, and a wrong one restates the quantity of every document that ever
  /// uses the unit. That is why the server still gets the last word — see
  /// [syncPendingSkuUoms].
  Future<void> addSkuUomOffline({
    required int companyCode,
    required int skuNo,
    required String uom,
    required double factor,
    required int userId,
    String? sourceDoc,
  }) async {
    final u = uom.trim();
    if (u.isEmpty || factor <= 0) return;
    final now = DateTime.now();
    await _isar.writeTxn(() async {
      final dupes = await _isar.pendingSkuUoms
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .skuNoEqualTo(skuNo)
          .findAll();
      for (final d in dupes) {
        if (d.uom.trim().toUpperCase() == u.toUpperCase()) {
          await _isar.pendingSkuUoms.delete(d.id);
        }
      }
      await _isar.pendingSkuUoms.put(PendingSkuUom.of(
        companyCode: companyCode,
        skuNo: skuNo,
        uom: u,
        factor: factor,
        addedBy: userId,
        sourceDoc: sourceDoc,
      ));
      // Usable straight away, including by the barcode step that follows.
      await _isar.inStockUoms.put(InStockUom()
        ..companyCode = companyCode
        ..skuNo = skuNo
        ..uom = u
        ..factor = factor
        ..status = 'A'
        ..lastWriteTimeStamp = now);
    });
  }

  /// Uploads queued units. Call BEFORE [syncPendingPlus]: a barcode can
  /// reference a unit created in the same trip, and linking `BOX` to an item
  /// that only gained `BOX` a minute earlier fails if the unit isn't there
  /// first.
  ///
  /// Per queued unit:
  ///   * created, or the server already has it with the SAME factor → done.
  ///   * the server has it with a DIFFERENT factor → the whole sync stops.
  ///     A factor is not a preference to be merged: quantities entered on this
  ///     device were counted against ours, so someone has to look.
  ///   * offline → left queued, nothing fails.
  ///
  /// Returns null to proceed, or a message to stop.
  /// Set when [syncPendingSkuUoms] stops on a factor disagreement, so the UI
  /// can offer to adopt the server's answer. Cleared at the start of each run.
  SkuUomConflict? lastUomConflict;

  /// Takes the server's factor for a unit this device created with a different
  /// one, and corrects what was recorded against it.
  ///
  /// The server's item master is the authority — it is what every other device
  /// and the desktop already use. Adopting it means three things, and skipping
  /// any one of them leaves the device lying:
  ///   1. the cached unit takes the server's factor;
  ///   2. the queued creation is dropped, so the sync can proceed;
  ///   3. UNSENT document lines that captured the old factor are corrected,
  ///      because the server evaluates their base-unit quantities using the
  ///      factor stored ON THE LINE.
  ///
  /// The quantity a picker counted does not change — three boxes are still
  /// three boxes. What changes is what a box means.
  Future<void> adoptServerUomFactor(SkuUomConflict c) async {
    await _isar.writeTxn(() async {
      final uoms = await _isar.inStockUoms
          .filter()
          .companyCodeEqualTo(c.companyCode)
          .and()
          .skuNoEqualTo(c.skuNo)
          .findAll();
      for (final u in uoms) {
        if ((u.uom ?? '').trim().toUpperCase() != c.uom.trim().toUpperCase()) {
          continue;
        }
        u.factor = c.theirs;
        await _isar.inStockUoms.put(u);
      }

      final queued = await _isar.pendingSkuUoms
          .filter()
          .companyCodeEqualTo(c.companyCode)
          .and()
          .skuNoEqualTo(c.skuNo)
          .findAll();
      for (final q in queued) {
        if (q.uom.trim().toUpperCase() == c.uom.trim().toUpperCase()) {
          await _isar.pendingSkuUoms.delete(q.id);
        }
      }

      // Only UNSENT lines. A line the server already holds was accepted under
      // whatever factor it carried; rewriting it here would put the two copies
      // out of step without telling anyone.
      final picks = await _isar.pickListItems
          .filter()
          .companyCodeEqualTo(c.companyCode)
          .and()
          .skuNoEqualTo(c.skuNo)
          .and()
          .isSyncedEqualTo(false)
          .findAll();
      for (final it in picks) {
        if ((it.uom ?? '').trim().toUpperCase() != c.uom.trim().toUpperCase()) {
          continue;
        }
        it.factor = c.theirs;
        await _isar.pickListItems.put(it);
      }

      final packs = await _isar.packListItems
          .filter()
          .companyCodeEqualTo(c.companyCode)
          .and()
          .skuNoEqualTo(c.skuNo)
          .and()
          .isSyncedEqualTo(false)
          .findAll();
      for (final it in packs) {
        if ((it.uom ?? '').trim().toUpperCase() != c.uom.trim().toUpperCase()) {
          continue;
        }
        it.factor = c.theirs;
        await _isar.packListItems.put(it);
      }
    });
    lastUomConflict = null;
    print('✅ UOM ${c.uom} on SKU ${c.skuNo}: adopted server factor ${c.theirs}');
  }

  Future<String?> syncPendingSkuUoms(int companyCode) async {
    lastUomConflict = null;
    final queued = await _isar.pendingSkuUoms
        .filter()
        .companyCodeEqualTo(companyCode)
        .findAll();
    if (queued.isEmpty) return null;

    for (final q in queued) {
      http.Response res;
      try {
        res = await http
            .post(
              Uri.parse('${AppConfig.apiBaseUrl}/api/sku-uoms'),
              headers: AppConfig.apiHeaders,
              body: json.encode({
                'companyCode': q.companyCode,
                'skuNo': q.skuNo,
                'uom': q.uom,
                'factor': q.factor,
                'userId': q.addedBy ?? 1,
              }),
            )
            .timeout(const Duration(seconds: 20));
      } catch (_) {
        print('⚠️ UOM: ${q.uom} for SKU ${q.skuNo} still queued (offline)');
        return null;
      }

      Map<String, dynamic> body;
      try {
        body = json.decode(res.body) as Map<String, dynamic>;
      } catch (_) {
        return 'Unit ${q.uom} on SKU ${q.skuNo}: unexpected response '
            '(${res.statusCode}).';
      }

      final created = res.statusCode == 200 && body['success'] == true;
      if (created) {
        await _isar.writeTxn(() async {
          await _isar.pendingSkuUoms.delete(q.id);
        });
        continue;
      }

      if (body['alreadyExists'] == true) {
        final theirs = (body['factor'] as num?)?.toDouble() ?? 0;
        if ((theirs - q.factor).abs() < 0.0001) {
          // Same answer from both sides — nothing to reconcile.
          await _isar.writeTxn(() async {
            await _isar.pendingSkuUoms.delete(q.id);
          });
          continue;
        }
        // Structured, not just a sentence — the caller has to be able to
        // OFFER the fix. Reporting this and leaving the row queued would fail
        // every future sync, including for documents that have nothing to do
        // with this unit, and strand the device with no way out of the app.
        lastUomConflict = SkuUomConflict(
          companyCode: q.companyCode,
          skuNo: q.skuNo,
          uom: q.uom,
          mine: q.factor,
          theirs: theirs,
          sourceDoc: q.sourceDoc,
        );
        return 'Unit ${q.uom} on SKU ${q.skuNo} already exists with factor '
            '$theirs, but this device used ${q.factor}'
            '${(q.sourceDoc ?? '').isEmpty ? '' : ' on ${q.sourceDoc}'}. '
            'Quantities entered here were counted against ${q.factor}. '
            'Nothing was uploaded.';
      }

      return 'Unit ${q.uom} on SKU ${q.skuNo}: '
          '${(body['details'] ?? body['error'] ?? 'failed')}';
    }
    return null;
  }

  /// Links a barcode to a SKU + UOM, working offline.
  ///
  /// Writes the link locally and queues it. The barcode scans IMMEDIATELY on
  /// this device — a picker who has just met a new case code can carry on
  /// scanning it down the aisle without a signal.
  ///
  /// The server is still the authority, but it gets the last word on the next
  /// sync rather than blocking the work now. See [syncPendingPlus] for what
  /// happens when it disagrees.
  Future<void> addPluOffline({
    required int companyCode,
    required String pluNo,
    required int skuNo,
    required String uom,
    required int userId,
    String? sourceDoc,
  }) async {
    final code = pluNo.trim();
    if (code.isEmpty) return;
    await _isar.writeTxn(() async {
      // One queue entry per (company, barcode) — re-linking the same code
      // before it has synced replaces the earlier intent rather than sending
      // two conflicting rows.
      final dupes = await _isar.pendingPlus
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .pluNoEqualTo(code)
          .findAll();
      for (final d in dupes) {
        await _isar.pendingPlus.delete(d.id);
      }
      await _isar.pendingPlus.put(PendingPlu.of(
        companyCode: companyCode,
        pluNo: code,
        skuNo: skuNo,
        uom: uom,
        addedBy: userId,
        sourceDoc: sourceDoc,
      ));
    });
    await _cachePluLocally(
      companyCode: companyCode,
      pluNo: code,
      skuNo: skuNo,
      uom: uom,
      userId: userId,
      isDefault: false,
    );
  }

  /// Uploads queued barcodes. Call this BEFORE uploading the documents that
  /// used them, so a pick never lands referring to a barcode the server has
  /// never heard of.
  ///
  /// Per queued link:
  ///   * accepted, or the server already has the SAME sku/uom → done, dropped
  ///     from the queue. "Already linked" is the same outcome as linking it.
  ///   * the server has that barcode against a DIFFERENT sku/uom → the whole
  ///     sync fails. A barcode means one item company-wide, so this is not a
  ///     merge to be resolved quietly: something has been scanned as the wrong
  ///     item and a person needs to look at it.
  ///   * offline / unreachable → left queued, reported as not-done. Nothing
  ///     fails; the work simply waits.
  ///
  /// Returns null when the caller may proceed, or a message when it must stop.
  Future<String?> syncPendingPlus(int companyCode) async {
    final queued = await _isar.pendingPlus
        .filter()
        .companyCodeEqualTo(companyCode)
        .findAll();
    if (queued.isEmpty) return null;

    for (final q in queued) {
      http.Response res;
      try {
        res = await http
            .post(
              Uri.parse('${AppConfig.apiBaseUrl}/api/plus'),
              headers: AppConfig.apiHeaders,
              body: json.encode({
                'companyCode': q.companyCode,
                'pluNo': q.pluNo,
                'skuNo': q.skuNo,
                'uom': q.uom,
                'userId': q.addedBy ?? 1,
              }),
            )
            .timeout(const Duration(seconds: 20));
      } catch (_) {
        // Offline. Leave it queued and let the caller carry on — the barcode
        // is already correct on this device.
        print('\u26a0\ufe0f PLU: ${q.pluNo} still queued (offline)');
        return null;
      }

      Map<String, dynamic> body;
      try {
        body = json.decode(res.body) as Map<String, dynamic>;
      } catch (_) {
        return 'Barcode ${q.pluNo}: unexpected response from the server '
            '(${res.statusCode}).';
      }

      final accepted = res.statusCode == 200 && body['success'] == true;
      final sameLink = body['alreadyLinked'] == true;

      if (accepted || sameLink) {
        await _isar.writeTxn(() async {
          await _isar.pendingPlus.delete(q.id);
        });
        print(sameLink
            ? '\u2713 PLU ${q.pluNo} already linked to SKU ${q.skuNo} — dropped'
            : '\u2713 PLU ${q.pluNo} -> SKU ${q.skuNo} (${q.uom})');
        continue;
      }

      // Taken by a different item. Stop everything: this device has been
      // scanning that barcode as the wrong goods.
      final theirSku = body['skuNo'];
      final theirUom = (body['uom'] ?? '').toString();
      return 'Barcode ${q.pluNo} is already used by SKU $theirSku '
          '($theirUom), but this device linked it to SKU ${q.skuNo} '
          '(${q.uom})${(q.sourceDoc ?? '').isEmpty ? '' : ' on ${q.sourceDoc}'}. '
          'Nothing was uploaded. Fix the barcode in the desktop app, then '
          'sync again.';
    }
    return null;
  }

  /// How many barcode links are waiting to upload.
  Future<int> pendingPluCount(int companyCode) => _isar.pendingPlus
      .filter()
      .companyCodeEqualTo(companyCode)
      .count();

  /// Writes a barcode into the local mirror so it scans immediately, rather
  /// than waiting for the next full sync.
  Future<void> _cachePluLocally({
    required int companyCode,
    required String pluNo,
    required int skuNo,
    required String uom,
    required int userId,
    required bool isDefault,
  }) async {
    final now = DateTime.now();
    await _isar.writeTxn(() async {
      final old = await _isar.inStockPlus
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .pluNoEqualTo(pluNo)
          .findAll();
      for (final o in old) {
        await _isar.inStockPlus.delete(o.id);
      }
      await _isar.inStockPlus.put(InStockPlu(
        companyCode: companyCode,
        pluNo: pluNo,
        skuNo: skuNo,
        uom: uom,
        status: 'A',
        defPlu: isDefault ? 'Y' : 'N',
        addedBy: userId,
        addedDate: now,
        lastModifiedBy: userId,
        lastWriteTimeStamp: now,
        creationDate: now,
        lastEditDate: now,
      ));
    });
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

/// A unit this device created with a factor the server disagrees with.
class SkuUomConflict {
  final int companyCode;
  final int skuNo;
  final String uom;

  /// What this device used when quantities were entered.
  final double mine;

  /// What the item master actually says.
  final double theirs;

  final String? sourceDoc;

  const SkuUomConflict({
    required this.companyCode,
    required this.skuNo,
    required this.uom,
    required this.mine,
    required this.theirs,
    this.sourceDoc,
  });
}
