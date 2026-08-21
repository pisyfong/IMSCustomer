import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'quote_context.dart';

/// Offline-safe running number generator for MP_Pick_List rows.
/// Mirrors QuoteNumberService but namespaced under `pick_seq` and stamped
/// with a `PK` section so pick PreLabels never collide with quote PreLabels
/// even though both share the same nvarchar(15) column type on the server.
///
/// Format: {PREFIX}/PK/{YYMM}{RUNNING}   e.g. FS01/PK/2607001
class PickNumberService {
  static const _storage = FlutterSecureStorage();
  static const _kSeqPrefix = 'pick_seq';

  Future<String> nextPickNumber({DateTime? now}) async {
    final dt = now ?? DateTime.now();
    final prefix = QuoteContext.I.quotePrefix ?? 'FS01';

    final yy = (dt.year % 100).toString().padLeft(2, '0');
    final mm = dt.month.toString().padLeft(2, '0');
    final period = '$yy$mm';

    final storageKey = _makeKey(prefix, period);
    final currentStr = await _storage.read(key: storageKey);
    int current = int.tryParse(currentStr ?? '') ?? 0;
    current += 1;
    await _storage.write(key: storageKey, value: current.toString());

    final running = current.toString().padLeft(3, '0');
    final preLabel = '$prefix/PK/$period$running';

    if (kDebugMode) debugPrint('PickNumberService: generated $preLabel');
    return preLabel;
  }

  String _makeKey(String prefix, String period) => '$_kSeqPrefix:$prefix:$period';
}
