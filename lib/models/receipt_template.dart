import 'package:isar/isar.dart';

part 'receipt_template.g.dart';

/// How a receipt sections its lines.
enum ReceiptGrouping {
  /// One flat list, in the order the operator sees on screen.
  none,

  /// One section per customer — several SQs for the same customer merge.
  customer,

  /// One section per source sales quotation.
  sq,

  /// One section per upstream document (a pack's source pick). Falls back to
  /// [sq] on a pick, which has no upstream document of its own.
  sourceDoc,
}

extension ReceiptGroupingLabel on ReceiptGrouping {
  String get label => switch (this) {
        ReceiptGrouping.none => 'No grouping',
        ReceiptGrouping.customer => 'Customer',
        ReceiptGrouping.sq => 'SQ',
        ReceiptGrouping.sourceDoc => 'Source pick',
      };
}

/// A named receipt layout the operator can choose at print time.
///
/// Device-local (like [PrinterSettings]): the paperwork a branch prints is a
/// property of that branch's bench, and there's no server table for it yet.
/// The shape is deliberately flat and self-contained so a future server-side
/// definition can overwrite a row wholesale without migrating anything.
@collection
class ReceiptTemplate {
  Id id = Isar.autoIncrement;

  /// Which module may use this template — [modulePick] or [modulePack].
  @Index()
  late String module;

  static const String modulePick = 'PICK';
  static const String modulePack = 'PACK';

  /// What the operator picks from, e.g. "By customer".
  late String name;

  /// Masthead title, e.g. "PICKING LIST" or "DELIVERY NOTE".
  String title = '';

  @Enumerated(EnumType.name)
  ReceiptGrouping grouping = ReceiptGrouping.sq;

  // ─── Company header block ───────────────────────────────────────────────

  bool showCompanyName = true;

  /// Free-text lines printed under the company name — address, telephone,
  /// SSM number. Centred, wrapped to the paper width.
  List<String> headerLines = [];

  // ─── Which fields print ─────────────────────────────────────────────────

  bool showDate = true;
  bool showLocation = true;
  bool showAssignee = true;
  bool showStatus = true;
  bool showPrintedAt = true;

  /// The "** NOT YET UPLOADED **" warning on a document the server hasn't seen.
  bool showUnsyncedWarning = true;

  bool showPlu = true;
  bool showUom = true;

  /// The upstream document reference on each line (a pack line's source pick).
  bool showSource = true;

  /// Per-line "SHORT n" callout when picked/packed is under the planned qty.
  bool showShortQty = true;

  bool showTotals = true;

  /// CODE128 of the document number at the foot.
  bool showBarcode = true;

  // ─── Footer ─────────────────────────────────────────────────────────────

  /// Free-text terms / remark printed above the signatures.
  String footerNote = '';

  /// Signature lines, e.g. ["Picked by", "Checked by"]. Empty prints none.
  List<String> signatures = [];

  /// The template pre-selected when printing from this module.
  bool isDefault = false;

  /// Ordering in the picker.
  int sortOrder = 0;

  ReceiptTemplate();

  /// A deep copy — the editor works on one of these so Cancel really cancels.
  ReceiptTemplate copy() => ReceiptTemplate()
    ..id = id
    ..module = module
    ..name = name
    ..title = title
    ..grouping = grouping
    ..showCompanyName = showCompanyName
    ..headerLines = List<String>.from(headerLines)
    ..showDate = showDate
    ..showLocation = showLocation
    ..showAssignee = showAssignee
    ..showStatus = showStatus
    ..showPrintedAt = showPrintedAt
    ..showUnsyncedWarning = showUnsyncedWarning
    ..showPlu = showPlu
    ..showUom = showUom
    ..showSource = showSource
    ..showShortQty = showShortQty
    ..showTotals = showTotals
    ..showBarcode = showBarcode
    ..footerNote = footerNote
    ..signatures = List<String>.from(signatures)
    ..isDefault = isDefault
    ..sortOrder = sortOrder;
}
