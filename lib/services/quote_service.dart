import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/quote.dart';
import '../main.dart';
import 'signalr_service.dart';
import 'offline_first_service.dart';
import '../config/app_config.dart';

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

  // Fetch quotes from server via SignalR or HTTP fallback
  Future<List<Quote>> fetchQuotesFromServer({
    int? companyCode,
    String? customerCode,
    String? searchQuery,
  }) async {
    try {
      print('🔍 QUOTE SERVICE: Fetching quotes from server...');
      
      // Try SignalR first if connected
      if (_signalRService.isConnected) {
        try {
          print('📡 QUOTE SERVICE: Using SignalR...');
          final effectiveCustomerCode = (customerCode?.isEmpty ?? true) ? '' : customerCode;
          
          final response = await _signalRService.invoke('getQuotes', [
            companyCode,
            effectiveCustomerCode,
            searchQuery ?? '',
          ]);

          if (response != null) {
            List<dynamic> quotesData;
            if (response is List) {
              quotesData = response;
            } else if (response is Map && response.containsKey('quotes')) {
              quotesData = response['quotes'] as List;
            } else {
              quotesData = [];
            }

            if (quotesData.isNotEmpty) {
              final quotes = quotesData.map((data) => Quote.fromJson(data as Map<String, dynamic>)).toList();
              print('✅ QUOTE SERVICE: Received ${quotes.length} quotes from SignalR');
              return quotes;
            }
          }
        } catch (e) {
          print('⚠️ QUOTE SERVICE: SignalR failed, trying HTTP fallback: $e');
        }
      }

      // HTTP Fallback
      print('🌐 QUOTE SERVICE: Using HTTP fallback...');
      final params = <String>[];
      if (companyCode != null) params.add('companyCode=$companyCode');
      if (customerCode != null && customerCode.isNotEmpty) params.add('customerCode=$customerCode');
      if (searchQuery != null && searchQuery.isNotEmpty) params.add('searchQuery=$searchQuery');
      
      final queryString = params.isNotEmpty ? '?${params.join('&')}' : '';
      final url = Uri.parse('${AppConfig.apiBaseUrl}/api/quotes$queryString');
      print('📡 QUOTE SERVICE: GET $url');
      
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timeout');
        },
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final quotes = data.map((item) => Quote.fromJson(item as Map<String, dynamic>)).toList();
        print('✅ QUOTE SERVICE: Received ${quotes.length} quotes from HTTP');
        return quotes;
      } else {
        print('❌ QUOTE SERVICE: HTTP error ${response.statusCode}: ${response.body}');
        return [];
      }
    } catch (e) {
      print('❌ QUOTE SERVICE FETCH ERROR: $e');
      throw Exception('Failed to fetch quotes from server: $e');
    }
  }

  // Save quotes to local database with upsert (insert or update)
  // Uses quotePreLabel as unique key to avoid duplicates
  Future<void> saveQuotesToLocal(List<Quote> quotes) async {
    try {
      int inserted = 0;
      int updated = 0;
      
      await isar.writeTxn(() async {
        for (final quote in quotes) {
          if (quote.companyCode == null || quote.quotePreLabel == null) continue;
          
          // Check if quote already exists
          final existing = await isar.quotes
              .filter()
              .companyCodeEqualTo(quote.companyCode!)
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
      print('💾 QUOTE SERVICE: Saved ${quotes.length} quotes (inserted: $inserted, updated: $updated)');
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
