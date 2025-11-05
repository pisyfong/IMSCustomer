import 'package:isar/isar.dart';
import '../models/invoice.dart';
import 'signalr_service.dart';
import '../main.dart';

class InvoiceService {
  final SignalRService _signalRService;

  InvoiceService(this._signalRService);

  /// Get invoices with TRUE offline-first pattern
  /// Returns cached data immediately, syncs in background
  Future<List<Invoice>> getInvoices({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
    bool forceRefresh = false,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Getting invoices (offline-first)...');
      
      // ALWAYS load from local cache first for instant response
      final localInvoices = await getLocalInvoices(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: searchQuery,
      );
      
      // If we have cached data and not forcing refresh, return immediately
      if (localInvoices.isNotEmpty && !forceRefresh) {
        print('✅ INVOICE SERVICE: Returning ${localInvoices.length} cached invoices (instant)');
        
        // Sync in background without blocking
        if (_signalRService.isConnected) {
          _syncInvoicesInBackground(
            companyCode: companyCode,
            customerCode: customerCode,
            searchQuery: searchQuery,
          );
        }
        
        return localInvoices;
      }
      
      // If no cache or force refresh, fetch from server
      if (_signalRService.isConnected) {
        try {
          print('📡 INVOICE SERVICE: No cache, fetching from server...');
          final serverInvoices = await fetchInvoicesFromServer(
            companyCode: companyCode,
            customerCode: customerCode,
            searchQuery: searchQuery,
          );
          
          // Save to local database
          if (serverInvoices.isNotEmpty) {
            await saveInvoicesToLocal(serverInvoices);
          }
          
          return serverInvoices;
        } catch (e) {
          print('⚠️ INVOICE SERVICE: Server fetch failed: $e');
          // Return cached data even if empty
          return localInvoices;
        }
      }
      
      // Offline and no cache
      print('📱 INVOICE SERVICE: Offline, returning ${localInvoices.length} cached invoices');
      return localInvoices;
    } catch (e) {
      print('❌ INVOICE SERVICE ERROR: $e');
      rethrow;
    }
  }
  
  /// Sync invoices in background without blocking UI
  Future<void> _syncInvoicesInBackground({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔄 INVOICE SERVICE: Background sync started...');
      final serverInvoices = await fetchInvoicesFromServer(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: searchQuery,
      );
      
      if (serverInvoices.isNotEmpty) {
        await saveInvoicesToLocal(serverInvoices);
        print('✅ INVOICE SERVICE: Background sync completed (${serverInvoices.length} invoices)');
      }
    } catch (e) {
      print('⚠️ INVOICE SERVICE: Background sync failed: $e');
      // Silently fail - user already has cached data
    }
  }

