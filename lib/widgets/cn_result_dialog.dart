import 'package:flutter/material.dart';

import '../models/adjustment.dart';
import '../services/adjustment_pdf_service.dart';
import '../theme/app_design.dart';

/// Shows the document numbers the server assigned after an upload.
///
/// The device only ever had a provisional label, so until this point nobody
/// knows what the credit note is actually called — and that number is what
/// gets quoted to the customer and written on the paperwork. It is shown once,
/// deliberately, rather than left to be found in a list.
class CnResultDialog extends StatelessWidget {
  final List<Adjustment> uploaded;

  /// Set when the run stopped early. The numbers above it are still real.
  final String? error;

  const CnResultDialog({super.key, required this.uploaded, this.error});

  static Future<void> show(
    BuildContext context, {
    required List<Adjustment> uploaded,
    String? error,
  }) {
    if (uploaded.isEmpty && error == null) return Future.value();
    return showDialog<void>(
      context: context,
      builder: (_) => CnResultDialog(uploaded: uploaded, error: error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final many = uploaded.length > 1;
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      title: Row(
        children: [
          Icon(uploaded.isEmpty ? Icons.error_outline : Icons.check_circle,
              size: 20,
              color: uploaded.isEmpty ? AppDesign.danger : AppDesign.success),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              uploaded.isEmpty
                  ? 'Nothing was sent'
                  : many
                      ? '${uploaded.length} credit notes created'
                      : 'Credit note created',
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (uploaded.isNotEmpty) ...[
            const Text('Document number',
                style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                    color: AppDesign.inkSubtle)),
            const SizedBox(height: 6),
            // Constrained so a long run scrolls instead of running off the
            // dialog — twenty queued notes should still be readable.
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [for (final a in uploaded) _row(context, a)],
                ),
              ),
            ),
          ],
          if (error != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: AppDesign.danger.withOpacity(0.08),
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              ),
              child: Text(
                uploaded.isEmpty
                    ? error!
                    : 'The rest stopped here: $error',
                style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: AppDesign.danger),
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ],
    );
  }

  Widget _row(BuildContext context, Adjustment a) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText(
                  a.preLabel,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.3,
                      color: AppDesign.modCreditNote),
                ),
                Text(
                  '${a.adjustmentDescription ?? a.adjustment}'
                  '${(a.partyName ?? '').trim().isEmpty ? '' : ' · ${a.partyName!.trim()}'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppDesign.inkMuted),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Print or share',
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.print_outlined,
                size: 19, color: AppDesign.modCreditNote),
            onPressed: () => _print(context, a),
          ),
        ],
      ),
    );
  }

  Future<void> _print(BuildContext context, Adjustment a) async {
    try {
      await AdjustmentPdfService().shareFor(a);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not build the report: $e')),
        );
      }
    }
  }
}
