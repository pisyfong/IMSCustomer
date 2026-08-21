import 'package:flutter/material.dart';

import '../models/printer_settings.dart';
import '../models/receipt_template.dart';
import '../pages/receipt_templates_page.dart';
import '../services/printer_service.dart';
import '../services/receipt_service.dart';
import '../services/receipt_template_service.dart';
import '../theme/app_design.dart';
import 'printer_setup_sheet.dart';
import 'receipt_paper_view.dart';

/// Shows the receipt exactly as it will be printed, then sends it.
///
/// The preview is the plain-text transcript captured while the ESC/POS bytes
/// were built — not a re-render — so what's on screen is what comes out of the
/// printer, character for character at the configured paper width.
class ReceiptPreviewDialog extends StatefulWidget {
  /// [ReceiptTemplate.modulePick] or [ReceiptTemplate.modulePack] — scopes the
  /// template picker to layouts that make sense for this document.
  final String module;

  /// Renders the receipt for a chosen template. Called again on every template
  /// change, so the preview always reflects the selection rather than the one
  /// it opened with.
  final Future<ReceiptJob> Function(ReceiptTemplate) build;

  /// Accent for the module this receipt belongs to (picking blue / packing
  /// violet), so the dialog reads as part of the page that opened it.
  final Color accent;

  /// Further slips to send after the previewed one, rendered with the SAME
  /// template the user previewed.
  ///
  /// Used by "one slip per invoice": the operator previews slip 1 of N and
  /// confirming sends all N. The template lives in this dialog, so building
  /// the rest anywhere else would either print them with a different layout
  /// or force the caller to duplicate the template picker.
  final Future<List<ReceiptJob>> Function(ReceiptTemplate)? buildRest;

  const ReceiptPreviewDialog({
    super.key,
    required this.module,
    required this.build,
    required this.accent,
    this.buildRest,
  });

  /// Returns the print result, or null if the user backed out.
  static Future<PrintResult?> show(
    BuildContext context, {
    required String module,
    required Future<ReceiptJob> Function(ReceiptTemplate) build,
    required Color accent,
    Future<List<ReceiptJob>> Function(ReceiptTemplate)? buildRest,
  }) {
    return showDialog<PrintResult>(
      context: context,
      barrierDismissible: true,
      builder: (_) => ReceiptPreviewDialog(
          module: module, build: build, accent: accent, buildRest: buildRest),
    );
  }

  @override
  State<ReceiptPreviewDialog> createState() => _ReceiptPreviewDialogState();
}

class _ReceiptPreviewDialogState extends State<ReceiptPreviewDialog> {
  PrinterSettings? _printer;
  bool _sending = false;

