import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';

/// One of the group's own companies, as a sales document can be issued by it.
class AlternateCompany {
  /// `[ACC].dbo.AR_Customer.Code` — what `MP_Quote.Alternate_Company` stores.
  /// The column is `nvarchar(6)`.
  final String code;
  final String name;

  /// How many quotations have been raised under it. Only used for ordering, so
  /// the entity this branch actually trades as comes first.
  final int documents;

  const AlternateCompany({
    required this.code,
    required this.name,
    this.documents = 0,
  });

  factory AlternateCompany.fromJson(Map<String, dynamic> m) => AlternateCompany(
        code: (m['code'] ?? '').toString().trim(),
        name: (m['name'] ?? '').toString().trim(),
        documents: (m['documents'] is num)
            ? (m['documents'] as num).toInt()
            : int.tryParse('${m['documents']}') ?? 0,
      );

  Map<String, dynamic> toJson() =>
      {'code': code, 'name': name, 'documents': documents};

  /// What to show when there is room for one line.
  String get label => name.isEmpty ? code : name;
}

/// Loads the issuing entities a quotation can be raised under.
///
/// `Alternate_Company` is the ISSUING company, not the bill-to customer — the
/// quotation prefix follows it (YT/AR/YC/AA at Miri), so getting it wrong
/// files the document under the wrong entity. It is set on every one of the
/// 187,320 legacy quotes, while this app was writing none, which is why the
/// checkout now asks.
///
/// The list is cached because the checkout must work on a handheld with no
/// signal — an operator who cannot reach the server still has to be able to
/// raise the order under the entity they were using an hour ago.
class AlternateCompanyService {
  static const _storage = FlutterSecureStorage();
  static String _key(int companyCode) => 'alternate_companies_$companyCode';

  /// Cached first, then refreshed in the background.
  ///
  /// Returns the cache immediately when there is one, so the picker never
  /// blocks on the network. A failed refresh leaves the cache in place rather
  /// than emptying the list.
  Future<List<AlternateCompany>> load(int companyCode,
      {bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _readCache(companyCode);
      if (cached.isNotEmpty) {
        // Refresh for next time without making this call wait.
        unawaitedRefresh(companyCode);
        return cached;
      }
    }
    final fresh = await _fetch(companyCode);
    if (fresh.isNotEmpty) {
      await _writeCache(companyCode, fresh);
      return fresh;
    }
    return _readCache(companyCode);
  }

  void unawaitedRefresh(int companyCode) {
    _fetch(companyCode).then((fresh) {
      if (fresh.isNotEmpty) _writeCache(companyCode, fresh);
    }).catchError((_) {
      // Offline is the normal case out in the warehouse, not an error.
    });
  }

  Future<List<AlternateCompany>> _fetch(int companyCode) async {
    try {
      final uri = Uri.parse(
          '${AppConfig.apiBaseUrl}/api/alternate-companies?companyCode=$companyCode');
      final res = await http
          .get(uri, headers: AppConfig.apiHeaders)
          .timeout(const Duration(seconds: 8));
      if (res.statusCode != 200) {
        print('🏢 AltCompanies: HTTP ${res.statusCode}');
        return const [];
      }
      final decoded = jsonDecode(res.body);
      if (decoded is! List) return const [];
      return [
        for (final e in decoded)
          if (e is Map<String, dynamic>) AlternateCompany.fromJson(e)
      ].where((c) => c.code.isNotEmpty).toList();
    } catch (e) {
      print('🏢 AltCompanies: fetch failed ($e)');
      return const [];
    }
  }

  Future<List<AlternateCompany>> _readCache(int companyCode) async {
    try {
      final raw = await _storage.read(key: _key(companyCode));
      if (raw == null || raw.isEmpty) return const [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final e in decoded)
          if (e is Map<String, dynamic>) AlternateCompany.fromJson(e)
      ];
    } catch (_) {
      return const [];
    }
  }

  Future<void> _writeCache(int companyCode, List<AlternateCompany> list) async {
    try {
      await _storage.write(
          key: _key(companyCode),
          value: jsonEncode([for (final c in list) c.toJson()]));
    } catch (_) {
      // A cache write failure only costs a fetch next time.
    }
  }

  // ── The operator's last choice ──────────────────────────────────────────
  //
  // A branch raises nearly every document under the same entity, so defaulting
  // to the last one used is right far more often than defaulting to the
  // most-used across the whole company.

  static String _lastKey(int companyCode) => 'alternate_company_last_$companyCode';

  Future<String?> lastUsed(int companyCode) async {
    try {
      final v = await _storage.read(key: _lastKey(companyCode));
      return (v ?? '').trim().isEmpty ? null : v!.trim();
    } catch (_) {
      return null;
    }
  }

  Future<void> rememberUsed(int companyCode, String code) async {
    try {
      await _storage.write(key: _lastKey(companyCode), value: code.trim());
    } catch (_) {
      // Preference only.
    }
  }
}
