import 'package:isar/isar.dart';

part 'pending_plu.g.dart';

/// A barcode linked to an item on the device, not yet accepted by the server.
///
/// Kept in its OWN collection rather than as a flag on [InStockPlu]. That table
/// is a mirror of `In_Stock_Plu` and is wiped wholesale by the inventory
/// refresh (`inStockPlus.clear()`); a pending link living there would vanish
/// on the next full sync with nothing to show for it. This is the device's own
/// unsent work, and it belongs with the other unsent work.
///
/// The row is deleted once the server has accepted it — or once the server
/// confirms the same link already exists, which is the same outcome.
@collection
class PendingPlu {
  Id id = Isar.autoIncrement;

  @Index()
  int companyCode = 0;

  /// The scanned barcode. Unique per company on the server
  /// (`PK (Company_Code, Plu_No)`), which is what makes a conflict on upload
  /// worth failing loudly over.
  @Index(composite: [CompositeIndex('companyCode')])
  String pluNo = '';

  int skuNo = 0;
  String uom = '';

  int? addedBy;
  DateTime? addedDate;

  /// The pick that was open when this was scanned. Only for the error message
  /// — it tells whoever has to fix a conflict where the barcode came from.
  String? sourceDoc;

  PendingPlu();

  PendingPlu.of({
    required this.companyCode,
    required this.pluNo,
    required this.skuNo,
    required this.uom,
    this.addedBy,
    this.sourceDoc,
  }) : addedDate = DateTime.now();
}
