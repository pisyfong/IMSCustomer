import 'package:isar/isar.dart';

part 'pack_list.g.dart';

/// Mirror of MP_Pack_List.
@Collection()
class PackList {
  Id id = Isar.autoIncrement;

  @Index()
  int? companyCode;

  @Index()
  String? packPreLabel;

  String? locationCode;
  String? remark;
  String? status;
  double? totalPackQty;
  int? totalPackItem;
  int? lastModifiedBy;
  DateTime? lastWriteTimeStamp;
  int? addedBy;
  DateTime? addedDate;
  int? cancelledBy;
  DateTime? cancelledDate;

  /// PI_Users.User_ID this pack is assigned to. Defaults to its creator.
  int? assignedTo;

  bool isSynced = true;

  /// Idempotency token for the delta-based upload (see PackService). A fresh
  /// token is minted on each Save; the server dedupes a retry carrying the same
  /// token so a lost response can't double-apply the pack deltas.
  String? uploadToken;

  PackList();

  factory PackList.fromJson(Map<String, dynamic> j) {
    DateTime? _dt(dynamic v) => v == null ? null : DateTime.tryParse(v.toString());
    double? _d(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toDouble();
      return double.tryParse(v.toString());
    }
    int? _i(dynamic v) {
      if (v == null) return null;
      if (v is num) return v.toInt();
      return int.tryParse(v.toString());
    }

    return PackList()
      ..companyCode = _i(j['Company_Code'])
      ..packPreLabel = j['Pack_PreLabel']?.toString()
      // Trimmed: Location_Code is char(3) on the server, so a 2-character
      // code arrives blank-padded ('AA ') and stops matching the trimmed
      // value the location picker stores.
      ..locationCode = j['Location_Code']?.toString().trim()
      ..remark = j['Remark']?.toString()
      ..status = j['Status']?.toString()
      ..totalPackQty = _d(j['Total_Pack_Qty'])
      ..totalPackItem = _i(j['Total_Pack_Item'])
      ..lastModifiedBy = _i(j['Last_Modified_By'])
      ..lastWriteTimeStamp = _dt(j['LastWriteTimeStamp'])
      ..addedBy = _i(j['Added_By'])
      ..addedDate = _dt(j['Added_Date'])
      ..cancelledBy = _i(j['Cancelled_By'])
      ..cancelledDate = _dt(j['Cancelled_Date'])
      ..assignedTo = _i(j['Assigned_To']);
  }

  Map<String, dynamic> toJson() => {
        'Company_Code': companyCode,
        'Pack_PreLabel': packPreLabel,
        'Location_Code': locationCode,
        'Remark': remark,
        'Status': status,
        'Total_Pack_Qty': totalPackQty,
        'Total_Pack_Item': totalPackItem,
        'Last_Modified_By': lastModifiedBy,
        'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
        'Added_By': addedBy,
        'Added_Date': addedDate?.toIso8601String(),
        'Cancelled_By': cancelledBy,
        'Cancelled_Date': cancelledDate?.toIso8601String(),
        'Assigned_To': assignedTo,
      };
}
