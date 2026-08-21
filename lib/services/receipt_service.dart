import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../main.dart';
import '../models/app_location.dart';
import '../models/app_user.dart';
import '../models/customer.dart';
import '../models/in_stock_plu.dart';
import '../models/inventory_item.dart';
import '../models/pack_list.dart';
import '../models/pack_list_item.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/quote.dart';
import '../models/receipt_template.dart';
import 'auth_service.dart';
import 'printer_service.dart';
import 'escpos.dart';

/// Builds and prints the pick / pack receipts.
///
/// Takes the lines it is given rather than re-reading Isar, so the detail page
/// can print exactly what's on screen (including edits saved a moment ago) and
/// a hub row can print straight from the database. Everything *around* the
/// lines — descriptions, PLUs, customers, the assignee's name — is resolved
/// here so no caller has to assemble it.
class ReceiptService {
  ReceiptService._();
  static final ReceiptService _i = ReceiptService._();
  factory ReceiptService() => _i;

  static final DateFormat _stamp = DateFormat('dd MMM yy hh:mm:ss a');
  static final DateFormat _day = DateFormat('dd MMM yy');

  // ─── Public entry points ─────────────────────────────────────────────────

  /// Builds the pick receipt without sending it, for the preview dialog.
  Future<ReceiptJob> buildPick(
      PickList h, List<PickListItem> items, ReceiptTemplate t) async {
    final doc = await _gather(
      template: t,
      companyCode: h.companyCode,
      docNo: h.pickPreLabel ?? '',
      docDate: h.pickDate ?? h.addedDate,
      locationCode: h.locationCode,
      assignedTo: h.assignedTo,
      status: h.status,
      synced: h.isSynced,
      doneLabel: 'PICKED',
      lines: [
        for (final it in items.where((i) => i.status != 'X'))
          _RLine(
            skuNo: it.skuNo,
            uom: it.uom,
            planned: it.qty ?? 0,
            done: it.pickQty ?? 0,
            sq: it.parentPreLabel,
            // A pick line's parent IS the SQ, so there's no second reference.
            source: null,
          ),
      ],
    );
    return _job(doc);
  }

  /// Builds the pack receipt without sending it, for the preview dialog.
  /// [invoiceNo] and [partLabel] set when printing one slip per invoice; the
  /// caller passes only that invoice's [items].
  Future<ReceiptJob> buildPack(
      PackList h, List<PackListItem> items, ReceiptTemplate t,
      {String? invoiceNo, String? partLabel}) async {
    final doc = await _gather(
      invoiceNo: invoiceNo,
      partLabel: partLabel,
      template: t,
      companyCode: h.companyCode,
      docNo: h.packPreLabel ?? '',
      docDate: h.addedDate,
      locationCode: h.locationCode,
      assignedTo: h.assignedTo,
      status: h.status,
      synced: h.isSynced,
      doneLabel: 'PACKED',
      lines: [
        for (final it in items.where((i) => i.status != 'X'))
          _RLine(
            skuNo: it.skuNo,
            uom: it.uom,
            planned: it.qty ?? 0,
            done: it.packQty ?? 0,
            sq: it.sourceSq,
            // Packs trace back to a pick — print it so a short pack can be
            // reconciled against the pick that fed it.
            source: it.parentPreLabel,
          ),
      ],
    );
    return _job(doc);
  }

  /// Sends an already-built (and previewed) receipt to the printer.
  Future<PrintResult> printJob(ReceiptJob job) =>
      // The bytes were laid out for the width the preview showed, so ignore
      // the callback's column count rather than silently re-flowing them.
      PrinterService().print((_) => job.bytes);

  /// Builds a preview of [t] for the template editor, without printing.
  ///
  /// Always renders the FIXED demo document below — never live data. These
  /// templates are edited on machines belonging to different customers, and a
  /// preview ends up in screenshots, support tickets and training material; it
  /// must not carry one customer's product list or trading names into another's.
  /// The demo set is also stable, so two people comparing layouts see the
  /// same receipt.
  Future<ReceiptJob> buildPreview(ReceiptTemplate t) async =>
      _job(await _sampleDoc(t));

