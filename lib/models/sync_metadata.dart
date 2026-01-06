import 'package:isar/isar.dart';

part 'sync_metadata.g.dart';

/// Tracks the last sync timestamp for each entity type per company
/// Used for incremental/delta sync to only fetch changed records
@collection
class SyncMetadata {
  Id id = Isar.autoIncrement;

  @Index(unique: true, composite: [CompositeIndex('entityType')])
  late int companyCode;

  /// Entity type: 'quote', 'quote_item', 'invoice', 'invoice_item', 'inventory', etc.
  late String entityType;

  /// Last successful sync timestamp - used to fetch only records modified after this time
  DateTime? lastSyncTimestamp;

  /// Number of records synced in last sync
  int? lastSyncCount;

  /// Last sync status: 'success', 'partial', 'failed'
  String? lastSyncStatus;

  /// Error message if last sync failed
  String? lastSyncError;

  /// When this metadata was last updated
  DateTime? updatedAt;

  SyncMetadata();

  /// Create a unique key for this sync metadata
  String get uniqueKey => '${companyCode}_$entityType';

  @override
  String toString() {
    return 'SyncMetadata(company: $companyCode, entity: $entityType, lastSync: $lastSyncTimestamp, count: $lastSyncCount)';
  }
}
