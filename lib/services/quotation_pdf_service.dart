import 'dart:typed_data';
import 'package:barcode/barcode.dart';
import 'package:isar/isar.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../main.dart';
import '../models/credit_term.dart';
import '../models/customer.dart';
import '../models/inventory_item.dart';
import '../models/quotation.dart';
import '../models/quote_item.dart';
import '../models/representative.dart';
import 'auth_service.dart';

/// Re-renders the quotation PDF for a saved Quotation row, looking up all
/// dependent data (items, customer, representative, credit term, inventory
/// descriptions) from local Isar.
///
/// Mirrors the layout produced by checkout_page._generatePdfQuotation so
/// the regenerated PDF looks the same as the original.
class QuotationPdfService {
  static final QuotationPdfService _instance =
      QuotationPdfService._internal();
  factory QuotationPdfService() => _instance;
  QuotationPdfService._internal();

  /// Builds the PDF for [quotation] and opens it in the system print/share
  /// preview. All data is read from local Isar — works fully offline.
  Future<void> regenerateAndPreview(Quotation quotation) async {
    final bytes = await buildPdfBytes(quotation);
    if (bytes == null) return;
    final fileName = _fileName(quotation);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => bytes,
      name: fileName,
    );
  }

  /// Returns the PDF as bytes for the given quotation, or null if the
  /// quotation has no items. Pure render — does not touch the network.
  Future<Uint8List?> buildPdfBytes(Quotation quotation) async {
    // ─── Gather dependent data from local Isar ───
    final items = await isar.quoteItems
        .filter()
        .companyCodeEqualTo(quotation.companyCode)
        .and()
        .quotePreLabelEqualTo(quotation.quotePreLabel)
        .findAll();
    items.sort((a, b) => a.sequenceNo.compareTo(b.sequenceNo));
    if (items.isEmpty) return null;

    final customer = await isar.customers
        .filter()
        .companyCodeEqualTo(quotation.companyCode)
        .and()
        .codeEqualTo(quotation.customer ?? '')
        .findFirst();

    Representative? rep;
    if (quotation.representativeId != null) {
      rep = await isar.representatives
          .filter()
          .companyCodeEqualTo(quotation.companyCode)
          .and()
          .representativeIdEqualTo(quotation.representativeId!)
          .findFirst();
    }

    CreditTerm? term;
    if (quotation.term != null && quotation.term!.isNotEmpty) {
      term = await isar.creditTerms
          .filter()
          .companyCodeEqualTo(quotation.companyCode)
          .and()
          .termEqualTo(quotation.term!)
          .findFirst();
    }

    // SKU+UOM -> description lookup (mirrors checkout_page's descLookup).
    final skuNos = items.map((i) => i.skuNo).toSet().toList();
    final inv = <int, InventoryItem>{};
    for (final sku in skuNos) {
      final it = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(quotation.companyCode)
          .and()
          .skuNoEqualTo(sku)
          .findFirst();
      if (it != null) inv[sku] = it;
    }
    String descFor(QuoteItem item) {
      final cached = inv[item.skuNo];
      return cached?.description ?? cached?.articleDesc ?? 'Item ${item.skuNo}';
    }

    final auth = AuthService();
    final user = await auth.loadSavedLogin();
    final selectedCompany = await auth.getSelectedCompany();
    final companyName =
        selectedCompany?['companyName']?.toString() ?? 'Company';

    // ─── Build the PDF ───
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return [
            // Header: company info + PICKING LIST + quote number
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        companyName.toUpperCase(),
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(
                        'LOT 1422 EASTWOOD VALLEY INDUSTRIAL PARK 1, JALAN MIRI BY-PASS,',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                      pw.Text(
                        '96000 MIRI SARAWAK  TEL/FAX: 085-419489, 013-6686555',
                        style: const pw.TextStyle(fontSize: 8),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text('Email: fungseng22@gmail.com',
                          style: const pw.TextStyle(fontSize: 8)),
                    ],
                  ),
                ),
                pw.Expanded(
                  flex: 2,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Container(
                        decoration:
                            pw.BoxDecoration(border: pw.Border.all(width: 2)),
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: pw.Text('PICKING LIST',
                            style: pw.TextStyle(
                                fontSize: 16,
                                fontWeight: pw.FontWeight.bold)),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(quotation.quotePreLabel,
                          style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 15),

            // Customer + Quote info
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'To: ${quotation.customer ?? ''}'
                        '${customer?.name != null ? " - ${customer!.name}" : ''}',
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 3),
                      if (customer != null && _customerAddress(customer).isNotEmpty)
                        pw.Text(_customerAddress(customer),
                            style: const pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Container(
                  width: 150,
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(border: pw.Border.all()),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      _kv('Master Quote', quotation.masterPreLabel ?? quotation.quotePreLabel),
                      _kv('Quote Date',
                          (quotation.quoteDate ?? DateTime.now())
                              .toString()
                              .split(' ')[0]),
                      _kv('Term', term?.displayDescription ?? quotation.term ?? '30 DAYS'),
                      _kv('Quoted By', user?.loginName ?? 'IMS'),
                      _kv('SalesRep', rep?.displayName ?? '-'),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 15),

            // Items table
            pw.Table(
              border: pw.TableBorder.all(width: 0.5),
              columnWidths: {
                0: const pw.FixedColumnWidth(30),
                1: const pw.FlexColumnWidth(2),
                2: const pw.FlexColumnWidth(4),
                3: const pw.FixedColumnWidth(40),
                4: const pw.FixedColumnWidth(35),
                5: const pw.FixedColumnWidth(45),
                6: const pw.FixedColumnWidth(55),
                7: const pw.FixedColumnWidth(45),
                8: const pw.FixedColumnWidth(60),
              },
              children: [
                pw.TableRow(
                  decoration:
                      const pw.BoxDecoration(color: PdfColors.grey200),
                  children: [
                    _hdr('No'),
                    _hdr('Plu/Barcode'),
                    _hdr('Description'),
                    _hdr('Qty'),
                    _hdr('Foc'),
                    _hdr('Uom/F'),
                    _hdr('U/Price'),
                    _hdr('Disc.'),
                    _hdr('Amount'),
                  ],
                ),
                ...items.asMap().entries.map((e) {
                  final idx = e.key + 1;
                  final item = e.value;
                  final qty = (item.quoteQuantity ?? 0).toInt();
                  final price = (item.unitPrice ?? 0).toStringAsFixed(2);
                  final amount = (item.netAmount ?? 0).toStringAsFixed(2);
                  return pw.TableRow(children: [
                    _cell('$idx'),
                    _barcodeCell(item.pluNo),
                    _descCell(descFor(item), (item.remark ?? '').trim()),
                    _cell('$qty', align: pw.TextAlign.right),
                    _cell(''),
                    _cell(item.uom),
                    _cell(price, align: pw.TextAlign.right),
                    _cell(''),
                    _cell(amount, align: pw.TextAlign.right),
                  ]);
                }),
              ],
            ),
            pw.SizedBox(height: 10),

            if ((quotation.remark1 ?? '').isNotEmpty)
              pw.Text('REMARK 1: ${quotation.remark1}',
                  style: const pw.TextStyle(fontSize: 8)),
            pw.SizedBox(height: 10),

            // Footer: signatures + total
            pw.Container(
              decoration: const pw.BoxDecoration(
                border: pw.Border(top: pw.BorderSide(width: 1)),
              ),
              padding: const pw.EdgeInsets.only(top: 10),
              child: pw.Column(children: [
                pw.SizedBox(height: 10),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: pw.Row(children: [
                        pw.Expanded(child: _signBox('Received By')),
                        pw.SizedBox(width: 5),
                        pw.Expanded(child: _signBox('Check By')),
                        pw.SizedBox(width: 5),
                        pw.Expanded(child: _signBox('Delivered By')),
                        pw.SizedBox(width: 5),
                        pw.Expanded(child: _signBox('For Fung Seng Trading SB')),
                      ]),
                    ),
                    pw.SizedBox(width: 20),
                    pw.Container(
                      width: 150,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                        children: [
                          pw.Container(
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(top: pw.BorderSide(width: 1)),
                            ),
                            padding: const pw.EdgeInsets.only(top: 4),
                            child: _totalRow(
                              'Total (GST Inc.)',
                              'RM',
                              (quotation.netAmount ?? 0).toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  // ─── Helpers ───

  String _fileName(Quotation q) {
    final code = (q.customer ?? 'N_A').replaceAll(RegExp(r'[\\/]'), '_');
    final qno = q.quotePreLabel.replaceAll(RegExp(r'[\\/]'), '_');
    return 'Quote_${code}_$qno.pdf';
  }

  String _customerAddress(Customer c) {
    final parts = [
      c.address1,
      c.address2,
      c.address3,
      c.address4,
      c.postcode,
      c.city,
      c.state,
    ].where((s) => s != null && s.toString().trim().isNotEmpty).toList();
    return parts.join(', ');
  }

  pw.Widget _kv(String k, String v) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(k, style: const pw.TextStyle(fontSize: 8)),
        pw.Text(': $v', style: const pw.TextStyle(fontSize: 8)),
      ],
    );
  }

  pw.Widget _hdr(String text) => pw.Padding(
        padding: const pw.EdgeInsets.all(3),
        child: pw.Text(
          text,
          style: pw.TextStyle(fontSize: 8, fontWeight: pw.FontWeight.bold),
          textAlign: pw.TextAlign.center,
        ),
      );

  pw.Widget _cell(String text,
          {double fontSize = 8, pw.TextAlign align = pw.TextAlign.left}) =>
      pw.Padding(
        padding: const pw.EdgeInsets.all(3),
        child: pw.Text(text,
            style: pw.TextStyle(fontSize: fontSize), textAlign: align),
      );

  pw.Widget _descCell(String description, String? remarks) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(3),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(description, style: const pw.TextStyle(fontSize: 8)),
          if (remarks != null && remarks.isNotEmpty)
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 2),
              child: pw.Text('Note: $remarks',
                  style: pw.TextStyle(
                      fontSize: 7,
                      color: PdfColors.grey700,
                      fontStyle: pw.FontStyle.italic)),
            ),
        ],
      ),
    );
  }

  pw.Widget _signBox(String label) => pw.Container(
        height: 50,
        decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(2),
              decoration: const pw.BoxDecoration(
                border: pw.Border(top: pw.BorderSide(width: 0.5)),
              ),
              child: pw.Center(
                child: pw.Text(label, style: const pw.TextStyle(fontSize: 7)),
              ),
            ),
          ],
        ),
      );

  pw.Widget _totalRow(String label, String colon, String value) {
    final style =
        pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold);
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: style),
          pw.Text(colon, style: style),
          pw.Text(value, style: style),
        ],
      ),
    );
  }

  pw.Widget _barcodeCell(String? pluNo) {
    if (pluNo == null || pluNo.isEmpty) return _cell('');
    try {
      final isNumeric = RegExp(r'^[0-9]+$').hasMatch(pluNo);
      final type = (isNumeric && pluNo.length == 13)
          ? Barcode.ean13()
          : Barcode.code128();
      return pw.Padding(
        padding: const pw.EdgeInsets.all(2),
        child: pw.BarcodeWidget(
          barcode: type,
          data: pluNo,
          width: 80,
          height: 30,
          drawText: true,
          textStyle: const pw.TextStyle(fontSize: 6),
        ),
      );
    } catch (_) {
      return _cell(pluNo, fontSize: 7);
    }
  }
}
