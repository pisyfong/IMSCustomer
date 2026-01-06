import 'package:isar/isar.dart';
import '../main.dart';
import '../models/sync_metadata.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';
import '../models/invoice.dart';
import 'signalr_service.dart';

/// Service for incremental/delta synchronization
/// Only syncs records that have changed since last sync using lastWriteTimeStamp
class DeltaSyncService {
  static final DeltaSyncService _instance = DeltaSyncService._internal();
  factory DeltaSyncService() => _instance;
  DeltaSyncService._internal();

  final SignalRService _signalRService = SignalRService();

  // Entity type constants
  static const String ENTITY_QUOTE = 'quote';
  static const String ENTITY_QUOTE_ITEM = 'quote_item';
  static const String ENTITY_INVOICE = 'invoice';
  static const String ENTITY_INVOICE_ITEM = 'invoice_item';

  /// Get or create sync metadata for an entity type
  Future<SyncMetadata> _getOrCreateSyncMetadata(int companyCode, String entityType) async {
    var metadata = await isar.syncMetadatas
        .filter()
        .companyCodeEqualTo(companyCode)
        .and()
        .entityTypeEqualTo(entityType)
        .findFirst();

    if (metadata == null) {
      metadata = SyncMetadata()
        ..companyCode = companyCode
        ..entityType = entityType
        ..lastSyncTimestamp = null
        ..lastSyncCount = 0
        ..lastSyncStatus = 'never'
        ..updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.syncMetadatas.put(metadata!);
      });
      print('📊 DELTA SYNC: Created new sync metadata for $entityType (company $companyCode)');
    }

    return metadata;
  }

  /// Update sync metadata after successful sync
  Future<void> _updateSyncMetadata(
    SyncMetadata metadata, {
    required DateTime syncTimestamp,
    required int syncCount,
    required String status,
    String? error,
  }) async {
    metadata.lastSyncTimestamp = syncTimestamp;
    metadata.lastSyncCount = syncCount;
    metadata.lastSyncStatus = status;
    metadata.lastSyncError = error;
    metadata.updatedAt = DateTime.now();

    await isar.writeTxn(() async {
      await isar.syncMetadatas.put(metadata);
    });
  }

  /// Delta sync quotes - only fetch quotes modified since last sync
  Future<DeltaSyncResult> syncQuotesDelta({
    required int companyCode,
    String? customerCode,
    bool forceFullSync = false,
  }) async {
    final startTime = DateTime.now();
    print('🔄 DELTA SYNC: Starting quote delta sync for company $companyCode...');

    try {
      // Get sync metadata
      final metadata = await _getOrCreateSyncMetadata(companyCode, ENTITY_QUOTE);
      
      // Determine sync timestamp (null for full sync)
      DateTime? sinceTimestamp = forceFullSync ? null : metadata.lastSyncTimestamp;
      
      if (sinceTimestamp != null) {
        print('🔄 DELTA SYNC: Fetching quotes modified since $sinceTimestamp');
      } else {
        print('🔄 DELTA SYNC: Performing full quote sync (no previous sync or forced)');
      }

      // Fetch changed quotes from server
      final changedQuotes = await _fetchQuotesDelta(
        companyCode: companyCode,
        customerCode: customerCode,
        sinceTimestamp: sinceTimestamp,
      );

      if (changedQuotes.isEmpty) {
        print('✅ DELTA SYNC: No quote changes detected');
        await _updateSyncMetadata(
          metadata,
          syncTimestamp: startTime,
          syncCount: 0,
          status: 'success',
        );
        return DeltaSyncResult(
          entityType: ENTITY_QUOTE,
          totalFetched: 0,
          inserted: 0,
          updated: 0,
          deleted: 0,
          duration: DateTime.now().difference(startTime),
          isFullSync: sinceTimestamp == null,
        );
      }

      // Upsert changed quotes (insert or update based on existence)
      final result = await _upsertQuotes(companyCode, changedQuotes);

      // Update sync metadata
      await _updateSyncMetadata(
        metadata,
        syncTimestamp: startTime,
        syncCount: changedQuotes.length,
        status: 'success',
      );

      print('✅ DELTA SYNC: Quote sync completed - ${result.inserted} inserted, ${result.updated} updated');
      return result.copyWith(
        duration: DateTime.now().difference(startTime),
        isFullSync: sinceTimestamp == null,
      );
    } catch (e) {
      print('❌ DELTA SYNC: Quote sync failed: $e');
      final metadata = await _getOrCreateSyncMetadata(companyCode, ENTITY_QUOTE);
      await _updateSyncMetadata(
        metadata,
        syncTimestamp: metadata.lastSyncTimestamp ?? DateTime.now(),
        syncCount: 0,
        status: 'failed',
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Fetch quotes changed since timestamp from server
  Future<List<Quote>> _fetchQuotesDelta({
    required int companyCode,
    String? customerCode,
    DateTime? sinceTimestamp,
  }) async {
    if (!_signalRService.isConnected) {
      throw Exception('SignalR not connected');
    }

    // Format timestamp for server (ISO 8601)
    final sinceStr = sinceTimestamp?.toUtc().toIso8601String() ?? '';
    final effectiveCustomerCode = customerCode ?? '';

    print('📡 DELTA SYNC: Calling getQuotesDelta(company=$companyCode, customer=$effectiveCustomerCode, since=$sinceStr)');

    // Try delta endpoint first, fall back to full fetch
    dynamic response;
    try {
      response = await _signalRService.invoke('getQuotesDelta', [
        companyCode,
        effectiveCustomerCode,
        sinceStr,
      ]);
    } catch (e) {
      // If delta endpoint doesn't exist, fall back to regular getQuotes
      print('⚠️ DELTA SYNC: getQuotesDelta not available, falling back to getQuotes');
      response = await _signalRService.invoke('getQuotes', [
        companyCode,
        effectiveCustomerCode,
        '', // searchQuery
      ]);
    }

    if (response == null) return [];

    List<dynamic> quoteList;
    if (response is List) {
      quoteList = response;
    } else if (response is Map && response.containsKey('quotes')) {
      quoteList = response['quotes'] as List;
    } else {
      return [];
    }

    return quoteList
        .map((json) {
          try {
            return Quote.fromJson(json as Map<String, dynamic>);
          } catch (e) {
            print('❌ DELTA SYNC: Error parsing quote: $e');
            return null;
          }
        })
        .whereType<Quote>()
        .toList();
  }

  /// Upsert quotes - insert new, update existing
  Future<DeltaSyncResult> _upsertQuotes(int companyCode, List<Quote> quotes) async {
    int inserted = 0;
    int updated = 0;

    await isar.writeTxn(() async {
      for (final quote in quotes) {
        // Check if quote exists by quotePreLabel
        final existing = await isar.quotes
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .quotePreLabelEqualTo(quote.quotePreLabel)
            .findFirst();

        if (existing != null) {
          // Update existing - preserve Isar ID
          quote.id = existing.id;
          updated++;
        } else {
          inserted++;
        }

        await isar.quotes.put(quote);
      }
    });

    return DeltaSyncResult(
      entityType: ENTITY_QUOTE,
      totalFetched: quotes.length,
      inserted: inserted,
      updated: updated,
      deleted: 0,
      duration: Duration.zero,
      isFullSync: false,
    );
  }

  /// Delta sync invoices - only fetch invoices modified since last sync
  Future<DeltaSyncResult> syncInvoicesDelta({
    required int companyCode,
    String? customerCode,
    bool forceFullSync = false,
  }) async {
    final startTime = DateTime.now();
    print('🔄 DELTA SYNC: Starting invoice delta sync for company $companyCode...');

    try {
      final metadata = await _getOrCreateSyncMetadata(companyCode, ENTITY_INVOICE);
      DateTime? sinceTimestamp = forceFullSync ? null : metadata.lastSyncTimestamp;

      if (sinceTimestamp != null) {
        print('🔄 DELTA SYNC: Fetching invoices modified since $sinceTimestamp');
      } else {
        print('🔄 DELTA SYNC: Performing full invoice sync');
      }

      final changedInvoices = await _fetchInvoicesDelta(
        companyCode: companyCode,
        customerCode: customerCode,
        sinceTimestamp: sinceTimestamp,
      );

      if (changedInvoices.isEmpty) {
        print('✅ DELTA SYNC: No invoice changes detected');
        await _updateSyncMetadata(
          metadata,
          syncTimestamp: startTime,
          syncCount: 0,
          status: 'success',
        );
        return DeltaSyncResult(
          entityType: ENTITY_INVOICE,
          totalFetched: 0,
          inserted: 0,
          updated: 0,
          deleted: 0,
          duration: DateTime.now().difference(startTime),
          isFullSync: sinceTimestamp == null,
        );
      }

      final result = await _upsertInvoices(companyCode, changedInvoices);

      await _updateSyncMetadata(
        metadata,
        syncTimestamp: startTime,
        syncCount: changedInvoices.length,
        status: 'success',
      );

      print('✅ DELTA SYNC: Invoice sync completed - ${result.inserted} inserted, ${result.updated} updated');
      return result.copyWith(
        duration: DateTime.now().difference(startTime),
        isFullSync: sinceTimestamp == null,
      );
    } catch (e) {
      print('❌ DELTA SYNC: Invoice sync failed: $e');
      final metadata = await _getOrCreateSyncMetadata(companyCode, ENTITY_INVOICE);
      await _updateSyncMetadata(
        metadata,
        syncTimestamp: metadata.lastSyncTimestamp ?? DateTime.now(),
        syncCount: 0,
        status: 'failed',
        error: e.toString(),
      );
      rethrow;
    }
  }

  /// Fetch invoices changed since timestamp from server
  Future<List<Invoice>> _fetchInvoicesDelta({
    required int companyCode,
    String? customerCode,
    DateTime? sinceTimestamp,
  }) async {
    if (!_signalRService.isConnected) {
      throw Exception('SignalR not connected');
    }

    final sinceStr = sinceTimestamp?.toUtc().toIso8601String() ?? '';
    final effectiveCustomerCode = customerCode ?? '';

    print('📡 DELTA SYNC: Calling getInvoicesDelta(company=$companyCode, customer=$effectiveCustomerCode, since=$sinceStr)');

    dynamic response;
    try {
      response = await _signalRService.invoke('getInvoicesDelta', [
        companyCode,
        effectiveCustomerCode,
        sinceStr,
      ]);
    } catch (e) {
      print('⚠️ DELTA SYNC: getInvoicesDelta not available, falling back to getInvoices');
      response = await _signalRService.invoke('getInvoices', [
        companyCode,
        effectiveCustomerCode,
        '',
      ]);
    }

    if (response == null) return [];

    List<dynamic> invoiceList;
    if (response is List) {
      invoiceList = response;
    } else if (response is Map && response.containsKey('invoices')) {
      invoiceList = response['invoices'] as List;
    } else {
      return [];
    }

    return invoiceList
        .map((json) {
          try {
            return Invoice.fromJson(json as Map<String, dynamic>);
          } catch (e) {
            print('❌ DELTA SYNC: Error parsing invoice: $e');
            return null;
          }
        })
        .whereType<Invoice>()
        .toList();
  }

  /// Upsert invoices - insert new, update existing
  Future<DeltaSyncResult> _upsertInvoices(int companyCode, List<Invoice> invoices) async {
    int inserted = 0;
    int updated = 0;

    await isar.writeTxn(() async {
      for (final invoice in invoices) {
        final existing = await isar.invoices
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .invoicePreLabelEqualTo(invoice.invoicePreLabel)
            .findFirst();

        if (existing != null) {
          // For Invoice with final fields, we need to delete and re-insert
          await isar.invoices.delete(existing.id);
          updated++;
        } else {
          inserted++;
        }

        await isar.invoices.put(invoice);
      }
    });

    return DeltaSyncResult(
      entityType: ENTITY_INVOICE,
      totalFetched: invoices.length,
      inserted: inserted,
      updated: updated,
      deleted: 0,
      duration: Duration.zero,
      isFullSync: false,
    );
  }

  /// Delta sync quote items for a specific quote
  Future<DeltaSyncResult> syncQuoteItemsDelta({
    required int companyCode,
    required String quotePreLabel,
    bool forceFullSync = false,
  }) async {
    final startTime = DateTime.now();
    print('🔄 DELTA SYNC: Starting quote items delta sync for $quotePreLabel...');

    try {
      final changedItems = await _fetchQuoteItemsDelta(
        companyCode: companyCode,
        quotePreLabel: quotePreLabel,
      );

      if (changedItems.isEmpty) {
        print('✅ DELTA SYNC: No quote item changes for $quotePreLabel');
        return DeltaSyncResult(
          entityType: ENTITY_QUOTE_ITEM,
          totalFetched: 0,
          inserted: 0,
          updated: 0,
          deleted: 0,
          duration: DateTime.now().difference(startTime),
          isFullSync: false,
        );
      }

      final result = await _upsertQuoteItems(companyCode, quotePreLabel, changedItems);

      print('✅ DELTA SYNC: Quote items sync completed - ${result.inserted} inserted, ${result.updated} updated');
      return result.copyWith(duration: DateTime.now().difference(startTime));
    } catch (e) {
      print('❌ DELTA SYNC: Quote items sync failed: $e');
      rethrow;
    }
  }

  /// Fetch quote items from server
  Future<List<QuoteItem>> _fetchQuoteItemsDelta({
    required int companyCode,
    required String quotePreLabel,
  }) async {
    if (!_signalRService.isConnected) {
      throw Exception('SignalR not connected');
    }

    print('📡 DELTA SYNC: Calling getQuoteItems(company=$companyCode, quote=$quotePreLabel)');

    final response = await _signalRService.invoke('getQuoteItems', [
      companyCode,
      quotePreLabel,
    ]);

    if (response == null) return [];

    List<dynamic> itemList;
    if (response is List) {
      itemList = response;
    } else if (response is Map && response.containsKey('items')) {
      itemList = response['items'] as List;
    } else {
      return [];
    }

    return itemList
        .map((json) {
          try {
            return QuoteItem.fromJson(json as Map<String, dynamic>);
          } catch (e) {
            print('❌ DELTA SYNC: Error parsing quote item: $e');
            return null;
          }
        })
        .whereType<QuoteItem>()
        .toList();
  }

  /// Upsert quote items
  Future<DeltaSyncResult> _upsertQuoteItems(
    int companyCode,
    String quotePreLabel,
    List<QuoteItem> items,
  ) async {
    int inserted = 0;
    int updated = 0;

    await isar.writeTxn(() async {
      // First, remove existing items for this quote (replace strategy)
      final existingCount = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .quotePreLabelEqualTo(quotePreLabel)
          .deleteAll();
      
      if (existingCount > 0) {
        updated = existingCount;
      }

      // Insert all items
      await isar.quoteItems.putAll(items);
      inserted = items.length;
    });

    return DeltaSyncResult(
      entityType: ENTITY_QUOTE_ITEM,
      totalFetched: items.length,
      inserted: inserted,
      updated: updated,
      deleted: 0,
      duration: Duration.zero,
      isFullSync: false,
    );
  }

  /// Get sync status for all entity types
  Future<Map<String, SyncMetadata>> getSyncStatus(int companyCode) async {
    final allMetadata = await isar.syncMetadatas
        .filter()
        .companyCodeEqualTo(companyCode)
        .findAll();

    return {for (var m in allMetadata) m.entityType: m};
  }

  /// Reset sync metadata to force full sync
  Future<void> resetSyncMetadata(int companyCode, {String? entityType}) async {
    await isar.writeTxn(() async {
      if (entityType != null) {
        await isar.syncMetadatas
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .entityTypeEqualTo(entityType)
            .deleteAll();
        print('🔄 DELTA SYNC: Reset sync metadata for $entityType (company $companyCode)');
      } else {
        await isar.syncMetadatas
            .filter()
            .companyCodeEqualTo(companyCode)
            .deleteAll();
        print('🔄 DELTA SYNC: Reset all sync metadata for company $companyCode');
      }
    });
  }
}

/// Result of a delta sync operation
class DeltaSyncResult {
  final String entityType;
  final int totalFetched;
  final int inserted;
  final int updated;
  final int deleted;
  final Duration duration;
  final bool isFullSync;

  DeltaSyncResult({
    required this.entityType,
    required this.totalFetched,
    required this.inserted,
    required this.updated,
    required this.deleted,
    required this.duration,
    required this.isFullSync,
  });

  DeltaSyncResult copyWith({
    String? entityType,
    int? totalFetched,
    int? inserted,
    int? updated,
    int? deleted,
    Duration? duration,
    bool? isFullSync,
  }) {
    return DeltaSyncResult(
      entityType: entityType ?? this.entityType,
      totalFetched: totalFetched ?? this.totalFetched,
      inserted: inserted ?? this.inserted,
      updated: updated ?? this.updated,
      deleted: deleted ?? this.deleted,
      duration: duration ?? this.duration,
      isFullSync: isFullSync ?? this.isFullSync,
    );
  }

  @override
  String toString() {
    return 'DeltaSyncResult($entityType: fetched=$totalFetched, inserted=$inserted, updated=$updated, deleted=$deleted, ${duration.inMilliseconds}ms, fullSync=$isFullSync)';
  }
}
