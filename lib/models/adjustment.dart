import 'package:isar/isar.dart';

part 'adjustment.g.dart';

/// A stock adjustment composed on the device — a credit note (CN) and its
/// siblings (CRT sales return, DN debit note, and so on).
///
/// Mirrors `AD_Adjustment`, but only the columns the handheld actually decides.
/// The rest — document date, totals recomputed server-side, the running number
/// — are the server's to set at upload, because they cannot be decided
/// correctly offline.
///
/// ## The document number
///
/// [preLabel] holds a PROVISIONAL number until the document is uploaded, at
/// which point the server allocates the real one the same way the legacy
/// desktop app does (read `AD_Code_Location.Running_No`, collision-check,
/// increment) and [preLabel] is overwritten with it.
///
/// This is deliberately different from how quotations behave. The quotation
/// flow keeps whatever number the device generated, which is why 43 rows in
/// `MP_Quote` carry device prefixes (`FS13/SQ/…`, `PI99/SQ/…`) alongside 4,816
/// properly numbered `FST/SQ/…` ones — permanently outside legacy's numbering.
/// An adjustment moves stock and money, so it has to sit in the same sequence
/// the desktop app maintains.
@collection
class Adjustment {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  /// Provisional while [isSynced] is false; the server's real number after.
  /// See [isProvisional].
  @Index()
  late String preLabel;

  /// `AD_Code_Location.Adjustment` — 'CN', 'CRT', 'DN'…
  late String adjustment;

  /// Human label for the code, cached so the list reads properly offline.
  String? adjustmentDescription;

  /// Stock direction derived from the code's `Type`: 1 in, -1 out, 0 none.
  /// Cached at creation so the device can show the effect without the server.
  int sign = 0;

  /// The customer (or vendor) code — `AD_Adjustment.Code`.
  String? partyCode;
  String? partyName;

  /// 'Y' for a customer document, 'N' for a vendor one.
  String isCustomer = 'Y';

  late String locationCode;

  /// `AD_Batch.Batch_No` — the accounting period. Mandatory, and re-checked at
  /// upload: a period can close while the document sits on the device.
  int? batchNo;
  String? batchName;

  String? reference;
  String? remark;
  int? representativeId;

  /// Credit term code and its days, used server-side for `Due_Date`.
  String? term;
  int? termDays;

  /// When the operator created it. NOT the document date — the server stamps
  /// that from its own clock, because a handheld's date can be wrong and the
  /// document date selects the accounting period.
  DateTime createdAt = DateTime.now();

  int? addedBy;

  @Index()
  bool isSynced = false;

  DateTime? syncedAt;
  String? syncError;

  /// Whether [preLabel] is still the device's placeholder.
  ///
  /// Kept as a marker on the string rather than a separate flag so it cannot
  /// disagree with the number actually shown to the operator.
  @ignore
  bool get isProvisional => preLabel.contains(provisionalMarker);

  /// The marker that makes a provisional number unmistakable on screen.
  static const String provisionalMarker = '/~';
}
