import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import 'device_fingerprint_service.dart';
import 'quote_context.dart';

class ActivationService {
  static const _storage = FlutterSecureStorage();
  static const _kActivated = 'activated';
  static const _kLicenseToken = 'license_token';
  static const _kQuotePrefix = 'quote_prefix';

  Future<bool> isActivated() async {
    final v = await _storage.read(key: _kActivated);
    return v == 'true';
  }

  Future<void> saveActivation({required String licenseToken, required String quotePrefix}) async {
    await _storage.write(key: _kActivated, value: 'true');
    await _storage.write(key: _kLicenseToken, value: licenseToken);
    await _storage.write(key: _kQuotePrefix, value: quotePrefix);
    // Update in-memory context for immediate availability
    QuoteContext.I.setQuotePrefix(quotePrefix);
  }

  Future<String?> getQuotePrefix() => _storage.read(key: _kQuotePrefix);
  Future<String?> getLicenseToken() => _storage.read(key: _kLicenseToken);

  Future<void> resetActivation() async {
    await _storage.delete(key: _kActivated);
    await _storage.delete(key: _kLicenseToken);
    await _storage.delete(key: _kQuotePrefix);
  }

  /// Validate and consume a one-time activation key with backend.
  /// Expects backend to return { quotePrefix, licenseToken } on success.
  Future<void> validateAndConsumeKey(String validationKey) async {
    final fingerprint = await DeviceFingerprintService().buildFingerprintPayload();

    final uri = Uri.parse('${AppConfig.baseUrl}/activation/validate-consume');
    final resp = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'validationKey': validationKey.trim(),
        'device': fingerprint,
      }),
    );

    if (resp.statusCode != 200) {
      debugPrint('Activation failed: HTTP ${resp.statusCode} ${resp.body}');
      throw Exception('Activation failed (${resp.statusCode}).');
    }

    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    final quotePrefix = (data['quotePrefix'] ?? '').toString();
    final licenseToken = (data['licenseToken'] ?? '').toString();

    if (quotePrefix.isEmpty || licenseToken.isEmpty) {
      throw Exception('Invalid activation response.');
    }

    // Make the prefix available immediately in app state
    QuoteContext.I.setQuotePrefix(quotePrefix);
    await saveActivation(licenseToken: licenseToken, quotePrefix: quotePrefix);
  }
}

