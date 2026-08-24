import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Whether scanning books items in their basic unit regardless of which unit
/// the barcode stands for.
///
/// Defaults to ON, and stays on until someone deliberately turns it off:
/// counting everything in one unit is what most operations want, and it is
/// also the safer default — booking a carton barcode as a carton when the
/// operator meant pieces overstates the order by the pack size, which is a
/// harder mistake to spot than the reverse.
class ScanUomPref {
  static const _storage = FlutterSecureStorage();
  static const String _key = 'scan_prefer_basic_uom';

  static const bool defaultValue = true;

  static Future<bool> load() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null) return defaultValue;
      return raw == 'true';
    } catch (_) {
      // A storage failure must never keep the scanner off the screen, and the
      // default is the safe one.
      return defaultValue;
    }
  }

  static Future<void> save(bool value) async {
    try {
      await _storage.write(key: _key, value: value ? 'true' : 'false');
    } catch (_) {
      // Preference only — losing it costs the operator one tap.
    }
  }
}
