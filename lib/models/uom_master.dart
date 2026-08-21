import 'package:isar/isar.dart';

part 'uom_master.g.dart';

/// The company's unit-of-measure master (`PI_Uom`), cached.
///
/// Cached because the barcode-linking flow needs it on the warehouse floor,
/// where there may be no signal. Without it, the "units this item doesn't have
/// yet" half of that screen simply doesn't appear offline — and that is the
/// case it exists for: a new case code usually arrives BECAUSE the item just
/// gained a pack size nobody had recorded.
///
/// Tiny (22 rows on this customer) and almost static, so it is replaced
/// wholesale rather than tracked with a watermark.
@collection
class UomMaster {
  Id id = Isar.autoIncrement;

  @Index()
  int companyCode = 0;

  @Index(composite: [CompositeIndex('companyCode')])
  String uom = '';

  String? description;

  UomMaster();

  UomMaster.of({
    required this.companyCode,
    required this.uom,
    this.description,
  });
}

/// A unit added to an item on the device, not yet accepted by the server.
///
/// Its own collection, like [PendingPlu] — `In_Stock_Uom` is a mirror that a
/// full inventory refresh replaces, so a pending row living there would vanish
/// with nothing to show for it.
///
/// Uploaded BEFORE the pending barcodes, because a barcode can reference a
/// unit created in the same trip: linking `BOX` to an item that only gained
/// `BOX` a minute earlier fails if the unit isn't there first.
@collection
class PendingSkuUom {
  Id id = Isar.autoIncrement;

  @Index()
  int companyCode = 0;

  @Index()
  int skuNo = 0;

  String uom = '';

  /// How many base units are in one of these. The reason this can't be
  /// defaulted or guessed: it restates the quantity of every document that
  /// ever uses the unit.
  double factor = 0;

  int? addedBy;
  DateTime? addedDate;

  /// The document being worked when it was added — for the error message if
  /// the server turns out to hold a different factor.
  String? sourceDoc;

  PendingSkuUom();

  PendingSkuUom.of({
    required this.companyCode,
    required this.skuNo,
    required this.uom,
    required this.factor,
    this.addedBy,
    this.sourceDoc,
  }) : addedDate = DateTime.now();
}
