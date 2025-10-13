import 'package:isar/isar.dart';

part 'credit_term.g.dart';

@collection
class CreditTerm {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;
  
  @Index()
  late String term;

  String? description;
  int? days;
  String? type;
  String? description2;
  int? ordering;
  int? ordering2;
  String? salesLedgerAccount;
  String? purchaseLedgerAccount;
  int? dayOfMonth;

  // Convert from server response
  static CreditTerm fromJson(Map<String, dynamic> json) {
    return CreditTerm()
      ..companyCode = _parseInt(json['Company_Code']) ?? 0
      ..term = (json['term'] ?? '').toString().trim()
      ..description = json['description']
      ..days = _parseInt(json['days'])
      ..type = json['Type']
      ..description2 = json['Description2']
      ..ordering = _parseInt(json['Ordering'])
      ..ordering2 = _parseInt(json['Ordering2'])
      ..salesLedgerAccount = json['Sales_Ledger_Account']
      ..purchaseLedgerAccount = json['Purchase_Ledger_Account']
      ..dayOfMonth = _parseInt(json['DayOfMonth']);
  }

  // Helper methods for parsing
  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }

  // Convert to JSON for server communication
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'term': term,
      'description': description,
      'days': days,
      'Type': type,
      'Description2': description2,
      'Ordering': ordering,
      'Ordering2': ordering2,
      'Sales_Ledger_Account': salesLedgerAccount,
      'Purchase_Ledger_Account': purchaseLedgerAccount,
      'DayOfMonth': dayOfMonth,
    };
  }

  // Display helpers
  String get displayTerm => term;
  String get displayDescription => description ?? description2 ?? term;
  String get displayDays => days != null ? '$days days' : '';
  String get displayFull => '$displayTerm - $displayDescription${days != null ? " ($days days)" : ""}';
  
  // Override equality to compare by companyCode and term
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditTerm &&
          runtimeType == other.runtimeType &&
          companyCode == other.companyCode &&
          term == other.term;

  @override
  int get hashCode => companyCode.hashCode ^ term.hashCode;
}
