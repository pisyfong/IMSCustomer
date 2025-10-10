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
  Future<String> getOrCreateDeviceId() async {
    try {
      // First try to get platform-specific stable ID
      String? platformId;
      
      if (Platform.isAndroid) {
        final info = await _deviceInfo.androidInfo;
        // Use id property which contains Android ID in device_info_plus 11.x
        platformId = info.id; // Android ID - persists across app reinstalls
        debugPrint('DeviceFingerprint: Android ID = $platformId');
      } else if (Platform.isIOS) {
        final info = await _deviceInfo.iosInfo;
        platformId = info.identifierForVendor; // iOS vendor ID
      }
      
      // Use platform ID if available and valid
      if (platformId != null && platformId.isNotEmpty && platformId != 'unknown') {
        return platformId;
      }
      
      // Fallback to secure storage UUID (for cases where platform ID unavailable)
      final existing = await _storage.read(key: _kDeviceIdKey);
      if (existing != null && existing.isNotEmpty) return existing;

      final newId = const Uuid().v4();
      await _storage.write(key: _kDeviceIdKey, value: newId);
      debugPrint('DeviceFingerprint: Using fallback UUID as platform ID unavailable');
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
