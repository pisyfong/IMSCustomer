import 'package:flutter/material.dart';

import '../theme/app_design.dart';

/// An in-app numeric keypad, so quantity and money entry never depends on the
/// operating system's keyboard.
///
/// Ported from the procurement PD receive dialog, for the same reason it exists
/// there: the platform keyboard is the wrong tool for this job. On iOS
/// `TextInputType.number` renders a pad with no decimal point at all, so a
/// price simply cannot be typed; the decimal variants differ again by locale
/// and OS version. A keypad drawn by the app is identical on every device, and
/// on a handheld it is also a bigger target than a phone keyboard's.
///
/// The caller owns the controllers and decides which one is active — this
/// widget only reports key presses.
class NumberPad extends StatelessWidget {
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback? onDecimal;
  final VoidCallback? onClear;

  /// Dismisses the pad. Shown as a tick so there is an obvious way out that
  /// is not "tap somewhere else and hope".
  final VoidCallback? onDone;

  /// False for a whole-number field. The key is replaced by a blank of the
  /// same size rather than removed, so the other keys never move under a
  /// finger that is already on its way down.
  final bool decimalEnabled;

  final Color accent;

  const NumberPad({
    super.key,
    required this.onDigit,
    required this.onBackspace,
    this.onDecimal,
    this.onClear,
    this.onDone,
    this.decimalEnabled = true,
    this.accent = AppDesign.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _row(const ['1', '2', '3']),
          const SizedBox(height: 5),
          _row(const ['4', '5', '6']),
          const SizedBox(height: 5),
          _row(const ['7', '8', '9']),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(child: _decimalKey()),
              const SizedBox(width: 5),
              Expanded(child: _digitKey('0')),
              const SizedBox(width: 5),
              Expanded(child: _backspaceKey()),
            ],
          ),
          if (onClear != null || onDone != null) ...[
            const SizedBox(height: 5),
            Row(
              children: [
                if (onClear != null)
                  Expanded(
                    child: _key(
                      label: 'Clear',
                      onTap: onClear!,
                      fg: AppDesign.danger,
                      bg: AppDesign.danger.withOpacity(0.08),
                      border: AppDesign.danger.withOpacity(0.4),
                    ),
                  ),
                if (onClear != null && onDone != null)
                  const SizedBox(width: 5),
                if (onDone != null)
                  Expanded(
                    flex: 2,
                    child: _key(
                      label: 'Done',
                      icon: Icons.check,
                      onTap: onDone!,
                      fg: Colors.white,
                      bg: accent,
                      border: accent,
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _row(List<String> digits) => Row(
        children: [
          for (var i = 0; i < digits.length; i++) ...[
            Expanded(child: _digitKey(digits[i])),
            if (i != digits.length - 1) const SizedBox(width: 5),
          ],
        ],
      );

  Widget _digitKey(String digit) => _key(
        label: digit,
        onTap: () => onDigit(digit),
        fg: AppDesign.ink,
        bg: AppDesign.surface,
        border: AppDesign.border,
        fontSize: 18,
      );

  Widget _decimalKey() {
    if (!decimalEnabled || onDecimal == null) {
      return const SizedBox(height: 40);
    }
    return _key(
      label: '.',
      onTap: onDecimal!,
      fg: AppDesign.ink,
      bg: AppDesign.surface,
      border: AppDesign.border,
      fontSize: 20,
    );
  }

  Widget _backspaceKey() => _key(
        icon: Icons.backspace_outlined,
        onTap: onBackspace,
        fg: AppDesign.danger,
        bg: AppDesign.danger.withOpacity(0.08),
        border: AppDesign.danger.withOpacity(0.4),
      );

  Widget _key({
    String? label,
    IconData? icon,
    required VoidCallback onTap,
    required Color fg,
    required Color bg,
    required Color border,
    double fontSize = 15,
  }) {
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          side: BorderSide(color: border),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, size: 18),
            if (icon != null && label != null) const SizedBox(width: 5),
            if (label != null)
              Text(label,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}

/// Applies keypad presses to a text controller.
///
/// Kept out of the widget so every screen edits a value the same way. The rule
/// that matters is [freshInput]: the first key after a field is selected
/// REPLACES what is there. A field showing "1.00" that the operator taps and
/// types 5 into must become "5", not "1.005" — which is what append-only
/// behaviour produces, and it is the single most common way a wrong quantity
/// gets entered.
class NumberPadBuffer {
  final TextEditingController controller;
  bool _fresh = true;

  NumberPadBuffer(this.controller);

  /// Call when the operator selects this field.
  void select() => _fresh = true;

  void digit(String d) {
    final current = controller.text;
    // A lone leading zero is replaced rather than built on: "0" then 5 is 5.
    controller.text = (_fresh || current == '0' || current == '0.00')
        ? d
        : '$current$d';
    _fresh = false;
  }

  void decimal() {
    if (_fresh || controller.text.isEmpty) {
      controller.text = '0.';
    } else if (!controller.text.contains('.')) {
      controller.text = '${controller.text}.';
    }
    // A second decimal point is ignored rather than appended — it would make
    // the value unparseable and the field would silently stop committing.
    _fresh = false;
  }

  void backspace() {
    final t = controller.text;
    controller.text = t.isEmpty ? '' : t.substring(0, t.length - 1);
    _fresh = false;
  }

  void clear() {
    controller.text = '';
    _fresh = false;
  }
}