  /// Fetch invoices from server via SignalR
  Future<List<Invoice>> fetchInvoicesFromServer({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Fetching invoices from server...');
      print('  - companyCode: $companyCode');
      print('  - customerCode: "$customerCode"');
      print('  - searchQuery: "${searchQuery ?? ''}"');

      if (companyCode == null) {
        throw Exception('Company code is required');
      }

      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        print('🔍 INVOICE SERVICE: SignalR not connected, attempting to connect...');
        await _signalRService.connect();
      }

      if (!_signalRService.isConnected) {
        throw Exception('Unable to establish SignalR connection');
      }

      final effectiveCustomerCode = (customerCode?.isEmpty ?? true) ? '' : customerCode;

      final response = await _signalRService.invoke('getInvoices', [
        companyCode,
        effectiveCustomerCode,
        searchQuery ?? '',
      ]);

      print('📦 INVOICE SERVICE: Received response from server');

      if (response == null) {
        print('⚠️ INVOICE SERVICE: Null response from server');
        return [];
      }

      List<dynamic> invoiceList;
      if (response is List) {
        invoiceList = response;
      } else if (response is Map && response.containsKey('invoices')) {
        invoiceList = response['invoices'] as List;
      } else {
        print('⚠️ INVOICE SERVICE: Unexpected response format: ${response.runtimeType}');
        return [];
      }

      print('📋 INVOICE SERVICE: Processing ${invoiceList.length} invoices');

      final invoices = invoiceList
          .map((json) {
            try {
              return Invoice.fromJson(json as Map<String, dynamic>);
            } catch (e) {
              print('❌ INVOICE SERVICE: Error parsing invoice: $e');
              print('   JSON: $json');
              return null;
            }
          })
          .whereType<Invoice>()
          .toList();

      print('✅ INVOICE SERVICE: Successfully parsed ${invoices.length} invoices');
      return invoices;
    } catch (e, stackTrace) {
      print('❌ INVOICE SERVICE ERROR: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Save invoices to local database
  Future<void> saveInvoicesToLocal(List<Invoice> invoices) async {
    try {
      await isar.writeTxn(() async {
        await isar.invoices.putAll(invoices);
      });
      print('💾 INVOICE SERVICE: Saved ${invoices.length} invoices to local database');
    } catch (e) {
      print('❌ INVOICE SERVICE: Error saving to local: $e');
    }
  }

  /// Get invoices from local database
  Future<List<Invoice>> getLocalInvoices({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      var query = isar.invoices.where();
      
      // Build the query with filters
      var results = await query.findAll();
      
      // Apply filters in memory
      if (companyCode != null) {
        results = results.where((inv) => inv.companyCode == companyCode).toList();
      }
      
      if (customerCode != null && customerCode.isNotEmpty) {
        results = results.where((inv) => inv.customer == customerCode).toList();
      }
      
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final searchLower = searchQuery.toLowerCase();
        results = results.where((inv) =>
          (inv.invoicePreLabel.toLowerCase().contains(searchLower)) ||
          (inv.customer?.toLowerCase().contains(searchLower) ?? false) ||
          (inv.ref1?.toLowerCase().contains(searchLower) ?? false) ||
          (inv.remark1?.toLowerCase().contains(searchLower) ?? false)
        ).toList();
      }
      
      // Sort by date descending
      results.sort((a, b) {
        final dateA = a.invoiceDate ?? DateTime(1970);
        final dateB = b.invoiceDate ?? DateTime(1970);
        return dateB.compareTo(dateA);
      });
      
      print('📱 INVOICE SERVICE: Loaded ${results.length} invoices from local database');
      return results;
    } catch (e) {
      print('❌ INVOICE SERVICE: Error loading from local: $e');
      return [];
    }
  }

  /// Get invoice items for a SKU with online fallback to populate cache when empty
  Future<List<Map<String, dynamic>>> getInvoiceItemsBySkuWithOnlineFallback({
    required int companyCode,
    required String customerCode,
    required int skuNo,
    String? filterUom,
    int limit = 10,
    int fetchInvoicesLimit = 10,
  }) async {
    // Try local optimized path first
    final local = await getInvoiceItemsBySku(
      companyCode: companyCode,
      customerCode: customerCode,
      skuNo: skuNo,
      filterUom: filterUom,
      limit: limit,
    );
    if (local.isNotEmpty) return local;

    // If not connected, return whatever we have (empty)
    if (!_signalRService.isConnected) return local;

    try {
      // Fetch recent invoices for this customer from server
      final serverInvoices = await fetchInvoicesFromServer(
        companyCode: companyCode,
        customerCode: customerCode,
      );

      if (serverInvoices.isEmpty) return local;

      // Take a small batch to limit network calls
      final recent = serverInvoices.take(fetchInvoicesLimit).toList();

      // For each recent invoice, fetch its items and cache locally
      for (final inv in recent) {
        try {
          final items = await fetchInvoiceItemsFromServer(
            companyCode: companyCode,
            invoicePreLabel: inv.invoicePreLabel,
          );
          if (items.isNotEmpty) {
            await saveInvoiceItemsToLocal(items);
          }
        } catch (e) {
          // Skip invoice on error, continue
          continue;
        }
      }

      // Re-run local optimized query after caching
      return await getInvoiceItemsBySku(
        companyCode: companyCode,
        customerCode: customerCode,
        skuNo: skuNo,
        filterUom: filterUom,
        limit: limit,
      );
    } catch (e) {
      return local; // Return whatever we have
    }
  }

  /// Get invoice items with offline-first pattern
  Future<List<InvoiceItem>> getInvoiceItems({
    required int companyCode,
    required String invoicePreLabel,
  }) async {
    try {
      // Try to fetch from server first
      if (_signalRService.isConnected) {
        try {
          final serverItems = await fetchInvoiceItemsFromServer(
            companyCode: companyCode,
            invoicePreLabel: invoicePreLabel,
          );
          
          // Save to local database
          if (serverItems.isNotEmpty) {
            await saveInvoiceItemsToLocal(serverItems);
          }
          
          return serverItems;
        } catch (e) {
          print('⚠️ INVOICE SERVICE: Server fetch failed, falling back to local: $e');
        }
      }
      
      // Fallback to local database
      return await getLocalInvoiceItems(
        companyCode: companyCode,
        invoicePreLabel: invoicePreLabel,
      );
    } catch (e) {
      print('❌ INVOICE SERVICE ERROR: $e');
      rethrow;
    }
  }

  /// Fetch invoice items from server via SignalR
  Future<List<InvoiceItem>> fetchInvoiceItemsFromServer({
    required int companyCode,
    required String invoicePreLabel,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Fetching invoice items from server...');
      print('  - companyCode: $companyCode');
      print('  - invoicePreLabel: "$invoicePreLabel"');

      final response = await _signalRService.invoke('getInvoiceItems', [
        companyCode,
        invoicePreLabel,
      ]);

      print('📦 INVOICE SERVICE: Received invoice items response');

      if (response == null) {
        print('⚠️ INVOICE SERVICE: Null response for invoice items');
        return [];
      }

      List<dynamic> itemList;
      if (response is List) {
        itemList = response;
      } else if (response is Map && response.containsKey('items')) {
        itemList = response['items'] as List;
      } else {
        print('⚠️ INVOICE SERVICE: Unexpected response format: ${response.runtimeType}');
        return [];
      }

      print('📋 INVOICE SERVICE: Processing ${itemList.length} invoice items');

      final items = itemList
          .map((json) {
            try {
              return InvoiceItem.fromJson(json as Map<String, dynamic>);
            } catch (e, stackTrace) {
              print('❌ INVOICE SERVICE: Error parsing invoice item: $e');
              print('   Stack trace: $stackTrace');
              print('   JSON keys: ${(json as Map).keys.toList()}');
              print('   Problematic fields:');
              print('     Company_Code: ${json['Company_Code']} (${json['Company_Code'].runtimeType})');
              print('     Invoice_PreLabel: ${json['Invoice_PreLabel']} (${json['Invoice_PreLabel'].runtimeType})');
              print('     Sequence_No: ${json['Sequence_No']} (${json['Sequence_No'].runtimeType})');
              print('     DO_PreLabel: ${json['DO_PreLabel']} (${json['DO_PreLabel'].runtimeType})');
              print('     Sku_No: ${json['Sku_No']} (${json['Sku_No'].runtimeType})');
              print('     Uom: ${json['Uom']} (${json['Uom'].runtimeType})');
              return null;
            }
          })
          .whereType<InvoiceItem>()
          .toList();

      print('✅ INVOICE SERVICE: Successfully parsed ${items.length} invoice items');
      return items;
    } catch (e, stackTrace) {
      print('❌ INVOICE SERVICE ERROR: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  /// Save invoice items to local database
  Future<void> saveInvoiceItemsToLocal(List<InvoiceItem> items) async {
    try {
      await isar.writeTxn(() async {
        await isar.invoiceItems.putAll(items);
      });
      print('💾 INVOICE SERVICE: Saved ${items.length} invoice items to local database');
    } catch (e) {
      print('❌ INVOICE SERVICE: Error saving items to local: $e');
    }
  }

  /// Get invoice items from local database
  Future<List<InvoiceItem>> getLocalInvoiceItems({
    required int companyCode,
    required String invoicePreLabel,
  }) async {
    try {
      var results = await isar.invoiceItems.where().findAll();
      
      // Filter in memory
      results = results.where((item) =>
        item.companyCode == companyCode &&
        item.invoicePreLabel == invoicePreLabel
      ).toList();
      
      // Sort by sequence number
      results.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
      
      print('📱 INVOICE SERVICE: Loaded ${results.length} invoice items from local database');
      return results;
    } catch (e) {
      print('❌ INVOICE SERVICE: Error loading items from local: $e');
      return [];
    }
  }
  
  /// Get invoice items for a specific SKU across all invoices (OPTIMIZED)
  /// This is much faster than loading all items per invoice then filtering
  Future<List<Map<String, dynamic>>> getInvoiceItemsBySku({
    required int companyCode,
    required String customerCode,
    required int skuNo,
    String? filterUom,
    int limit = 10,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Optimized query - Getting items for SKU $skuNo');
      
      // Load all invoice items from local database
      var allItems = await isar.invoiceItems.where().findAll();
      
      // Filter by company code and SKU in memory
      var filteredItems = allItems.where((item) =>
        item.companyCode == companyCode &&
        item.skuNo == skuNo
      ).toList();
      
      // Apply UOM filter if specified
      if (filterUom != null && filterUom.isNotEmpty) {
        filteredItems = filteredItems.where((item) => item.uom == filterUom).toList();
      }
      
      print('📊 INVOICE SERVICE: Found ${filteredItems.length} matching items for SKU $skuNo');
      
      // Get corresponding invoices to include invoice date and customer info
      final invoicePreLabels = filteredItems.map((item) => item.invoicePreLabel).toSet();
      var allInvoices = await isar.invoices.where().findAll();
      
      // Filter invoices by customer and get only those with matching items
      final invoiceMap = <String, Invoice>{};
      for (final invoice in allInvoices) {
        if (invoice.companyCode == companyCode &&
            invoice.customer == customerCode &&
            invoicePreLabels.contains(invoice.invoicePreLabel)) {
          invoiceMap[invoice.invoicePreLabel] = invoice;
        }
      }
      
      print('📋 INVOICE SERVICE: Found ${invoiceMap.length} invoices for customer $customerCode out of ${invoicePreLabels.length} invoice labels');
      if (invoiceMap.isEmpty && invoicePreLabels.isNotEmpty) {
        print('⚠️ INVOICE SERVICE: Invoice items exist but invoice headers not synced for customer $customerCode');
        print('   Invoice labels needed: ${invoicePreLabels.take(3).join(", ")}...');
        
        // Auto-fetch missing invoice headers if connected
        if (_signalRService.isConnected) {
          print('🔄 INVOICE SERVICE: Auto-fetching invoice headers for customer $customerCode...');
          try {
            final fetchedInvoices = await fetchInvoicesFromServer(
              companyCode: companyCode,
              customerCode: customerCode,
            );
            if (fetchedInvoices.isNotEmpty) {
              await saveInvoicesToLocal(fetchedInvoices);
              print('✅ INVOICE SERVICE: Auto-fetched ${fetchedInvoices.length} invoice headers');
              
              // Rebuild invoice map with newly fetched invoices
              for (final invoice in fetchedInvoices) {
                if (invoicePreLabels.contains(invoice.invoicePreLabel)) {
                  invoiceMap[invoice.invoicePreLabel] = invoice;
                }
              }
            }
          } catch (e) {
            print('❌ INVOICE SERVICE: Auto-fetch failed: $e');
          }
        }
      }
      
      // Build result list with invoice date (offline-first: show items even without full invoice details)
      final List<Map<String, dynamic>> results = [];
      for (final item in filteredItems) {
        final invoice = invoiceMap[item.invoicePreLabel];
        results.add({
          'invoiceNo': item.invoicePreLabel,
          'date': invoice?.invoiceDate ?? item.dueDate ?? DateTime.now(), // Fallback to item due date or current date
          'qty': item.quantity ?? 0,
          'uom': item.uom,
          'price': item.unitPrice ?? 0,
        });
      }
      
      // Sort by date (newest first)
      results.sort((a, b) {
        final dateA = a['date'] as DateTime? ?? DateTime(1970);
        final dateB = b['date'] as DateTime? ?? DateTime(1970);
        return dateB.compareTo(dateA);
      });
      
      // Return limited results
      final limitedResults = results.take(limit).toList();
      print('✅ INVOICE SERVICE: Returning ${limitedResults.length} optimized results');
      
      return limitedResults;
    } catch (e) {
      print('❌ INVOICE SERVICE: Error in optimized SKU query: $e');
      return [];
    }
  }
}
