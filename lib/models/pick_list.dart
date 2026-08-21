import 'package:isar/isar.dart';

part 'pick_list.g.dart';

/// Mirror of MP_Pick_List. Header for a picking task.
@Collection()
class PickList {
  Id id = Isar.autoIncrement;

  @Index()
  int? companyCode;

  @Index()
  String? pickPreLabel;

  String? locationCode;
  String? remark;
  int? batchCount;
  DateTime? pickDate;
  String? status;
  double? totalPickQty;
  int? totalPickItem;
  int? lastModifiedBy;
  DateTime? lastWriteTimeStamp;
  int? addedBy;
  DateTime? addedDate;
  int? cancelledBy;
  DateTime? cancelledDate;

  /// PI_Users.User_ID this pick is assigned to. Defaults to its creator.
  int? assignedTo;

  /// True once we've successfully pushed local edits back to the server.
  /// Server-sourced rows are always considered synced.
  bool isSynced = true;

  /// Idempotency token for the delta-based upload. A fresh token is minted on
  /// each Save; the server dedupes a retry that carries the same token so a
  /// lost response can't double-apply the pick deltas.
  String? uploadToken;

  PickList();

  factory PickList.fromJson(Map<String, dynamic> j) {
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

    return PickList()
      ..companyCode = _i(j['Company_Code'])
      ..pickPreLabel = j['Pick_PreLabel']?.toString()
      // Trimmed: Location_Code is char(3) on the server, so a 2-character
      // code arrives blank-padded ('AA ') and stops matching the trimmed
      // value the location picker stores.
      ..locationCode = j['Location_Code']?.toString().trim()
      ..remark = j['Remark']?.toString()
      ..batchCount = _i(j['Batch_Count'])
      ..pickDate = _dt(j['Pick_Date'])
      ..status = j['Status']?.toString()
      ..totalPickQty = _d(j['Total_Pick_Qty'])
      ..totalPickItem = _i(j['Total_Pick_Item'])
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
        'Pick_PreLabel': pickPreLabel,
        'Location_Code': locationCode,
        'Remark': remark,
        'Batch_Count': batchCount,
        'Pick_Date': pickDate?.toIso8601String(),
        'Status': status,
        'Total_Pick_Qty': totalPickQty,
        'Total_Pick_Item': totalPickItem,
        'Last_Modified_By': lastModifiedBy,
        'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
        'Added_By': addedBy,
        'Added_Date': addedDate?.toIso8601String(),
        'Cancelled_By': cancelledBy,
        'Cancelled_Date': cancelledDate?.toIso8601String(),
        'Assigned_To': assignedTo,
      };
}
