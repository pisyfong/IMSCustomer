import 'dart:async';
import 'package:flutter/material.dart';

import '../services/qty.dart';
import '../theme/app_design.dart';

/// What one row of item history is: a document, a date, and the line as it was
/// sold or quoted.
///
/// A plain map crosses the boundary from the two loaders, so this parses once,
/// here, rather than every widget doing `row['qty'] as double?` and disagreeing
/// about what a missing key means.
class ItemHistoryEntry {
  final String docNo;
  final DateTime? date;
  final double qty;
  final String uom;
  final double price;
  final double foc;
  final double quantityLoose;
  final double focLoose;
  final double? factor;

  const ItemHistoryEntry({
    required this.docNo,
    required this.date,
    required this.qty,
    required this.uom,
    required this.price,
    this.foc = 0,
    this.quantityLoose = 0,
    this.focLoose = 0,
    this.factor,
  });

  factory ItemHistoryEntry.fromMap(Map<String, dynamic> m) {
    double num_(dynamic v) =>
        v == null ? 0 : (v is num ? v.toDouble() : double.tryParse('$v') ?? 0);
    return ItemHistoryEntry(
      docNo: (m['invoiceNo'] ?? m['quoteNo'] ?? '-').toString().trim(),
      date: m['date'] as DateTime?,
      qty: num_(m['qty']),
      uom: (m['uom'] ?? '').toString().trim(),
      price: num_(m['price']),
      foc: num_(m['foc']),
      quantityLoose: num_(m['quantityLoose']),
      focLoose: num_(m['focLoose']),
      factor: m['factor'] == null ? null : num_(m['factor']),
    );
  }

  /// Whether this line carried anything beyond a plain charged quantity.
  bool get hasExtras => foc > 0 || quantityLoose > 0 || focLoose > 0;

  /// What the line was worth, on the same rule the cart and the sheet use:
  /// packs at the UOM price, basic quantities at the base-unit price, FOC free.
  double get lineTotal {
    final f = (factor ?? 1) > 0 ? (factor ?? 1) : 1;
    return price * qty + (price / f) * quantityLoose;
  }
}

/// Previous invoices or quotations for one item, each re-orderable in a tap.
///
/// Replaces a horizontally scrolling strip of 140px cards. That strip could
/// show two documents at a time on a handheld, hid the rest behind a sideways
/// swipe inside a vertically scrolling sheet, and had nowhere to put an action.
/// A vertical list shows three at a glance and has room for the line's whole
/// shape — which matters now that a row can be put back in the cart, since the
/// operator is agreeing to what it says.
class ItemHistoryList extends StatelessWidget {
  final List<ItemHistoryEntry> entries;

  /// Invoices and quotations differ only in colour and wording; the row is the
  /// same, because re-ordering one is the same act as re-ordering the other.
  final bool isInvoice;

  /// Null hides the add affordance — used while a company or customer is still
  /// resolving, so a tap cannot land on a half-built cart line.
  final Future<void> Function(ItemHistoryEntry entry)? onAdd;

  const ItemHistoryList({
    Key? key,
    required this.entries,
    required this.isInvoice,
    this.onAdd,
  }) : super(key: key);

  Color get _accent => isInvoice ? AppDesign.modPicking : AppDesign.info;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return Center(
        child: Text(
          'No previous ${isInvoice ? 'invoices' : 'quotations'}',
          style: const TextStyle(fontSize: 11.5, color: AppDesign.inkSubtle),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: entries.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 9, color: AppDesign.divider),
      itemBuilder: (context, i) => _row(context, entries[i]),
    );
  }

  Widget _row(BuildContext context, ItemHistoryEntry e) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      e.docNo.isEmpty ? '-' : e.docNo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w800,
                          color: _accent),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _fmtDate(e.date),
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: AppDesign.inkSubtle),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                _quantityLine(e),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.ink),
              ),
              Text(
                'RM ${e.price.toStringAsFixed(2)} / ${e.uom.isEmpty ? 'unit' : e.uom}'
                '${e.qty > 0 ? '   ·   RM ${e.lineTotal.toStringAsFixed(2)}' : ''}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppDesign.inkMuted),
              ),
            ],
          ),
        ),
        if (onAdd != null) ...[
          const SizedBox(width: 8),
          _AddButton(accent: _accent, onPressed: () => onAdd!(e)),
        ],
      ],
    );
  }

  /// The quantity as the document recorded it, extras included.
  ///
  /// Free goods and basic quantities are named here rather than summed into
  /// the quantity, because the button below re-orders exactly this and the
  /// operator has to be able to see what "exactly this" means.
  static String _quantityLine(ItemHistoryEntry e) {
    final uom = e.uom.isEmpty ? '' : ' ${e.uom}';
    final b = StringBuffer('${Qty.fmt(e.qty)}$uom');
    if (e.foc > 0) b.write('  +${Qty.fmt(e.foc)} FOC');
    if (e.quantityLoose > 0) b.write('  +${Qty.fmt(e.quantityLoose)} basic');
    if (e.focLoose > 0) b.write('  +${Qty.fmt(e.focLoose)} FOC basic');
    return b.toString();
  }

  static String _fmtDate(DateTime? d) {
    if (d == null) return '—';
    String two(int v) => v.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year}';
  }
}

/// The re-order affordance.
///
/// Holds its own busy state so a slow write cannot be tapped twice into two
/// cart lines — the add is a database round trip, and on a handheld a
/// non-responding button gets tapped again.
///
/// It also confirms in place. The usual confirmation is a SnackBar, but this
/// list lives inside a bottom sheet covering most of the screen, and a SnackBar
/// comes up underneath it — the operator would tap and see nothing happen.
class _AddButton extends StatefulWidget {
  final Color accent;
  final Future<void> Function() onPressed;

  const _AddButton({required this.accent, required this.onPressed});

  @override
  State<_AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<_AddButton> {
  bool _busy = false;
  bool _done = false;
  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  Future<void> _run() async {
    if (_busy) return;
    setState(() => _busy = true);
    var ok = false;
    try {
      await widget.onPressed();
      ok = true;
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _done = ok;
        });
        if (ok) {
          // Back to "Add" shortly: the row can be ordered again, and a button
          // stuck on a tick reads as "already done, do not press".
          _resetTimer?.cancel();
          _resetTimer = Timer(const Duration(milliseconds: 1600), () {
            if (mounted) setState(() => _done = false);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colour = _done ? AppDesign.success : widget.accent;
    return SizedBox(
      height: 30,
      child: OutlinedButton(
        onPressed: _busy ? null : _run,
        style: OutlinedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          foregroundColor: colour,
          side: BorderSide(color: colour.withOpacity(_done ? 0.9 : 0.5)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
        ),
        child: _busy
            ? const SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(strokeWidth: 2))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_done ? Icons.check : Icons.add_shopping_cart, size: 13),
                  const SizedBox(width: 4),
                  Text(_done ? 'In cart' : 'Add',
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w800)),
                ],
              ),
      ),
    );
  }
}
