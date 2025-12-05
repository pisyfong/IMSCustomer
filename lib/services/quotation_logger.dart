import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../models/quotation.dart';

/// Service for logging quotations and their items to text files for backup purposes
class QuotationLogger {
  static const String _logFileName = 'quotation_backup.log';
  static const String _itemsLogFileName = 'quotation_items_backup.log';
  static const String _duplicateLogFileName = 'duplicate_quotations.log';
  
  /// Get the application documents directory
  static Future<Directory> _getLogDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final logDir = Directory('${appDir.path}/quotation_logs');
    if (!await logDir.exists()) {
      await logDir.create(recursive: true);
    }
    return logDir;
  }

  /// Log quotation header creation
  static Future<void> logQuotationCreation({
    required int companyCode,
    required String quotePreLabel,
    required String customer,
    required DateTime quoteDate,
    required String status,
    String? term,
    DateTime? quoteExpiry,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final logDir = await _getLogDirectory();
      final logFile = File('${logDir.path}/$_logFileName');
      
      final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      final quoteDateStr = DateFormat('yyyy-MM-dd').format(quoteDate);
      final quoteExpiryStr = quoteExpiry != null ? DateFormat('yyyy-MM-dd').format(quoteExpiry) : 'NULL';
      
      final logEntry = {
        'timestamp': timestamp,
        'action': 'CREATE_QUOTATION',
        'companyCode': companyCode,
        'quotePreLabel': quotePreLabel,
        'customer': customer,
        'quoteDate': quoteDateStr,
        'quoteExpiry': quoteExpiryStr,
        'status': status,
        'term': term ?? 'NULL',
        'additionalData': additionalData ?? {},
      };
      
      final logLine = '${jsonEncode(logEntry)}\n';
      
      // Append to log file
      await logFile.writeAsString(logLine, mode: FileMode.append);
      
      print('📝 LOGGER: Quotation creation logged - $quotePreLabel');
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to log quotation creation: $e');
      // Don't throw - logging failure shouldn't break the main process
    }
  }

  /// Log quotation items creation
  static Future<void> logQuotationItems({
    required int companyCode,
    required String quotePreLabel,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      final logDir = await _getLogDirectory();
      final logFile = File('${logDir.path}/$_itemsLogFileName');
      
      final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      
      for (int i = 0; i < items.length; i++) {
        final item = items[i];
        final logEntry = {
          'timestamp': timestamp,
          'action': 'CREATE_QUOTATION_ITEM',
          'companyCode': companyCode,
          'quotePreLabel': quotePreLabel,
          'sequenceNo': i + 1,
          'skuNo': item['skuNo'] ?? 0,
          'uom': item['uom'] ?? 'PCS',
          'quantity': item['quantity'] ?? 0.0,
          'unitPrice': item['unitPrice'] ?? 0.0,
          'amount': item['amount'] ?? ((item['quantity'] ?? 0.0) * (item['unitPrice'] ?? 0.0)),
          'pluNo': item['pluNo'] ?? 'NULL',
          'remark': item['remark'] ?? 'NULL',
        };
        
        final logLine = '${jsonEncode(logEntry)}\n';
        
        // Append to log file
        await logFile.writeAsString(logLine, mode: FileMode.append);
      }
      
      print('📝 LOGGER: ${items.length} quotation items logged for $quotePreLabel');
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to log quotation items: $e');
      // Don't throw - logging failure shouldn't break the main process
    }
  }

  /// Log quotation update
  static Future<void> logQuotationUpdate({
    required String quotePreLabel,
    required String action,
    Map<String, dynamic>? changes,
  }) async {
    try {
      final logDir = await _getLogDirectory();
      final logFile = File('${logDir.path}/$_logFileName');
      
      final timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      
      final logEntry = {
        'timestamp': timestamp,
        'action': 'UPDATE_QUOTATION',
        'quotePreLabel': quotePreLabel,
        'updateAction': action,
        'changes': changes ?? {},
      };
      
      final logLine = '${jsonEncode(logEntry)}\n';
      
      // Append to log file
      await logFile.writeAsString(logLine, mode: FileMode.append);
      
      print('📝 LOGGER: Quotation update logged - $quotePreLabel ($action)');
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to log quotation update: $e');
      // Don't throw - logging failure shouldn't break the main process
    }
  }

  /// Get log file paths for debugging or manual recovery
  static Future<Map<String, String>> getLogFilePaths() async {
    try {
      final logDir = await _getLogDirectory();
      return {
        'quotations': '${logDir.path}/$_logFileName',
        'items': '${logDir.path}/$_itemsLogFileName',
        'duplicates': '${logDir.path}/$_duplicateLogFileName',
        'directory': logDir.path,
      };
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to get log file paths: $e');
      return {};
    }
  }

  /// Log duplicate quotation details for manual review
  static Future<void> logDuplicateQuotation(Map<String, dynamic> duplicateData) async {
    try {
      final logDir = await _getLogDirectory();
      final logFile = File('${logDir.path}/$_duplicateLogFileName');
      
      // Create a comprehensive log entry with all quotation details
      final logEntry = {
        'logged_at': DateTime.now().toIso8601String(),
        'duplicate_info': duplicateData,
      };
      
      // Write as JSON line to the duplicate log file
      final jsonLine = '${jsonEncode(logEntry)}\n';
      await logFile.writeAsString(jsonLine, mode: FileMode.append);
      
      print('📝 DUPLICATE LOGGER: Logged duplicate quotation ${duplicateData['quotation_header']?['Quote_PreLabel']} to ${logFile.path}');
      
    } catch (e) {
      print('❌ DUPLICATE LOGGER ERROR: Failed to log duplicate quotation: $e');
      // Don't throw - logging failure shouldn't break the process
    }
  }

  /// Clean up old log files (keep last 30 days)
  static Future<void> cleanupOldLogs() async {
    try {
      final logDir = await _getLogDirectory();
      final files = await logDir.list().toList();
      final cutoffDate = DateTime.now().subtract(Duration(days: 30));
      
      for (final file in files) {
        if (file is File) {
          final stat = await file.stat();
          if (stat.modified.isBefore(cutoffDate)) {
            await file.delete();
            print('📝 LOGGER: Deleted old log file: ${file.path}');
          }
        }
      }
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to cleanup old logs: $e');
    }
  }

  /// Generate SQL insert statements from log files for manual recovery
  static Future<String> generateSQLRecoveryScript() async {
    try {
      final logDir = await _getLogDirectory();
      final quotationFile = File('${logDir.path}/$_logFileName');
      final itemsFile = File('${logDir.path}/$_itemsLogFileName');
      
      final sqlStatements = <String>[];
      sqlStatements.add('-- Quotation Recovery SQL Script');
      sqlStatements.add('-- Generated on: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}');
      sqlStatements.add('');
      
      // Process quotation headers
      if (await quotationFile.exists()) {
        final quotationLines = await quotationFile.readAsLines();
        sqlStatements.add('-- Quotation Headers');
        
        for (final line in quotationLines) {
          if (line.trim().isEmpty) continue;
          
          try {
            final data = jsonDecode(line) as Map<String, dynamic>;
            if (data['action'] == 'CREATE_QUOTATION') {
              final sql = '''INSERT INTO quotations (company_code, quote_pre_label, customer, quote_date, quote_expiry, status, term, gross_amount, net_amount, added_date) VALUES (
  ${data['companyCode']}, 
  '${data['quotePreLabel']}', 
  '${data['customer']}', 
  '${data['quoteDate']}', 
  '${data['quoteExpiry']}', 
  '${data['status']}', 
  '${data['term']}',
  ${data['additionalData']?['grossAmount'] ?? 0.0},
  ${data['additionalData']?['netAmount'] ?? 0.0},
  '${data['timestamp']}'
);''';
              sqlStatements.add(sql);
            }
          } catch (e) {
            sqlStatements.add('-- Error parsing line: $line');
          }
        }
      }
      
      sqlStatements.add('');
      
      // Process quotation items
      if (await itemsFile.exists()) {
        final itemsLines = await itemsFile.readAsLines();
        sqlStatements.add('-- Quotation Items');
        
        for (final line in itemsLines) {
          if (line.trim().isEmpty) continue;
          
          try {
            final data = jsonDecode(line) as Map<String, dynamic>;
            if (data['action'] == 'CREATE_QUOTATION_ITEM') {
              final sql = '''INSERT INTO quotation_items (company_code, quote_pre_label, sequence_no, sku_no, uom, quantity, unit_price, amount, plu_no, remark) VALUES (
  ${data['companyCode']}, 
  '${data['quotePreLabel']}', 
  ${data['sequenceNo']}, 
  ${data['skuNo']}, 
  '${data['uom']}', 
  ${data['quantity']}, 
  ${data['unitPrice']}, 
  ${data['amount']}, 
  '${data['pluNo']}', 
  '${data['remark']}'
);''';
              sqlStatements.add(sql);
            }
          } catch (e) {
            sqlStatements.add('-- Error parsing line: $line');
          }
        }
      }
      
      return sqlStatements.join('\n');
    } catch (e) {
      print('❌ LOGGER ERROR: Failed to generate SQL recovery script: $e');
      return '-- Error generating recovery script: $e';
    }
  }
}
