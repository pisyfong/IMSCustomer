import 'package:flutter/material.dart';

import '../theme/app_design.dart';

/// Shared building blocks for the app's page chrome.
///
/// These were the picking/packing hubs' private widgets, lifted out so every
/// module renders the same search band, segmented tabs, list rows and empty
/// states. Copying them page-by-page is how the app drifted into four different
/// header styles in the first place — anything visual that appears twice
/// belongs here.
///
/// Every component takes an [accent] so a page reads in its module's colour
/// (`AppDesign.modOrdering`, `modPicking`, …) without forking the layout.
class UiKit {
  const UiKit._();

  /// Flat white app bar with a hairline underline. The house style.
  static PreferredSizeWidget appBar(
    String title, {
    String? subtitle,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? leading,
    bool automaticallyImplyLeading = true,
  }) {
    return AppBar(
      title: subtitle == null
          ? Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.ink))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppDesign.ink)),
                Text(subtitle,
                    style: AppDesign.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
      backgroundColor: AppDesign.surface,
      foregroundColor: AppDesign.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      shape: const Border(bottom: BorderSide(color: AppDesign.border)),
      actions: actions,
      bottom: bottom,
    );
  }
}

/// The 38pt search field used in every list header.
class UiSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final bool autofocus;

  const UiSearchField({
    super.key,
    required this.controller,
    required this.hint,
    this.onSubmitted,
    this.onChanged,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: AppDesign.bg,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.border),
      ),
      child: Row(children: [
        const SizedBox(width: 8),
        const Icon(Icons.search, size: 17, color: AppDesign.inkSubtle),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: controller,
            autofocus: autofocus,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            textInputAction:
                onSubmitted == null ? TextInputAction.search : TextInputAction.go,
            style: const TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: AppDesign.ink),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppDesign.inkSubtle),
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
        if (controller.text.isNotEmpty)
          InkWell(
            onTap: () {
              controller.clear();
              onChanged?.call('');
            },
            borderRadius: BorderRadius.circular(12),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.clear, size: 15, color: AppDesign.inkSubtle),
            ),
          ),
        const SizedBox(width: 4),
      ]),
    );
  }
}

/// 38×38 tinted square button that sits beside the search field, with an
/// optional count badge (sort / filter / scan).
class UiSquareAction extends StatelessWidget {
  final IconData icon;
  final Color accent;
  final Color accentBg;
  final VoidCallback? onTap;
  final String? tooltip;

  /// When non-null and > 0 the button fills solid and shows the count.
  final int? badge;

  const UiSquareAction({
    super.key,
    required this.icon,
    required this.accent,
    required this.accentBg,
    this.onTap,
    this.tooltip,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final active = (badge ?? 0) > 0;
    final button = Material(
      color: active ? accent : accentBg,
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        onTap: onTap,
        child: SizedBox(
          width: 38,
          height: 38,
          child: Stack(alignment: Alignment.center, children: [
            Icon(icon, size: 19, color: active ? Colors.white : accent),
            if (active)
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  constraints:
                      const BoxConstraints(minWidth: 13, minHeight: 13),
                  child: Text('$badge',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: accent)),
                ),
              ),
          ]),
        ),
      ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip!, child: button);
  }
}

/// Compact segmented tabs with per-tab counts.
class UiSegmented extends StatelessWidget {
  /// (label, count) per segment; a null count hides the badge.
  final List<(String, int?)> segments;
  final int index;
  final ValueChanged<int> onChanged;
  final Color accent;

  const UiSegmented({
    super.key,
    required this.segments,
    required this.index,
    required this.onChanged,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppDesign.bg,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: AppDesign.border),
      ),
      child: Row(
        children: [
          for (var i = 0; i < segments.length; i++)
            Expanded(child: _seg(segments[i].$1, segments[i].$2, i)),
        ],
      ),
    );
  }

  Widget _seg(String label, int? count, int i) {
    final on = i == index;
    return InkWell(
      onTap: () => onChanged(i),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm - 1),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: on ? AppDesign.surface : null,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm - 1),
          border: on ? Border.all(color: AppDesign.border) : null,
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: on ? FontWeight.w800 : FontWeight.w600,
                color: on ? accent : AppDesign.inkMuted,
              )),
          if (count != null) ...[
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: on ? accent.withOpacity(0.12) : AppDesign.border,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
              child: Text('$count',
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: on ? accent : AppDesign.inkMuted)),
            ),
          ],
        ]),
      ),
    );
  }
}

/// A list row on a coloured status rail — the shape used for picks, packs,
/// drafts and orders alike.
class UiRailCard extends StatelessWidget {
  final Color rail;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final bool selected;

