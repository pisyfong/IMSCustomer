import 'package:isar/isar.dart';

part 'customer.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;

  @Index()
  late int companyCode;

  @Index()
  late String code;

  String? name;
  String? registrationNo;
  String? address1;
  String? address2;
  String? address3;
  String? address4;
  String? city;
  String? state;
  String? country;
  String? postcode;
  String? telNo;
  String? faxNo;
  String? contactName;
  String? contactPhone;
  String? email;
  String? website;
  String? method;
  String? term;
  String? category;
  String? area;
  String? zone;
  String? frequency;
  String? status;
  String? currency;
  double? creditLimit;
  double? balance;
  double? kivBalance;
  String? priceType;
  String? ledgerAccount;
  String? gstLedgerAccount;
  String? distributeLedgerAccount;
  String? contra;
  String? remark;
  int? defaultShipTo;
  int? addedBy;
  DateTime? addedDate;
  int? lastModifiedBy;
  DateTime? lastModifiedDate;
  String? linkImsInvoice;
  String? ref1;
  String? ref2;
  String? bankAccount;
  String? discountLedgerAccount;
  String? otherChargesLedgerAccount;
  String? taxLedgerAccount;
  int? deliveryDays;
  String? reference1;
  String? reference2;
  String? reference3;
  String? reference4;
  String? freeText1;
  String? freeText2;
  String? freeText3;
  String? freeText4;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  DateTime? date4;
  String? project;
  String? location;
  String? customerType;
  double? creditBalance;
  int? payDay;
  DateTime? deliveryTermTime;
  int? cycleVisit;
  int? calculateDueDateBy;
  int? lpsMonthDay;
  int? cpsMonthDay;
  String? ppDiscountByRate;
  double? ppDiscountRate;
  double? ppDiscountAmount;
  int? ppDueBy;
  int? lpsType;
  int? cpsType;
  double? deposit;
  String? name2;
  int? salesman;
  String? autoSiDiscountNote;
  String? selectDiscountCode;
  String? defPaymentType;
  String? webPriceType;
  String? lastSellPrice;
  String? addMarkAmount;
  String? useCustomerBarcode;
  String? labelId;
  String? priceTypeUseMultiQty;
  String? siReportTitle;
  String? masterCode;
  String? gstRegistrationNo;
  DateTime? gstRegistrationDate;
  String? applyGst;
  String? defaultGstCode;
  String? ledgerAccountGstCode;
  String? distributeLedgerAccountGstCode;
  String? gstLedgerAccountGstCode;
  String? discountLedgerAccountGstCode;
  String? otherChargesLedgerAccountGstCode;
  String? taxLedgerAccountGstCode;
  String? excludeGaf;
  String? incTax;
  String? roundingLedgerAccount;
  String? roundingLedgerAccountGstCode;
  String? webPromoField;
  String? sstRegistrationNo;

  Customer();

  // Factory constructor from JSON/Map
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer()
      ..companyCode = json['Company_Code'] ?? 0
      ..code = json['Code'] ?? ''
      ..name = json['Name']
      ..registrationNo = json['Registration_No']
      ..address1 = json['Address1']
      ..address2 = json['Address2']
      ..address3 = json['Address3']
      ..address4 = json['Address4']
      ..city = json['City']
      ..state = json['State']
      ..country = json['Country']
      ..postcode = json['Postcode']
      ..telNo = json['Tel_No']
      ..faxNo = json['Fax_No']
      ..contactName = json['Contact_Name']
      ..contactPhone = json['Contact_Phone']
      ..email = json['Email']
      ..website = json['Website']
      ..method = json['Method']
      ..term = json['Term']
      ..category = json['Category']
      ..area = json['Area']
      ..zone = json['Zone']
      ..frequency = json['Frequency']
      ..status = json['Status']
      ..currency = json['Currency']
      ..creditLimit = _parseDouble(json['Credit_Limit'])
      ..balance = _parseDouble(json['Balance'])
      ..kivBalance = _parseDouble(json['KIV_Balance'])
      ..priceType = json['Price_Type']
      ..ledgerAccount = json['Ledger_Account']
      ..gstLedgerAccount = json['GST_Ledger_Account']
      ..distributeLedgerAccount = json['Distribute_Ledger_Account']
      ..contra = json['Contra']
      ..remark = json['Remark']
      ..defaultShipTo = json['Default_ShipTo']
      ..addedBy = json['Added_By']
      ..addedDate = _parseDateTime(json['Added_Date'])
      ..lastModifiedBy = json['Last_Modified_By']
      ..lastModifiedDate = _parseDateTime(json['Last_Modified_Date'])
      ..linkImsInvoice = json['Link_IMS_Invoice']
      ..ref1 = json['Ref1']
      ..ref2 = json['Ref2']
      ..bankAccount = json['Bank_Account']
      ..discountLedgerAccount = json['Discount_Ledger_Account']
      ..otherChargesLedgerAccount = json['Other_Charges_Ledger_Account']
      ..taxLedgerAccount = json['Tax_Ledger_Account']
      ..deliveryDays = json['Delivery_Days']
      ..reference1 = json['Reference1']
      ..reference2 = json['Reference2']
      ..reference3 = json['Reference3']
      ..reference4 = json['Reference4']
      ..freeText1 = json['Free_Text1']
      ..freeText2 = json['Free_Text2']
      ..freeText3 = json['Free_Text3']
      ..freeText4 = json['Free_Text4']
      ..date1 = _parseDateTime(json['Date1'])
      ..date2 = _parseDateTime(json['Date2'])
      ..date3 = _parseDateTime(json['Date3'])
      ..date4 = _parseDateTime(json['Date4'])
      ..project = json['Project']
      ..location = json['Location']
      ..customerType = json['Customer_Type']
      ..creditBalance = _parseDouble(json['Credit_Balance'])
      ..payDay = json['Pay_Day']
      ..deliveryTermTime = _parseDateTime(json['Delivery_Term_Time'])
      ..cycleVisit = json['Cycle_Visit']
      ..calculateDueDateBy = json['Calculate_Due_Date_By']
      ..lpsMonthDay = json['LPS_Month_Day']
      ..cpsMonthDay = json['CPS_Month_Day']
      ..ppDiscountByRate = json['PP_DiscountByRate']
      ..ppDiscountRate = _parseDouble(json['PP_Discount_Rate'])
      ..ppDiscountAmount = _parseDouble(json['PP_Discount_Amount'])
      ..ppDueBy = json['PP_Due_By']
      ..lpsType = json['LPS_Type']
      ..cpsType = json['CPS_Type']
      ..deposit = _parseDouble(json['Deposit'])
      ..name2 = json['Name2']
      ..salesman = json['Salesman']
      ..autoSiDiscountNote = json['Auto_SI_Discount_Note']
      ..selectDiscountCode = json['Select_Discount_Code']
      ..defPaymentType = json['Def_Payment_Type']
      ..webPriceType = json['Web_PriceType']
      ..lastSellPrice = json['Last_Sell_Price']
      ..addMarkAmount = json['Add_Mark_Amount']
      ..useCustomerBarcode = json['Use_Customer_Barcode']
      ..labelId = json['Label_ID']
      ..priceTypeUseMultiQty = json['Price_Type_Use_Multi_Qty']
      ..siReportTitle = json['SI_Report_Title']
      ..masterCode = json['Master_Code']
      ..gstRegistrationNo = json['GST_Registration_No']
      ..gstRegistrationDate = _parseDateTime(json['GST_Registration_Date'])
      ..applyGst = json['Apply_GST']
      ..defaultGstCode = json['Default_GST_Code']
      ..ledgerAccountGstCode = json['Ledger_Account_GST_Code']
      ..distributeLedgerAccountGstCode = json['Distribute_Ledger_Account_GST_Code']
      ..gstLedgerAccountGstCode = json['GST_Ledger_Account_GST_Code']
      ..discountLedgerAccountGstCode = json['Discount_Ledger_Account_GST_Code']
      ..otherChargesLedgerAccountGstCode = json['Other_Charges_Ledger_Account_GST_Code']
      ..taxLedgerAccountGstCode = json['Tax_Ledger_Account_GST_Code']
      ..excludeGaf = json['Exclude_GAF']
      ..incTax = json['Inc_Tax']
      ..roundingLedgerAccount = json['Rounding_Ledger_Account']
      ..roundingLedgerAccountGstCode = json['Rounding_Ledger_Account_GST_Code']
      ..webPromoField = json['Web_Promo_Field']
      ..sstRegistrationNo = json['SST_Registration_No'];
  }

  // Convert to JSON/Map
  Map<String, dynamic> toJson() {
    return {
      'Company_Code': companyCode,
      'Code': code,
      'Name': name,
      'Registration_No': registrationNo,
      'Address1': address1,
      'Address2': address2,
      'Address3': address3,
      'Address4': address4,
      'City': city,
      'State': state,
      'Country': country,
      'Postcode': postcode,
      'Tel_No': telNo,
      'Fax_No': faxNo,
      'Contact_Name': contactName,
      'Contact_Phone': contactPhone,
      'Email': email,
      'Website': website,
      'Method': method,
      'Term': term,
      'Category': category,
      'Area': area,
      'Zone': zone,
      'Frequency': frequency,
      'Status': status,
      'Currency': currency,
      'Credit_Limit': creditLimit,
      'Balance': balance,
      'KIV_Balance': kivBalance,
      'Price_Type': priceType,
      'Ledger_Account': ledgerAccount,
      'GST_Ledger_Account': gstLedgerAccount,
      'Distribute_Ledger_Account': distributeLedgerAccount,
      'Contra': contra,
      'Remark': remark,
      'Default_ShipTo': defaultShipTo,
      'Added_By': addedBy,
      'Added_Date': addedDate?.toIso8601String(),
      'Last_Modified_By': lastModifiedBy,
      'Last_Modified_Date': lastModifiedDate?.toIso8601String(),
      'Link_IMS_Invoice': linkImsInvoice,
      'Ref1': ref1,
      'Ref2': ref2,
      'Bank_Account': bankAccount,
      'Discount_Ledger_Account': discountLedgerAccount,
      'Other_Charges_Ledger_Account': otherChargesLedgerAccount,
      'Tax_Ledger_Account': taxLedgerAccount,
      'Delivery_Days': deliveryDays,
      'Reference1': reference1,
      'Reference2': reference2,
      'Reference3': reference3,
      'Reference4': reference4,
      'Free_Text1': freeText1,
      'Free_Text2': freeText2,
      'Free_Text3': freeText3,
      'Free_Text4': freeText4,
      'Date1': date1?.toIso8601String(),
      'Date2': date2?.toIso8601String(),
      'Date3': date3?.toIso8601String(),
      'Date4': date4?.toIso8601String(),
      'Project': project,
      'Location': location,
      'Customer_Type': customerType,
      'Credit_Balance': creditBalance,
      'Pay_Day': payDay,
      'Delivery_Term_Time': deliveryTermTime?.toIso8601String(),
      'Cycle_Visit': cycleVisit,
      'Calculate_Due_Date_By': calculateDueDateBy,
      'LPS_Month_Day': lpsMonthDay,
      'CPS_Month_Day': cpsMonthDay,
      'PP_DiscountByRate': ppDiscountByRate,
      'PP_Discount_Rate': ppDiscountRate,
      'PP_Discount_Amount': ppDiscountAmount,
      'PP_Due_By': ppDueBy,
      'LPS_Type': lpsType,
      'CPS_Type': cpsType,
      'Deposit': deposit,
      'Name2': name2,
      'Salesman': salesman,
      'Auto_SI_Discount_Note': autoSiDiscountNote,
      'Select_Discount_Code': selectDiscountCode,
      'Def_Payment_Type': defPaymentType,
      'Web_PriceType': webPriceType,
      'Last_Sell_Price': lastSellPrice,
      'Add_Mark_Amount': addMarkAmount,
      'Use_Customer_Barcode': useCustomerBarcode,
      'Label_ID': labelId,
      'Price_Type_Use_Multi_Qty': priceTypeUseMultiQty,
      'SI_Report_Title': siReportTitle,
      'Master_Code': masterCode,
      'GST_Registration_No': gstRegistrationNo,
      'GST_Registration_Date': gstRegistrationDate?.toIso8601String(),
      'Apply_GST': applyGst,
      'Default_GST_Code': defaultGstCode,
      'Ledger_Account_GST_Code': ledgerAccountGstCode,
      'Distribute_Ledger_Account_GST_Code': distributeLedgerAccountGstCode,
      'GST_Ledger_Account_GST_Code': gstLedgerAccountGstCode,
      'Discount_Ledger_Account_GST_Code': discountLedgerAccountGstCode,
      'Other_Charges_Ledger_Account_GST_Code': otherChargesLedgerAccountGstCode,
      'Tax_Ledger_Account_GST_Code': taxLedgerAccountGstCode,
      'Exclude_GAF': excludeGaf,
      'Inc_Tax': incTax,
      'Rounding_Ledger_Account': roundingLedgerAccount,
      'Rounding_Ledger_Account_GST_Code': roundingLedgerAccountGstCode,
      'Web_Promo_Field': webPromoField,
      'SST_Registration_No': sstRegistrationNo,
    };
  }

  // Get display name (prioritize name2, then name, then code)
  String get displayName {
    if (name2?.isNotEmpty == true) return name2!;
    if (name?.isNotEmpty == true) return name!;
    return code;
  }

  // Get full address as a single string
  String get fullAddress {
    final addressParts = [address1, address2, address3, address4]
        .where((part) => part?.isNotEmpty == true)
        .toList();
    
    final cityStatePostcode = [city, state, postcode]
        .where((part) => part?.isNotEmpty == true)
        .join(' ');
    
    if (cityStatePostcode.isNotEmpty) {
      addressParts.add(cityStatePostcode);
    }
    
    if (country?.isNotEmpty == true) {
      addressParts.add(country!);
    }
    
    return addressParts.join(', ');
  }

  // Helper methods for parsing
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  @override
  String toString() {
    return 'Customer(code: $code, name: $displayName, companyCode: $companyCode)';
  }
}
