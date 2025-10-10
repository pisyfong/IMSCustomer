import 'package:isar/isar.dart';

part 'user_app_settings.g.dart';

@collection
class UserAppSettings {
  Id id = Isar.autoIncrement;
  
  @Index()
  late int userId;
  
  @Index()
  late int companyCode;
  
  int? promoterId;
  String? selectShop; // 'Y' or 'N'
  String? showPI; // 'Y' or 'N'
  int? siBatch;
  String? siShowQty; // 'Y' or 'N'
  String? siShowCost; // 'Y' or 'N'
  String? siAllowChangePrice; // 'Y' or 'N' - Controls price editing permission
  String? siAllowBelowCost; // 'Y' or 'N'
  String? siAllowExceedQty; // 'Y' or 'N'
  String? siAllowFoc; // 'Y' or 'N'
  String? siAllOrderView; // 'Y' or 'N'
  String? siAllOrderEdit; // 'Y' or 'N'
  DateTime? lastWriteTimestamp;
  String? adDistCreateEvent; // 'Y' or 'N'
  String? siDistCreateEvent; // 'Y' or 'N'
  
  UserAppSettings();

  factory UserAppSettings.fromJson(Map<String, dynamic> json) {
    return UserAppSettings()
      ..userId = json['User_ID'] ?? 0
      ..companyCode = json['Company_Code'] ?? 0
      ..promoterId = json['Promoter_Id']
      ..selectShop = json['Select_Shop']
      ..showPI = json['Show_PI']
      ..siBatch = json['SI_Batch']
      ..siShowQty = json['SI_Show_Qty']
      ..siShowCost = json['SI_Show_Cost']
      ..siAllowChangePrice = json['SI_Allow_Change_Price']
      ..siAllowBelowCost = json['SI_Allow_Below_Cost']
      ..siAllowExceedQty = json['SI_Allow_Exceed_Qty']
      ..siAllowFoc = json['SI_Allow_Foc']
      ..siAllOrderView = json['SI_All_Order_View']
      ..siAllOrderEdit = json['SI_All_Order_Edit']
      ..lastWriteTimestamp = json['Lastwritetimestamp'] != null 
          ? DateTime.tryParse(json['Lastwritetimestamp'].toString())
          : null
      ..adDistCreateEvent = json['AD_Dist_Create_Event']
      ..siDistCreateEvent = json['SI_Dist_Create_Event'];
  }

  Map<String, dynamic> toJson() {
    return {
      'User_ID': userId,
      'Company_Code': companyCode,
      'Promoter_Id': promoterId,
      'Select_Shop': selectShop,
      'Show_PI': showPI,
      'SI_Batch': siBatch,
      'SI_Show_Qty': siShowQty,
      'SI_Show_Cost': siShowCost,
      'SI_Allow_Change_Price': siAllowChangePrice,
      'SI_Allow_Below_Cost': siAllowBelowCost,
      'SI_Allow_Exceed_Qty': siAllowExceedQty,
      'SI_Allow_Foc': siAllowFoc,
      'SI_All_Order_View': siAllOrderView,
      'SI_All_Order_Edit': siAllOrderEdit,
      'Lastwritetimestamp': lastWriteTimestamp?.toIso8601String(),
      'AD_Dist_Create_Event': adDistCreateEvent,
      'SI_Dist_Create_Event': siDistCreateEvent,
    };
  }

  // Helper getters for boolean permissions
  bool get canChangePrice => siAllowChangePrice == 'Y';
  bool get canSellBelowCost => siAllowBelowCost == 'Y';
  bool get canExceedQty => siAllowExceedQty == 'Y';
  bool get canAddFoc => siAllowFoc == 'Y';
  bool get canViewAllOrders => siAllOrderView == 'Y';
  bool get canEditAllOrders => siAllOrderEdit == 'Y';
  bool get showQuantity => siShowQty == 'Y';
  bool get showCost => siShowCost == 'Y';
}
