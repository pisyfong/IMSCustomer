import 'package:isar/isar.dart';

part 'adjustment_lookup.g.dart';

/// An adjustment code as `AD_Code_Location` defines it, cached for offline use.
///
/// Codes are per COMPANY AND LOCATION — that is why 'CN' is absent from
/// `AD_Code` yet drives 495 documents. Both are part of the identity, so the
/// cache is keyed on the pair.
@collection
class AdjustmentCodeRow {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  @Index()
  late String locationCode;

  late String code;
  String? description;

  /// 1 = stock in, 2 = stock out, 3 = value only.
  int type = 0;

  /// Derived from [type] by the server: 1, -1 or 0.
  int sign = 0;

  /// 'C' customer, 'V' vendor, 'A' either.
  String vendorCustomer = 'A';
  String? defaultRemark;

  /// Stable identity for a row, so a re-sync updates rather than duplicates.
  static String keyOf(int companyCode, String locationCode, String code) =>
      '$companyCode|${locationCode.trim().toUpperCase()}|${code.trim().toUpperCase()}';

  @Index(unique: true, replace: true)
  String get lookupKey => keyOf(companyCode, locationCode, code);
}

/// An open accounting period from `AD_Batch`.
///
/// Only open batches are cached: a closed one cannot accept a document, and
/// offering it would produce a 409 at upload after the operator had already
/// filled the form in.
@collection
class AdjustmentBatchRow {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  @Index()
  late String locationCode;

  late int batchNo;
  String? batchName;

  static String keyOf(int companyCode, String locationCode, int batchNo) =>
      '$companyCode|${locationCode.trim().toUpperCase()}|$batchNo';

  @Index(unique: true, replace: true)
  String get lookupKey => keyOf(companyCode, locationCode, batchNo);
}
