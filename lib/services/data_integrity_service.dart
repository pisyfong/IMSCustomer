import 'dart:async';
import 'package:isar/isar.dart';
import '../main.dart';
import 'signalr_service.dart';
import 'auth_service.dart';
import '../models/inventory_item.dart';
import '../models/customer.dart';
import '../models/quotation.dart';
import '../models/in_stock_plu.dart';

/// Data integrity check result for a single entity type
class IntegrityCheckResult {
  final String entityType;
  final int localCount;
  final int serverCount;
  final int matchingCount;
  final int missingOnLocal;
  final int missingOnServer;
  final int mismatchedRecords;
  final List<String> discrepancies;
  final DateTime checkTime;
  final bool hasErrors;
  final String? errorMessage;

  IntegrityCheckResult({
    required this.entityType,
    required this.localCount,
    required this.serverCount,
    required this.matchingCount,
    required this.missingOnLocal,
    required this.missingOnServer,
    required this.mismatchedRecords,
    required this.discrepancies,
    required this.checkTime,
    this.hasErrors = false,
    this.errorMessage,
  });

  bool get isInSync => missingOnLocal == 0 && missingOnServer == 0 && mismatchedRecords == 0 && !hasErrors;
  
  double get syncPercentage {
    if (serverCount == 0 && localCount == 0) return 100.0;
    if (serverCount == 0) return 0.0;
    return (matchingCount / serverCount) * 100;
  }

  Map<String, dynamic> toJson() => {
    'entityType': entityType,
    'localCount': localCount,
    'serverCount': serverCount,
    'matchingCount': matchingCount,
    'missingOnLocal': missingOnLocal,
    'missingOnServer': missingOnServer,
    'mismatchedRecords': mismatchedRecords,
    'discrepancies': discrepancies,
    'checkTime': checkTime.toIso8601String(),
    'isInSync': isInSync,
    'syncPercentage': syncPercentage,
    'hasErrors': hasErrors,
    'errorMessage': errorMessage,
  };
}

/// Overall integrity check report
class IntegrityReport {
  final List<IntegrityCheckResult> results;
  final DateTime reportTime;
  final int companyCode;

  IntegrityReport({
    required this.results,
    required this.reportTime,
    required this.companyCode,
  });

  bool get allInSync => results.every((r) => r.isInSync);
  
  int get totalDiscrepancies => results.fold(0, (sum, r) => 
    sum + r.missingOnLocal + r.missingOnServer + r.mismatchedRecords);

  Map<String, dynamic> toJson() => {
    'reportTime': reportTime.toIso8601String(),
    'companyCode': companyCode,
    'allInSync': allInSync,
    'totalDiscrepancies': totalDiscrepancies,
    'results': results.map((r) => r.toJson()).toList(),
  };
}

/// Service to check data integrity between local Isar database and server
class DataIntegrityService {
  static final DataIntegrityService _instance = DataIntegrityService._internal();
  factory DataIntegrityService() => _instance;
  DataIntegrityService._internal();

  final SignalRService _signalRService = SignalRService();
  final AuthService _authService = AuthService();

  // Progress stream for UI updates
  final StreamController<String> _progressController = StreamController<String>.broadcast();
  Stream<String> get progressStream => _progressController.stream;

  void _emitProgress(String message) {
    print('🔍 INTEGRITY: $message');
    _progressController.add(message);
  }

  /// Run full integrity check for all entity types
  Future<IntegrityReport> runFullIntegrityCheck({int? companyCode}) async {
    final results = <IntegrityCheckResult>[];
    
    // Get company code
    final selectedCompany = await _authService.getSelectedCompany();
    final effectiveCompanyCode = companyCode ?? 
      (selectedCompany?['companyCode'] is String 
        ? int.tryParse(selectedCompany?['companyCode']) ?? 1 
        : (selectedCompany?['companyCode'] as int?) ?? 1);

    _emitProgress('Starting integrity check for company $effectiveCompanyCode...');

    // Check inventory
    _emitProgress('Checking inventory data...');
    results.add(await checkInventoryIntegrity(effectiveCompanyCode));

    // Check customers
    _emitProgress('Checking customer data...');
    results.add(await checkCustomerIntegrity(effectiveCompanyCode));

    // Check quotations
    _emitProgress('Checking quotation data...');
    results.add(await checkQuotationIntegrity(effectiveCompanyCode));

    // Check PLU data
    _emitProgress('Checking PLU barcode data...');
    results.add(await checkPluIntegrity(effectiveCompanyCode));

    _emitProgress('Integrity check completed!');

    return IntegrityReport(
      results: results,
      reportTime: DateTime.now(),
      companyCode: effectiveCompanyCode,
    );
  }