  /// The demo document. Entirely synthetic and deliberately awkward, so a
  /// layout is judged against the cases that actually break it:
  ///
  ///  * two customers / two SQs  → grouping and subtotals are visible
  ///  * a description that wraps → the hanging indent is exercised
  ///  * a very short description → the opposite extreme
  ///  * one short-picked line    → the SHORT callout and the shortfall total
  ///  * a long company name      → masthead wrapping
  Future<_Doc> _sampleDoc(ReceiptTemplate t) async {
    final isPick = t.module == ReceiptTemplate.modulePick;
    final printer = await PrinterService().settings(refresh: true);

    _RLine line(int sku, String desc, String plu, String uom, double planned,
        double done, String sq, String custCode, String custName) {
      final l = _RLine(
        skuNo: sku,
        uom: uom,
        planned: planned,
        done: done,
        sq: sq,
        source: isPick ? null : 'DEMO/PK/0001',
      );
      // Set directly: the hydration path reads Isar, which has nothing for
      // these demo SKUs — and must not be consulted for a preview anyway.
      l.description = desc;
      l.plu = plu;
      l.customerCode = custCode;
      l.customerName = custName;
      return l;
    }

    const codeA = 'C1001';
    const custA = 'ALPHA RETAIL SDN BHD';
    const codeB = 'C1002';
    const custB = 'BETA WHOLESALE TRADING CO';

    final lines = <_RLine>[
      line(1001, 'MINERAL WATER 1.5L PET BOTTLE 12 X 1.5L SHRINK PACK',
          '1234567890123', 'CTN', 12, 10, 'DEMO/SQ/0001', codeA, custA),
      line(1002, 'WHITE SUGAR 1KG', '1234567890147', 'PKT', 24, 24,
          'DEMO/SQ/0001', codeA, custA),
      line(100345, 'COOKING OIL 5KG JERRY CAN', '1234567890161', 'TIN', 6, 6,
          'DEMO/SQ/0002', codeB, custB),
      line(1004, 'RICE PREMIUM GRADE A 10KG', '1234567890185', 'BAG', 8, 8,
          'DEMO/SQ/0002', codeB, custB),
    ];

    return _Doc(
      template: t,
      // Generic on purpose — the real company name would put a customer's
      // identity into every preview screenshot.
      companyName: 'DEMO TRADING COMPANY SDN BHD',
      docNo: isPick ? 'DEMO/PK/0001' : 'DEMO/PL/0001',
      // Fixed, not DateTime.now(), so the demo receipt is reproducible.
      docDate: DateTime(2026, 1, 15, 10, 30),
      location: 'WH1 · MAIN WAREHOUSE',
      assignee: 'Sample User',
      status: 'A',
      synced: true, // never show the not-uploaded banner on a demo
      doneLabel: isPick ? 'PICKED' : 'PACKED',
      lines: lines,
      printBarcode: t.showBarcode && printer.printBarcode,
      feedLines: printer.feedLines,
      autoCut: printer.autoCut,
    );
  }

  /// Renders [doc] once, keeping the bytes and the plain-text transcript from
  /// the same pass so the preview always matches the paper.
  Future<ReceiptJob> _job(_Doc doc) async {
    final cols = (await PrinterService().settings()).columns;
    final e = _build(doc, cols);
    return ReceiptJob(
      title: doc.template.name,
      docNo: doc.docNo,
      cols: cols,
      bytes: e.bytes,
      lines: e.textLines,
      bold: e.textBold,
    );
  }

  // ─── Metadata resolution ─────────────────────────────────────────────────

