import 'package:isar/isar.dart';

part 'sync_checkpoint.g.dart';

/// Per-(company, table) sync watermark. Stores the highest server-side
/// LastWriteTimeStamp the client has successfully drained for a given
/// base table, so subsequent delta syncs can pass `lastSync` and pull only
/// new rows.
///
/// Also tracks lastFullSyncAt and lastError for diagnostics.
@collection
class SyncCheckpoint {
  Id id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('tableName')], unique: true, replace: true)
  late int companyCode;

  late String tableName; // e.g. 'In_Stock', 'In_Stock_Uom', etc.

  /// The highest LastWriteTimeStamp seen in a successful sync. Pass this
  /// value as the next call's `lastSync` to drain only delta rows.
  /// Null = never successfully synced.
  DateTime? lastWriteTimeStamp;

  /// Highest keyset cursor drained, for feeds paged by a monotonic id rather
  /// than a timestamp (e.g. MP_Txn_History.Transaction_Id). Null = from 0.
  int? lastCursorId;

  /// Wall-clock time of the last full successful drain.
  DateTime? lastSyncedAt;

  /// Number of rows pulled in the most recent successful drain.
  int? lastRowCount;

  /// Last error message, if the most recent attempt failed.
  String? lastError;
  DateTime? lastErrorAt;
}
