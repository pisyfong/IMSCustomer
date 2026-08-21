import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

/// Provides a stable, app-specific device identifier and non-sensitive
/// device metadata for activation and validation.
class DeviceFingerprintService {
  static const _storage = FlutterSecureStorage();
  static const _kDeviceIdKey = 'device_id';

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Returns a stable, device-specific identifier that persists across app reinstalls.
  ///
  /// Uses Android ID (or iOS identifierForVendor) as primary identifier.
  /// Falls back to secure storage UUID if platform ID unavailable.
  ///
  /// NOTE: on Android this is a locally-generated UUID, NOT a platform ID.
  /// `AndroidDeviceInfo.id` is `Build.ID` — the OS *build* identifier (e.g.
  /// "TKQ1.230420.001"), which is identical on every handheld running the same
  /// firmware. It was being used here as though it were ANDROID_ID, so every
  /// EDA52 on the same image reported the same "device". That made licence
  /// device-binding and seat counting meaningless. device_info_plus no longer
  /// exposes ANDROID_ID at all (removed for privacy), so a persisted UUID is
  /// the correct primary identifier.
  ///
  /// Trade-off: secure storage generally does not survive an app *uninstall*,
  /// so a reinstall looks like a new device and the licence must be unbound by
  /// an administrator. That's the intended workflow (the admin tool has an
  /// /unbind action) and is far better than every device sharing one id.
  Future<String> getOrCreateDeviceId() async {
    try {
      // Persisted per-install UUID — the identity we actually bind licences to.
      final existing = await _storage.read(key: _kDeviceIdKey);
      if (existing != null && existing.isNotEmpty) return existing;

      // iOS does expose a genuine per-vendor device id; prefer it there and
      // persist it so the value is stable even if the API stops answering.
      String? platformId;
      if (Platform.isIOS) {
        final info = await _deviceInfo.iosInfo;
        platformId = info.identifierForVendor;
      }

      if (platformId != null && platformId.isNotEmpty && platformId != 'unknown') {
        await _storage.write(key: _kDeviceIdKey, value: platformId);
        return platformId;
      }
      
      // Android, and any platform without a usable per-device id: mint one and
      // keep it. First call on a device decides its identity for good.
      final newId = const Uuid().v4();
      await _storage.write(key: _kDeviceIdKey, value: newId);
      debugPrint('DeviceFingerprint: minted new device id');
      return newId;
    } catch (e) {
      // As a last resort, fall back to an ephemeral id (not persisted)
      // so activation call can still proceed. Prefer secure storage.
      debugPrint('DeviceFingerprint: secure storage failed, using ephemeral id. Error: $e');
      return const Uuid().v4();
    }
  }

  /// Platform-specific identifiers (best-effort, may be null depending on OEM/policy):
  /// - Android: ANDROID_ID (Settings.Secure.ANDROID_ID) via device_info_plus
  /// - iOS: identifierForVendor via device_info_plus
  Future<Map<String, String?>> getPlatformIds() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfo.androidInfo;
        return {
          'androidId': info.id, // device_info_plus 11.x: use id
          'hardware': info.hardware,
          'brand': info.brand,
          'device': info.device,
          'model': info.model,
        };
      } else if (Platform.isIOS) {
        final info = await _deviceInfo.iosInfo;
        return {
          'identifierForVendor': info.identifierForVendor,
          'name': info.name,
          'systemName': info.systemName,
          'systemVersion': info.systemVersion,
          'model': info.model,
        };
      }
    } catch (e) {
      debugPrint('DeviceFingerprint: getPlatformIds error: $e');
    }
    return {};
  }

  /// Basic device + app metadata (non-sensitive) helpful for activation logs.
  Future<Map<String, String>> getMetadata() async {
    final pkg = await PackageInfo.fromPlatform();
    final map = <String, String>{
      'platform': Platform.operatingSystem,
      'osVersion': Platform.operatingSystemVersion,
      'appName': pkg.appName,
      'packageName': pkg.packageName,
      'version': pkg.version,
      'buildNumber': pkg.buildNumber,
    };
    try {
      final ids = await getPlatformIds();
      ids.forEach((k, v) {
        if (v != null) map[k] = v;
      });
    } catch (_) {}
    return map;
  }

  /// Composes the full fingerprint payload to send to backend on activation.
  Future<Map<String, dynamic>> buildFingerprintPayload() async {
    final deviceId = await getOrCreateDeviceId();
    final meta = await getMetadata();
    return {
      'deviceId': deviceId,
      'metadata': meta,
    };
  }
}
