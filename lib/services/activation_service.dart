import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'license_service.dart';
import 'quote_context.dart';

/// Device activation, now backed by the shared IMS licence Worker
/// (Cloudflare Workers + KV) instead of this app's own
/// `/activation/validate-consume` endpoint — the same scheme IMS Procurement
/// uses, so one AppKey store serves every IMS app.
///
/// The public surface is unchanged ([isActivated], [getQuotePrefix],
/// [resetActivation], [validateAndConsumeKey]) so `main.dart` and
/// [QuoteContext] didn't need touching. What changed is where the answer comes
/// from, and that a licence can now be withdrawn remotely.
class ActivationService {
  static const _storage = FlutterSecureStorage();
  static const _kActivated = 'activated';
  static const _kQuotePrefix = 'quote_prefix';

  /// Legacy key from the old local-activation scheme, cleared on reset so a
  /// device can't half-remember two activation systems at once.
  static const _kLegacyLicenseToken = 'license_token';

  final LicenseService _license = LicenseService();

  /// True when this device holds a licence record. Whether that licence is
  /// still *good* is [checkLicense]'s job — this only answers "has an AppKey
  /// ever been accepted here", which is what decides between the activation
  /// screen and the app.
  Future<bool> isActivated() async {
    if (await _license.cachedLicense() != null) return true;
    // Devices activated under the old scheme stay activated until reset, so
    // upgrading the app doesn't lock a working handheld out in the field.
    return (await _storage.read(key: _kActivated)) == 'true';
  }

  /// Re-validates against the Worker (or the cache when offline). Call at
  /// startup to honour revoke / expiry / maintenance / forced-upgrade.
  Future<LicenseResult> checkLicense() => _license.check();

  /// The document-number prefix — `custom_1` on the licence record.
  ///
  /// Falls back to the value stored by the old activation scheme so devices
  /// that upgrade keep minting numbers in their existing series. Two devices
  /// sharing a prefix mint colliding Pick_PreLabels, which the server upserts
  /// into one merged document — so this must stay unique per licence.
  Future<String?> getQuotePrefix() async {
    final fromLicence = (await _license.cachedLicense())?.quotePrefix ?? '';
    if (fromLicence.isNotEmpty) return fromLicence;
    return _storage.read(key: _kQuotePrefix);
  }

  Future<String?> getLicenseToken() async =>
      (await _license.cachedLicense())?.appKey;

  Future<void> resetActivation() async {
    await _license.clear();
    await _storage.delete(key: _kActivated);
    await _storage.delete(key: _kQuotePrefix);
    await _storage.delete(key: _kLegacyLicenseToken);
    QuoteContext.I.setQuotePrefix('');
  }

  /// Validates an AppKey with the licence Worker and activates the device.
  ///
  /// Throws with an operator-readable reason on refusal, so the activation
  /// page can surface it directly.
  Future<void> validateAndConsumeKey(String appKey) async {
    final res = await _license.activate(appKey);
    if (!res.state.allowsUse) {
      throw Exception(res.state.message);
    }

    final lic = res.license!;
    final prefix = lic.quotePrefix;
    if (prefix.isEmpty) {
      // Refuse rather than silently defaulting: a wrong or shared prefix mints
      // colliding document numbers, and /api/picks upserts those into a single
      // merged pick. Better to block activation than to corrupt numbering.
      //
      // Drop the cached record first. LicenseService caches on a successful
      // /validate, which happens BEFORE this check — leaving it would make
      // isActivated() true for an activation that actually failed, so the next
      // launch would skip the activation screen entirely and run with no
      // document prefix.
      await _license.clear();
      throw Exception(
        'This licence has no document prefix (custom_1) set. Ask your '
        'administrator to set it on this AppKey, then activate again.',
      );
    }

    await _storage.write(key: _kActivated, value: 'true');
    // Mirror into the legacy slot so a first run with no connectivity still
    // finds a prefix.
    await _storage.write(key: _kQuotePrefix, value: prefix);
    QuoteContext.I.setQuotePrefix(prefix);
  }
}
