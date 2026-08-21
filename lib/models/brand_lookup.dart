import 'package:isar/isar.dart';

part 'brand_lookup.g.dart';

/// Brand code → name, cached for offline use.
///
/// Unlike [GroupLookup] and [DepartmentLookup] this carries no taxonomyMode:
/// brand names exist only in PI_Brand. Web_Brand has Company_Code/Brand/Grp
/// and no Description, so there is nothing web-side to keep separate — one
/// cache serves both modes.
@collection
class BrandLookup {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('brandCode')])
  late int companyCode;

  /// Trimmed. PI_Brand.Code is char() and arrives blank-padded, and an
  /// untrimmed key would never match the brand held on an item.
  late String brandCode;

  late String description;

  DateTime? lastUpdated;

  BrandLookup();

  factory BrandLookup.fromJson(Map<String, dynamic> json, int companyCode) {
    return BrandLookup()
      ..companyCode = companyCode
      ..brandCode =
          (json['code'] ?? json['Code'] ?? json['brand'] ?? json['Brand'] ?? '')
              .toString()
              .trim()
      ..description =
          (json['description'] ?? json['Description'] ?? '').toString().trim()
      ..lastUpdated = DateTime.now();
  }
}
