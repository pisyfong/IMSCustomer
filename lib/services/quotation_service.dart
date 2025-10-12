import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../models/quotation.dart';
import '../main.dart';
import 'signalr_service.dart';
import '../config/app_config.dart';

class QuotationService {
  final SignalRService signalRService;

  QuotationService(this.signalRService);

  /// Create a new quotation (offline-first)
  Future<Quotation> createQuotation({
    required int companyCode,
    required String quotePreLabel,
    required String customer,
    DateTime? quoteDate,
    String? term,
    DateTime? quoteExpiry,
    String? status,
    Map<String, dynamic>? additionalData,
  }) async {
    final quotation = Quotation()
      ..companyCode = companyCode
      ..quotePreLabel = quotePreLabel
      ..customer = customer
      ..quoteDate = quoteDate ?? DateTime.now()
      ..term = term
      ..quoteExpiry = quoteExpiry
      ..status = status ?? 'P' // P = Pending
      ..addedDate = DateTime.now()
      ..isSynced = false; // Mark as not synced

    // Apply additional data if provided
    if (additionalData != null) {
      _applyAdditionalData(quotation, additionalData);
    }

    await isar.writeTxn(() async {
      await isar.quotations.put(quotation);
    });

    print('📝 QUOTATION: Created new quotation ${quotation.quotePreLabel} (offline, not synced)');
    return quotation;
  }

  /// Update an existing quotation
  Future<void> updateQuotation(Quotation quotation) async {
    quotation.isSynced = false; // Mark as not synced after update
    quotation.lastWriteTimeStamp = DateTime.now();

    await isar.writeTxn(() async {
      await isar.quotations.put(quotation);
    });

    print('📝 QUOTATION: Updated quotation ${quotation.quotePreLabel} (marked as not synced)');
  }

  /// Get quotation by company code and quote prelabel
  Future<Quotation?> getQuotation(int companyCode, String quotePreLabel) async {
    return await isar.quotations
        .filter()
        .companyCodeEqualTo(companyCode)
        .quotePreLabelEqualTo(quotePreLabel)
        .findFirst();
  }

  /// Get all quotations for a company
  Future<List<Quotation>> getQuotations({
    required int companyCode,
    String? customer,
    String? status,
    int limit = 100,
    int offset = 0,
  }) async {
    var query = isar.quotations
        .filter()
        .companyCodeEqualTo(companyCode);

    if (customer != null && customer.isNotEmpty) {
      query = query.customerEqualTo(customer);
    }

    if (status != null && status.isNotEmpty) {
      query = query.statusEqualTo(status);
    }

    return await query
        .sortByQuoteDateDesc()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  /// Get unsynced quotations
  Future<List<Quotation>> getUnsyncedQuotations() async {
    return await isar.quotations
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }

  /// Sync unsynced quotations to server
  Future<int> syncUnsyncedQuotations() async {
    final unsyncedQuotations = await getUnsyncedQuotations();
    
    if (unsyncedQuotations.isEmpty) {
      print('📝 QUOTATION SYNC: No unsynced quotations to sync');
      return 0;
    }

    print('📝 QUOTATION SYNC: Found ${unsyncedQuotations.length} unsynced quotations');
    int syncedCount = 0;

    for (final quotation in unsyncedQuotations) {
      try {
        // Send to server via HTTP API
        final apiUrl = '${AppConfig.apiBaseUrl}/api/quotations';
        print('📤 Sending quotation to: $apiUrl');
        
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(quotation.toJson()),
        );

        if (response.statusCode == 200) {
          // Mark as synced
          quotation.isSynced = true;
          quotation.lastSyncAttempt = DateTime.now();
          quotation.syncError = null;

          await isar.writeTxn(() async {
            await isar.quotations.put(quotation);
          });

          syncedCount++;
          print('✅ QUOTATION SYNC: Synced quotation ${quotation.quotePreLabel}');
        } else {
          throw Exception('Server returned ${response.statusCode}: ${response.body}');
        }
      } catch (e) {
        print('❌ QUOTATION SYNC: Failed to sync quotation ${quotation.quotePreLabel}: $e');
        
        // Update sync error
        quotation.lastSyncAttempt = DateTime.now();
        quotation.syncError = e.toString();

        await isar.writeTxn(() async {
          await isar.quotations.put(quotation);
        });
      }
    }

    print('📝 QUOTATION SYNC: Successfully synced $syncedCount/${unsyncedQuotations.length} quotations');
    return syncedCount;
  }

