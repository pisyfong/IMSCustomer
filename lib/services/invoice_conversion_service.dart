import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

import '../config/app_config.dart';
import '../main.dart';
import '../models/pick_list.dart';
import '../models/pick_list_item.dart';
import '../models/quote.dart';
import '../models/quote_item.dart';

/// One pick line's split across the four SI quantity buckets.
///
/// The pick records a single `Pick_Qty` (in the line's UOM), but an invoice
/// line carries Quantity / Quantity_Loose / Foc / Foc_Loose — and only the
/// operator knows how a partial pick divides between charged, loose and free
/// goods. The invariant the server enforces, mirrored here for live
/// validation, is in BASE units:
///
///   (qty + foc) × factor + qtyLoose + focLoose  ==  pickedQty × factor
///
/// FOC changes money, not stock — a wrong split silently over- or
/// under-charges the customer, which is why nothing is submitted until every
/// line balances exactly.
class InvoiceAllocation {
  final String sq; // '' = the no-SQ bucket
  final int skuNo;
  final String uom;
  final double factor;
  final double pickedQty; // in UOM units (packs)

  /// Base units picked on this line's LOOSE sibling (the split pick line the
  /// add-sheet creates for an SQ line's loose demand). Counted in the picked
  /// total and pre-filled into [qtyLoose].
  final double pickedLooseBase;

  double qty;
  double qtyLoose;
  double foc;
  double focLoose;

  /// True when the numbers were copied straight from the SQ line (full pick).
  final bool prefilledFromQuote;

  InvoiceAllocation({
    required this.sq,
    required this.skuNo,
    required this.uom,
    required this.factor,
    required this.pickedQty,
    this.pickedLooseBase = 0,
    required this.qty,
    this.qtyLoose = 0,
    this.foc = 0,
    this.focLoose = 0,
    this.prefilledFromQuote = false,
  });

  double get pickedBase => pickedQty * factor + pickedLooseBase;
  double get allocatedBase => (qty + foc) * factor + qtyLoose + focLoose;
  double get remainingBase => pickedBase - allocatedBase;
  bool get balanced => remainingBase.abs() < 0.01;

  Map<String, dynamic> toJson() => {
        'sq': sq,
        'sku': skuNo,
        'uom': uom,
        'qty': qty,
        'qtyLoose': qtyLoose,
        'foc': foc,
        'focLoose': focLoose,
      };
}

/// Builds allocation prefills and drives POST /api/pick-invoices.
class InvoiceConversionService {
  /// One allocation per picked line, grouped later by [InvoiceAllocation.sq].
  ///
  /// Prefill rule: when the picked amount equals the SQ line's TOTAL demand
  /// (in base units), the quote's own four-bucket split is copied — a full
  /// pick needs no operator input at all. Anything else defaults to
  /// fully-charged whole packs, which the operator then adjusts.
  Future<List<InvoiceAllocation>> buildAllocations(PickList pick) async {
    final cc = pick.companyCode;
    final label = pick.pickPreLabel;
    if (cc == null || label == null || label.isEmpty) return const [];

    final rows = await isar.pickListItems
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .pickPreLabelEqualTo(label)
        .findAll();

    // Quote lines for the SQs involved, for prefill.
    final sqs = rows
        .map((r) => (r.parentPreLabel ?? '').trim())
        .where((s) => s.isNotEmpty)
        .toSet()
        .toList();
    final quoteLines = <String, QuoteItem>{};
    if (sqs.isNotEmpty) {
      final qItems = await isar.quoteItems
          .filter()
          .companyCodeEqualTo(cc)
          .and()
          .anyOf(sqs, (q, s) => q.quotePreLabelEqualTo(s))
          .findAll();
      for (final it in qItems) {
        final k = '${(it.quotePreLabel ?? '').trim()}|${it.skuNo}|'
            '${(it.uom ?? '').trim().toUpperCase()}';
        quoteLines.putIfAbsent(k, () => it);
      }
    }

    // Partition: LOOSE-marked lines (the base-unit half of a split SQ line)
    // fold into their pack sibling — the invoice carries ONE row per SQ line,
    // pack qty + Quantity_Loose, exactly as legacy writes it.
    final packRows = <PickListItem>[];
    final looseBase = <String, double>{}; // 'sq|sku' -> picked base units
    for (final r in rows) {
      final picked = r.pickQty ?? 0;
      if (picked <= 0) continue; // unpicked lines are not invoiced
      if ((r.status ?? 'A') == 'X') continue;
      if (r.skuNo == null) continue;
      if ((r.remark ?? '').trim().toUpperCase() == 'LOOSE') {
        final k = '${(r.parentPreLabel ?? '').trim()}|${r.skuNo}';
        final f = (r.factor ?? 1) <= 0 ? 1.0 : (r.factor ?? 1);
        looseBase[k] = (looseBase[k] ?? 0) + picked * f;
      } else {
        packRows.add(r);
      }
    }

    final out = <InvoiceAllocation>[];
    for (final r in packRows) {
      final picked = r.pickQty ?? 0;
      final sku = r.skuNo!;
      final sq = (r.parentPreLabel ?? '').trim();
      final uom = (r.uom ?? '').trim();
      final factor = (r.factor ?? 1) <= 0 ? 1.0 : (r.factor ?? 1);
      final loose = looseBase.remove('$sq|$sku') ?? 0;

      final q = quoteLines['$sq|$sku|${uom.toUpperCase()}'];
      if (q != null) {
        final qQty = q.quoteQuantity ?? 0;
        final qLoose = q.quoteQuantityLoose ?? 0;
        final qFoc = q.quoteFoc ?? 0;
        final qFocLoose = q.quoteFocLoose ?? 0;
        final quoteBase = (qQty + qFoc) * factor + qLoose + qFocLoose;
        if ((picked * factor + loose - quoteBase).abs() < 0.01 &&
            quoteBase > 0) {
          out.add(InvoiceAllocation(
            sq: sq, skuNo: sku, uom: uom, factor: factor,
            pickedQty: picked, pickedLooseBase: loose,
            qty: qQty, qtyLoose: qLoose, foc: qFoc, focLoose: qFocLoose,
            prefilledFromQuote: true,
          ));
          continue;
        }
      }
      out.add(InvoiceAllocation(
        sq: sq, skuNo: sku, uom: uom, factor: factor,
        pickedQty: picked, pickedLooseBase: loose,
        qty: picked, qtyLoose: loose,
      ));
    }

    // Loose lines whose pack sibling was never picked stand alone.
    for (final e in looseBase.entries) {
      final parts = e.key.split('|');
      final sq = parts[0];
      final sku = int.parse(parts[1]);
      final src = rows.firstWhere((r) =>
          (r.remark ?? '').trim().toUpperCase() == 'LOOSE' &&
          (r.parentPreLabel ?? '').trim() == sq &&
          r.skuNo == sku);
      out.add(InvoiceAllocation(
        sq: sq, skuNo: sku, uom: (src.uom ?? '').trim(),
        factor: 1, pickedQty: e.value, qty: e.value,
      ));
    }
    return out;
  }

