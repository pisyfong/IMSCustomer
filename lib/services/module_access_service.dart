import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import 'auth_service.dart';

/// Which modules the signed-in user may use.
class ModuleAccess {
  final bool ordering;
  final bool picking;
  final bool packing;
  final bool creditNote;

  const ModuleAccess({
    this.ordering = true,
    this.picking = true,
    this.packing = true,
    this.creditNote = true,
  });

  /// Everything on. Used before the first fetch and whenever the server or the
  /// file cannot answer — see [ModuleAccessService] for why that direction.
  static const ModuleAccess all = ModuleAccess();

  factory ModuleAccess.fromJson(Map<String, dynamic> m) {
    bool flag(String k) => m[k] == true || m[k] == 'Y';
    return ModuleAccess(
      ordering: flag('ordering'),
      picking: flag('picking'),
      packing: flag('packing'),
      creditNote: flag('creditNote'),
    );
  }

  Map<String, dynamic> toJson() => {
        'ordering': ordering,
        'picking': picking,
        'packing': packing,
        'creditNote': creditNote,
      };

  bool get any => ordering || picking || packing || creditNote;
}

/// Reads the four access flags from the backend's `access.json`.
///
/// ## Fails open, deliberately
///
/// A missing file, an unreachable server or a parse error all resolve to
/// [ModuleAccess.all]. This is a convenience control for deciding who sees
/// which button — not a security boundary. The server still enforces what it
/// enforces, and locking a driver out of picking because the warehouse wifi
/// dropped would be a worse failure than showing a button they rarely use.
///
/// The last answer is cached, so a handheld that goes offline keeps whatever
/// was configured rather than silently widening back to everything.
class ModuleAccessService {
  static final ModuleAccessService _i = ModuleAccessService._();
  factory ModuleAccessService() => _i;
  ModuleAccessService._();

  static const _storage = FlutterSecureStorage();
  static String _key(String user) => 'module_access_$user';

  ModuleAccess _current = ModuleAccess.all;
  bool _resolved = false;

  /// The flags as last resolved. Safe to read synchronously while building.
  ///
  /// All-allowed until the first [load], so check [resolved] if the difference
  /// between "not asked yet" and "allowed" matters.
  ModuleAccess get current => _current;

  /// Whether a real answer — cached or fresh — has been applied yet.
  bool get resolved => _resolved;

  String get _user {
    final u = AuthService().currentUser;
    final name = (u?.loginName ?? '').trim();
    if (name.isNotEmpty) return name;
    return (u?.userId ?? '').toString();
  }

  /// Cache first so the UI can paint, then refresh from the server.
  Future<ModuleAccess> load() async {
    final user = _user;
    final cached = await _readCache(user);
    if (cached != null) {
      _current = cached;
      _resolved = true;
    }

    final fresh = await _fetch(user);
    if (fresh != null) {
      _current = fresh;
      _resolved = true;
      await _writeCache(user, fresh);
    } else if (cached == null) {
      // Never configured and unreachable — everything stays available.
      _current = ModuleAccess.all;
    }
    return _current;
  }

  Future<ModuleAccess?> _fetch(String user) async {
    try {
      final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/module-access'
          '?user=${Uri.encodeQueryComponent(user)}');
      final res = await http
          .get(uri, headers: AppConfig.apiHeaders)
          .timeout(const Duration(seconds: 6));
      if (res.statusCode != 200) return null;
      final decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) return null;
      return ModuleAccess.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  Future<ModuleAccess?> _readCache(String user) async {
    try {
      final raw = await _storage.read(key: _key(user));
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return ModuleAccess.fromJson(decoded);
    } catch (_) {
      return null;
    }
  }

  Future<void> _writeCache(String user, ModuleAccess a) async {
    try {
      await _storage.write(key: _key(user), value: jsonEncode(a.toJson()));
    } catch (_) {
      // Only costs a fetch next launch.
    }
  }
}