  const UiRailCard({
    super.key,
    required this.rail,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.fromLTRB(10, 9, 10, 9),
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        border: Border.all(
          color: selected ? rail : AppDesign.border,
          width: selected ? 1.4 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 3, color: rail),
                Expanded(child: Padding(padding: padding, child: child)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Small tinted pill for statuses and counts.
class UiPill extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  final bool solid;

  const UiPill(this.text,
      {super.key, required this.color, this.icon, this.solid = false});

  @override
  Widget build(BuildContext context) {
    final fg = solid ? Colors.white : color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: solid ? color : color.withOpacity(0.10),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm - 2),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[
          Icon(icon, size: 10, color: fg),
          const SizedBox(width: 3),
        ],
        Text(text,
            style: TextStyle(
                fontSize: 9, fontWeight: FontWeight.w800, color: fg)),
      ]),
    );
  }
}

/// Deterministic initials avatar.
///
/// The colour is picked from the design palette by name hash rather than a
/// random hue, so a long customer list stays scannable without the page
/// turning into confetti.
class UiAvatar extends StatelessWidget {
  final String name;
  final double size;

  const UiAvatar(this.name, {super.key, this.size = 38});

  static const _palette = <Color>[
    AppDesign.info,
    AppDesign.success,
    AppDesign.modPacking,
    AppDesign.accent,
    AppDesign.modCreditNote,
    AppDesign.warning,
  ];

  static Color colorFor(String name) =>
      _palette[name.hashCode.abs() % _palette.length];

  static String initialsFor(String name) {
    final words =
        name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.isEmpty) return '?';
    if (words.length == 1) return words.first.characters.first.toUpperCase();
    return (words[0].characters.first + words[1].characters.first)
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final c = colorFor(name);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      ),
      alignment: Alignment.center,
      child: Text(initialsFor(name),
          style: TextStyle(
              fontSize: size * 0.34, fontWeight: FontWeight.w900, color: c)),
    );
  }
}

/// Centred empty / error state with an optional single action.
class UiEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Color accent;

  const UiEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
    this.accent = AppDesign.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accent.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30, color: accent),
            ),
            const SizedBox(height: 14),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppDesign.ink)),
            if (message != null) ...[
              const SizedBox(height: 5),
              Text(message!,
                  textAlign: TextAlign.center, style: AppDesign.caption),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(0, 40),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusSm)),
                ),
                child: Text(actionLabel!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Dismissible inline banner for errors and notices.
class UiBanner extends StatelessWidget {
  final String message;
  final Color color;
  final IconData icon;
  final VoidCallback? onDismiss;

  const UiBanner({
    super.key,
    required this.message,
    this.color = AppDesign.danger,
    this.icon = Icons.error_outline,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Row(children: [
        Icon(icon, size: 15, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message,
              style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w600, color: color)),
        ),
        if (onDismiss != null)
          InkWell(
            onTap: onDismiss,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Icon(Icons.close, size: 14, color: color),
            ),
          ),
      ]),
    );
  }
}

/// Uppercase micro label above a group of controls.
class UiSectionLabel extends StatelessWidget {
  final String text;
  final Widget? trailing;
  const UiSectionLabel(this.text, {super.key, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 7),
      child: Row(children: [
        Text(text, style: AppDesign.micro),
        const Spacer(),
        if (trailing != null) trailing!,
      ]),
    );
  }
}

/// Sticky bottom bar carrying a total and the page's primary action.
class UiSummaryBar extends StatelessWidget {
  /// Label/value pairs stacked above the button (e.g. Subtotal, Tax, Total).
  /// The last pair renders emphasised.
  final List<(String, String)> rows;
  final String actionLabel;
  final IconData? actionIcon;
  final VoidCallback? onAction;
  final Color accent;
  final bool busy;
  final Widget? extra;

  const UiSummaryBar({
    super.key,
    required this.rows,
    required this.actionLabel,
    required this.accent,
    this.actionIcon,
    this.onAction,
    this.busy = false,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: SafeArea(
        top: false,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (extra != null) ...[extra!, const SizedBox(height: 8)],
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0) const SizedBox(height: 3),
            _row(rows[i].$1, rows[i].$2, emphasis: i == rows.length - 1),
          ],
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: busy ? null : onAction,
              icon: busy
                  ? const SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white))
                  : Icon(actionIcon ?? Icons.arrow_forward, size: 17),
              label: Text(actionLabel,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w800)),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                elevation: 0,
                minimumSize: const Size(0, 46),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _row(String label, String value, {required bool emphasis}) => Row(
        children: [
          Text(label,
              style: emphasis
                  ? const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppDesign.ink)
                  : AppDesign.caption),
          const Spacer(),
          Text(value,
              style: emphasis
                  ? TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: accent,
                      letterSpacing: -0.3)
                  : const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.inkMuted)),
        ],
      );
}
