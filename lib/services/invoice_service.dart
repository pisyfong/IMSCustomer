import 'package:isar/isar.dart';
import '../models/invoice.dart';
import 'signalr_service.dart';
import '../main.dart';

class InvoiceService {
  final SignalRService _signalRService;

  InvoiceService(this._signalRService);

  /// Get invoices with offline-first pattern
  Future<List<Invoice>> getInvoices({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Getting invoices (offline-first)...');
      
      // Try to fetch from server first
      if (_signalRService.isConnected) {
        try {
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
          print('⚠️ INVOICE SERVICE: Server fetch failed, falling back to local: $e');
        }
      }
      
      // Fallback to local database
      print('📱 INVOICE SERVICE: Loading from local database...');
      return await getLocalInvoices(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: searchQuery,
      );
    } catch (e) {
      print('❌ INVOICE SERVICE ERROR: $e');
      rethrow;
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
      var query = isar.invoices.filter();
      
      if (companyCode != null) {
        query = query.companyCodeEqualTo(companyCode);
      }
      
      if (customerCode != null && customerCode.isNotEmpty) {
        query = query.and().customerEqualTo(customerCode);
      }
      
      if (searchQuery != null && searchQuery.isNotEmpty) {
        query = query.and().group((q) => q
          .invoicePreLabelContains(searchQuery, caseSensitive: false)
          .or()
          .customerContains(searchQuery, caseSensitive: false)
          .or()
          .ref1Contains(searchQuery, caseSensitive: false)
          .or()
          .remark1Contains(searchQuery, caseSensitive: false)
        );
      }
      
      final invoices = await query.sortByInvoiceDateDesc().findAll();
      print('📱 INVOICE SERVICE: Loaded ${invoices.length} invoices from local database');
      return invoices;
    } catch (e) {
      print('❌ INVOICE SERVICE: Error loading from local: $e');
      return [];
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
      final items = await isar.invoiceItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .invoicePreLabelEqualTo(invoicePreLabel)
          .sortBySequenceNo()
          .findAll();
      
      print('📱 INVOICE SERVICE: Loaded ${items.length} invoice items from local database');
      return items;
    } catch (e) {
      print('❌ INVOICE SERVICE: Error loading items from local: $e');
      return [];
    }
  }
}
