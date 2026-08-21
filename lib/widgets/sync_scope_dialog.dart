import 'package:flutter/material.dart';

import '../services/sync_history_window.dart';
import '../theme/app_design.dart';

/// What the operator chose. Returned as an object so that "Everything"
/// (days == null) stays distinguishable from dismissing the dialog, which
/// returns null.
class SyncScopeResult {
  final int? days;
  const SyncScopeResult(this.days);
}

/// Asked before a full sync: how much invoice and quote history to bring down.
///
/// This exists because the ledger is the whole cost of a first sync — roughly
/// 2 million rows on the YeonTak data, of which under 8% falls in the last six
/// months. Rather than pick a cutoff on the operator's behalf, the trade-off
/// is put in front of them in the terms they actually feel: how long they will
/// wait, and how far back "Previous orders" will reach.
///
/// Deliberately not a settings-screen toggle they'd have to go looking for —
/// it appears at the one moment the choice matters, with the current value
/// preselected so repeat syncs are a single tap.
class SyncScopeDialog extends StatefulWidget {
  /// Preselected option. Defaults to the stored preference.
  final int? initialDays;

  const SyncScopeDialog({super.key, this.initialDays});

  /// Returns null if dismissed.
  static Future<SyncScopeResult?> show(BuildContext context) async {
    final current = await SyncHistoryWindow.days;
    if (!context.mounted) return null;
    return showDialog<SyncScopeResult>(
      context: context,
      barrierDismissible: true,
      builder: (_) => SyncScopeDialog(initialDays: current),
    );
  }

  @override
  State<SyncScopeDialog> createState() => _SyncScopeDialogState();
}

class _SyncScopeDialogState extends State<SyncScopeDialog> {
  late int? _selected = widget.initialDays ?? SyncHistoryWindow.defaultDays;

  /// Relative cost, phrased as the operator experiences it. Deliberately not
  /// row counts or megabytes: those vary per company and would be a promise
  /// we can't keep, whereas "about a minute" sets the right expectation.
  static const Map<String, (String, String)> _detail = {
    '30': ('Quickest', 'About a minute'),
    '90': ('Fast', 'A couple of minutes'),
    '180': ('Recommended', 'A few minutes'),
    '365': ('Thorough', 'Five minutes or so'),
    'all': ('Everything', 'Can take 20 minutes or more'),
  };

  static (String, String) _detailFor(int? days) =>
      _detail[days?.toString() ?? 'all'] ?? ('', '');

  @override
  Widget build(BuildContext context) {
    final isEverything = _selected == null;

    return Dialog(
      backgroundColor: AppDesign.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDesign.radiusLg),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
                child: Column(
                  children: [
                    for (final days in SyncHistoryWindow.options)
                      _option(days),
                    if (isEverything) ...[
                      const SizedBox(height: 10),
                      _everythingWarning(),
                    ],
                    const SizedBox(height: 12),
                    _footnote(),
                  ],
                ),
              ),
            ),
            _actions(),
          ],
        ),
      ),
    );
  }

  // ─── Header ──────────────────────────────────────────────────────────────

  Widget _header() => Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppDesign.modPickingBg,
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              ),
              child: const Icon(Icons.history,
                  size: 19, color: AppDesign.modPicking),
            ),
            const SizedBox(width: 11),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('How much history?',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppDesign.ink)),
                  SizedBox(height: 2),
                  Text(
                    'Older invoices and quotations take the longest to '
                    'download. Everything else syncs in full.',
                    style: TextStyle(
                        fontSize: 11.5,
                        height: 1.35,
                        color: AppDesign.inkMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  // ─── Options ─────────────────────────────────────────────────────────────

  Widget _option(int? days) {
    final selected = _selected == days;
    final (badge, cost) = _detailFor(days);
    final recommended = days == SyncHistoryWindow.defaultDays;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected ? AppDesign.modPickingBg : AppDesign.surface,
        borderRadius: BorderRadius.circular(AppDesign.radius),
        child: InkWell(
          onTap: () => setState(() => _selected = days),
          borderRadius: BorderRadius.circular(AppDesign.radius),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 11, 12, 11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDesign.radius),
              border: Border.all(
                color: selected ? AppDesign.modPicking : AppDesign.border,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                // A radio drawn by hand rather than a Radio widget: it keeps
                // the whole row tappable without the widget stealing the hit
                // test, and matches the module accent.
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected
                          ? AppDesign.modPicking
                          : AppDesign.borderStrong,
                      width: selected ? 5.5 : 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(children: [
                        Text(
                          SyncHistoryWindow.label(days),
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: selected
                                ? AppDesign.modPicking
                                : AppDesign.ink,
                          ),
                        ),
                        if (recommended) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppDesign.success.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(
                                  AppDesign.radiusPill),
                            ),
                            child: const Text('RECOMMENDED',
                                style: TextStyle(
                                    fontSize: 8.5,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.3,
                                    color: AppDesign.success)),
                          ),
                        ],
                      ]),
                      const SizedBox(height: 1),
                      Text(cost,
                          style: const TextStyle(
                              fontSize: 11, color: AppDesign.inkMuted)),
                    ],
                  ),
                ),
                Text(
                  badge,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: days == null
                        ? AppDesign.warning
                        : AppDesign.inkSubtle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _everythingWarning() => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppDesign.warning.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.warning.withOpacity(0.25)),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.warning_amber_rounded,
                size: 15, color: AppDesign.warning),
            SizedBox(width: 7),
            Expanded(
              child: Text(
                'Downloads every invoice and quotation ever raised. Keep the '
                'device plugged in and on Wi-Fi.',
                style: TextStyle(
                    fontSize: 11, height: 1.35, color: AppDesign.warning),
              ),
            ),
          ],
        ),
      );

  /// The reassurance that makes a short window an easy choice: nothing is
  /// lost, and the setting can be widened later.
  Widget _footnote() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 13, color: AppDesign.inkSubtle),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              'Nothing is deleted on the server — this only sets how far back '
              '"Previous orders" reaches on this device. You can pick a longer '
              'period any time.',
              style: AppDesign.caption.copyWith(height: 1.35),
            ),
          ),
        ],
      );

  // ─── Actions ─────────────────────────────────────────────────────────────

  Widget _actions() => Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radius),
                  ),
                ),
                child: const Text('Cancel',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppDesign.inkMuted)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: () =>
                    Navigator.of(context).pop(SyncScopeResult(_selected)),
                icon: const Icon(Icons.sync, size: 17),
                label: const Text('Start sync',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w800)),
                style: FilledButton.styleFrom(
                  backgroundColor: AppDesign.modPicking,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radius),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
