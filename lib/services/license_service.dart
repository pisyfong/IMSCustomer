import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'device_fingerprint_service.dart';

/// Why the app is (or isn't) allowed to run.
///
/// Mirrors the Worker's own precedence: revoked beats maintenance beats
/// expired. [offlineGrace] and [offlineExpired] are decided locally from the
/// cached record when the Worker can't be reached.
enum LicenseState {
  /// No AppKey entered yet.
  none,

  /// Validated (online, or within the offline grace window).
  ok,

  /// Key isn't in the store.
  unknown,

  /// Key was issued for a different app.
  wrongApp,

  /// The key is already bound to a different device. The Worker binds `uid` on
  /// first successful validate; an administrator must /unbind to move it.
  deviceMismatch,

  /// Killed by the licensor.
  revoked,

  /// Temporarily withdrawn.
  maintenance,

  /// Past expiry_date.
  expired,

  /// need_app_upgrade == 'Y'.
  upgradeRequired,

  /// Offline, cached record still inside the grace window.
  offlineGrace,

  /// Offline for longer than the grace window — must reconnect to re-verify.
  offlineExpired,
}

extension LicenseStateInfo on LicenseState {
  /// Can the app proceed past the licence gate?
  bool get allowsUse => this == LicenseState.ok || this == LicenseState.offlineGrace;

  String get message => switch (this) {
        LicenseState.none => 'Enter your AppKey to activate this device.',
        LicenseState.ok => 'Licence active.',
        LicenseState.unknown =>
          'This AppKey was not recognised. Check it and try again.',
        LicenseState.wrongApp =>
          'This AppKey belongs to a different IMS app.',
        LicenseState.deviceMismatch =>
          'This AppKey is already in use on another device. Ask your '
          'administrator to release (unbind) it before activating here.',
        LicenseState.revoked =>
          'This licence has been revoked. Contact your administrator.',
        LicenseState.maintenance =>
          'The system is under maintenance. Please try again later.',
        LicenseState.expired =>
          'This licence has expired. Contact your administrator to renew it.',
        LicenseState.upgradeRequired =>
          'A newer version of the app is required before you can continue.',
        LicenseState.offlineGrace => 'Licence active (verified offline).',
        LicenseState.offlineExpired =>
          'Could not verify the licence. Connect to the internet once to continue.',
      };
}

/// The licence record as returned by the Worker and cached on the device.
class License {
  final String appKey;
  final String app;
  final String companyName;
  final String masterUrl;
  final String expiryDate; // 'YYYY-MM-DD', or '' for none
  final String logo;
  final int totalDevice;
  final String needAppUpgrade; // 'Y' / 'N'
  final String appStoreUrl;
  final String uid;

  /// custom_1 — the document-number prefix (e.g. 'PI99' → PI99/PK/2608001).
  final String quotePrefix;

  /// When this device last got a successful answer from the Worker.
  final DateTime? validatedAt;

  const License({
    required this.appKey,
    this.app = '',
    this.companyName = '',
    this.masterUrl = '',
    this.expiryDate = '',
    this.logo = '',
    this.totalDevice = 0,
    this.needAppUpgrade = 'N',
    this.appStoreUrl = '',
    this.uid = '',
    this.quotePrefix = '',
    this.validatedAt,
  });

  bool get isExpired =>
      expiryDate.isNotEmpty &&
      expiryDate.compareTo(DateTime.now().toIso8601String().substring(0, 10)) < 0;

