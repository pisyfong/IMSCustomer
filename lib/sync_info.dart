import 'package:isar/isar.dart';

part 'sync_info.g.dart';

@collection
class SyncInfo {
  Id id = Isar.autoIncrement;
  
  // We'll use a constant ID for the single record
  static const int singletonId = 1;
  
  // Last sync time
  DateTime? lastSyncTime;
  
  // Online status
  bool isOnline = false;
  
  // Create a singleton instance
  static SyncInfo create() {
    return SyncInfo()
      ..id = singletonId
      ..lastSyncTime = DateTime.now()
      ..isOnline = false;
  }
}
