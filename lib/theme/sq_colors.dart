import 'package:flutter/material.dart';

/// Stable colour assignment per source SQ pre-label. Used to visually group
/// pick-list lines that came from the same sales quote.
///
/// - Same string in, same colour out (uses `hashCode & mask`).
/// - Null / empty SQ (freestanding line) returns the neutral grey pair.
class SqColors {
  static const List<_ColorPair> _palette = [
    _ColorPair(Color(0xFFEF6C00), Color(0xFFFFF3E0)), // deepOrange
    _ColorPair(Color(0xFF1D4ED8), Color(0xFFEFF6FF)), // blue
    _ColorPair(Color(0xFF0F766E), Color(0xFFECFDF5)), // teal
    _ColorPair(Color(0xFF7C3AED), Color(0xFFF5F3FF)), // violet
    _ColorPair(Color(0xFFBE185D), Color(0xFFFDF2F8)), // pink
    _ColorPair(Color(0xFF15803D), Color(0xFFF0FDF4)), // green
    _ColorPair(Color(0xFFB45309), Color(0xFFFFFBEB)), // amber
    _ColorPair(Color(0xFF0369A1), Color(0xFFF0F9FF)), // sky
  ];

  static const _ColorPair _free = _ColorPair(Color(0xFF9CA3AF), Color(0xFFF3F4F6));

  static Color fg(String? sqPreLabel) => _pick(sqPreLabel).fg;
  static Color bg(String? sqPreLabel) => _pick(sqPreLabel).bg;

  static _ColorPair _pick(String? sqPreLabel) {
    if (sqPreLabel == null || sqPreLabel.isEmpty) return _free;
    final idx = (sqPreLabel.hashCode & 0x7FFFFFFF) % _palette.length;
    return _palette[idx];
  }
}

class _ColorPair {
  final Color fg;
  final Color bg;
  const _ColorPair(this.fg, this.bg);
}