  List<ReceiptTemplate> _templates = [];
  ReceiptTemplate? _template;
  ReceiptJob? _job;
  bool _rendering = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final printer = await PrinterService().settings(refresh: true);
    final templates = await ReceiptTemplateService().templates(widget.module);
    if (!mounted) return;
    setState(() {
      _printer = printer;
      _templates = templates;
    });
    // Keep the current choice across a settings round-trip; otherwise start
    // from the module default.
    final keep = _template == null
        ? null
        : templates.where((t) => t.id == _template!.id).firstOrNull;
    await _select(keep ??
        templates.firstWhere((t) => t.isDefault, orElse: () => templates.first));
  }

  Future<void> _select(ReceiptTemplate t) async {
    setState(() {
      _template = t;
      _rendering = true;
    });
    final job = await widget.build(t);
    if (!mounted) return;
    setState(() {
      _job = job;
      _rendering = false;
    });
  }

  Future<void> _print() async {
    final job = _job;
    if (job == null) return;
    setState(() => _sending = true);
    final r = await ReceiptService().printJob(job);
    if (!mounted) return;
    // Keep the preview open on failure so Retry doesn't mean rebuilding the
    // whole receipt; only a successful send dismisses it.
    if (r.ok) {
      // Send the remaining slips on the same template. A failure part-way
      // through is reported rather than swallowed — the operator needs to
      // know which slips actually came out.
      final rest = widget.buildRest;
      final t = _template;
      if (rest != null && t != null) {
        try {
          for (final j in await rest(t)) {
            final more = await ReceiptService().printJob(j);
            if (!more.ok) {
              if (!mounted) return;
              setState(() => _sending = false);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppDesign.danger,
                behavior: SnackBarBehavior.floating,
                content: Text('Some slips printed, then: ${more.message}'),
              ));
              return;
            }
          }
        } catch (e) {
          if (!mounted) return;
          setState(() => _sending = false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppDesign.danger,
            behavior: SnackBarBehavior.floating,
            content: Text('Some slips printed, then failed: $e'),
          ));
          return;
        }
      }
      if (!mounted) return;
      Navigator.pop(context, r);
      return;
    }
    setState(() => _sending = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppDesign.danger,
      behavior: SnackBarBehavior.floating,
      content: Text(r.message),
      action: r.failure == PrintFailure.noPrinter
          ? SnackBarAction(
              label: 'Set up',
              textColor: Colors.white,
              onPressed: () async {
                await PrinterSetupSheet.show(context);
                if (mounted) {
                  final s = await PrinterService().settings(refresh: true);
                  if (mounted) setState(() => _printer = s);
                }
              },
            )
          : null,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.radiusLg)),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: media.height * 0.86),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            const Divider(height: 1, color: AppDesign.border),
            _templateBar(),
            const Divider(height: 1, color: AppDesign.border),
            Flexible(child: _paper()),
            const Divider(height: 1, color: AppDesign.border),
            _actions(),
          ],
        ),
      ),
    );
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 10),
        child: Row(children: [
          Icon(Icons.receipt_long, size: 18, color: widget.accent),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Print preview',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                Text(_job?.docNo ?? '…',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: widget.accent),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Printer settings',
            icon: const Icon(Icons.settings_outlined, size: 18),
            onPressed: _sending
                ? null
                : () async {
                    await PrinterSetupSheet.show(context);
                    if (!mounted) return;
                    final s = await PrinterService().settings(refresh: true);
                    if (mounted) setState(() => _printer = s);
                  },
          ),
        ]),
      );

  /// Horizontal strip of templates. Tapping one re-renders the preview, so the
  /// operator compares layouts against the real document rather than guessing
  /// from a name.
  Widget _templateBar() => Container(
        color: AppDesign.surface,
        padding: const EdgeInsets.fromLTRB(10, 8, 6, 8),
        child: Row(children: [
          Expanded(
            child: SizedBox(
              height: 28,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _templates.length,
                separatorBuilder: (_, __) => const SizedBox(width: 6),
                itemBuilder: (context, i) => _templateChip(_templates[i]),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Manage templates',
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.tune, size: 17),
            onPressed: _sending
                ? null
                : () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReceiptTemplatesPage()),
                    );
                    // An edit to the selected template must show up here.
                    if (mounted) await _load();
                  },
          ),
        ]),
      );

  Widget _templateChip(ReceiptTemplate t) {
    final on = t.id == _template?.id;
    return InkWell(
      onTap: (_sending || on) ? null : () => _select(t),
      borderRadius: BorderRadius.circular(AppDesign.radiusPill),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: on ? widget.accent.withOpacity(0.10) : null,
          borderRadius: BorderRadius.circular(AppDesign.radiusPill),
          border:
              Border.all(color: on ? widget.accent : AppDesign.borderStrong),
        ),
        child: Text(
          t.name,
          style: TextStyle(
            fontSize: 11,
            fontWeight: on ? FontWeight.w800 : FontWeight.w600,
            color: on ? widget.accent : AppDesign.inkMuted,
          ),
        ),
      ),
    );
  }

  /// The receipt itself. Shared with the template editor via
  /// [ReceiptPaperView] so both render from the same transcript.
  Widget _paper() {
    final job = _job;
    if (job == null) {
      return const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return ReceiptPaperView(job: job);
  }

  Widget _actions() {
    final p = _printer;
    final ready = p?.isConfigured ?? false;
    final target = !ready
        ? 'No printer selected'
        : '${p!.displayName} · ${p.paperWidthMm}mm'
            '${p.copies > 1 ? ' · ${p.copies} copies' : ''}';

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Icon(ready ? Icons.print_outlined : Icons.print_disabled_outlined,
                size: 14,
                color: ready ? AppDesign.inkMuted : AppDesign.warning),
            const SizedBox(width: 6),
            Expanded(
              child: Text(target,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: ready ? AppDesign.inkMuted : AppDesign.warning),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _sending ? null : () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppDesign.inkMuted,
                  side: const BorderSide(color: AppDesign.borderStrong),
                  minimumSize: const Size(0, 42),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusSm)),
                ),
                child: const Text('Cancel',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: (_sending || _rendering || _job == null)
                    ? null
                    : _print,
                icon: (_sending || _rendering)
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : const Icon(Icons.print, size: 16),
                label: Text(_sending ? 'Sending…' : 'Print',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.accent,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  minimumSize: const Size(0, 42),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppDesign.radiusSm)),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
