import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// How far back the handheld pulls invoice and quote history.
///
/// This is a *retention* bound, and quite separate from the delta watermark:
/// the watermark answers "what changed since I last looked", this answers "how
/// much past is worth carrying at all". Without it a first sync drags the
/// entire ledger onto the device — on the YeonTak data that is ~2.05 million
/// rows across four tables, of which the last 180 days account for under 8%.
///
/// Persisted through FlutterSecureStorage, the same store the document-number
/// services use, so this needs no new dependency and survives a reinstall.
/// Stored as a day count; the literal 'all' means unbounded, rather than
/// overloading a number with a second meaning.
class SyncHistoryWindow {
  SyncHistoryWindow._();

  static const _storage = FlutterSecureStorage();
  static const String _key = 'sync_history_days';
  static const String _all = 'all';

  /// Offered in the picker, narrowest first. `null` = no bound.
  static const List<int?> options = [30, 90, 180, 365, null];

  /// Six months: long enough to cover a reorder cycle, short enough that a
  /// first sync finishes while someone waits for it.
  static const int defaultDays = 180;

  /// The chosen window, or [defaultDays] if the user has never picked one.
  static Future<int?> get days async {
    final raw = await _storage.read(key: _key);
    if (raw == null) return defaultDays;
    if (raw == _all) return null;
    return int.tryParse(raw) ?? defaultDays;
  }

  static Future<void> setDays(int? value) =>
      _storage.write(key: _key, value: value?.toString() ?? _all);

  /// True when the user has never chosen, so the caller can ask rather than
  /// silently applying a default to their first — and largest — sync.
  static Future<bool> get isUnset async =>
      (await _storage.read(key: _key)) == null;

  /// The cutoff to send to the server, or null for no bound.
  static DateTime? sinceDateFor(int? days) =>
      days == null ? null : DateTime.now().subtract(Duration(days: days));

  /// Is [candidate] a wider window than what is currently stored?
  ///
  /// Widening is the one direction that needs the delta checkpoints cleared.
  /// The watermark records how far *forward* we have read and says nothing
  /// about how far back, so going from 90 days to 365 without a reset leaves
  /// the extra year permanently invisible — the same failure that once hid
  /// the whole inventory catalogue when a refresh dropped rows but kept the
  /// checkpoint.
  ///
  /// Narrowing needs no reset: the older data is already local and simply
  /// stops being topped up.
  static Future<bool> isWiderThanStored(int? candidate) async {
    final current = await days;
    if (current == null) return false;      // already unbounded
    if (candidate == null) return true;     // bounded -> unbounded
    return candidate > current;
  }

  /// Human label, used by the picker and the settings summary.
  static String label(int? days) {
    if (days == null) return 'Everything';
    if (days % 365 == 0) {
      final y = days ~/ 365;
      return y == 1 ? 'Last 12 months' : 'Last $y years';
    }
    if (days % 30 == 0) {
      final m = days ~/ 30;
      return m == 1 ? 'Last month' : 'Last $m months';
    }
    return 'Last $days days';
  }
}
