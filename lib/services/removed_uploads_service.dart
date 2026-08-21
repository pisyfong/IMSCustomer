import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// One removed pending-upload row, as the recycle bin lists it.
class RemovedUpload {
  final String key;

  /// What to call it on screen. Stored alongside the key because the row it
  /// came from is filtered out of every list — without this the recycle bin
  /// could only offer `SQ|FST/SQ/002755` back to the operator.
  final String label;
  final String kind;
  final DateTime removedAt;

  const RemovedUpload({
    required this.key,
    required this.label,
    required this.kind,
    required this.removedAt,
  });

  Map<String, dynamic> toJson() => {
        'key': key,
        'label': label,
        'kind': kind,
        'at': removedAt.toIso8601String(),
      };

  factory RemovedUpload.fromJson(Map<String, dynamic> m) => RemovedUpload(
        key: (m['key'] ?? '').toString(),
        label: (m['label'] ?? '').toString(),
        kind: (m['kind'] ?? '').toString(),
        removedAt:
            DateTime.tryParse((m['at'] ?? '').toString()) ?? DateTime(1970),
      );
}

/// The pending-upload rows the operator has removed.
///
/// "Removed" is what it is called on screen and what it feels like — the row
/// disappears from the list, from the tab counts and from the dashboard badge.
/// Underneath, nothing is destroyed: the document is still in Isar, still
/// `isSynced = false`, and still uploadable the moment it is restored. Nothing
/// is sent to the server.
///
/// That gap between the wording and the mechanism is deliberate. This screen
/// is the only evidence that work has not reached the server, so a real delete
/// would throw away the record of an unsent order. The recycle bin is what
/// makes the honest version safe to present as a delete.
///
/// Rows are keyed by pre-label rather than Isar id: an id is a local row
/// number that changes when a resync rebuilds the record, which would either
/// resurrect a removed row or, worse, remove whichever row inherited the
/// number.
class RemovedUploadsService {
  static const _storage = FlutterSecureStorage();
  static const _key = 'removed_pending_uploads';

  /// Namespaced so a quotation and a pick that happen to share a pre-label
  /// cannot remove one another.
  static String keyFor(String kind, String? preLabel) =>
      '$kind|${(preLabel ?? '').trim().toUpperCase()}';

  Future<List<RemovedUpload>> load() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null || raw.isEmpty) return const [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      final out = <RemovedUpload>[
        for (final e in decoded)
          if (e is Map<String, dynamic>) RemovedUpload.fromJson(e)
      ].where((e) => e.key.isNotEmpty).toList();
      // Newest first: the thing just removed by mistake is the thing most
      // likely to be wanted back.
      out.sort((a, b) => b.removedAt.compareTo(a.removedAt));
      return out;
    } catch (_) {
      // A read failure must show every row rather than none: the risk of an
      // unreadable store is a cluttered list, never a lost document.
      return const [];
    }
  }

  Future<Set<String>> loadKeys() async =>
      {for (final e in await load()) e.key};

  Future<void> _save(List<RemovedUpload> rows) async {
    try {
      if (rows.isEmpty) {
        await _storage.delete(key: _key);
        return;
      }
      await _storage.write(
          key: _key, value: jsonEncode([for (final r in rows) r.toJson()]));
    } catch (_) {
      // Losing the preference only means a removed row comes back.
    }
  }

  Future<List<RemovedUpload>> remove({
    required String key,
    required String label,
    required String kind,
    required DateTime at,
  }) async {
    final rows = [...await load()]..removeWhere((e) => e.key == key);
    rows.add(RemovedUpload(key: key, label: label, kind: kind, removedAt: at));
    await _save(rows);
    return load();
  }

  Future<List<RemovedUpload>> restore(String key) async {
    final rows = [...await load()]..removeWhere((e) => e.key == key);
    await _save(rows);
    return rows;
  }

  Future<List<RemovedUpload>> restoreAll() async {
    await _save(const []);
    return const [];
  }
}
