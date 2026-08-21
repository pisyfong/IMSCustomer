import 'package:isar/isar.dart';

part 'pack_list_item.g.dart';

/// Mirror of MP_Pack_List_Item.
@Collection()
class PackListItem {
  Id id = Isar.autoIncrement;

  @Index()
  int? companyCode;

  @Index()
  String? packPreLabel;

  int? sequenceNo;
  int? skuNo;
  String? uom;

  @Index()
  String? parentPreLabel; // source Pick_PreLabel

  /// The source SQ this line was picked from. Part of the line identity so the
  /// same SKU picked from two SQs stays as two distinct pack lines.
  String? sourceSq;

  /// The sales invoice this line was raised from, when the pack was built
  /// straight off an SI instead of off a pick.
  ///
  /// Independent of [parentPreLabel]: an invoice created in the legacy system
  /// has no pick behind it, so those lines carry a null parent. Part of the
  /// line identity for the same reason [sourceSq] is — the same SKU and UOM
  /// packed for two different invoices are two lines, not one.
  @Index()
  String? sourceSi;

  String? locationCode;
  String? remark;
  String? status;
  double? factor;

  /// Target quantity for this line = the qty picked on the parent pick for this
  /// (sku, uom). Pack_Qty accumulates toward this; the line is "packed" when
  /// packQty >= qty. (Mirrors MP_Pick_List_Item.Qty.)
  double? qty;

  double? packQty;

  /// The `packQty` value at the last successful download/upload. Delta-based
  /// upload sends `packQty - baselinePackQty` so multiple packers accumulate.
  double? baselinePackQty;

  int? lastModifiedBy;
  DateTime? lastWriteTimeStamp;
  int? addedBy;
  DateTime? addedDate;
  int? cancelledBy;
  DateTime? cancelledDate;

  bool isSynced = true;

  /// How much this device has packed since its last sync (the delta to add).
  double get packQtyDelta => (packQty ?? 0) - (baselinePackQty ?? 0);

  PackListItem();

  factory PackListItem.fromJson(Map<String, dynamic> j) {
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

    return PackListItem()
      ..companyCode = _i(j['Company_Code'])
      ..packPreLabel = j['Pack_PreLabel']?.toString()
      ..sequenceNo = _i(j['Sequence_No'])
      ..skuNo = _i(j['Sku_No'])
      ..uom = j['Uom']?.toString()
      ..parentPreLabel = j['Parent_PreLabel']?.toString()
      ..sourceSq = j['Source_SQ']?.toString()
      ..sourceSi = j['Source_SI']?.toString()
      // Trimmed: Location_Code is char(3) on the server, so a 2-character
      // code arrives blank-padded ('AA ') and stops matching the trimmed
      // value the location picker stores.
      ..locationCode = j['Location_Code']?.toString().trim()
      ..remark = j['Remark']?.toString()
      ..status = j['Status']?.toString()
      ..factor = _d(j['Factor'])
      ..qty = _d(j['Qty'])
      ..packQty = _d(j['Pack_Qty'])
      ..lastModifiedBy = _i(j['Last_Modified_By'])
      ..lastWriteTimeStamp = _dt(j['LastWriteTimeStamp'])
      ..addedBy = _i(j['Added_By'])
      ..addedDate = _dt(j['Added_Date'])
      ..cancelledBy = _i(j['Cancelled_By'])
      ..cancelledDate = _dt(j['Cancelled_Date']);
  }

  Map<String, dynamic> toJson() => {
        'Company_Code': companyCode,
        'Pack_PreLabel': packPreLabel,
        'Sequence_No': sequenceNo,
        'Sku_No': skuNo,
        'Uom': uom,
        'Parent_PreLabel': parentPreLabel,
        'Source_SQ': sourceSq,
        'Source_SI': sourceSi,
        'Location_Code': locationCode,
        'Remark': remark,
        'Status': status,
        'Factor': factor,
        'Qty': qty,
        'Pack_Qty': packQty,
        'Pack_Qty_Delta': packQtyDelta,
        'Last_Modified_By': lastModifiedBy,
        'LastWriteTimeStamp': lastWriteTimeStamp?.toIso8601String(),
        'Added_By': addedBy,
        'Added_Date': addedDate?.toIso8601String(),
        'Cancelled_By': cancelledBy,
        'Cancelled_Date': cancelledDate?.toIso8601String(),
      };
}
