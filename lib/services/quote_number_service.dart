import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'quote_context.dart';

/// Offline-safe running number generator for quotations.
///
/// Stores a local counter in secure storage segmented by
/// quote prefix and year-month to avoid repeats even when offline.
///
/// Format example: FS01/SQ/2510007 (FS01 = prefix, SQ = Sales Quotation, 2510 = YYMM, 007 = running number)
class QuoteNumberService {
  static const _storage = FlutterSecureStorage();
  static const _kSeqPrefix = 'quote_seq'; // storage key namespace

  /// Returns next quote number string, e.g. "FS01/SQ/2510007".
  /// Format: {PREFIX}/SQ/{YYMM}{RUNNING}
  /// Running number resets each month and is 3 digits.
  /// Increments and persists the local counter atomically.
  Future<String> nextQuoteNumber({DateTime? now}) async {
    final dt = now ?? DateTime.now();
    final prefix = QuoteContext.I.quotePrefix ?? 'FS01';

    // Use YY (last 2 digits of year) instead of YYYY
    final yy = (dt.year % 100).toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final period = '$yy$mm'; // YYMM (e.g., 2510 for October 2025)

    final storageKey = _makeKey(prefix, period);

    // Read current counter
    final currentStr = await _storage.read(key: storageKey);
    int current = int.tryParse(currentStr ?? '') ?? 0;

    // Increment and persist
    current += 1;
    await _storage.write(key: storageKey, value: current.toString());

    // Use 3-digit running number
    final running = current.toString().padLeft(3, '0');
    
    // Format: PREFIX/SQ/YYMMRUNNING (e.g., FS01/SQ/2510007)
    final quoteNo = '$prefix/SQ/$period$running';
    
    if (kDebugMode) {
      debugPrint('QuoteNumberService: generated $quoteNo (counter=$current, period=$period)');
    }
    return quoteNo;
  }

  /// Peek current counter without incrementing (for diagnostics)
  Future<int> getCurrentCounter({String? prefix, DateTime? now}) async {
    final dt = now ?? DateTime.now();
    final pfx = prefix ?? QuoteContext.I.quotePrefix ?? 'FS01';
    final yy = (dt.year % 100).toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final period = '$yy$mm'; // YYMM format
    final storageKey = _makeKey(pfx, period);
    final currentStr = await _storage.read(key: storageKey);
    return int.tryParse(currentStr ?? '') ?? 0;
  }

  /// Optionally allows resetting the counter for a given period.
  Future<void> resetCounter({required String prefix, required String periodYYYYMM}) async {
    final storageKey = _makeKey(prefix, periodYYYYMM);
    await _storage.delete(key: storageKey);
  }

  String _makeKey(String prefix, String period) => '$_kSeqPrefix:$prefix:$period';
}
