import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../config/app_config.dart';
import '../main.dart';
import '../models/representative.dart';
import 'offline_first_service.dart';

class RepresentativeService {
  /// Local-only: read whatever is currently cached for the company.
  Future<List<Representative>> getCachedRepresentatives({required int companyCode}) async {
    try {
      final reps = await isar.representatives
          .filter()
          .companyCodeEqualTo(companyCode)
          .sortByFullName()
          .findAll();
      return reps;
    } catch (e) {
      print('❌ REPRESENTATIVE: cache read failed: $e');
      return [];
    }
  }

  /// Fetch from server (HTTP) and replace the per-company cache. Returns the
  /// fresh list. Falls back to cached data on any network/parse error so the
  /// caller can still populate a dropdown when offline.
  Future<List<Representative>> fetchRepresentatives({required int companyCode}) async {
    // Fast path: if recent connectivity check says we're offline, skip the
    // HTTP attempt entirely instead of waiting on a timeout.
    if (!OfflineFirstService.isLikelyOnline()) {
      print('📋 REPRESENTATIVE: offline (cached state) — using cache');
      return await getCachedRepresentatives(companyCode: companyCode);
    }

    final uri = Uri.parse(
      '${AppConfig.apiBaseUrl}/api/representatives?companyCode=$companyCode',
    );

    try {
      print('📋 REPRESENTATIVE: fetching from $uri');
      final response = await http.get(uri).timeout(const Duration(seconds: 3));

      if (response.statusCode != 200) {
        print('⚠️ REPRESENTATIVE: server returned ${response.statusCode}: ${response.body}');
        return await getCachedRepresentatives(companyCode: companyCode);
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! List) {
        print('⚠️ REPRESENTATIVE: unexpected response shape: ${decoded.runtimeType}');
        return await getCachedRepresentatives(companyCode: companyCode);
      }

      final reps = decoded
          .map((e) => Representative.fromJson(e as Map<String, dynamic>))
          .toList();

      await isar.writeTxn(() async {
        final existing = await isar.representatives
            .filter()
            .companyCodeEqualTo(companyCode)
            .findAll();
        if (existing.isNotEmpty) {
          await isar.representatives
              .deleteAll(existing.map((r) => r.id).toList());
        }
        await isar.representatives.putAll(reps);
      });

      print('✅ REPRESENTATIVE: cached ${reps.length} for company $companyCode');
      return reps;
    } catch (e) {
      print('⚠️ REPRESENTATIVE: fetch failed, using cache: $e');
      return await getCachedRepresentatives(companyCode: companyCode);
    }
  }
}
