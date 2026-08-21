import 'dart:io';
import 'dart:typed_data';

import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../main.dart';
import '../models/adjustment.dart';
import '../models/adjustment_item.dart';
import '../models/customer.dart';
import '../models/representative.dart';
import 'company_letterhead.dart';
import 'qty.dart';

/// Renders the printed credit note.
///
/// Laid out to match what the legacy desktop app produces (sample:
/// FST/CN/000496): letterhead left, document type and number right, the
/// account block beneath, a six-field meta column, the line table, the amount
/// spelled out, and the totals box. Whoever files these has both versions in
/// the same folder, so they have to read as the same document.
class AdjustmentPdfService {
  static final AdjustmentPdfService _i = AdjustmentPdfService._();
  factory AdjustmentPdfService() => _i;
  AdjustmentPdfService._();

  /// Builds the PDF and hands it to the system share/print sheet.
  Future<void> shareFor(Adjustment header) async {
    final bytes = await build(header);
    await Printing.sharePdf(
      bytes: bytes,
      filename: fileNameFor(header),
    );
  }

  /// Builds the report, writes it beside the quotation PDFs, and opens the
  /// viewer — the same sequence the checkout uses after creating a quotation,
  /// so a credit note behaves like every other document the app produces.
  ///
  /// Returns the bytes and the path so the caller can offer Open and Share
  /// afterwards without rebuilding the document.
  Future<AdjustmentPdfResult> buildAndOpen(Adjustment header) async {
    final bytes = await build(header);
    final name = fileNameFor(header);

    String? savedPath;
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, name));
      await file.writeAsBytes(bytes);
      savedPath = file.path;
    } catch (e) {
      // A failed write must not cost the operator the document — it is still
      // in memory and can be shared straight from there.
      print('📄 CN PDF: could not save to disk ($e)');
    }

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => bytes,
      name: name,
    );
    return AdjustmentPdfResult(bytes: bytes, fileName: name, path: savedPath);
  }

  Future<void> share(AdjustmentPdfResult r) =>
      Printing.sharePdf(bytes: r.bytes, filename: r.fileName);

  Future<void> open(AdjustmentPdfResult r) => Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => r.bytes,
        name: r.fileName,
      );

  static String fileNameFor(Adjustment h) => '${_safeName(h.preLabel)}.pdf';

  static String _safeName(String preLabel) =>
      preLabel.replaceAll(RegExp(r'[^A-Za-z0-9]+'), '');

  Future<Uint8List> build(Adjustment header) async {
    final items = await isar.adjustmentItems
        .filter()
        .preLabelEqualTo(header.preLabel)
        .findAll();
    items.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));

    final letterhead = await CompanyLetterhead.current();
    final customer = await _customer(header);
    final rep = await _rep(header);
    final net = _net(items);

    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(28, 24, 28, 24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _head(letterhead, header),
            pw.SizedBox(height: 10),
            _party(customer, header, rep),
            pw.SizedBox(height: 8),
            _table(items),
            // Totals sit at the foot of the page rather than under the last
            // line, so a one-line note and a thirty-line note print the same
            // shape.
            pw.Expanded(child: pw.SizedBox()),
            _amountInWords(net),
            pw.SizedBox(height: 4),
            _totals(net),
          ],
        ),
      ),
    );
    return doc.save();
  }

  Future<Customer?> _customer(Adjustment h) async {
    final code = (h.partyCode ?? '').trim();
    if (code.isEmpty) return null;
    try {
      return await isar.customers
          .filter()
          .companyCodeEqualTo(h.companyCode)
          .and()
          .codeEqualTo(code)
          .findFirst();
    } catch (_) {
      return null;
    }
  }

  Future<Representative?> _rep(Adjustment h) async {
    final id = h.representativeId;
    if (id == null || id == 0) return null;
    try {
      final all = await isar.representatives
          .filter()
          .companyCodeEqualTo(h.companyCode)
          .findAll();
      final hit = all.where((r) => r.representativeId == id);
      return hit.isEmpty ? null : hit.first;
    } catch (_) {
      return null;
    }
  }

  static double _net(List<AdjustmentItem> items) {
    var t = 0.0;
    for (final i in items) {
      t += i.lineTotal;
    }
    return t;
  }

  // ── Sections ─────────────────────────────────────────────────────────────

  pw.Widget _head(CompanyLetterhead lh, Adjustment h) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 3,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(lh.companyName,
                  style: pw.TextStyle(
                      fontSize: 15,
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 1.1)),
              if (lh.registrationNo.isNotEmpty)
                pw.Text(lh.registrationNo,
                    style: const pw.TextStyle(fontSize: 7)),
              for (final line in lh.addressLines)
                pw.Text(line, style: const pw.TextStyle(fontSize: 8)),
            ],
          ),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Column(
            children: [
              pw.Text(
                (h.adjustmentDescription ?? h.adjustment).toUpperCase(),
                style: pw.TextStyle(
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                    fontStyle: pw.FontStyle.italic),
              ),
              pw.SizedBox(height: 2),
              pw.Text(h.preLabel,
                  style: pw.TextStyle(
                      fontSize: 15, fontWeight: pw.FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _party(Customer? c, Adjustment h, Representative? rep) {
    final address = <String>[
      for (final l in [c?.address1, c?.address2, c?.address3, c?.address4])
        if ((l ?? '').trim().isNotEmpty) l!.trim(),
    ];
    final contact = <String>[
      if ((c?.telNo ?? '').trim().isNotEmpty) 'Tel: ${c!.telNo!.trim()}',
      if ((c?.faxNo ?? '').trim().isNotEmpty) 'Fax: ${c!.faxNo!.trim()}',
    ].join('  ');

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 3,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('A/c : ${h.partyCode ?? ''}',
                  style: pw.TextStyle(
                      fontSize: 8, fontWeight: pw.FontWeight.bold)),
              pw.Text('To  : ${(c?.name ?? h.partyName ?? '').trim()}',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold)),
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 22),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    for (final l in address)
                      pw.Text(l, style: const pw.TextStyle(fontSize: 8)),
                    if (contact.isNotEmpty)
                      pw.Text(contact, style: const pw.TextStyle(fontSize: 8)),
                    if ((c?.email ?? '').trim().isNotEmpty)
                      pw.Text(c!.email!.trim(),
                          style: const pw.TextStyle(fontSize: 8)),
                  ],
                ),
              ),
            ],
          ),
        ),
        pw.Expanded(
          flex: 2,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _meta('Date', _date(h.syncedAt ?? h.createdAt)),
              _meta('Ref #', (h.reference ?? '').trim()),
              _meta('Sales Rep', (rep?.fullName ?? '').trim()),
              _meta('Adjust By', 'IMS'),
              _meta(
                  'Batch',
                  '${h.batchNo ?? ''}'
                      '${(h.batchName ?? '').trim().isEmpty ? '' : '-${h.batchName!.trim()}'}'),
              _meta('Adj Code', h.adjustment),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _meta(String label, String value) => pw.Row(
        children: [
          pw.SizedBox(
              width: 54,
              child: pw.Text(label, style: const pw.TextStyle(fontSize: 8))),
          pw.Text(': $value', style: const pw.TextStyle(fontSize: 8)),
        ],
      );

  static String _date(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${d.day.toString().padLeft(2, '0')}-${months[d.month - 1]}-${d.year}';
  }

  pw.Widget _table(List<AdjustmentItem> items) {
    final head = pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold);

    var qty = 0.0;
    var foc = 0.0;
    for (final i in items) {
      qty += i.quantity;
      foc += i.focQuantity;
    }

    pw.Widget h(String t, double w, {bool right = false}) => pw.SizedBox(
        width: w,
        child: pw.Text(t,
            textAlign: right ? pw.TextAlign.right : pw.TextAlign.left,
            style: head));

    return pw.Column(
      children: [
        pw.Divider(height: 4, thickness: 0.8),
        pw.Row(children: [
          h('No', 16),
          h('Sku', 46),
          pw.Expanded(child: pw.Text('Description', style: head)),
          h('Qty', 30, right: true),
          h('Foc', 26, right: true),
          h('Uom/F', 42),
          h('U/Price', 52, right: true),
          h('Disc.', 40, right: true),
          h('Tax', 30, right: true),
          h('Amount', 56, right: true),
        ]),
        pw.Divider(height: 4, thickness: 0.8),
        for (var n = 0; n < items.length; n++) _line(n + 1, items[n]),
        pw.Divider(height: 4, thickness: 0.5),
        pw.Row(children: [
          pw.Expanded(child: pw.SizedBox()),
          h(_n(qty), 30, right: true),
          h(_n(foc), 26, right: true),
          pw.SizedBox(width: 42),
          pw.SizedBox(width: 52),
          pw.SizedBox(width: 40),
          pw.SizedBox(width: 30),
          h(_money(_net(items)), 56, right: true),
        ]),
        pw.Divider(height: 4, thickness: 0.8),
      ],
    );
  }

  pw.Widget _line(int no, AdjustmentItem it) {
    final cell = pw.TextStyle(fontSize: 8);
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(width: 16, child: pw.Text('$no', style: cell)),
          // Zero-padded to six, as legacy prints it.
          pw.SizedBox(
              width: 46,
              child:
                  pw.Text(it.skuNo.toString().padLeft(6, '0'), style: cell)),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(it.description ?? 'SKU ${it.skuNo}', style: cell),
                if ((it.remark ?? '').trim().isNotEmpty)
                  pw.Text('REMARK: ${it.remark!.trim()}',
                      style: pw.TextStyle(
                          fontSize: 7, fontWeight: pw.FontWeight.bold)),
              ],
            ),
          ),
          pw.SizedBox(
              width: 30,
              child: pw.Text(_n(it.quantity),
                  textAlign: pw.TextAlign.right, style: cell)),
          pw.SizedBox(
              width: 26,
              child: pw.Text(it.focQuantity == 0 ? '' : _n(it.focQuantity),
                  textAlign: pw.TextAlign.right, style: cell)),
          pw.SizedBox(width: 42, child: pw.Text(it.uom, style: cell)),
          pw.SizedBox(
              width: 52,
              child: pw.Text(_money(it.unitCost),
                  textAlign: pw.TextAlign.right, style: cell)),
          pw.SizedBox(width: 40),
          pw.SizedBox(width: 30),
          pw.SizedBox(
              width: 56,
              child: pw.Text(_money(it.lineTotal),
                  textAlign: pw.TextAlign.right, style: cell)),
        ],
      ),
    );
  }

  pw.Widget _amountInWords(double net) => pw.Text(
        'RINGGIT MALAYSIA :  ${AmountInWords.ringgit(net)}',
        style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
      );

  pw.Widget _totals(double net) {
    pw.Widget row(String label, String value, {bool strong = false}) =>
        pw.Row(children: [
          pw.SizedBox(
              width: 84,
              child: pw.Text(label,
                  style: pw.TextStyle(
                      fontSize: 8, fontWeight: pw.FontWeight.bold))),
          pw.Text(':',
              style:
                  pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold)),
          pw.Expanded(
            child: pw.Text(value,
                textAlign: pw.TextAlign.right,
                style: pw.TextStyle(
                    fontSize: strong ? 10 : 8,
                    fontWeight: pw.FontWeight.bold)),
          ),
        ]);

    return pw.Row(children: [
      pw.Expanded(child: pw.SizedBox()),
      pw.SizedBox(
        width: 230,
        child: pw.Column(children: [
          pw.Divider(height: 4, thickness: 0.5),
          row('Grand Total', _money(net)),
          // Printed empty rather than omitted: the form is the same on every
          // credit note, and a missing row reads as a different document.
          row('Other Charges', ''),
          row('Disc.', ''),
          row('Tax', ''),
          row('Rounding', ''),
          pw.Divider(height: 4, thickness: 0.5),
          row('Net Total', 'RM   ${_money(net)}', strong: true),
          pw.Divider(height: 4, thickness: 0.8),
        ]),
      ),
    ]);
  }

  static String _money(double v) => v.toStringAsFixed(2);

  /// Quantities print bare when whole — legacy shows "1", not "1.00".
  static String _n(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : Qty.fmt(v);
}