  /// SQ → customer code, from the locally-synced quote headers.
  Future<Map<String, String>> sqCustomers(int cc, List<String> sqs) async {
    if (sqs.isEmpty) return {};
    final quotes = await isar.quotes
        .filter()
        .companyCodeEqualTo(cc)
        .and()
        .anyOf(sqs, (q, s) => q.quotePreLabelEqualTo(s))
        .findAll();
    return {
      for (final q in quotes)
        if ((q.quotePreLabel ?? '').isNotEmpty)
          q.quotePreLabel!.trim(): (q.customer ?? '').trim(),
    };
  }

  static String newToken() {
    final rand = Random();
    final hex = List.generate(12, (_) => rand.nextInt(16).toRadixString(16)).join();
    return 'si-$hex-${DateTime.now().millisecondsSinceEpoch}';
  }

  /// The open invoice batches for a location, newest first.
  ///
  /// Which batch an invoice is filed under is an operator decision, not
  /// something the app can infer: the names carry a date and a product
  /// category ("AA 14072026", "AR 10082026(F&V)") and a location can have
  /// many open at once. Live from the server rather than the local cache —
  /// batches are opened and closed in the back office and a stale list would
  /// file invoices under a batch that closed this morning.
  Future<List<InvoiceBatch>> openBatches({
    required int companyCode,
    required String locationCode,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/invoice-batches'
        '?companyCode=$companyCode&locationCode=${Uri.encodeComponent(locationCode)}');
    final res =
        await http.get(uri, headers: AppConfig.apiHeaders).timeout(const Duration(seconds: 20));
    final decoded = jsonDecode(res.body);
    if (res.statusCode != 200 || decoded is! Map<String, dynamic>) {
      throw Exception('Could not load invoice batches: ${res.body}');
    }
    return [
      for (final b in (decoded['batches'] as List? ?? []))
        InvoiceBatch.fromJson(b as Map<String, dynamic>),
    ];
  }

  /// dryRun: full plan (grouping, pricing, batch) with nothing written.
  Future<Map<String, dynamic>> convert({
    required PickList pick,
    required List<InvoiceAllocation> allocations,
    required int userId,
    String? noSqCustomer,
    required String uploadToken,
    required bool dryRun,
    int? batchNo,
  }) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/api/pick-invoices');
    final body = jsonEncode({
      'companyCode': pick.companyCode,
      'pickPreLabel': pick.pickPreLabel,
      'userId': userId,
      'dryRun': dryRun,
      'uploadToken': uploadToken,
      if (batchNo != null) 'batchNo': batchNo,
      if (noSqCustomer != null && noSqCustomer.isNotEmpty)
        'noSqCustomer': noSqCustomer,
      'allocations': allocations.map((a) => a.toJson()).toList(),
    });

    final res = await http
        .post(uri, headers: AppConfig.apiHeaders, body: body)
        .timeout(Duration(seconds: dryRun ? 30 : 90));

    final decoded = jsonDecode(res.body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('Unexpected response: ${res.body}');
    }
    if (res.statusCode != 200) {
      // The server's refusals are informative (allocation mismatch, missing
      // price, no open batch, already converted) — surface them verbatim.
      throw InvoiceConversionException(
        decoded['error']?.toString() ?? 'HTTP ${res.statusCode}',
        details: decoded,
      );
    }
    return decoded;
  }
}

class InvoiceConversionException implements Exception {
  final String message;
  final Map<String, dynamic> details;
  InvoiceConversionException(this.message, {this.details = const {}});
  @override
  String toString() => message;
}

/// An open MP_Invoice_Batch the operator can file invoices into.
class InvoiceBatch {
  final int batchNo;
  final String name;
  final DateTime? addedDate;

  InvoiceBatch({required this.batchNo, required this.name, this.addedDate});

  factory InvoiceBatch.fromJson(Map<String, dynamic> j) => InvoiceBatch(
        batchNo: (j['Batch_No'] as num?)?.toInt() ?? 0,
        name: (j['Batch_Name'] ?? '').toString().trim(),
        addedDate: j['Added_Date'] == null
            ? null
            : DateTime.tryParse(j['Added_Date'].toString()),
      );

  /// What the operator reads. The name already carries the date and category,
  /// so the number is a tiebreaker rather than the headline.
  String get label => name.isEmpty ? 'Batch $batchNo' : name;
}
