import 'package:isar/isar.dart';
import '../models/quote_item.dart';
import '../services/signalr_service.dart';
import '../services/offline_first_service.dart';
import '../main.dart';

class QuoteItemService {
  final SignalRService _signalRService;

  QuoteItemService(this._signalRService);

  // Get quote items for a specific quote
  Future<List<QuoteItem>> getQuoteItems({
    required String quotePreLabel,
    required int companyCode,
    bool forceSync = false,
  }) async {
    try {
      // Getting quote items for $quotePreLabel

      // Always try local data first (offline-first pattern)
      final localItems = await getLocalQuoteItems(
        quotePreLabel: quotePreLabel,
        companyCode: companyCode,
      );

      // If we have local data and not forcing sync, return it
      if (localItems.isNotEmpty && !forceSync) {
        print('✅ QUOTE ITEM SERVICE: Returning ${localItems.length} local quote items');
        return localItems;
      }

      // Try to sync from server if we have connectivity
      if (await OfflineFirstService.isServerReachable()) {
        try {
          // Syncing quote items from server
          final serverItems = await fetchQuoteItemsFromServer(
            quotePreLabel: quotePreLabel,
            companyCode: companyCode,
          );

          // Save to local database
          await saveQuoteItemsToLocal(serverItems);
          
          print('✅ Synced ${serverItems.length} quote items for $quotePreLabel');
          return serverItems;
        } catch (e) {
          print('❌ QUOTE ITEM SERVICE: Server sync failed: $e');
          // Fall back to local data if server sync fails
          if (localItems.isNotEmpty) {
            print('📱 QUOTE ITEM SERVICE: Falling back to ${localItems.length} local quote items');
            return localItems;
          }
          throw Exception('Failed to sync quote items and no local data available: $e');
        }
      } else {
        print('📱 QUOTE ITEM SERVICE: Offline - using local data');
        return localItems;
      }
    } catch (e) {
      print('❌ QUOTE ITEM SERVICE ERROR: $e');
      throw Exception('Failed to get quote items: $e');
    }
  }

  // Fetch quote items from server via SignalR
  Future<List<QuoteItem>> fetchQuoteItemsFromServer({
    required String quotePreLabel,
    required int companyCode,
  }) async {
    try {
      // Fetching quote items from server

      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        print('🔍 QUOTE ITEM SERVICE: SignalR not connected, attempting to connect...');
        await _signalRService.connect();
      }

      if (!_signalRService.isConnected) {
        throw Exception('Unable to establish SignalR connection');
      }

      // Call server method to get quote items
      final response = await _signalRService.invoke('getQuoteItems', [
        companyCode,
        quotePreLabel,
      ]);

      // Received response from server

      if (response == null) {
        print('⚠️ QUOTE ITEM SERVICE: Server returned null response');
        return [];
      }

      List<dynamic> itemsData;
      if (response is List) {
        itemsData = response;
      } else if (response is Map && response.containsKey('items')) {
        itemsData = response['items'] as List;
      } else {
        print('⚠️ QUOTE ITEM SERVICE: Unexpected response format: $response');
        return [];
      }

      final items = itemsData.map((data) => QuoteItem.fromJson(data as Map<String, dynamic>)).toList();
      
      // Converted ${items.length} quote items
      return items;
    } catch (e) {
      print('❌ QUOTE ITEM SERVICE FETCH ERROR: $e');
      throw Exception('Failed to fetch quote items from server: $e');
    }
  }

  // Save quote items to local database with deduplication
  Future<void> saveQuoteItemsToLocal(List<QuoteItem> items) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing items for this quote to avoid duplicates
        final quotePreLabel = items.isNotEmpty ? items.first.quotePreLabel : null;
        final companyCode = items.isNotEmpty ? items.first.companyCode : null;
        
        if (quotePreLabel != null && companyCode != null) {
          // Get all items and filter manually to avoid Isar syntax issues
          final itemsToDelete = await isar.quoteItems
              .filter()
              .companyCodeEqualTo(companyCode)
              .quotePreLabelEqualTo(quotePreLabel)
              .findAll();
          
          final idsToDelete = itemsToDelete.map((item) => item.id).toList();
          if (idsToDelete.isNotEmpty) {
            await isar.quoteItems.deleteAll(idsToDelete);
          }
        }
        
        // Save new items
        await isar.quoteItems.putAll(items);
      });
      // Saved ${items.length} quote items to local database
    } catch (e) {
      print('❌ QUOTE ITEM SERVICE SAVE ERROR: $e');
      throw Exception('Failed to save quote items to local database: $e');
    }
  }

  // Get quote items from local database
  Future<List<QuoteItem>> getLocalQuoteItems({
    required String quotePreLabel,
    required int companyCode,
  }) async {
    try {
      // Query items by companyCode and quotePreLabel directly in Isar
      final items = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .quotePreLabelEqualTo(quotePreLabel)
          .findAll();
      
      // Sort by sequence number
      items.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
      
      return items;
    } catch (e) {
      print('Error getting local quote items: $e');
      return [];
    }
  }

  // Clear local quote items cache
  Future<void> clearLocalQuoteItems({
    String? quotePreLabel,
    int? companyCode,
  }) async {
    try {
      await isar.writeTxn(() async {
        if (quotePreLabel != null && companyCode != null) {
          // Get all items and filter manually to avoid Isar syntax issues
          final allItems = await isar.quoteItems.filter().companyCodeEqualTo(companyCode).findAll();
          final itemsToDelete = allItems.where((item) => 
              item.companyCode == companyCode && item.quotePreLabel == quotePreLabel).toList();
          
          final idsToDelete = itemsToDelete.map((item) => item.id).toList();
          if (idsToDelete.isNotEmpty) {
            await isar.quoteItems.deleteAll(idsToDelete);
          }
        } else {
          await isar.quoteItems.clear();
        }
      });
      print('🗑️ QUOTE ITEM SERVICE: Cleared local quote items data');
    } catch (e) {
      print('❌ QUOTE ITEM SERVICE CLEAR ERROR: $e');
    }
  }

  // Force refresh quote items from server
  Future<List<QuoteItem>> forceRefreshQuoteItems({
    required String quotePreLabel,
    required int companyCode,
  }) async {
    return getQuoteItems(
      quotePreLabel: quotePreLabel,
      companyCode: companyCode,
      forceSync: true,
    );
  }
}
