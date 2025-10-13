import 'package:isar/isar.dart';
import '../models/credit_term.dart';
import '../main.dart';
import 'signalr_service.dart';

class CreditTermService {
  final SignalRService signalRService;

  CreditTermService(this.signalRService);

  /// Fetch credit terms from server and store locally
  Future<List<CreditTerm>> fetchCreditTerms({required int companyCode}) async {
    try {
      print('📋 CREDIT TERMS: Fetching from server for company $companyCode');
      
      // Try SignalR first
      List<dynamic>? result;
      try {
        result = await signalRService.invoke('getCreditTerms', [companyCode]);
      } catch (e) {
        print('⚠️ CREDIT TERMS: SignalR failed, will use cached data: $e');
      }

      if (result == null || result.isEmpty) {
        print('📋 CREDIT TERMS: No data from server, returning cached data');
        return await getCreditTerms(companyCode: companyCode);
      }

      final creditTerms = result
          .map((json) => CreditTerm.fromJson(json as Map<String, dynamic>))
          .toList();

      // Save to local database
      await isar.writeTxn(() async {
        // Clear existing credit terms for this company
        final existing = await isar.creditTerms
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
        await isar.creditTerms.deleteAll(existing.map((e) => e.id).toList());

        // Save new credit terms
        for (final term in creditTerms) {
          await isar.creditTerms.put(term);
        }
      });

      print('✅ CREDIT TERMS: Saved ${creditTerms.length} credit terms to local database');
      return creditTerms;
    } catch (e) {
      print('❌ CREDIT TERMS: Error fetching from server: $e');
      // Return cached data on error
      return await getCreditTerms(companyCode: companyCode);
    }
  }

  /// Get credit terms from local database
  Future<List<CreditTerm>> getCreditTerms({required int companyCode}) async {
    try {
      final terms = await isar.creditTerms
          .filter()
          .companyCodeEqualTo(companyCode)
          .sortByOrdering()
          .findAll();
      
      print('📋 CREDIT TERMS: Found ${terms.length} cached credit terms');
      return terms;
    } catch (e) {
      print('❌ CREDIT TERMS: Error getting from cache: $e');
      return [];
    }
  }

  /// Get a specific credit term
  Future<CreditTerm?> getCreditTerm({
    required int companyCode,
    required String term,
  }) async {
    try {
      return await isar.creditTerms
          .filter()
          .companyCodeEqualTo(companyCode)
          .termEqualTo(term)
          .findFirst();
    } catch (e) {
      print('❌ CREDIT TERMS: Error getting credit term: $e');
      return null;
    }
  }

  /// Get default credit term (usually the first one or with specific type)
  Future<CreditTerm?> getDefaultCreditTerm({required int companyCode}) async {
    try {
      final terms = await getCreditTerms(companyCode: companyCode);
      if (terms.isEmpty) return null;
      
      // Try to find a default term (you can customize this logic)
      // For now, return the first one sorted by ordering
      return terms.first;
    } catch (e) {
      print('❌ CREDIT TERMS: Error getting default term: $e');
      return null;
    }
  }
}
