import 'package:isar/isar.dart';

part 'pick_list_item.g.dart';

/// Mirror of MP_Pick_List_Item.
@Collection()
class PickListItem {
  Id id = Isar.autoIncrement;

  @Index()
  int? companyCode;

  @Index()
  String? pickPreLabel;

  int? sequenceNo;
  int? skuNo;
  String? uom;

  @Index()
  String? parentPreLabel;

  String? locationCode;
  String? remark;
  int? batch;
  String? status;
  double? factor;
  double? qty;
  double? pickQty;

  /// The `pickQty` value at the last successful download/upload. Delta-based
  /// upload sends `pickQty - baselinePickQty` so multiple pickers accumulate.
  /// Set on download and after a successful upload; untouched by local edits.
  double? baselinePickQty;

  int? lastModifiedBy;
  DateTime? lastWriteTimeStamp;
  int? addedBy;
  DateTime? addedDate;
  int? cancelledBy;
  DateTime? cancelledDate;

  bool isSynced = true;

  /// How much this device has picked since its last sync (the delta to add
  /// on the server). Never negative below what was already contributed.
  double get pickQtyDelta => (pickQty ?? 0) - (baselinePickQty ?? 0);

  PickListItem();

  factory PickListItem.fromJson(Map<String, dynamic> j) {
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

    return PickListItem()
      ..companyCode = _i(j['Company_Code'])
      ..pickPreLabel = j['Pick_PreLabel']?.toString()
      ..sequenceNo = _i(j['Sequence_No'])
      ..skuNo = _i(j['Sku_No'])
      ..uom = j['Uom']?.toString()
      ..parentPreLabel = j['Parent_PreLabel']?.toString()
      // Trimmed: Location_Code is char(3) on the server, so a 2-character
      // code arrives blank-padded ('AA ') and stops matching the trimmed
      // value the location picker stores.
      ..locationCode = j['Location_Code']?.toString().trim()
      ..remark = j['Remark']?.toString()
      ..batch = _i(j['Batch'])
      ..status = j['Status']?.toString()
      ..factor = _d(j['Factor'])
      ..qty = _d(j['Qty'])
      ..pickQty = _d(j['Pick_Qty'])
      ..lastModifiedBy = _i(j['Last_Modified_By'])
      ..lastWriteTimeStamp = _dt(j['LastWriteTimeStamp'])
      ..addedBy = _i(j['Added_By'])
      ..addedDate = _dt(j['Added_Date'])
      ..cancelledBy = _i(j['Cancelled_By'])
      ..cancelledDate = _dt(j['Cancelled_Date']);
  }

  Map<String, dynamic> toJson() => {
        'Company_Code': companyCode,
        'Pick_PreLabel': pickPreLabel,
        'Sequence_No': sequenceNo,
        'Sku_No': skuNo,
        'Uom': uom,
        'Parent_PreLabel': parentPreLabel,
        'Location_Code': locationCode,
        'Remark': remark,
        'Batch': batch,
        'Status': status,
        'Factor': factor,
        'Qty': qty,
        'Pick_Qty': pickQty,
        'Pick_Qty_Delta': pickQtyDelta,
        'Last_Modified_By': lastModifiedBy,
        'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
        'Added_By': addedBy,
        'Added_Date': addedDate?.toIso8601String(),
        'Cancelled_By': cancelledBy,
        'Cancelled_Date': cancelledDate?.toIso8601String(),
      };
}
