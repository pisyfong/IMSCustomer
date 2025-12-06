import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../models/quotation.dart';
import '../models/quote_item.dart';
import '../main.dart';
import 'signalr_service.dart';
import '../config/app_config.dart';
import 'quotation_logger.dart';

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
    final quotationDate = quoteDate ?? DateTime.now();
    final quotationStatus = status ?? 'P'; // P = Pending
    
    // STEP 1: Log quotation creation BEFORE saving to database
    await QuotationLogger.logQuotationCreation(
      companyCode: companyCode,
      quotePreLabel: quotePreLabel,
      customer: customer,
      quoteDate: quotationDate,
      quoteExpiry: quoteExpiry,
      status: quotationStatus,
      term: term,
      additionalData: additionalData,
    );
    
    // STEP 2: Create quotation object
    final quotation = Quotation()
      ..companyCode = companyCode
      ..quotePreLabel = quotePreLabel
      ..customer = customer
      ..quoteDate = quotationDate
      ..term = term
      ..quoteExpiry = quoteExpiry
      ..status = quotationStatus
      ..addedDate = DateTime.now()
      ..isSynced = false; // Mark as not synced

    // Apply additional data if provided
    if (additionalData != null) {
      _applyAdditionalData(quotation, additionalData);
    }

    // STEP 3: Save to database (after logging)
    await isar.writeTxn(() async {
      await isar.quotations.put(quotation);
    });

    print('📝 QUOTATION: Created new quotation ${quotation.quotePreLabel} (logged & saved offline)');
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
        // Get quotation items for this quotation
        final quotationItems = await getQuotationItems(
          companyCode: quotation.companyCode,
          quotePreLabel: quotation.quotePreLabel,
        );
        
        // Prepare complete quotation data with items
        final quotationData = {
          'quotation': quotation.toJson(),
          'items': quotationItems.map((item) => item.toJson()).toList(),
        };
        
        // Send to server via HTTP API
        final apiUrl = '${AppConfig.apiBaseUrl}/api/quotations';
        print('📤 Sending quotation ${quotation.quotePreLabel} with ${quotationItems.length} items to: $apiUrl');
        
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(quotationData),
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
        
        // Check if this is a duplicate key violation (PRIMARY KEY constraint)
        if (e.toString().contains('PRIMARY KEY constraint') || 
            e.toString().contains('PK_MP_Quote') ||
            e.toString().contains('duplicate key')) {
          
          print('🔍 QUOTATION SYNC: Detected duplicate key error for ${quotation.quotePreLabel}');
          
          // Log the complete quotation details to text file for manual review
          await _logDuplicateQuotationDetails(quotation, e.toString());
          
          // Remove the local unsynced quotation to prevent endless sync failures
          await isar.writeTxn(() async {
            await isar.quotations.delete(quotation.id);
          });
          
          syncedCount++; // Count as synced to prevent re-processing
          print('✅ QUOTATION SYNC: Logged and removed duplicate quotation ${quotation.quotePreLabel}');
        } else {
          // Update sync error for other types of errors
          quotation.lastSyncAttempt = DateTime.now();
          quotation.syncError = e.toString();

          await isar.writeTxn(() async {
            await isar.quotations.put(quotation);
          });
        }
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

  /// Get quotation items for a specific quotation
  Future<List<QuoteItem>> getQuotationItems({
    required int companyCode,
    required String quotePreLabel,
  }) async {
    try {
      final items = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .quotePreLabelEqualTo(quotePreLabel)
          .findAll();
      
      // Sort by sequence number
      items.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
      
      print('📝 QUOTATION ITEMS: Found ${items.length} items for $quotePreLabel');
      return items;
    } catch (e) {
      print('❌ QUOTATION ITEMS: Error getting items: $e');
      return [];
    }
  }

  /// Delete a quotation and its items
  Future<void> deleteQuotation(int quotationId) async {
    await isar.writeTxn(() async {
      // Get the quotation to find its prelabel and company code
      final quotation = await isar.quotations.get(quotationId);
      if (quotation != null) {
        // Delete associated items first
        final items = await isar.quoteItems
            .filter()
            .companyCodeEqualTo(quotation.companyCode)
            .quotePreLabelEqualTo(quotation.quotePreLabel)
            .findAll();
        
        if (items.isNotEmpty) {
          final itemIds = items.map((item) => item.id).toList();
          await isar.quoteItems.deleteAll(itemIds);
          print('📝 QUOTATION: Deleted ${items.length} items for quotation ${quotation.quotePreLabel}');
        }
      }
      
      // Delete the quotation
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
    
    // Add total fields
    if (data.containsKey('totalQuoteQuantity')) quotation.totalQuoteQuantity = data['totalQuoteQuantity'];
    if (data.containsKey('totalQuoteItem')) quotation.totalQuoteItem = data['totalQuoteItem'];
    if (data.containsKey('grossAmount')) quotation.grossAmount = data['grossAmount'];
    if (data.containsKey('totalDiscountAmount')) quotation.totalDiscountAmount = data['totalDiscountAmount'] ?? 0.0;
    if (data.containsKey('totalTaxAmount')) quotation.totalTaxAmount = data['totalTaxAmount'] ?? 0.0;
    if (data.containsKey('gstAmount')) quotation.gstAmount = data['gstAmount'];
    if (data.containsKey('totalAmountB4Gst')) quotation.totalAmountB4Gst = data['totalAmountB4Gst'];
    if (data.containsKey('netAmount')) quotation.netAmount = data['netAmount'];
    if (data.containsKey('otherCharges')) quotation.otherCharges = data['otherCharges'] ?? 0.0;
    if (data.containsKey('roundingDiscount')) quotation.roundingDiscount = data['roundingDiscount'] ?? 0.0;
    if (data.containsKey('addedBy')) quotation.addedBy = data['addedBy'];
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

  /// Save quotation items (offline-first: local then server)
  Future<bool> saveQuotationItems({
    required int companyCode,
    required String quotePreLabel,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      print('📝 QUOTATION ITEMS: Saving ${items.length} items for $quotePreLabel');
      
      // First, save items locally (offline-first pattern)
      await _saveQuotationItemsLocally(
        companyCode: companyCode,
        quotePreLabel: quotePreLabel,
        items: items,
      );
      print('✅ QUOTATION ITEMS: Saved ${items.length} items locally');
      
      // Then try to sync to server
      bool serverSaved = false;
      try {
        serverSaved = await _saveQuotationItemsToServer(
          companyCode: companyCode,
          quotePreLabel: quotePreLabel,
          items: items,
        );
      } catch (e) {
        print('⚠️ QUOTATION ITEMS: Server sync failed, but items are saved locally: $e');
      }
      
      return true; // Always return true since local save succeeded
    } catch (e) {
      print('❌ QUOTATION ITEMS: Error saving items: $e');
      return false;
    }
  }

  /// Save quotation items to local database
  Future<void> _saveQuotationItemsLocally({
    required int companyCode,
    required String quotePreLabel,
    required List<Map<String, dynamic>> items,
  }) async {
    // STEP 1: Log quotation items BEFORE saving to database
    await QuotationLogger.logQuotationItems(
      companyCode: companyCode,
      quotePreLabel: quotePreLabel,
      items: items,
    );
    
    // STEP 2: Convert cart items to QuoteItem objects
    final quoteItems = items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      
      final quantity = item['quantity'] ?? 0.0;
      final unitPrice = item['unitPrice'] ?? item['price'] ?? 0.0;
      
      final quoteItem = QuoteItem()
        ..companyCode = companyCode
        ..quotePreLabel = quotePreLabel
        ..sequenceNo = index + 1
        ..skuNo = item['skuNo'] ?? item['sku_no'] ?? 0
        ..uom = item['uom'] ?? 'PCS'
        ..factor = item['factor'] ?? 1.0
        ..status = 'A'
        ..quoteQuantity = quantity
        ..quoteQuantityLoose = 0.0
        ..quoteFoc = 0.0
        ..quoteFocLoose = 0.0
        ..unitPrice = unitPrice
        ..unitPriceBasic = unitPrice
        ..unitDiscountRate = 0.0
        ..unitDiscountAmount = 0.0
        ..taxRate = 0.0
        ..taxAmount = 0.0
        ..netAmount = item['amount'] ?? (quantity * unitPrice)
        ..pluNo = item['pluNo'] ?? item['plu_no']
        ..remark = _buildItemRemark(item['remark'], item['remarks'])
        ..locationCode = 'FST'
        ..quoteQuantityOri = quantity
        ..unitPriceOri = unitPrice
        ..quantityOriginal = quantity
        ..addedDate = DateTime.now();
      
      return quoteItem;
    }).toList();

    // STEP 3: Save to local database (after logging)
    await isar.writeTxn(() async {
      // Clear existing items for this quotation to avoid duplicates
      final existingItems = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .quotePreLabelEqualTo(quotePreLabel)
          .findAll();
      
      if (existingItems.isNotEmpty) {
        final idsToDelete = existingItems.map((item) => item.id).toList();
        await isar.quoteItems.deleteAll(idsToDelete);
      }
      
      // Save new items
      await isar.quoteItems.putAll(quoteItems);
    });
  }

  /// Save quotation items to server
  Future<bool> _saveQuotationItemsToServer({
    required int companyCode,
    required String quotePreLabel,
    required List<Map<String, dynamic>> items,
  }) async {
    // Prepare items for server
    final itemsToSend = items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      
      final quantity = item['quantity'] ?? 0.0;
      final unitPrice = item['unitPrice'] ?? item['price'] ?? 0.0;
      
      return {
        'Company_Code': companyCode,
        'Quote_PreLabel': quotePreLabel,
        'Sequence_No': index + 1,
        'Sku_No': item['skuNo'] ?? item['sku_no'] ?? 0,
        'Uom': item['uom'] ?? 'PCS',
        'Factor': item['factor'] ?? 1.0,
        'Status': 'A',
        'Quote_Quantity': quantity,
        'Quote_Quantity_Loose': 0.0,
        'Quote_Foc': 0.0,
        'Quote_Foc_Loose': 0.0,
        'Unit_Price': unitPrice,
        'Unit_Price_Basic': unitPrice,
        'Unit_Discount_Rate': 0.0,
        'Unit_Discount_Amount': 0.0,
        'Tax_Rate': 0.0,
        'Tax_Amount': 0.0,
        'Net_Amount': item['amount'] ?? (quantity * unitPrice),
        'Plu_No': item['pluNo'] ?? item['plu_no'],
        'Remark': item['remark'],
        'Location_Code': 'FST',
        'Quote_Quantity_Ori': quantity,
        'Unit_Price_Ori': unitPrice,
        'Quantity_Original': quantity,
      };
    }).toList();
    
    final apiUrl = '${AppConfig.apiBaseUrl}/api/quotation-items';
    print('📤 Sending ${itemsToSend.length} items to: $apiUrl');
    
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'items': itemsToSend}),
      ).timeout(
        const Duration(seconds: 4),
        onTimeout: () {
          print('⏱️ QUOTATION ITEMS: Request timed out after 4 seconds (likely offline)');
          throw TimeoutException('Server request timed out');
        },
      );

      if (response.statusCode == 200) {
        print('✅ QUOTATION ITEMS: Successfully synced ${items.length} items to server');
        return true;
      } else {
        print('❌ QUOTATION ITEMS: Server returned ${response.statusCode}: ${response.body}');
        return false;
      }
    } on TimeoutException {
      print('📱 QUOTATION ITEMS: Offline mode - items saved locally, will sync when online');
      return false;
    }
  }

  /// Get log file paths for debugging or manual recovery
  Future<Map<String, String>> getLogFilePaths() async {
    return await QuotationLogger.getLogFilePaths();
  }

  /// Generate SQL recovery script from log files
  Future<String> generateSQLRecoveryScript() async {
    return await QuotationLogger.generateSQLRecoveryScript();
  }

  /// Clean up old log files (keep last 30 days)
  Future<void> cleanupOldLogs() async {
    await QuotationLogger.cleanupOldLogs();
  }

  /// Re-sync quotation items for quotations that were synced without items
  /// This fixes quotations that were synced before the item sync fix was implemented
  Future<int> resyncQuotationItems({DateTime? fromDate}) async {
    try {
      print('🔄 ITEM RESYNC: Starting re-sync of quotation items...');
      
      // Get all synced quotations (optionally from a specific date)
      var query = isar.quotations.filter().isSyncedEqualTo(true);
      
      if (fromDate != null) {
        query = query.and().quoteDateGreaterThan(fromDate);
      }
      
      final syncedQuotations = await query.findAll();
      
      if (syncedQuotations.isEmpty) {
        print('🔄 ITEM RESYNC: No synced quotations found to re-sync');
        return 0;
      }
      
      print('🔄 ITEM RESYNC: Found ${syncedQuotations.length} synced quotations to check');
      int resyncedCount = 0;
      
      for (final quotation in syncedQuotations) {
        try {
          // Get local quotation items
          final quotationItems = await getQuotationItems(
            companyCode: quotation.companyCode,
            quotePreLabel: quotation.quotePreLabel,
          );
          
          if (quotationItems.isEmpty) {
            print('⚠️ ITEM RESYNC: No local items found for ${quotation.quotePreLabel}, skipping');
            continue;
          }
          
          // Prepare items-only sync data
          final itemsData = {
            'quotation_id': quotation.quotePreLabel,
            'company_code': quotation.companyCode,
            'items': quotationItems.map((item) => item.toJson()).toList(),
          };
          
          // Send items to server via dedicated endpoint
          final apiUrl = '${AppConfig.apiBaseUrl}/api/quotations/items';
          print('📤 Re-syncing ${quotationItems.length} items for quotation ${quotation.quotePreLabel}');
          
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(itemsData),
          );
          
          if (response.statusCode == 200) {
            resyncedCount++;
            print('✅ ITEM RESYNC: Successfully re-synced items for ${quotation.quotePreLabel}');
          } else {
            print('❌ ITEM RESYNC: Failed to re-sync items for ${quotation.quotePreLabel}: ${response.statusCode} - ${response.body}');
          }
          
          // Add small delay to avoid overwhelming server
          await Future.delayed(const Duration(milliseconds: 500));
          
        } catch (e) {
          print('❌ ITEM RESYNC: Error re-syncing items for ${quotation.quotePreLabel}: $e');
        }
      }
      
      print('🔄 ITEM RESYNC: Successfully re-synced items for $resyncedCount/${syncedQuotations.length} quotations');
      return resyncedCount;
      
    } catch (e) {
      print('❌ ITEM RESYNC: Error during re-sync process: $e');
      return 0;
    }
  }

  /// Get quotations that might be missing items on server (synced but created before fix)
  Future<List<Quotation>> getQuotationsNeedingItemResync({DateTime? beforeDate}) async {
    var query = isar.quotations.filter().isSyncedEqualTo(true);
    
    if (beforeDate != null) {
      query = query.and().quoteDateLessThan(beforeDate);
    }
    
    final quotations = await query.findAll();
    
    // Filter to only include quotations that have local items
    final quotationsWithItems = <Quotation>[];
    
    for (final quotation in quotations) {
      final items = await getQuotationItems(
        companyCode: quotation.companyCode,
        quotePreLabel: quotation.quotePreLabel,
      );
      
      if (items.isNotEmpty) {
        quotationsWithItems.add(quotation);
      }
    }
    
    return quotationsWithItems;
  }

  /// Build item remark by combining description and user remarks
  String _buildItemRemark(String? description, String? userRemarks) {
    final desc = description ?? '';
    final remarks = userRemarks?.trim() ?? '';
    
    if (desc.isEmpty && remarks.isEmpty) {
      return '';
    } else if (desc.isNotEmpty && remarks.isNotEmpty) {
      return '$desc\n$remarks'; // Description on first line, remarks on second line
    } else {
      return desc.isNotEmpty ? desc : remarks;
    }
  }

  /// Log duplicate quotation details to text file for manual review
  Future<void> _logDuplicateQuotationDetails(Quotation quotation, String errorDetails) async {
    try {
      print('📝 DUPLICATE LOG: Logging quotation ${quotation.quotePreLabel} details for manual review');
      
      // Get quotation items
      final items = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(quotation.companyCode)
          .and()
          .quotePreLabelEqualTo(quotation.quotePreLabel)
          .findAll();
      
      // Create detailed log entry
      final logEntry = {
        'timestamp': DateTime.now().toIso8601String(),
        'error_type': 'PRIMARY_KEY_VIOLATION',
        'error_details': errorDetails,
        'quotation_header': quotation.toJson(),
        'quotation_items': items.map((item) => item.toJson()).toList(),
        'items_count': items.length,
        'total_amount': quotation.netAmount,
      };
      
      // Log to dedicated duplicate quotations file
      await QuotationLogger.logDuplicateQuotation(logEntry);
      
      print('✅ DUPLICATE LOG: Logged quotation ${quotation.quotePreLabel} with ${items.length} items');
      
    } catch (e) {
      print('❌ DUPLICATE LOG: Failed to log quotation details: $e');
      // Don't throw - logging failure shouldn't break the sync process
    }
  }

}
