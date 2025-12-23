import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import '../services/quotation_service.dart';
import '../services/signalr_service.dart';
import '../models/quotation.dart';
import '../models/quote_item.dart';
import '../main.dart';

class DebugLogsPage extends StatefulWidget {
  const DebugLogsPage({Key? key}) : super(key: key);

  @override
  State<DebugLogsPage> createState() => _DebugLogsPageState();
}

class _DebugLogsPageState extends State<DebugLogsPage> {
  late QuotationService _quotationService;
  Map<String, String> _logPaths = {};
  String _sqlScript = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _quotationService = QuotationService(signalRService);
    _loadLogPaths();
  }

  Future<void> _loadLogPaths() async {
    setState(() => _isLoading = true);
    try {
      final paths = await _quotationService.getLogFilePaths();
      setState(() {
        _logPaths = paths;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Failed to load log paths: $e');
    }
  }

  Future<void> _generateSQLScript() async {
    setState(() => _isLoading = true);
    try {
      final script = await _quotationService.generateSQLRecoveryScript();
      setState(() {
        _sqlScript = script;
        _isLoading = false;
      });
      _showSuccess('SQL recovery script generated successfully');
    } catch (e) {
      _showError('Failed to generate SQL script: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _resyncQuotationItems() async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Re-sync Quotation Items'),
        content: const Text(
          'This will re-sync all quotation items for quotations that were synced before the fix was implemented. '
          'This may take some time depending on the number of quotations.\n\n'
          'Do you want to continue?'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Re-sync'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);
    try {
      // Re-sync items for quotations from the last 30 days
      final fromDate = DateTime.now().subtract(const Duration(days: 30));
      final resyncedCount = await _quotationService.resyncQuotationItems(fromDate: fromDate);
      
      _showSuccess('Successfully re-synced items for $resyncedCount quotations');
    } catch (e) {
      _showError('Failed to re-sync quotation items: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _checkQuotationsNeedingResync() async {
    setState(() => _isLoading = true);
    try {
      // Check quotations from the last 30 days
      final beforeDate = DateTime.now();
      final quotations = await _quotationService.getQuotationsNeedingItemResync(beforeDate: beforeDate);
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quotations Needing Re-sync'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Found ${quotations.length} quotations that may need item re-sync:'),
                const SizedBox(height: 8),
                ...quotations.take(10).map((q) => Text('• ${q.quotePreLabel}')),
                if (quotations.length > 10)
                  Text('... and ${quotations.length - 10} more'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      _showError('Failed to check quotations: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _cleanupOldLogs() async {
    setState(() => _isLoading = true);
    try {
      await _quotationService.cleanupOldLogs();
      setState(() => _isLoading = false);
      _showSuccess('Old log files cleaned up successfully');
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Failed to cleanup logs: $e');
    }
  }

  Future<void> _exportDatabaseToSQL() async {
    setState(() => _isLoading = true);
    try {
      // Get all quotations from database using collection<T>() syntax
      final quotationCollection = isar.collection<Quotation>();
      final quotations = await quotationCollection.where().findAll();
      print('📊 DATABASE EXPORT: Found ${quotations.length} quotations in database');
      
      if (quotations.isEmpty) {
        setState(() => _isLoading = false);
        _showError('No quotations found in database');
        return;
      }
      
      final buffer = StringBuffer();
      buffer.writeln('-- Database Export SQL Script');
      buffer.writeln('-- Generated: ${DateTime.now()}');
      buffer.writeln('-- Total Quotations: ${quotations.length}');
      buffer.writeln('');
      
      int totalItems = 0;
      final quoteItemCollection = isar.collection<QuoteItem>();
      
      for (final quotation in quotations) {
        // Export quotation header
        buffer.writeln('-- Quotation: ${quotation.quotePreLabel}');
        buffer.writeln('INSERT INTO quotations (');
        buffer.writeln('  Company_Code, Quote_Pre_Label, Quote_Date, Customer,');
        buffer.writeln('  Status, GST_Amount, Net_Amount, Is_Synced');
        buffer.writeln(') VALUES (');
        buffer.writeln('  ${quotation.companyCode}, \'${quotation.quotePreLabel}\',');
        buffer.writeln('  \'${quotation.quoteDate?.toIso8601String()}\', \'${quotation.customer?.replaceAll("'", "''") ?? ""}\',');
        buffer.writeln('  \'${quotation.status ?? ""}\', ${quotation.gstAmount ?? 0},');
        buffer.writeln('  ${quotation.netAmount ?? 0}, ${quotation.isSynced ? 1 : 0}');
        buffer.writeln(');');
        buffer.writeln('');
        
        // Get quotation items
        final items = await quoteItemCollection
            .where()
            .companyCodeEqualTo(quotation.companyCode)
            .filter()
            .quotePreLabelEqualTo(quotation.quotePreLabel)
            .findAll();
        
        totalItems = totalItems + items.length;
        
        // Export quotation items
        for (final item in items) {
          buffer.writeln('-- Item for quotation: ${quotation.quotePreLabel}');
          buffer.writeln('INSERT INTO quotation_items (');
          buffer.writeln('  Company_Code, Quote_Pre_Label, Sequence_No, Sku_No,');
          buffer.writeln('  Unit_Price, Quote_Quantity, Net_Amount, Remark, PLU_No');
          buffer.writeln(') VALUES (');
          buffer.writeln('  ${item.companyCode}, \'${item.quotePreLabel}\', ${item.sequenceNo},');
          buffer.writeln('  ${item.skuNo}, ${item.unitPrice}, ${item.quoteQuantity},');
          buffer.writeln('  ${item.netAmount}, \'${item.remark?.replaceAll("'", "''") ?? ""}\',');
          buffer.writeln('  \'${item.pluNo ?? ""}\'');
          buffer.writeln(');');
          buffer.writeln('');
        }
      }
      
      buffer.writeln('-- Export Summary:');
      buffer.writeln('-- Quotations: ${quotations.length}');
      buffer.writeln('-- Items: $totalItems');
      
      setState(() {
        _sqlScript = buffer.toString();
      });
      
      _showSuccess('Database exported to SQL script (${quotations.length} quotations, $totalItems items)');
      print('✅ DATABASE EXPORT: Generated SQL script with ${quotations.length} quotations and $totalItems items');
      
    } catch (e) {
      _showError('Failed to export database: $e');
      print('❌ DATABASE EXPORT: Error: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _showDatabaseStats() async {
    setState(() => _isLoading = true);
    try {
      // Get database statistics using collection<T>() syntax
      final quotationCollection = isar.collection<Quotation>();
      final quoteItemCollection = isar.collection<QuoteItem>();
      
      final quotationCount = await quotationCollection.count();
      final itemCount = await quoteItemCollection.count();
      final syncedQuotations = await quotationCollection.where().filter().isSyncedEqualTo(true).count();
      final unsyncedQuotations = quotationCount - syncedQuotations;
      
      // Get date range
      final oldestQuotation = await quotationCollection.where().sortByQuoteDate().findFirst();
      final newestQuotation = await quotationCollection.where().sortByQuoteDateDesc().findFirst();
      
      // Get company breakdown
      final companies = await quotationCollection.where().distinctByCompanyCode().findAll();
      final companyStats = <int, int>{};
      for (final company in companies) {
        final count = await quotationCollection.where().filter().companyCodeEqualTo(company.companyCode).count();
        companyStats[company.companyCode] = count;
      }
      
      if (!mounted) return;
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Database Statistics'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('📊 Total Quotations: $quotationCount'),
                Text('📦 Total Items: $itemCount'),
                const SizedBox(height: 8),
                Text('✅ Synced: $syncedQuotations'),
                Text('⏳ Unsynced: $unsyncedQuotations'),
                const SizedBox(height: 8),
                if (oldestQuotation != null)
                  Text('📅 Oldest: ${oldestQuotation.quoteDate?.toString().split(' ')[0]}'),
                if (newestQuotation != null)
                  Text('📅 Newest: ${newestQuotation.quoteDate?.toString().split(' ')[0]}'),
                const SizedBox(height: 8),
                const Text('🏢 By Company:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...companyStats.entries.map((entry) => 
                  Text('  Company ${entry.key}: ${entry.value} quotations')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
      
    } catch (e) {
      _showError('Failed to get database stats: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _copyToClipboard(String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    _showSuccess('$label copied to clipboard');
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Logs'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Log File Paths Section
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Log File Locations',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (_logPaths.isNotEmpty) ...[
                            _buildLogPathItem('Directory', _logPaths['directory'] ?? ''),
                            _buildLogPathItem('Quotations Log', _logPaths['quotations'] ?? ''),
                            _buildLogPathItem('Items Log', _logPaths['items'] ?? ''),
                          ] else
                            const Text('No log paths available'),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Action Buttons Section
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Log Management',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _generateSQLScript,
                                  icon: const Icon(Icons.code),
                                  label: const Text('Generate SQL Script'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _cleanupOldLogs,
                                  icon: const Icon(Icons.cleaning_services),
                                  label: const Text('Cleanup Old Logs'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _checkQuotationsNeedingResync,
                                  icon: const Icon(Icons.search),
                                  label: const Text('Check Missing Items'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _resyncQuotationItems,
                                  icon: const Icon(Icons.sync),
                                  label: const Text('Re-sync Items'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Database Recovery Section
                          const Text(
                            'Database Recovery',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _exportDatabaseToSQL,
                                  icon: const Icon(Icons.download),
                                  label: const Text('Export DB to SQL'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _showDatabaseStats,
                                  icon: const Icon(Icons.analytics),
                                  label: const Text('Database Stats'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // SQL Script Section
                  if (_sqlScript.isNotEmpty)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'SQL Recovery Script',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _copyToClipboard(_sqlScript, 'SQL script'),
                                  icon: const Icon(Icons.copy),
                                  tooltip: 'Copy to clipboard',
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              height: 300,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: SingleChildScrollView(
                                child: Text(
                                  _sqlScript,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                  const SizedBox(height: 16),
                  
                  // Instructions Section
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Instructions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '1. Log files are automatically created when quotations are saved\n'
                            '2. Each quotation and its items are logged before database operations\n'
                            '3. Use "Generate SQL Script" to create recovery commands\n'
                            '4. Copy the SQL script and run it on your database if needed\n'
                            '5. Use "Cleanup Old Logs" to remove files older than 30 days',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildLogPathItem(String label, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              path,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
          IconButton(
            onPressed: () => _copyToClipboard(path, label),
            icon: const Icon(Icons.copy, size: 16),
            tooltip: 'Copy path',
          ),
        ],
      ),
    );
  }
}