  Future<_Doc> _gather({
    required ReceiptTemplate template,
    required int? companyCode,
    required String docNo,
    required DateTime? docDate,
    required String? locationCode,
    required int? assignedTo,
    required String? status,
    required bool synced,
    required String doneLabel,
    required List<_RLine> lines,
    String? invoiceNo,
    String? partLabel,
  }) async {
    final company = await AuthService().getSelectedCompany();
    final printer = await PrinterService().settings(refresh: true);

    if (companyCode != null) {
      await _hydrateItems(companyCode, lines);
      await _hydrateCustomers(companyCode, lines);
    }

    String? assignee;
    if (assignedTo != null) {
      final u = await isar.appUsers.filter().userIdEqualTo(assignedTo).findFirst();
      assignee = u?.displayName;
    }

    String? location;
    if (companyCode != null && (locationCode ?? '').isNotEmpty) {
      final l = await isar.appLocations
          .filter()
          .companyCodeEqualTo(companyCode)
          .and()
          .locationCodeEqualTo(locationCode!)
          .findFirst();
      location = l?.displayName ?? locationCode;
    }

    return _Doc(
      template: template,
      companyName: (company?['companyName'] ?? '').toString().trim(),
      docNo: docNo,
      docDate: docDate,
      location: location,
      assignee: assignee,
      status: status,
      synced: synced,
      doneLabel: doneLabel,
      invoiceNo: invoiceNo,
      partLabel: partLabel,
      lines: lines,
      // The barcode is off if EITHER the template omits it or the printer is
      // configured without one — a template can't switch on hardware output
      // the operator has globally disabled.
      printBarcode: template.showBarcode && printer.printBarcode,
      feedLines: printer.feedLines,
      autoCut: printer.autoCut,
    );
  }

  /// Descriptions + per-UOM PLUs. The PLU is what the picker reads off the
  /// shelf label, so it matters more on paper than the internal SKU number.
  Future<void> _hydrateItems(int cc, List<_RLine> lines) async {
    final skus = lines.map((l) => l.skuNo).whereType<int>().toSet().toList();
    if (skus.isEmpty) return;

    final inv = await isar.inventoryItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
        .findAll();
    final desc = <int, String>{};
    final fallbackPlu = <int, String>{};
    for (final i in inv) {
      desc[i.skuNo] = (i.description ?? '').trim();
      final p = i.pluNo?.toString() ?? i.altPlu;
      if (p != null && p.isNotEmpty) fallbackPlu[i.skuNo] = p;
    }

    final uomPlu = <String, String>{};
    final pluRows = await isar.inStockPlus
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(skus, (q, s) => q.skuNoEqualTo(s))
        .findAll();
    for (final p in pluRows) {
      final sku = p.skuNo;
      if (sku == null || p.pluNo.isEmpty) continue;
      uomPlu['$sku|${(p.uom ?? '').toUpperCase()}'] = p.pluNo;
      fallbackPlu.putIfAbsent(sku, () => p.pluNo);
    }

    for (final l in lines) {
      final sku = l.skuNo;
      if (sku == null) continue;
      l.description = desc[sku] ?? '';
      l.plu = uomPlu['$sku|${(l.uom ?? '').toUpperCase()}'] ?? fallbackPlu[sku] ?? '';
    }
  }