  factory License.fromValidate(String appKey, Map<String, dynamic> j) {
    String s(String k) => (j[k] ?? '').toString();
    return License(
      appKey: appKey,
      // The Worker does not currently echo `app`; empty means "can't check".
      app: s('app'),
      companyName: s('company_name'),
      masterUrl: s('master_url'),
      expiryDate: s('expiry_date'),
      logo: s('logo'),
      totalDevice: int.tryParse(s('total_device')) ?? 0,
      needAppUpgrade: s('need_app_upgrade').isEmpty ? 'N' : s('need_app_upgrade'),
      appStoreUrl: s('app_store_url'),
      uid: s('uid'),
      // custom_1 carries the document prefix. Accept a couple of spellings so
      // a Worker update doesn't have to land in lock-step with the app.
      quotePrefix: [s('custom_1'), s('custom1'), s('quote_prefix')]
          .firstWhere((v) => v.isNotEmpty, orElse: () => ''),
      validatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'appKey': appKey,
        'app': app,
        'company_name': companyName,
        'master_url': masterUrl,
        'expiry_date': expiryDate,
        'logo': logo,
        'total_device': totalDevice,
        'need_app_upgrade': needAppUpgrade,
        'app_store_url': appStoreUrl,
        'uid': uid,
        'custom_1': quotePrefix,
        'validated_at': validatedAt?.toIso8601String(),
      };

  factory License.fromCache(Map<String, dynamic> j) {
    String s(String k) => (j[k] ?? '').toString();
    return License(
      appKey: s('appKey'),
      app: s('app'),
      companyName: s('company_name'),
      masterUrl: s('master_url'),
      expiryDate: s('expiry_date'),
      logo: s('logo'),
      totalDevice: int.tryParse(s('total_device')) ?? 0,
      needAppUpgrade: s('need_app_upgrade').isEmpty ? 'N' : s('need_app_upgrade'),
      appStoreUrl: s('app_store_url'),
      uid: s('uid'),
      quotePrefix: s('custom_1'),
      validatedAt: DateTime.tryParse(s('validated_at')),
    );
  }
}

/// Result of a licence check: the verdict plus whatever record we have.
class LicenseResult {
  final LicenseState state;
  final License? license;
  const LicenseResult(this.state, this.license);
}

/// Talks to the shared IMS licence Worker (Cloudflare Workers + KV) — the same
/// endpoint IMS Procurement validates against.
///
/// Contract, confirmed against the live Worker:
///   POST /validate   Authorization: Bearer <AppKey>
///   200 → {"valid":true,"status":"active","expiry_date":…,"master_url":…,
///          "company_name":…,"logo":…,"total_device":…,"need_app_upgrade":…,
///          "app_store_url":…,"first_used_at":…,"uid":…}
///   403 → {"valid":false,"status":"unknown","reason":"unknown_key"}
///
/// Offline-first: a handheld spends its day out of coverage, so a failed
/// round-trip is never itself a licence failure. The last good answer is
/// cached and honoured for [graceDays]; the expiry date is still enforced
/// locally against that cache, so an expired licence can't be extended by
/// staying offline.
class LicenseService {
  LicenseService._();
  static final LicenseService _i = LicenseService._();
  factory LicenseService() => _i;

  /// The licence Worker. Shared by every IMS app and customer — only change
  /// this if the Worker itself moves.
  static const String validateUrl =
      'https://ims-license.plusintralink.workers.dev/validate';

  /// The `app` value this build expects, when the Worker reports one. Guards
  /// against activating the customer app with a procurement key.
  static const String expectedApp = 'IMS-Customer';

  /// How long a cached validation is honoured without reaching the Worker.
  /// The expiry date is enforced regardless, so this only forgives the round
  /// trip, never the licence period.
  static const int graceDays = 14;

  static const _storage = FlutterSecureStorage();
  static const _kLicense = 'license_record';

  static const Duration _timeout = Duration(seconds: 12);

  License? _cached;

  // ─── Cache ───────────────────────────────────────────────────────────────

