import 'package:flutter/material.dart';

import '../theme/app_design.dart';

/// Where a save has got to. The two phases are deliberately separate: writing
/// to the device always succeeds and is what protects the operator's work;
/// reaching the server is best-effort on a handheld that spends its day in and
/// out of coverage.
enum SaveStage {
  saving,
  saved,
  syncing,
  synced,

  /// Written locally, upload deferred — no connection. Not a failure.
  queued,

  /// Written locally, but the server refused the upload (e.g. over-allocated).
  failed,
}

extension SaveStageInfo on SaveStage {
  bool get isTerminal =>
      this == SaveStage.synced ||
      this == SaveStage.queued ||
      this == SaveStage.failed;

  String get title => switch (this) {
        SaveStage.saving => 'Saving…',
        SaveStage.saved => 'Saved',
        SaveStage.syncing => 'Uploading…',
        SaveStage.synced => 'Synced',
        SaveStage.queued => 'Saved offline',
        SaveStage.failed => 'Upload failed',
      };

  Color get color => switch (this) {
        SaveStage.synced => AppDesign.success,
        SaveStage.queued => AppDesign.warning,
        SaveStage.failed => AppDesign.danger,
        _ => AppDesign.info,
      };
}

/// Drives [SaveStatusDialog]. The save routine pushes stages onto it; the
/// dialog only renders.
class SaveStatusController extends ChangeNotifier {
  SaveStage stage = SaveStage.saving;
  String? detail;

  void to(SaveStage s, {String? detail}) {
    stage = s;
    this.detail = detail;
    notifyListeners();
  }
}

/// Modal progress for Save → Upload.
///
/// Stays put throughout — no barrier dismiss while work is in flight, and no
/// auto-dismiss afterwards. Every outcome is acknowledged explicitly, so a
/// failed or merely-queued upload can't be mistaken for a completed one.
class SaveStatusDialog extends StatefulWidget {
  final SaveStatusController controller;
  final Color accent;

  /// Re-runs the upload only — the local write already succeeded.
  final Future<void> Function()? onRetry;

  const SaveStatusDialog({
    super.key,
    required this.controller,
    required this.accent,
    this.onRetry,
  });

  static Future<void> show(
    BuildContext context, {
    required SaveStatusController controller,
    required Color accent,
    Future<void> Function()? onRetry,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        // Back must not dismiss mid-write either.
        canPop: false,
        child: SaveStatusDialog(
          controller: controller,
          accent: accent,
          onRetry: onRetry,
        ),
      ),
    );
  }

  @override
  State<SaveStatusDialog> createState() => _SaveStatusDialogState();
}

class _SaveStatusDialogState extends State<SaveStatusDialog> {
  bool _closed = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onStage);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onStage);
    super.dispose();
  }

  void _onStage() {
    if (!mounted) return;
    setState(() {});
    // Deliberately no auto-dismiss: every outcome, including a clean sync,
    // waits to be acknowledged. A status that vanishes on its own is one the
    // operator can miss and then has to guess at.
  }

  void _close() {
    if (_closed || !mounted) return;
    _closed = true;
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> _retry() async {
    final retry = widget.onRetry;
    if (retry == null) return;
    widget.controller.to(SaveStage.syncing);
    await retry();
  }

  @override
  Widget build(BuildContext context) {
    final stage = widget.controller.stage;
    final detail = widget.controller.detail;

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.radiusLg)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              _headIcon(stage),
              const SizedBox(width: 10),
              Expanded(
                child: Text(stage.title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: stage.color)),
              ),
            ]),
            const SizedBox(height: 14),
            _step(
              label: 'Saved to device',
              state: stage == SaveStage.saving
                  ? _StepState.active
                  : _StepState.done,
            ),
            const SizedBox(height: 8),
            _step(
              label: switch (stage) {
                SaveStage.queued => 'Upload queued — will retry when online',
                SaveStage.failed => 'Upload rejected by server',
                SaveStage.synced => 'Uploaded to server',
                _ => 'Uploading to server',
              },
              state: switch (stage) {
                SaveStage.saving || SaveStage.saved => _StepState.pending,
                SaveStage.syncing => _StepState.active,
                SaveStage.synced => _StepState.done,
                SaveStage.queued => _StepState.deferred,
                SaveStage.failed => _StepState.failed,
              },
            ),
            if (detail != null && detail.trim().isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: stage.color.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  border: Border.all(color: stage.color.withOpacity(0.3)),
                ),
                child: Text(detail,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: stage.color)),
              ),
            ],
            const SizedBox(height: 6),
            if (stage.isTerminal)
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: _close,
                  child: Text(stage == SaveStage.synced ? 'Done' : 'Close',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: stage == SaveStage.synced
                              ? AppDesign.success
                              : AppDesign.inkMuted)),
                ),
                if (widget.onRetry != null &&
                    stage != SaveStage.synced) ...[
                  const SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: _retry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.accent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size(0, 34),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDesign.radiusSm)),
                    ),
                    child: const Text('Retry upload',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700)),
                  ),
                ],
              ])
            else
              const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  Widget _headIcon(SaveStage stage) {
    if (!stage.isTerminal) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2.4, color: stage.color),
      );
    }
    return Icon(
      switch (stage) {
        SaveStage.synced => Icons.cloud_done,
        SaveStage.queued => Icons.cloud_off,
        _ => Icons.error_outline,
      },
      size: 21,
      color: stage.color,
    );
  }

  Widget _step({required String label, required _StepState state}) {
    return Row(children: [
      SizedBox(
        width: 18,
        height: 18,
        child: switch (state) {
          _StepState.active => const CircularProgressIndicator(
              strokeWidth: 2, color: AppDesign.info),
          _StepState.done =>
            const Icon(Icons.check_circle, size: 17, color: AppDesign.success),
          _StepState.deferred =>
            const Icon(Icons.schedule, size: 17, color: AppDesign.warning),
          _StepState.failed =>
            const Icon(Icons.cancel, size: 17, color: AppDesign.danger),
          _StepState.pending => const Icon(Icons.circle_outlined,
              size: 15, color: AppDesign.inkSubtle),
        },
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight:
                  state == _StepState.pending ? FontWeight.w600 : FontWeight.w700,
              color: state == _StepState.pending
                  ? AppDesign.inkSubtle
                  : AppDesign.ink,
            )),
      ),
    ]);
  }
}

enum _StepState { pending, active, done, deferred, failed }
