import 'package:flutter/material.dart';
import '../models/draft_quotation.dart';
import '../services/draft_service.dart';
import '../services/customer_state_service.dart';
import '../services/auth_service.dart';
import 'edit_draft_page.dart';

class DraftListPage extends StatefulWidget {
  const DraftListPage({Key? key}) : super(key: key);

  @override
  State<DraftListPage> createState() => _DraftListPageState();
}

class _DraftListPageState extends State<DraftListPage> {
  final DraftService _draftService = DraftService();
  final CustomerStateService _customerStateService = CustomerStateService();
  final AuthService _authService = AuthService();

  List<DraftQuotation> _drafts = [];
  bool _isLoading = true;
  int _companyCode = 0;

  @override
  void initState() {
    super.initState();
    _loadDrafts();
  }

  Future<void> _loadDrafts() async {
    setState(() => _isLoading = true);

    try {
      final company = await _authService.getSelectedCompany();
      final companyCodeRaw = company?['companyCode'];
      _companyCode = companyCodeRaw is String
          ? int.tryParse(companyCodeRaw) ?? 0
          : (companyCodeRaw as int?) ?? 0;

      final customer = _customerStateService.selectedCustomer;

      final drafts = await _draftService.getDrafts(
        companyCode: _companyCode,
        customerCode: customer?.code,
      );

      setState(() {
        _drafts = drafts;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading drafts: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _createNewDraft() async {
    try {
      final company = await _authService.getSelectedCompany();
      final companyCodeRaw = company?['companyCode'];
      final companyCode = companyCodeRaw is String
          ? int.tryParse(companyCodeRaw) ?? 0
          : (companyCodeRaw as int?) ?? 0;

      final customer = _customerStateService.selectedCustomer;
      final user = _authService.currentUser;

      final draft = await _draftService.createDraft(
        companyCode: companyCode,
        customerCode: customer?.code,
        customerName: customer?.name,
        salespersonCode: user?.loginName,
        salespersonName: user?.fullName,
      );

      // Navigate to edit page
      final hasChanges = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (context) => EditDraftPage(draft: draft),
        ),
      );

      if (hasChanges == true) {
        await _loadDrafts();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating draft: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _editDraft(DraftQuotation draft) async {
    final hasChanges = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => EditDraftPage(draft: draft),
      ),
    );

    if (hasChanges == true) {
      await _loadDrafts();
    }
  }

  Future<void> _deleteDraft(DraftQuotation draft) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Draft'),
        content: Text('Are you sure you want to delete this draft?\n\nCustomer: ${draft.customerName ?? "Unknown"}\nItems: ${draft.totalItems}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        await _draftService.deleteDraft(draft.id);
        await _loadDrafts();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Draft deleted'), backgroundColor: Colors.green),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting draft: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Drafts'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDrafts,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _drafts.isEmpty
              ? _buildEmptyState()
              : _buildDraftList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createNewDraft,
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('New Draft', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.drafts_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No drafts yet',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Create a draft to save items before\ngenerating a quotation',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _createNewDraft,
            icon: const Icon(Icons.add),
            label: const Text('Create Draft'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraftList() {
    return RefreshIndicator(
      onRefresh: _loadDrafts,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _drafts.length,
        itemBuilder: (context, index) {
          final draft = _drafts[index];
          return _buildDraftCard(draft);
        },
      ),
    );
  }

  Widget _buildDraftCard(DraftQuotation draft) {
    final createdDate = draft.createdDate;
    final dateStr = createdDate != null
        ? '${createdDate.day}/${createdDate.month}/${createdDate.year} ${createdDate.hour.toString().padLeft(2, '0')}:${createdDate.minute.toString().padLeft(2, '0')}'
        : '-';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _editDraft(draft),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.drafts_outlined, color: Colors.teal.shade700, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Draft #${draft.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            draft.customerName ?? 'No customer',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                      onPressed: () => _deleteDraft(draft),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                const Divider(height: 1),
                const SizedBox(height: 12),

                // Details row
                Row(
                  children: [
                    _buildInfoChip(Icons.calendar_today, dateStr),
                    const SizedBox(width: 12),
                    _buildInfoChip(Icons.inventory_2_outlined, '${draft.totalItems} items'),
                  ],
                ),

                const SizedBox(height: 10),

                // Amount row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: RM ${draft.netAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_note, size: 14, color: Colors.orange.shade700),
                          const SizedBox(width: 4),
                          Text(
                            'Draft',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey[500]),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
