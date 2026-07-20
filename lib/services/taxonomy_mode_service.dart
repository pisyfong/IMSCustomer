import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum TaxonomyMode { pi, web }

/// Per-device switch: choose which taxonomy tables drive
/// Group / Dept / Category / SubDept lookups and filters.
///   pi  -> PI_Group + In_Stock.Grp/Dept/SubDept/Category (default)
///   web -> Web_Group / Web_Dept / Web_Category / Web_Sub_Dept + In_Stock.Web_* columns
class TaxonomyModeService {
  TaxonomyModeService._();
  static final TaxonomyModeService instance = TaxonomyModeService._();

  static const _key = 'taxonomy_mode';
  final _storage = const FlutterSecureStorage();

  TaxonomyMode? _cached;

  Future<TaxonomyMode> getMode() async {
    if (_cached != null) return _cached!;
    final raw = await _storage.read(key: _key);
    _cached = (raw == 'web') ? TaxonomyMode.web : TaxonomyMode.pi;
    return _cached!;
  }

  Future<void> setMode(TaxonomyMode mode) async {
    _cached = mode;
    await _storage.write(key: _key, value: mode == TaxonomyMode.web ? 'web' : 'pi');
  }

  /// Non-async accessor. Returns pi if cache is not warm yet — callers that
  /// need certainty should await getMode() first (typically at app startup).
  TaxonomyMode get modeOrDefault => _cached ?? TaxonomyMode.pi;
}
