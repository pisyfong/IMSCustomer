import 'package:isar/isar.dart';

import '../main.dart';
import '../models/app_location.dart';
import 'auth_service.dart';
import 'location_service.dart';

/// Who this document is FROM, for anything the app prints.
///
/// Resolved from the database — `PI_Company` for the trading name and
/// `PI_Company_Location` for the site's address and contact details — never
/// from the build.
///
/// It used to be hardcoded in each PDF builder. That shipped one customer's
/// letterhead ("LOT 1422 EASTWOOD VALLEY … fungseng22@gmail.com") to every
/// site the app was deployed to, on every quotation and checkout slip. Nothing
/// failed, which is why it survived: the only symptom is a customer's customer
/// reading someone else's address.
///
/// Every field degrades to nothing. A site with no address filled in prints
/// its name and stops — blank is honest, whereas a placeholder or a leftover
/// from another deployment is not.
class CompanyLetterhead {
  final String companyName;
  final String registrationNo;
  final List<String> addressLines;

  const CompanyLetterhead({
    required this.companyName,
    this.registrationNo = '',
    this.addressLines = const [],
  });

  bool get isEmpty => companyName.isEmpty && addressLines.isEmpty;

  /// For the location currently being worked in.
  ///
  /// Falls back to the user's default location, then to any location for the
  /// company — a document should still carry the trading name even if the
  /// site can't be resolved.
  static Future<CompanyLetterhead> current() async {
    final company = await AuthService().getSelectedCompany();
    final name = (company?['companyName'] ?? '').toString().trim();
    final code = company?['companyCode'];
    final companyCode =
        code is int ? code : int.tryParse(code?.toString() ?? '');

    AppLocation? loc;
    try {
      final selected = (await LocationService().selectedCode() ?? '').trim();
      final all = companyCode == null
          ? await isar.appLocations.where().findAll()
          : await isar.appLocations
              .filter()
              .companyCodeEqualTo(companyCode)
              .findAll();
      if (all.isNotEmpty) {
        loc = all.firstWhere(
          (l) => l.locationCode.trim() == selected && selected.isNotEmpty,
          orElse: () => all.firstWhere((l) => l.isDefault, orElse: () => all.first),
        );
      }
    } catch (_) {
      // A printed document is worth producing even if the location lookup
      // fails; the trading name alone still identifies the sender.
    }

    return CompanyLetterhead(
      companyName: name.isNotEmpty ? name : (loc?.name ?? '').trim(),
      registrationNo: (loc?.registrationNo ?? '').trim(),
      addressLines: loc?.letterheadLines ?? const [],
    );
  }
}
