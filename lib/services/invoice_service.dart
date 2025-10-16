import '../models/invoice.dart';
import 'signalr_service.dart';

class InvoiceService {
  final SignalRService _signalRService;

  InvoiceService(this._signalRService);

  /// Fetch invoices from server via SignalR
  Future<List<Invoice>> getInvoices({
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

  /// Fetch invoice items for a specific invoice
  Future<List<InvoiceItem>> getInvoiceItems({
    required int companyCode,
    required String invoicePreLabel,
  }) async {
    try {
      print('🔍 INVOICE SERVICE: Fetching invoice items...');
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
            } catch (e) {
              print('❌ INVOICE SERVICE: Error parsing invoice item: $e');
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
}
