import 'package:isar/isar.dart';

part 'app_location.g.dart';

/// A location the signed-in user is allowed to work in.
///
/// Sourced from PI_Company_Location joined to PI_User_Company_Access_Location
/// (the join IS the access check). Cached locally so the picker — and the
/// location scoping that depends on it — keep working offline.
@collection
class AppLocation {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('locationCode')], unique: true, replace: true)
  late int companyCode;

  late String locationCode;

  String? name;
  String? city;
  String? state;

  // ── Letterhead, for printed documents ───────────────────────────────────
  //
  // From PI_Company_Location. Kept here rather than in the app's config
  // because it differs per customer AND per site — a build with these baked
  // in printed one company's address on another company's quotations.
  //
  // Any of these may be blank; the letterhead prints only what exists rather
  // than leaving gaps or inventing values.
  String? registrationNo;
  String? address1;
  String? address2;
  String? address3;
  String? postcode;
  String? phone;
  String? fax;
  String? email;

  /// The user's default location (PI_User_Company_Access_Location.Def_Location).
  bool isDefault = false;

  DateTime? lastUpdated;

  /// What the picker shows.
  String get displayName {
    final n = (name ?? '').trim();
    return n.isEmpty ? locationCode : '$locationCode · $n';
  }

  /// The address block for a printed document, one entry per line.
  ///
  /// Only non-empty parts appear, so a site with nothing filled in prints
  /// nothing rather than blank lines or placeholder text. `TEL/FAX:` collapses
  /// to whichever of the two exists.
  List<String> get letterheadLines {
    String c(String? v) => (v ?? '').trim();
    final out = <String>[];

    for (final a in [c(address1), c(address2), c(address3)]) {
      if (a.isNotEmpty) out.add(a);
    }

    // "96000 MIRI SARAWAK" — postcode, city and state read as one line.
    final cityLine =
        [c(postcode), c(city), c(state)].where((e) => e.isNotEmpty).join(' ');
    if (cityLine.isNotEmpty) out.add(cityLine);

    final tel = c(phone);
    final fx = c(fax);
    if (tel.isNotEmpty && fx.isNotEmpty) {
      out.add(tel == fx ? 'TEL/FAX: $tel' : 'TEL: $tel   FAX: $fx');
    } else if (tel.isNotEmpty) {
      out.add('TEL: $tel');
    } else if (fx.isNotEmpty) {
      out.add('FAX: $fx');
    }

    if (c(email).isNotEmpty) out.add('Email: ${c(email)}');
    return out;
  }

  AppLocation();

  factory AppLocation.fromJson(Map<String, dynamic> j) {
    int _i(dynamic v) {
      if (v == null) return 0;
      if (v is num) return v.toInt();
      return int.tryParse(v.toString()) ?? 0;
    }

    return AppLocation()
      ..companyCode = _i(j['Company_Code'] ?? j['companyCode'])
      ..locationCode =
          (j['Location_Code'] ?? j['locationCode'] ?? '').toString().trim()
      ..name = (j['Name'] ?? j['name'])?.toString()
      ..city = (j['City'] ?? j['city'])?.toString()
      ..state = (j['State'] ?? j['state'])?.toString()
      ..registrationNo = (j['Registration_No'] ?? j['registrationNo'])?.toString()
      ..address1 = (j['Address1'] ?? j['address1'])?.toString()
      ..address2 = (j['Address2'] ?? j['address2'])?.toString()
      ..address3 = (j['Address3'] ?? j['address3'])?.toString()
      ..postcode = (j['Postcode'] ?? j['postcode'])?.toString()
      ..phone = (j['Phone'] ?? j['phone'])?.toString()
      ..fax = (j['Fax'] ?? j['fax'])?.toString()
      ..email = (j['Email'] ?? j['email'])?.toString()
      ..isDefault =
          (j['Def_Location'] ?? j['defLocation'] ?? 'N').toString().toUpperCase() ==
              'Y'
      ..lastUpdated = DateTime.now();
  }
}

/// The location the user is currently working in — the counterpart to
/// [SelectedCompany]. Singleton.
@collection
class SelectedLocation {
  static const int singletonId = 1;

  Id id = singletonId;

  late int companyCode;
  late String locationCode;
  String? name;
  DateTime selectedAt = DateTime.now();

  SelectedLocation() {
    companyCode = 0;
    locationCode = '';
  }
}
