import 'package:isar/isar.dart';
import '../models/quote.dart';
import '../main.dart';
import 'signalr_service.dart';
import 'offline_first_service.dart';

class QuoteService {
  final SignalRService _signalRService;

  QuoteService(this._signalRService);

  // Get quotes with offline-first pattern
  Future<List<Quote>> getQuotes({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
    bool forceSync = false,
  }) async {
    try {
      print('🔍 QUOTE SERVICE: Getting quotes...');
      print('Company Code: $companyCode');
      print('Customer Code: $customerCode');
      print('Search Query: $searchQuery');
      print('Force Sync: $forceSync');

      // Always try local data first (offline-first pattern)
      final localQuotes = await getLocalQuotes(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: searchQuery,
      );

      // If we have local data and not forcing sync, return it
      if (localQuotes.isNotEmpty && !forceSync) {
        print('✅ QUOTE SERVICE: Returning ${localQuotes.length} local quotes');
        return localQuotes;
      }

      // Try to sync from server if we have connectivity
      if (await OfflineFirstService.isServerReachable()) {
        try {
          print('🌐 QUOTE SERVICE: Syncing quotes from server...');
          final serverQuotes = await fetchQuotesFromServer(
            companyCode: companyCode,
            customerCode: customerCode,
            searchQuery: searchQuery,
          );

          // Save to local database
          await saveQuotesToLocal(serverQuotes);
          
          print('✅ QUOTE SERVICE: Synced ${serverQuotes.length} quotes from server');
          return serverQuotes;
        } catch (e) {
          print('❌ QUOTE SERVICE: Server sync failed: $e');
          // Fall back to local data if server sync fails
          if (localQuotes.isNotEmpty) {
            print('📱 QUOTE SERVICE: Falling back to ${localQuotes.length} local quotes');
            return localQuotes;
          }
          throw Exception('Failed to sync quotes and no local data available: $e');
        }
      } else {
        print('📱 QUOTE SERVICE: Offline - using local data');
        return localQuotes;
      }
    } catch (e) {
      print('❌ QUOTE SERVICE ERROR: $e');
      throw Exception('Failed to get quotes: $e');
    }
  }

  // Fetch quotes from server via SignalR
  Future<List<Quote>> fetchQuotesFromServer({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔍 QUOTE SERVICE: Fetching quotes from server...');

      // Ensure SignalR connection
      if (!_signalRService.isConnected) {
        print('🔍 QUOTE SERVICE: SignalR not connected, attempting to connect...');
        await _signalRService.connect();
      }

      if (!_signalRService.isConnected) {
        throw Exception('Unable to establish SignalR connection');
      }

      // Call server method to get quotes
      // If customerCode is empty or null, try different approaches to get all quotes
      final effectiveCustomerCode = (customerCode?.isEmpty ?? true) ? '' : customerCode;
      
      print('🔍 QUOTE SERVICE: Calling getQuotes with params:');
      print('  - companyCode: $companyCode');
      print('  - customerCode: "$effectiveCustomerCode"');
      print('  - searchQuery: "${searchQuery ?? ''}"');
      
      final response = await _signalRService.invoke('getQuotes', [
        companyCode,
        effectiveCustomerCode,
        searchQuery ?? '',
      ]);

      print('📦 QUOTE SERVICE: Server response type: ${response.runtimeType}');

      if (response == null) {
        print('⚠️ QUOTE SERVICE: Server returned null response');
        return [];
      }

      List<dynamic> quotesData;
      if (response is List) {
        quotesData = response;
      } else if (response is Map && response.containsKey('quotes')) {
        quotesData = response['quotes'] as List;
      } else {
        print('⚠️ QUOTE SERVICE: Unexpected response format: $response');
        return [];
      }

      final quotes = quotesData.map((data) => Quote.fromJson(data as Map<String, dynamic>)).toList();
      
      print('✅ QUOTE SERVICE: Converted ${quotes.length} quotes from server');
      return quotes;
    } catch (e) {
      print('❌ QUOTE SERVICE FETCH ERROR: $e');
      throw Exception('Failed to fetch quotes from server: $e');
    }
  }