  /// Check inventory data integrity
  Future<IntegrityCheckResult> checkInventoryIntegrity(int companyCode) async {
    try {
      // Get local inventory count and sample
      final localItems = await isar.inventoryItems
          .filter()
          .companyCodeEqualTo(companyCode)
          .findAll();
      final localCount = localItems.length;
      final localSkuSet = localItems.map((i) => i.skuNo).toSet();

      _emitProgress('Local inventory: $localCount items');

      // Get server inventory count
      if (!_signalRService.isConnected) {
        return IntegrityCheckResult(
          entityType: 'Inventory',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'Server not connected',
        );
      }

      // Get server inventory count via SignalR
      final user = await _authService.loadSavedLogin();
      if (user == null) {
        return IntegrityCheckResult(
          entityType: 'Inventory',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'No user logged in',
        );
      }

      // Get server count
      final serverCountResult = await _signalRService.invoke('getInventoryCount', [companyCode]);
      final serverCount = serverCountResult is int ? serverCountResult : 0;
      _emitProgress('Server inventory: $serverCount items');

      // Get sample of server SKUs for comparison (first 1000)
      final serverSampleResult = await _signalRService.invoke('getInventory', [
        user.userId,
        companyCode,
        '', // no search
        1000, // limit
        0, // offset
      ]);

      final serverSkuSet = <int>{};
      if (serverSampleResult is List) {
        for (final item in serverSampleResult) {
          if (item is Map<String, dynamic>) {
            final skuNo = item['SKU_No'];
            if (skuNo is int) serverSkuSet.add(skuNo);
          }
        }
      }

      // Calculate discrepancies
      final missingOnLocal = serverSkuSet.difference(localSkuSet).length;
      final missingOnServer = localSkuSet.difference(serverSkuSet).length;
      final matchingCount = localSkuSet.intersection(serverSkuSet).length;

      final discrepancies = <String>[];
      if (missingOnLocal > 0) {
        discrepancies.add('$missingOnLocal items exist on server but not locally');
      }
      if (missingOnServer > 0) {
        discrepancies.add('$missingOnServer items exist locally but not on server');
      }
      if (localCount != serverCount) {
        discrepancies.add('Count mismatch: Local=$localCount, Server=$serverCount');
      }

      return IntegrityCheckResult(
        entityType: 'Inventory',
        localCount: localCount,
        serverCount: serverCount,
        matchingCount: matchingCount,
        missingOnLocal: missingOnLocal,
        missingOnServer: missingOnServer,
        mismatchedRecords: 0,
        discrepancies: discrepancies,
        checkTime: DateTime.now(),
      );
    } catch (e) {
      return IntegrityCheckResult(
        entityType: 'Inventory',
        localCount: 0,
        serverCount: 0,
        matchingCount: 0,
        missingOnLocal: 0,
        missingOnServer: 0,
        mismatchedRecords: 0,
        discrepancies: [],
        checkTime: DateTime.now(),
        hasErrors: true,
        errorMessage: e.toString(),
      );
    }
  }