  /// SQ → customer code → name, so the receipt can be sectioned the way the
  /// goods are actually staged.
  Future<void> _hydrateCustomers(int cc, List<_RLine> lines) async {
    final sqs = lines
        .map((l) => l.sq)
        .whereType<String>()
        .where((s) => s.isNotEmpty)
        .toSet()
        .toList();
    if (sqs.isEmpty) return;

    final quotes = await isar.quotes
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(sqs, (q, s) => q.quotePreLabelEqualTo(s))
        .findAll();
    // Keep the code EXACTLY as stored for the lookup, and trim only for
    // display. `Customer.code` comes from a SQL char() column and keeps its
    // padding, so matching a trimmed code against it finds nothing — the
    // receipt would print a customer code with no name beside it.
    final sqCustomer = <String, String>{}; // SQ label -> raw customer code
    for (final q in quotes) {
      final label = q.quotePreLabel;
      if (label != null) sqCustomer[label] = q.customer ?? '';
    }

    final codes =
        sqCustomer.values.where((c) => c.trim().isNotEmpty).toSet().toList();
    final names = <String, String>{}; // trimmed code -> name
    if (codes.isNotEmpty) {
      final custs = await isar.customers
          .filter()
          // Code-only, NOT scoped by company — AR_Customer is partitioned by
          // Company_Code but the documents referencing it are not, so scoping
          // drops the name for most rows. On a printed receipt that leaves the
          // customer as a bare code in front of the customer.
          .anyOf(codes, (q, c) => q.codeEqualTo(c))
          .findAll();
      for (final c in custs) {
        names[c.code.trim()] = (c.name ?? '').trim();
      }
    }

    for (final l in lines) {
      final code = (sqCustomer[l.sq ?? ''] ?? '').trim();
      if (code.isEmpty) continue;
      l.customerCode = code;
      l.customerName = names[code] ?? '';
    }
  }

  // ─── Rendering ───────────────────────────────────────────────────────────

