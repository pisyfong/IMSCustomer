import 'package:isar/isar.dart';
import '../models/draft_quotation.dart';
import '../main.dart';

class DraftService {
  Isar get _isar => isar;

  /// Create a new draft quotation
  Future<DraftQuotation> createDraft({
    required int companyCode,
    String? customerCode,
    String? customerName,
    String? salespersonCode,
    String? salespersonName,
    String? remarks,
  }) async {
    final draft = DraftQuotation()
      ..companyCode = companyCode
      ..customerCode = customerCode
      ..customerName = customerName
      ..salespersonCode = salespersonCode
      ..salespersonName = salespersonName
      ..createdDate = DateTime.now()
      ..lastModifiedDate = DateTime.now()
      ..remarks = remarks
      ..status = 'draft'
      ..totalQuantity = 0
      ..totalItems = 0
      ..netAmount = 0
      ..grossAmount = 0;

    await _isar.writeTxn(() async {
      await _isar.draftQuotations.put(draft);
    });

    print('📝 DRAFT: Created new draft #${draft.id} for customer $customerCode');
    return draft;
  }

  /// Get all drafts for a company
  Future<List<DraftQuotation>> getDrafts({
    required int companyCode,
    String? customerCode,
  }) async {
    var query = _isar.draftQuotations
        .filter()
        .companyCodeEqualTo(companyCode)
        .statusEqualTo('draft');

    if (customerCode != null) {
      query = query.customerCodeEqualTo(customerCode);
    }

    return await query.sortByLastModifiedDateDesc().findAll();
  }

  /// Get a single draft by ID
  Future<DraftQuotation?> getDraftById(int draftId) async {
    return await _isar.draftQuotations.get(draftId);
  }

  /// Update draft details
  Future<void> updateDraft(DraftQuotation draft) async {
    draft.lastModifiedDate = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.draftQuotations.put(draft);
    });
    print('📝 DRAFT: Updated draft #${draft.id}');
  }

  /// Delete a draft and all its items
  Future<void> deleteDraft(int draftId) async {
    await _isar.writeTxn(() async {
      // Delete all items first
      await _isar.draftQuotationItems
          .filter()
          .draftIdEqualTo(draftId)
          .deleteAll();
      // Delete the draft
      await _isar.draftQuotations.delete(draftId);
    });
    print('📝 DRAFT: Deleted draft #$draftId and all its items');
  }

  /// Get items for a draft
  Future<List<DraftQuotationItem>> getDraftItems(int draftId) async {
    return await _isar.draftQuotationItems
        .filter()
        .draftIdEqualTo(draftId)
        .sortBySequenceNo()
        .findAll();
  }

  /// Add item to draft
  Future<DraftQuotationItem> addDraftItem({
    required int draftId,
    required int companyCode,
    required int skuNo,
    required String uom,
    required double quantity,
    required double unitPrice,
    String? pluNo,
    String? description,
    String? remark,
    String? brand,
  }) async {
    // Get existing items to determine next sequence number
    final existingItems = await getDraftItems(draftId);
    final nextSequence = existingItems.isEmpty
        ? 1
        : existingItems.map((i) => i.sequenceNo).reduce((a, b) => a > b ? a : b) + 1;

    final netAmount = quantity * unitPrice;

    final item = DraftQuotationItem()
      ..draftId = draftId
      ..companyCode = companyCode
      ..sequenceNo = nextSequence
      ..skuNo = skuNo
      ..pluNo = pluNo
      ..description = description
      ..uom = uom
      ..quantity = quantity
      ..unitPrice = unitPrice
      ..netAmount = netAmount
      ..remark = remark
      ..brand = brand
      ..addedDate = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.draftQuotationItems.put(item);
    });

    // Update draft totals
    await _recalculateDraftTotals(draftId);

    print('📝 DRAFT ITEM: Added SKU $skuNo to draft #$draftId');
    return item;
  }

  /// Update a draft item
  Future<void> updateDraftItem(DraftQuotationItem item) async {
    item.netAmount = item.quantity * item.unitPrice;
    await _isar.writeTxn(() async {
      await _isar.draftQuotationItems.put(item);
    });

    // Update draft totals
    await _recalculateDraftTotals(item.draftId);

    print('📝 DRAFT ITEM: Updated item #${item.id} in draft #${item.draftId}');
  }

  /// Delete a draft item
  Future<void> deleteDraftItem(int itemId, int draftId) async {
    await _isar.writeTxn(() async {
      await _isar.draftQuotationItems.delete(itemId);
    });

    // Update draft totals
    await _recalculateDraftTotals(draftId);

    print('📝 DRAFT ITEM: Deleted item #$itemId from draft #$draftId');
  }

  /// Recalculate draft totals based on items
  Future<void> _recalculateDraftTotals(int draftId) async {
    final items = await getDraftItems(draftId);
    final draft = await getDraftById(draftId);

    if (draft == null) return;

    double totalQty = 0;
    double netAmount = 0;

    for (final item in items) {
      totalQty += item.quantity;
      netAmount += item.netAmount;
    }

    draft.totalQuantity = totalQty;
    draft.totalItems = items.length;
    draft.netAmount = netAmount;
    draft.grossAmount = netAmount;
    draft.lastModifiedDate = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.draftQuotations.put(draft);
    });

    print('📝 DRAFT: Recalculated totals for draft #$draftId - ${items.length} items, RM $netAmount');
  }

  /// Get draft count for a company/customer
  Future<int> getDraftCount({
    required int companyCode,
    String? customerCode,
  }) async {
    var query = _isar.draftQuotations
        .filter()
        .companyCodeEqualTo(companyCode)
        .statusEqualTo('draft');

    if (customerCode != null) {
      query = query.customerCodeEqualTo(customerCode);
    }

    return await query.count();
  }

  /// Mark draft as converted (when converted to actual quotation)
  Future<void> markDraftAsConverted(int draftId, String quotePreLabel) async {
    final draft = await getDraftById(draftId);
    if (draft == null) return;

    draft.status = 'converted';
    draft.convertedQuotePreLabel = quotePreLabel;
    draft.lastModifiedDate = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.draftQuotations.put(draft);
    });

    print('📝 DRAFT: Marked draft #$draftId as converted to $quotePreLabel');
  }
}