  /// Check customer data integrity
  Future<IntegrityCheckResult> checkCustomerIntegrity(int companyCode) async {
    try {
      // Get local customers
      final localCustomers = await isar.customers
          .filter()
          .companyCodeEqualTo(companyCode)
          .findAll();
      final localCount = localCustomers.length;
      final localCodeSet = localCustomers.map((c) => c.code ?? '').where((c) => c.isNotEmpty).toSet();

      _emitProgress('Local customers: $localCount');

      if (!_signalRService.isConnected) {
        return IntegrityCheckResult(
          entityType: 'Customers',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'Server not connected',
        );
      }

      // Get server customers
      final user = await _authService.loadSavedLogin();
      if (user == null) {
        return IntegrityCheckResult(
          entityType: 'Customers',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'No user logged in',
        );
      }

      final serverResult = await _signalRService.invoke('getCustomers', [user.userId, companyCode]);
      
      final serverCodeSet = <String>{};
      int serverCount = 0;
      if (serverResult is List) {
        serverCount = serverResult.length;
        for (final item in serverResult) {
          if (item is Map<String, dynamic>) {
            final code = item['Code']?.toString() ?? '';
            if (code.isNotEmpty) serverCodeSet.add(code);
          }
        }
      }

      _emitProgress('Server customers: $serverCount');

      // Calculate discrepancies
      final missingOnLocal = serverCodeSet.difference(localCodeSet).length;
      final missingOnServer = localCodeSet.difference(serverCodeSet).length;
      final matchingCount = localCodeSet.intersection(serverCodeSet).length;

      final discrepancies = <String>[];
      if (missingOnLocal > 0) {
        discrepancies.add('$missingOnLocal customers exist on server but not locally');
      }
      if (missingOnServer > 0) {
        discrepancies.add('$missingOnServer customers exist locally but not on server');
      }

      return IntegrityCheckResult(
        entityType: 'Customers',
        localCount: localCount,
        serverCount: serverCount,
        matchingCount: matchingCount,
        missingOnLocal: missingOnLocal,
        missingOnServer: missingOnServer,
        mismatchedRecords: 0,
        discrepancies: discrepancies,
        checkTime: DateTime.now(),
      );
    } catch (e) {
      return IntegrityCheckResult(
        entityType: 'Customers',
        localCount: 0,
        serverCount: 0,
        matchingCount: 0,
        missingOnLocal: 0,
        missingOnServer: 0,
        mismatchedRecords: 0,
        discrepancies: [],
        checkTime: DateTime.now(),
        hasErrors: true,
        errorMessage: e.toString(),
      );
    }
  }

  /// Check quotation data integrity
  Future<IntegrityCheckResult> checkQuotationIntegrity(int companyCode) async {
    try {
      // Get local quotations
      final localQuotations = await isar.quotations
          .filter()
          .companyCodeEqualTo(companyCode)
          .findAll();
      final localCount = localQuotations.length;
      final localLabelSet = localQuotations.map((q) => q.quotePreLabel ?? '').where((l) => l.isNotEmpty).toSet();
      
      // Count synced vs unsynced
      final syncedCount = localQuotations.where((q) => q.isSynced == true).length;
      final unsyncedCount = localQuotations.where((q) => q.isSynced != true).length;

      _emitProgress('Local quotations: $localCount (synced: $syncedCount, unsynced: $unsyncedCount)');

      if (!_signalRService.isConnected) {
        return IntegrityCheckResult(
          entityType: 'Quotations',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: unsyncedCount,
          mismatchedRecords: 0,
          discrepancies: ['$unsyncedCount quotations pending sync'],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'Server not connected',
        );
      }

      // Get server quotations
      final user = await _authService.loadSavedLogin();
      if (user == null) {
        return IntegrityCheckResult(
          entityType: 'Quotations',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'No user logged in',
        );
      }

      final serverResult = await _signalRService.invoke('getQuotations', [user.userId, companyCode, 1000, 0]);
      
      final serverLabelSet = <String>{};
      int serverCount = 0;
      if (serverResult is List) {
        serverCount = serverResult.length;
        for (final item in serverResult) {
          if (item is Map<String, dynamic>) {
            final label = item['Quote_Pre_Label']?.toString() ?? '';
            if (label.isNotEmpty) serverLabelSet.add(label);
          }
        }
      }

      _emitProgress('Server quotations: $serverCount');

      // Calculate discrepancies
      final missingOnLocal = serverLabelSet.difference(localLabelSet).length;
      final missingOnServer = localLabelSet.difference(serverLabelSet).length;
      final matchingCount = localLabelSet.intersection(serverLabelSet).length;

      final discrepancies = <String>[];
      if (missingOnLocal > 0) {
        discrepancies.add('$missingOnLocal quotations exist on server but not locally');
      }
      if (unsyncedCount > 0) {
        discrepancies.add('$unsyncedCount quotations pending sync to server');
      }

      return IntegrityCheckResult(
        entityType: 'Quotations',
        localCount: localCount,
        serverCount: serverCount,
        matchingCount: matchingCount,
        missingOnLocal: missingOnLocal,
        missingOnServer: unsyncedCount,
        mismatchedRecords: 0,
        discrepancies: discrepancies,
        checkTime: DateTime.now(),
      );
    } catch (e) {
      return IntegrityCheckResult(
        entityType: 'Quotations',
        localCount: 0,
        serverCount: 0,
        matchingCount: 0,
        missingOnLocal: 0,
        missingOnServer: 0,
        mismatchedRecords: 0,
        discrepancies: [],
        checkTime: DateTime.now(),
        hasErrors: true,
        errorMessage: e.toString(),
      );
    }
  }