  EscPos _build(_Doc d, int cols) {
    final t = d.template;
    final e = EscPos(cols: cols)..reset();

    // ── Masthead ──
    e.align(1);
    if (t.showCompanyName && d.companyName.isNotEmpty) {
      e
        ..bold(true)
        ..line(d.companyName)
        ..bold(false);
    }
    // Address / tel / SSM lines from the template.
    for (final l in t.headerLines) {
      if (l.trim().isNotEmpty) e.wrapped(l.trim());
    }
    if (t.title.trim().isNotEmpty) {
      e
        ..size(w: 2, h: 2)
        ..bold(true)
        ..line(t.title.trim())
        ..bold(false)
        ..size();
    }
    e
      ..align(0)
      ..feed();

    // ── Header block ──
    e.rule('=');
    e
      ..bold(true)
      ..field(d.isPick ? 'Pick No' : 'Pack No', d.docNo)
      ..bold(false);
    // The invoice this slip covers, when the pack was split per invoice. Bold
    // like the document number: on a per-invoice slip it is the field the
    // person receiving the goods actually matches against.
    if ((d.invoiceNo ?? '').isNotEmpty) {
      e
        ..bold(true)
        ..field('Invoice', d.invoiceNo!)
        ..bold(false);
      if ((d.partLabel ?? '').isNotEmpty) e.field('Slip', d.partLabel!);
    }
    if (t.showDate) {
      e.field('Date', d.docDate == null ? '-' : _stamp.format(d.docDate!));
    }
    if (t.showLocation && (d.location ?? '').isNotEmpty) {
      e.field('Location', d.location!);
    }
    if (t.showAssignee && (d.assignee ?? '').isNotEmpty) {
      e.field('Assignee', d.assignee!);
    }
    if (t.showStatus) e.field('Status', d.statusLabel);
    if (t.showPrintedAt) e.field('Printed', _stamp.format(DateTime.now()));
    e.rule('=');

    // A receipt for a document that hasn't reached the server yet is a
    // snapshot of one device's view — say so, loudly, on the paper.
    if (t.showUnsyncedWarning && !d.synced) {
      e
        ..bold(true)
        ..centre('** NOT YET UPLOADED **')
        ..centre('quantities may change on sync')
        ..bold(false)
        ..rule('-');
    }

    // ── Lines, sectioned per the template ──
    final groups = _group(d.lines, t.grouping, d.isPick);
    var index = 0;

    for (final g in groups) {
      if (g.heading.isNotEmpty) {
        e
          ..bold(true)
          ..wrapped(g.heading)
          ..bold(false);
        // Customer under the SQ, unemphasised, so the document number stays
        // the thing the eye lands on. A long name wraps with an indent —
        // flush-left continuation reads as another heading.
        if (g.subheading.isNotEmpty) e.wrapped(g.subheading, indent: '  ');
      }
      e.row2('#ITEM DESCRIPTION', '${d.shortLabel}/QTY');
      e.rule('-');

      for (final l in g.lines) {
        index++;
        // Line 1: running number + description (wrapped under the number).
        final label =
            l.description.isEmpty ? 'SKU ${l.skuNo ?? '-'}' : l.description;
        e.wrapped('$index. $label', indent: '   ');

        // Line 2: what the picker matches against the shelf, and the count.
        // SKU first — it's the system's own identity for the line and the only
        // one that's always present; PLU can be blank for a non-scanned item.
        final parts = <String>[
          if (l.skuNo != null) '${l.skuNo}',
          if (t.showPlu && l.plu.isNotEmpty) l.plu,
          if (t.showUom && (l.uom ?? '').isNotEmpty) l.uom!.toUpperCase(),
          if (t.showSource && (l.source ?? '').isNotEmpty) '<- ${l.source}',
        ];
        final count = '${_qty(l.done)}/${_qty(l.planned)}';
        // 3 = the indent, 1 = the minimum gap before the count.
        e.row2('   ${_joinRef(parts, cols - 4 - count.length)}', count);

        // A short line is the exception that has to survive a glance — bold,
        // because it's the one thing on the page someone has to act on.
        if (t.showShortQty && l.done < l.planned) {
          e
            ..bold(true)
            ..row2('   ', 'SHORT ${_qty(l.planned - l.done)}')
            ..bold(false);
        }
      }
      // A subtotal is only meaningful when there's more than one section.
      if (t.showTotals && groups.length > 1) {
        final gd = g.lines.fold<double>(0, (a, l) => a + l.done);
        final gp = g.lines.fold<double>(0, (a, l) => a + l.planned);
        e.row2('   Subtotal (${g.lines.length})',
            '${_qty(gd)}/${_qty(gp)}', fill: '.');
      }
      e.rule(groups.length > 1 ? '-' : '=');
    }

    if (d.lines.isEmpty) {
      e
        ..centre('(no items)')
        ..rule('=');
    }

    // ── Totals ──
    if (t.showTotals) {
      final planned = d.lines.fold<double>(0, (a, l) => a + l.planned);
      final done = d.lines.fold<double>(0, (a, l) => a + l.done);
      e.row2('Total Items', '${d.lines.length}', fill: '.');
      e.row2('Total qty', _qty(planned), fill: '.');
      e
        ..bold(true)
        ..row2('Total ${d.doneLabel.toLowerCase()} qty', _qty(done), fill: '.')
        ..bold(false);
      if (done < planned) {
        e.row2('Total short qty', _qty(planned - done), fill: '.');
      }
      e.rule('=');
    }

    // ── Free-text note ──
    if (t.footerNote.trim().isNotEmpty) {
      e
        ..wrapped(t.footerNote.trim())
        ..rule('-');
    }

    // ── Scannable document number ──
    if (d.printBarcode && d.docNo.isNotEmpty) {
      e.align(1);
      e.barcode128(d.docNo);
      e
        ..align(0)
        ..feed();
    }

    // ── Sign-off ──
    _signatureBlock(e, t.signatures, cols);
    e
      ..feed()
      ..align(1)
      ..line(_day.format(DateTime.now()))
      ..align(0)
      // Feed the last line past the tear bar before cutting.
      ..feed(d.feedLines.clamp(0, 10));
    if (d.autoCut) e.cut();

    return e;
  }