  // Save quotes to local database with deduplication
  Future<void> saveQuotesToLocal(List<Quote> quotes) async {
    try {
      await isar.writeTxn(() async {
        // Clear existing quotes for this company/customer to avoid duplicates
        final companyCode = quotes.isNotEmpty ? quotes.first.companyCode : null;
        final customerCode = quotes.isNotEmpty ? quotes.first.customer : null;
        
        if (companyCode != null && customerCode != null) {
          await isar.quotes
              .filter()
              .companyCodeEqualTo(companyCode)
              .and()
              .customerEqualTo(customerCode)
              .deleteAll();
        }
        
        // Save new quotes
        await isar.quotes.putAll(quotes);
      });
      print('💾 QUOTE SERVICE: Saved ${quotes.length} quotes to local database (duplicates removed)');
    } catch (e) {
      print('❌ QUOTE SERVICE SAVE ERROR: $e');
      throw Exception('Failed to save quotes to local database: $e');
    }
  }

  // Get quotes from local database
  Future<List<Quote>> getLocalQuotes({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      List<Quote> quotes;
      
      if (companyCode != null && customerCode != null) {
        // Filter by both company code and customer
        quotes = await isar.quotes
            .filter()
            .companyCodeEqualTo(companyCode)
            .and()
            .customerEqualTo(customerCode)
            .findAll();
      } else if (companyCode != null) {
        // Filter by company code only
        quotes = await isar.quotes
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
      } else if (customerCode != null) {
        // Filter by customer only
        quotes = await isar.quotes
            .filter()
            .customerEqualTo(customerCode)
            .findAll();
      } else {
        // No filters - get all quotes
        quotes = await isar.quotes.where().findAll();
      }
      
      // Apply search filter if provided
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final searchLower = searchQuery.toLowerCase();
        quotes = quotes.where((quote) {
          return (quote.quotePreLabel?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.customer?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.ref1?.toLowerCase().contains(searchLower) ?? false) ||
                 (quote.remark1?.toLowerCase().contains(searchLower) ?? false);
        }).toList();
      }
      
      // Sort by date (newest first)
      quotes.sort((a, b) {
        final aDate = a.addedDate ?? DateTime(1970);
        final bDate = b.addedDate ?? DateTime(1970);
        return bDate.compareTo(aDate);
      });
      
      return quotes;
    } catch (e) {
      print('Error getting local quotes: $e');
      return [];
    }
  }

  // Search quotes locally
  Future<List<Quote>> searchQuotes({
    int? companyCode,
    String? customerCode,
    required String searchQuery,
  }) async {
    return await getLocalQuotes(
      companyCode: companyCode,
      customerCode: customerCode,
      searchQuery: searchQuery,
    );
  }

  // Clear local quotes cache
  Future<void> clearLocalQuotes({int? companyCode}) async {
    try {
      await isar.writeTxn(() async {
        if (companyCode != null) {
          await isar.quotes
              .filter()
              .companyCodeEqualTo(companyCode)
              .deleteAll();
        } else {
          await isar.quotes.clear();
        }
      });
      print('🗑️ QUOTE SERVICE: Cleared local quotes data');
    } catch (e) {
      print('❌ QUOTE SERVICE CLEAR ERROR: $e');
    }
  }

  // Force refresh quotes from server
  Future<List<Quote>> forceRefreshQuotes({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔄 QUOTE SERVICE: Force refreshing quotes...');
      
      // Clear local cache for this company/customer
      await clearLocalQuotes(companyCode: companyCode);
      
      // Fetch fresh data from server
      final freshQuotes = await fetchQuotesFromServer(
        companyCode: companyCode,
        customerCode: customerCode,
        searchQuery: searchQuery,
      );
      
      // Save fresh data to local cache
      await saveQuotesToLocal(freshQuotes);
      
      print('✅ QUOTE SERVICE: Force refresh completed - ${freshQuotes.length} quotes updated');
      return freshQuotes;
    } catch (e) {
      print('❌ QUOTE SERVICE FORCE REFRESH ERROR: $e');
      throw Exception('Failed to force refresh quotes: $e');
    }
  }
}
