import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// How the inventory browser lays out its items.
///
/// Three modes rather than a boolean, because the right density depends on
/// what the operator is doing: picking a familiar product by its packaging
/// wants big images, scanning a long catalogue for one name wants text.
enum InventoryViewMode {
  /// Two columns. Largest images — best for recognising a product by sight.
  grid2,

  /// Three columns. Roughly twice as many items per screen as grid2, with
  /// the image still large enough to identify at arm's length.
  grid3,

  /// One row per item. The only mode with room for brand, UOM and factor
  /// together, so it is the one to use when those details decide the choice.
  list,
}

extension InventoryViewModeX on InventoryViewMode {
  /// Icon of the mode that would come next in the cycle.
  IconData get nextIcon => next.icon;

  /// The icon for THIS layout, matching what is on screen:
  ///   * two per row  — four squares
  ///   * three per row — nine dots
  ///   * list — three lines
  IconData get icon {
    switch (this) {
      case InventoryViewMode.grid2:
        return Icons.grid_view; // 2x2
      case InventoryViewMode.grid3:
        return Icons.apps; // 3x3
      case InventoryViewMode.list:
        return Icons.list; // three lines
    }
  }

  String get label {
    switch (this) {
      case InventoryViewMode.grid2:
        return 'Large grid';
      case InventoryViewMode.grid3:
        return 'Compact grid';
      case InventoryViewMode.list:
        return 'List';
    }
  }

  /// Cycles grid2 → grid3 → list → grid2.
  InventoryViewMode get next {
    switch (this) {
      case InventoryViewMode.grid2:
        return InventoryViewMode.grid3;
      case InventoryViewMode.grid3:
        return InventoryViewMode.list;
      case InventoryViewMode.list:
        return InventoryViewMode.grid2;
    }
  }

  bool get isGrid => this != InventoryViewMode.list;

  /// Columns at the given width. Tablets get one extra so a 10" screen does
  /// not show two enormous cards.
  int columns(double width) {
    switch (this) {
      case InventoryViewMode.grid2:
        return width >= 600 ? 3 : 2;
      case InventoryViewMode.grid3:
        return width >= 600 ? 4 : 3;
      case InventoryViewMode.list:
        return 1;
    }
  }
}

/// Remembers the chosen mode across restarts.
///
/// A view preference that resets every launch is worse than none: the
/// operator re-picks it every session and stops trusting that it stuck.
class InventoryViewModePref {
  static const _storage = FlutterSecureStorage();
  static const String _key = 'inventory_view_mode';

  static Future<InventoryViewMode> load() async {
    try {
      final raw = await _storage.read(key: _key);
      return InventoryViewMode.values.firstWhere(
        (m) => m.name == raw,
        orElse: () => InventoryViewMode.grid2,
      );
    } catch (_) {
      // A storage failure must never keep the catalogue off the screen.
      return InventoryViewMode.grid2;
    }
  }

  static Future<void> save(InventoryViewMode mode) async {
    try {
      await _storage.write(key: _key, value: mode.name);
    } catch (_) {
      // Preference only — losing it costs the operator one tap.
    }
  }
}