  /// Sections the lines per [mode].
  ///
  /// Order within a section follows the order the caller supplied — the order
  /// the operator sees on screen. Sections themselves come out in first-seen
  /// order for the same reason: the paper should walk the goods the way the
  /// screen does, not in some alphabetical order nobody staged to.
  ///
  /// A line with no value for the grouping key (an SQ that never resolved to a
  /// customer, say) files under "OTHER" rather than vanishing.
  List<_Group> _group(List<_RLine> lines, ReceiptGrouping mode, bool isPick) {
    // A pick has no upstream document of its own, so "source pick" degrades to
    // the SQ rather than lumping every line into one unlabelled section.
    if (mode == ReceiptGrouping.sourceDoc && isPick) mode = ReceiptGrouping.sq;

    if (mode == ReceiptGrouping.none) {
      return [_Group('')..lines.addAll(lines)];
    }

    final byKey = <String, _Group>{};
    for (final l in lines) {
      final sq = (l.sq ?? '').trim();
      final cust = _customerLabel(l);
      final src = (l.source ?? '').trim();

      final (String key, String heading, String sub) = switch (mode) {
        ReceiptGrouping.customer => (
            cust.isEmpty ? '' : cust,
            cust.isEmpty ? 'OTHER' : cust,
            '', // the customer IS the heading here
          ),
        ReceiptGrouping.sourceDoc => (
            src,
            src.isEmpty ? 'OTHER' : src,
            // A single pick can feed several customers, so there is no one
            // customer to caption it with.
            '',
          ),
        // The SQ number alone doesn't tell a picker whose goods they're
        // looking at, so the customer goes on its own line beneath it —
        // joining them inline just wrapped awkwardly on 58mm paper.
        _ => (
            sq,
            sq.isEmpty ? 'OTHER' : sq,
            sq.isEmpty ? '' : cust,
          ),
      };
      byKey.putIfAbsent(key, () => _Group(heading, sub)).lines.add(l);
    }

    final groups = byKey.values.toList();
    // A single unnamed section would print a bare heading for no reason.
    if (groups.length == 1 && groups.first.heading == 'OTHER') {
      return [_Group('')..lines.addAll(groups.first.lines)];
    }
    return groups;
  }

  /// Sign-off block.
  ///
  /// Labels are padded to the longest one so every colon — and every rule —
  /// starts in the same column. Ragged colons are the single thing that makes
  /// a receipt look hand-made.
  ///
  ///     Picked by  : ____________________
  ///     Checked by : ____________________
  ///
  /// If the longest label leaves too little room to actually sign (long
  /// captions on 58mm paper), the layout flips to a full-width rule with the
  /// caption underneath — the form used on delivery notes, and the only one
  /// that still gives a usable signing space:
  ///
  ///     ________________________________
  ///     Delivered by
  static void _signatureBlock(EscPos e, List<String> labels, int cols) {
    final names =
        labels.map((l) => l.trim()).where((l) => l.isNotEmpty).toList();
    if (names.isEmpty) return;

    final width = names.fold<int>(0, (a, l) => l.length > a ? l.length : a);
    final rule = cols - width - 2; // 2 = ': '

    // Below this, the inline form leaves a signing space too short to be
    // worth printing.
    const minRule = 14;

    // Two blank lines, not one: people sign ON the rule, and a single line of
    // clearance means ascenders run into whatever is printed above. Two lines
    // is ~6mm on 203dpi paper — enough to sign in, and cheap.
    if (rule >= minRule) {
      for (final n in names) {
        e
          ..feed(2)
          ..line('${n.padRight(width)}: ${'_' * rule}');
      }
    } else {
      for (final n in names) {
        e
          ..feed(2)
          ..line('_' * cols)
          ..line(n);
      }
    }
  }

  /// `CODE - NAME` for a line's customer.
  ///
  /// The code is what appears on the SQ and what anyone quotes on the phone;
  /// the name is what identifies the pallet on the floor. Printing only one of
  /// them means somebody has to look the other up, so both go on. Degrades to
  /// whichever is present when the other isn't.
  static String _customerLabel(_RLine l) {
    final code = l.customerCode.trim();
    final name = l.customerName.trim();
    if (code.isNotEmpty && name.isNotEmpty) return '$code - $name';
    return code.isNotEmpty ? code : name;
  }

