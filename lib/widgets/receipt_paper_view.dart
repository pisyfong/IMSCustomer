import 'package:flutter/material.dart';

import '../services/receipt_service.dart';

/// Renders a built receipt as paper.
///
/// Shared by the print preview and the template editor so both show the exact
/// same thing — the transcript `EscPos` captured while building the bytes, not
/// a second rendering that could drift from it.
class ReceiptPaperView extends StatelessWidget {
  final ReceiptJob job;

  /// Background behind the paper strip.
  final Color backdrop;

  const ReceiptPaperView({
    super.key,
    required this.job,
    this.backdrop = const Color(0xFFF1F1F2),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backdrop,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(builder: (context, box) {
            // Monospace advance is ~0.6em, so this is the largest size that
            // still fits a full line without wrapping — wrapping would make
            // the preview lie about the layout.
            final fit = box.maxWidth / (job.cols * 0.62);
            final fontSize = fit.clamp(6.5, 12.0);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                job.lines.join('\n'),
                softWrap: false,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontFamilyFallback: const ['Courier New', 'Roboto Mono'],
                  fontSize: fontSize,
                  height: 1.28,
                  color: const Color(0xFF1A1A1A),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
