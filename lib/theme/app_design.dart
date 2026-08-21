import 'package:flutter/material.dart';

/// Design tokens for the IMS Customer app.
///
/// Clean minimalist: white surfaces, thin borders, deepOrange accents, tight
/// spacing, small type. Reuse these constants everywhere so the whole app
/// reads as one design system. Do NOT hardcode colors or paddings in pages.
class AppDesign {
  // ─── Palette ────────────────────────────────────────────────────────────
  static const Color accent = Color(0xFFEF6C00);        // deepOrange 800
  static const Color accentSoft = Color(0xFFFFF3E0);    // deepOrange 50
  static const Color accentInk = Color(0xFFE65100);     // deepOrange 900

  static const Color bg = Color(0xFFF7F7F8);            // page background
  static const Color surface = Colors.white;
  static const Color surfaceAlt = Color(0xFFFAFAFA);

  static const Color border = Color(0xFFE5E7EB);        // gray 200
  static const Color borderStrong = Color(0xFFD1D5DB);  // gray 300
  static const Color divider = Color(0xFFEEEEEE);

  static const Color ink = Color(0xFF111827);           // gray 900
  static const Color inkMuted = Color(0xFF4B5563);      // gray 600
  static const Color inkSubtle = Color(0xFF9CA3AF);     // gray 400

  static const Color success = Color(0xFF15803D);       // green 700
  static const Color warning = Color(0xFFB45309);       // amber 700
  static const Color danger = Color(0xFFB91C1C);        // red 700
  static const Color info = Color(0xFF1D4ED8);          // blue 700

  // ─── Module identity colours ────────────────────────────────────────────
  // One colour per module, used EVERYWHERE that module is represented (home
  // tiles, side drawer, page headers, badges) so its icon always reads the
  // same. Never hardcode these values again — reference the token.
  static const Color modOrdering = accent;                 // orange
  static const Color modOrderingBg = accentSoft;
  static const Color modPicking = Color(0xFF1D4ED8);       // blue 700
  static const Color modPickingBg = Color(0xFFEFF6FF);
  static const Color modPacking = Color(0xFF7C3AED);       // violet 600
  static const Color modPackingBg = Color(0xFFF5F3FF);
  static const Color modCreditNote = Color(0xFF0F766E);    // teal 700
  static const Color modCreditNoteBg = Color(0xFFECFDF5);

  // ─── Spacing (4pt scale) ────────────────────────────────────────────────
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space8 = 32;

  // ─── Radii ──────────────────────────────────────────────────────────────
  static const double radiusSm = 6;
  static const double radius = 10;
  static const double radiusLg = 14;
  static const double radiusPill = 999;

  // ─── Type ───────────────────────────────────────────────────────────────
  static const TextStyle titleLg = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w700, color: ink, letterSpacing: -0.2);
  static const TextStyle title = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w700, color: ink);
  static const TextStyle heading = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w600, color: ink);
  static const TextStyle body = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: ink);
  static const TextStyle bodyMuted = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: inkMuted);
  static const TextStyle caption = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w500, color: inkMuted);
  static const TextStyle micro = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w600, color: inkSubtle, letterSpacing: 0.4);

  // ─── Common decorations ─────────────────────────────────────────────────
  static BoxDecoration card({Color? color, bool selected = false}) => BoxDecoration(
        color: color ?? surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: selected ? accent : border,
          width: selected ? 1.4 : 1,
        ),
      );

  static BoxDecoration section() => BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(radiusLg),
        border: Border.all(color: border),
      );

  /// Tight AppBar with white bg, black text, hairline underline.
  static PreferredSizeWidget appBar(String title, {List<Widget>? actions, PreferredSizeWidget? bottom, bool automaticallyImplyLeading = true}) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: ink)),
      backgroundColor: surface,
      foregroundColor: ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: automaticallyImplyLeading,
      shape: const Border(bottom: BorderSide(color: border, width: 1)),
      actions: actions,
      bottom: bottom,
      centerTitle: false,
    );
  }
}