/// Spells a ringgit amount, for the line the document is legally read from.
///
/// Exact, never rounded or abbreviated: this is the figure that governs if the
/// digits are ever disputed, so 155.00 reads "ONE HUNDRED FIFTY-FIVE AND CENTS
/// ZERO ONLY".
class AmountInWords {
  const AmountInWords._();

  static const _units = [
    '', 'ONE', 'TWO', 'THREE', 'FOUR', 'FIVE', 'SIX', 'SEVEN', 'EIGHT',
    'NINE', 'TEN', 'ELEVEN', 'TWELVE', 'THIRTEEN', 'FOURTEEN', 'FIFTEEN',
    'SIXTEEN', 'SEVENTEEN', 'EIGHTEEN', 'NINETEEN'
  ];
  static const _tens = [
    '', '', 'TWENTY', 'THIRTY', 'FORTY', 'FIFTY', 'SIXTY', 'SEVENTY',
    'EIGHTY', 'NINETY'
  ];

  static String ringgit(double amount) {
    final whole = amount.floor();
    // Rounded, not truncated: an amount of 0.155 must not print fifteen cents
    // while the totals box says 0.16.
    final cents = ((amount - whole) * 100).round();
    return '${_words(whole)} AND CENTS '
        '${cents == 0 ? 'ZERO' : _words(cents)} ONLY';
  }

