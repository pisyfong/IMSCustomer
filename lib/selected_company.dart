import 'package:isar/isar.dart';

part 'selected_company.g.dart';

@collection
class SelectedCompany {
  static const int singletonId = 1;

  Id id = singletonId; // Singleton ID to ensure only one record exists

  late String companyId;
  late String companyName;
  late String companyCode;
  late DateTime selectedAt;

  // Default constructor required by Isar
  SelectedCompany() {
    companyId = '';
    companyName = '';
    companyCode = '';
    selectedAt = DateTime.now();
  }

  // Factory constructor to create from Company object
  factory SelectedCompany.fromCompany(Map<String, dynamic> company) {
    final selectedCompany = SelectedCompany();
    selectedCompany.companyId = company['companyId'] ?? '';
    selectedCompany.companyName = company['companyName'] ?? '';
    selectedCompany.companyCode = company['companyCode'] ?? '';
    selectedCompany.selectedAt = DateTime.now();
    return selectedCompany;
  }
}