  /// Check PLU barcode data integrity
  Future<IntegrityCheckResult> checkPluIntegrity(int companyCode) async {
    try {
      // Get local PLU data
      final localPlus = await isar.inStockPlus
          .filter()
          .companyCodeEqualTo(companyCode)
          .findAll();
      final localCount = localPlus.length;
      final localPluSet = localPlus.map((p) => '${p.skuNo}_${p.pluNo}').toSet();

      _emitProgress('Local PLU records: $localCount');

      if (!_signalRService.isConnected) {
        return IntegrityCheckResult(
          entityType: 'PLU Barcodes',
          localCount: localCount,
          serverCount: 0,
          matchingCount: 0,
          missingOnLocal: 0,
          missingOnServer: 0,
          mismatchedRecords: 0,
          discrepancies: [],
          checkTime: DateTime.now(),
          hasErrors: true,
          errorMessage: 'Server not connected',
        );
      }

      // Get server PLU count
      final serverResult = await _signalRService.invoke('getInStockPlu', [companyCode]);
      
      final serverPluSet = <String>{};
      int serverCount = 0;
      if (serverResult is List) {
        serverCount = serverResult.length;
        for (final item in serverResult) {
          if (item is Map<String, dynamic>) {
            final skuNo = item['Sku_No']?.toString() ?? '';
            final pluNo = item['Plu_No']?.toString() ?? '';
            if (skuNo.isNotEmpty && pluNo.isNotEmpty) {
              serverPluSet.add('${skuNo}_$pluNo');
            }
          }
        }
      }

      _emitProgress('Server PLU records: $serverCount');

      // Calculate discrepancies
      final missingOnLocal = serverPluSet.difference(localPluSet).length;
      final missingOnServer = localPluSet.difference(serverPluSet).length;
      final matchingCount = localPluSet.intersection(serverPluSet).length;

      final discrepancies = <String>[];
      if (missingOnLocal > 0) {
        discrepancies.add('$missingOnLocal PLU records exist on server but not locally');
      }
      if (missingOnServer > 0) {
        discrepancies.add('$missingOnServer PLU records exist locally but not on server');
      }

      return IntegrityCheckResult(
        entityType: 'PLU Barcodes',
        localCount: localCount,
        serverCount: serverCount,
        matchingCount: matchingCount,
        missingOnLocal: missingOnLocal,
        missingOnServer: missingOnServer,
        mismatchedRecords: 0,
        discrepancies: discrepancies,
        checkTime: DateTime.now(),
      );
    } catch (e) {
      return IntegrityCheckResult(
        entityType: 'PLU Barcodes',
        localCount: 0,
        serverCount: 0,
        matchingCount: 0,
        missingOnLocal: 0,
        missingOnServer: 0,
        mismatchedRecords: 0,
        discrepancies: [],
        checkTime: DateTime.now(),
        hasErrors: true,
        errorMessage: e.toString(),
      );
    }
  }

  /// Force sync to fix discrepancies
  Future<void> forceResync({
    required int companyCode,
    bool syncInventory = true,
    bool syncCustomers = true,
    bool syncPlu = true,
  }) async {
    _emitProgress('Starting force resync...');

    if (syncInventory) {
      _emitProgress('Force syncing inventory...');
      // Clear local inventory and refetch
      await isar.writeTxn(() async {
        await isar.inventoryItems.filter().companyCodeEqualTo(companyCode).deleteAll();
      });
      _emitProgress('Cleared local inventory, will resync on next access');
    }

    if (syncCustomers) {
      _emitProgress('Force syncing customers...');
      await isar.writeTxn(() async {
        await isar.customers.filter().companyCodeEqualTo(companyCode).deleteAll();
      });
      _emitProgress('Cleared local customers, will resync on next access');
    }

    if (syncPlu) {
      _emitProgress('Force syncing PLU data...');
      await isar.writeTxn(() async {
        await isar.inStockPlus.filter().companyCodeEqualTo(companyCode).deleteAll();
      });
      _emitProgress('Cleared local PLU data, will resync on next access');
    }

    _emitProgress('Force resync completed - data will refresh on next access');
  }

  void dispose() {
    _progressController.close();
  }
}