  static String _words(int n) {
    if (n == 0) return 'ZERO';
    if (n < 0) return 'MINUS ${_words(-n)}';
    if (n < 20) return _units[n];
    if (n < 100) {
      final t = _tens[n ~/ 10];
      final u = n % 10;
      return u == 0 ? t : '$t-${_units[u]}';
    }
    if (n < 1000) {
      // No "AND" after HUNDRED: the legacy report prints "ONE HUNDRED
      // FIFTY-FIVE" (sample FST/CN/000496), and these sit side by side in the
      // same file.
      final rest = n % 100;
      return '${_units[n ~/ 100]} HUNDRED'
          '${rest == 0 ? '' : ' ${_words(rest)}'}';
    }
    const scales = [
      [1000000000, 'BILLION'],
      [1000000, 'MILLION'],
      [1000, 'THOUSAND'],
    ];
    for (final scale in scales) {
      final value = scale[0] as int;
      if (n >= value) {
        final rest = n % value;
        return '${_words(n ~/ value)} ${scale[1]}'
            '${rest == 0 ? '' : ' ${_words(rest)}'}';
      }
    }
    return '$n';
  }
}

/// A rendered credit note, kept so Open and Share do not rebuild it.
class AdjustmentPdfResult {
  final Uint8List bytes;
  final String fileName;

  /// Null when the file could not be written; the bytes still work.
  final String? path;

  const AdjustmentPdfResult({
    required this.bytes,
    required this.fileName,
    this.path,
  });
}