  /// Fetch quotations from server and store locally
  Future<List<Quotation>> fetchQuotationsFromServer({
    required int companyCode,
    String? customer,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      print('🌐 QUOTATION: Fetching quotations from server...');

      // Build query parameters
      final queryParams = <String, String>{
        'companyCode': companyCode.toString(),
      };
      if (customer != null) queryParams['customer'] = customer;
      if (fromDate != null) queryParams['fromDate'] = fromDate.toIso8601String();
      if (toDate != null) queryParams['toDate'] = toDate.toIso8601String();

      final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/quotations').replace(queryParameters: queryParams);
      print('📤 Fetching from: $uri');

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Server returned ${response.statusCode}: ${response.body}');
      }

      final List<dynamic> result = jsonDecode(response.body) as List<dynamic>;

      if (result.isEmpty) {
        print('📝 QUOTATION: No quotations received from server');
        return [];
      }

      final quotations = result
          .map((json) => Quotation.fromJson(json as Map<String, dynamic>))
          .toList();

      // Save to local database
      await isar.writeTxn(() async {
        for (final quotation in quotations) {
          // Check if quotation already exists
          final existing = await isar.quotations
              .filter()
              .companyCodeEqualTo(quotation.companyCode)
              .quotePreLabelEqualTo(quotation.quotePreLabel)
              .findFirst();

          if (existing != null) {
            // Update existing quotation (keep local ID)
            quotation.id = existing.id;
            // If local version is not synced, keep it unsynced
            if (!existing.isSynced) {
              quotation.isSynced = false;
            }
          }

          await isar.quotations.put(quotation);
        }
      });

      print('✅ QUOTATION: Saved ${quotations.length} quotations to local database');
      return quotations;
    } catch (e) {
      print('❌ QUOTATION: Error fetching from server: $e');
      rethrow;
    }
  }

  /// Delete a quotation
  Future<void> deleteQuotation(int quotationId) async {
    await isar.writeTxn(() async {
      await isar.quotations.delete(quotationId);
    });
    print('📝 QUOTATION: Deleted quotation with ID $quotationId');
  }

  /// Apply additional data to quotation
  void _applyAdditionalData(Quotation quotation, Map<String, dynamic> data) {
    if (data.containsKey('masterPreLabel')) quotation.masterPreLabel = data['masterPreLabel'];
    if (data.containsKey('ref1')) quotation.ref1 = data['ref1'];
    if (data.containsKey('ref2')) quotation.ref2 = data['ref2'];
    if (data.containsKey('ref3')) quotation.ref3 = data['ref3'];
    if (data.containsKey('ref4')) quotation.ref4 = data['ref4'];
    if (data.containsKey('ref5')) quotation.ref5 = data['ref5'];
    if (data.containsKey('remark1')) quotation.remark1 = data['remark1'];
    if (data.containsKey('remark2')) quotation.remark2 = data['remark2'];
    if (data.containsKey('currency')) quotation.currency = data['currency'];
    if (data.containsKey('rate')) quotation.rate = data['rate'];
    if (data.containsKey('locationCode')) quotation.locationCode = data['locationCode'];
    if (data.containsKey('projectCode')) quotation.projectCode = data['projectCode'];
    if (data.containsKey('quotedBy')) quotation.quotedBy = data['quotedBy'];
    if (data.containsKey('attentionRemark')) quotation.attentionRemark = data['attentionRemark'];
    if (data.containsKey('latitude')) quotation.latitude = data['latitude'];
    if (data.containsKey('longitude')) quotation.longitude = data['longitude'];
  }

  /// Calculate totals for a quotation based on its items
  Future<void> calculateQuotationTotals(Quotation quotation, List<dynamic> items) async {
    double totalQuantity = 0;
    int totalItems = 0;
    double grossAmount = 0;
    double totalDiscountAmount = 0;
    double totalTaxAmount = 0;

    for (final item in items) {
      totalQuantity += (item['quantity'] ?? 0.0) as double;
      totalItems++;
      grossAmount += (item['amount'] ?? 0.0) as double;
      totalDiscountAmount += (item['discountAmount'] ?? 0.0) as double;
      totalTaxAmount += (item['taxAmount'] ?? 0.0) as double;
    }

    quotation.totalQuoteQuantity = totalQuantity;
    quotation.totalQuoteItem = totalItems;
    quotation.grossAmount = grossAmount;
    quotation.totalDiscountAmount = totalDiscountAmount;
    quotation.totalTaxAmount = totalTaxAmount;
    quotation.gstAmount = totalTaxAmount;
    quotation.totalAmountB4Gst = grossAmount - totalDiscountAmount;
    quotation.netAmount = (grossAmount - totalDiscountAmount) + totalTaxAmount + (quotation.otherCharges ?? 0);

    await updateQuotation(quotation);
  }

  /// Save quotation items to server
  Future<bool> saveQuotationItems({
    required int companyCode,
    required String quotePreLabel,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      print('📝 QUOTATION ITEMS: Saving ${items.length} items for $quotePreLabel');
      
      // Prepare items for server
      final itemsToSend = items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        
        return {
          'Company_Code': companyCode,
          'Quote_PreLabel': quotePreLabel,
          'Sequence_No': index + 1,
          'Sku_No': item['skuNo'] ?? item['sku_no'] ?? 0,
          'Uom': item['uom'] ?? 'PCS',
          'Factor': item['factor'] ?? 1.0,
          'Status': 'A',
          'Quote_Quantity': item['quantity'] ?? 0.0,
          'Quote_Quantity_Loose': 0.0,
          'Quote_Foc': 0.0,
          'Quote_Foc_Loose': 0.0,
          'Unit_Price': item['unitPrice'] ?? item['price'] ?? 0.0,
          'Unit_Price_Basic': item['unitPrice'] ?? item['price'] ?? 0.0,
          'Unit_Discount_Rate': 0.0,
          'Unit_Discount_Amount': 0.0,
          'Tax_Rate': 0.0,
          'Tax_Amount': 0.0,
          'Net_Amount': item['amount'] ?? (item['quantity'] ?? 0.0) * (item['unitPrice'] ?? item['price'] ?? 0.0),
          'Plu_No': item['pluNo'] ?? item['plu_no'],
          'Remark': item['remark'],
        };
      }).toList();
      
      final apiUrl = '${AppConfig.apiBaseUrl}/api/quotation-items';
      print('📤 Sending ${itemsToSend.length} items to: $apiUrl');
      
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'items': itemsToSend}),
      );

      if (response.statusCode == 200) {
        print('✅ QUOTATION ITEMS: Successfully saved ${items.length} items');
        return true;
      } else {
        print('❌ QUOTATION ITEMS: Server returned ${response.statusCode}: ${response.body}');
        return false;
      }
    } catch (e) {
      print('❌ QUOTATION ITEMS: Error saving items: $e');
      return false;
    }
  }
}