  Future<License?> cachedLicense() async {
    if (_cached != null) return _cached;
    final raw = await _storage.read(key: _kLicense);
    if (raw == null || raw.isEmpty) return null;
    try {
      return _cached = License.fromCache(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> _store(License lic) async {
    _cached = lic;
    await _storage.write(key: _kLicense, value: jsonEncode(lic.toJson()));
  }

  Future<void> clear() async {
    _cached = null;
    await _storage.delete(key: _kLicense);
  }

  // ─── Activation ──────────────────────────────────────────────────────────

  /// Validates [appKey] against the Worker and, on success, caches it.
  ///
  /// Unlike [check] this never falls back to cache — activating is a
  /// deliberate online action, and silently "activating" from a stale record
  /// would defeat the point.
  Future<LicenseResult> activate(String appKey) async {
    final key = appKey.trim().toUpperCase();
    if (key.isEmpty) return const LicenseResult(LicenseState.none, null);

    final res = await _validate(key);
    if (res.state.allowsUse && res.license != null) {
      await _store(res.license!);
    }
    return res;
  }

  /// Startup gate. Re-validates online when possible, else falls back to the
  /// cached record.
  Future<LicenseResult> check() async {
    final cached = await cachedLicense();
    if (cached == null) return const LicenseResult(LicenseState.none, null);

    try {
      final res = await _validate(cached.appKey);
      if (res.state.allowsUse && res.license != null) {
        await _store(res.license!);
        return res;
      }
      // A definitive negative (revoked / expired / unknown) is authoritative —
      // that's the whole point of a kill switch. Keep the cache so the reason
      // survives a restart, but report the refusal.
      return res;
    } catch (_) {
      // Couldn't reach the Worker — decide from the cache.
      return LicenseResult(_offlineVerdict(cached), cached);
    }
  }

  /// Offline verdict from a cached record. Expiry is still enforced; the grace
  /// window only forgives the *round trip*, never the expiry date.
  LicenseState _offlineVerdict(License lic) {
    if (lic.isExpired) return LicenseState.expired;
    final at = lic.validatedAt;
    if (at == null) return LicenseState.offlineExpired;
    final age = DateTime.now().difference(at).inDays;
    return age <= graceDays
        ? LicenseState.offlineGrace
        : LicenseState.offlineExpired;
  }

  // ─── Worker call ─────────────────────────────────────────────────────────

  /// Throws on transport failure so callers can distinguish "offline" from
  /// "the licensor said no".
  Future<LicenseResult> _validate(String appKey) async {
    // The device id is sent so the Worker can bind / seat-count. It is
    // ignored by Workers that don't implement binding, which is why this is
    // safe to send unconditionally.
    final deviceId = await DeviceFingerprintService().getOrCreateDeviceId();

    final resp = await http
        .post(
          Uri.parse(validateUrl),
          headers: {
            'Authorization': 'Bearer $appKey',
            'Content-Type': 'application/json',
            'X-Device-Id': deviceId,
          },
          body: jsonEncode({'uid': deviceId, 'device_id': deviceId}),
        )
        .timeout(_timeout);

    Map<String, dynamic> j;
    try {
      j = jsonDecode(resp.body) as Map<String, dynamic>;
    } catch (_) {
      throw Exception('Bad response from licence server (${resp.statusCode})');
    }

    final valid = j['valid'] == true;
    final reason = (j['reason'] ?? '').toString();
    final status = (j['status'] ?? '').toString();

    if (!valid) {
      return LicenseResult(
        switch (reason.isNotEmpty ? reason : status) {
          'revoked' => LicenseState.revoked,
          'maintenance' => LicenseState.maintenance,
          'expired' => LicenseState.expired,
          'device_mismatch' => LicenseState.deviceMismatch,
          'unknown_key' || 'unknown' => LicenseState.unknown,
          _ => LicenseState.unknown,
        },
        null,
      );
    }

    final lic = License.fromValidate(appKey, j);

    // Belt and braces: the Worker enforces these, but a cached-then-restored
    // record shouldn't depend on that alone.
    if (lic.app.isNotEmpty && lic.app != expectedApp) {
      return LicenseResult(LicenseState.wrongApp, lic);
    }
    if (lic.isExpired) return LicenseResult(LicenseState.expired, lic);
    if (lic.needAppUpgrade.toUpperCase() == 'Y') {
      return LicenseResult(LicenseState.upgradeRequired, lic);
    }

    if (kDebugMode) {
      debugPrint('Licence OK: ${lic.companyName} '
          '(prefix "${lic.quotePrefix}", expires ${lic.expiryDate})');
    }
    return LicenseResult(LicenseState.ok, lic);
  }
}