  /// Joins the SKU / PLU / UOM reference with the airiest separator that still
  /// fits beside the count.
  ///
  /// A 6-digit SKU plus a 13-digit EAN plus a UOM is 24 characters before any
  /// separators — on 58mm paper that leaves no room for ' . ', and `row2`
  /// would silently truncate the tail (losing the UOM, the one part a picker
  /// can't infer). So 80mm gets the spaced form and 58mm degrades to bare
  /// dots rather than dropping information.
  static String _joinRef(List<String> parts, int room) {
    if (parts.isEmpty) return '';
    for (final sep in const [' . ', '.']) {
      final s = parts.join(sep);
      if (s.length <= room) return s;
    }
    return parts.join('.');
  }

  static String _qty(double v) {
    if (v == v.roundToDouble()) return v.toStringAsFixed(0);
    return v.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
  }
}

// ─── Value objects ─────────────────────────────────────────────────────────

/// A rendered receipt: the exact bytes that will be sent, plus the plain-text
/// transcript the preview shows. Both come from one render pass.
class ReceiptJob {
  final String title;
  final String docNo;

  /// Characters per line the receipt was laid out for (32 = 58mm, 48 = 80mm).
  final int cols;

  final List<int> bytes;
  final List<String> lines;

  /// Emphasis flag per entry of [lines], so the preview can show bold as bold.
  final List<bool> bold;

  const ReceiptJob({
    required this.title,
    required this.docNo,
    required this.cols,
    required this.bytes,
    required this.lines,
    this.bold = const [],
  });
}

class _RLine {
  final int? skuNo;
  final String? uom;
  final double planned;
  final double done;

  /// Source sales quotation (the customer's order).
  final String? sq;

  /// Upstream document this line came from — the pick, for a pack line.
  final String? source;

  String description = '';
  String plu = '';
  String customerCode = '';
  String customerName = '';

  _RLine({
    required this.skuNo,
    required this.uom,
    required this.planned,
    required this.done,
    required this.sq,
    required this.source,
  });
}

class _Group {
  final String heading;

  /// Second line under the heading — the customer, on SQ-grouped receipts.
  final String subheading;

  final List<_RLine> lines = [];
  _Group(this.heading, [this.subheading = '']);
}

class _Doc {
  final ReceiptTemplate template;
  final String companyName;
  final String docNo;
  final DateTime? docDate;
  final String? location;
  final String? assignee;
  final String? status;
  final bool synced;
  final String doneLabel;

  /// Set when this slip covers ONE invoice out of a pack that spans several,
  /// with [partLabel] like "1 of 3". Printed in the header so a slip that
  /// leaves the building with the goods says which invoice it belongs to.
  final String? invoiceNo;
  final String? partLabel;

  final List<_RLine> lines;
  final bool printBarcode;
  final int feedLines;
  final bool autoCut;

  _Doc({
    required this.template,
    required this.companyName,
    required this.docNo,
    required this.docDate,
    required this.location,
    required this.assignee,
    required this.status,
    required this.synced,
    required this.doneLabel,
    this.invoiceNo,
    this.partLabel,
    required this.lines,
    this.printBarcode = true,
    this.feedLines = 4,
    this.autoCut = true,
  });

  /// Picks and packs differ in one label and one grouping fallback.
  bool get isPick => template.module == ReceiptTemplate.modulePick;

  /// Column-header form of [doneLabel] — 'PICK' / 'PACK'. The past tense is
  /// right for a total ("Total picked qty") but wrong over a column of
  /// targets, and the short form leaves more room for the description.
  String get shortLabel => isPick ? 'PICK' : 'PACK';

  String get statusLabel => switch ((status ?? '').toUpperCase()) {
        'C' => 'COMPLETED',
        'X' => 'CANCELLED',
        _ => 'OPEN',
      };
}
