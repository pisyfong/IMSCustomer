import 'package:isar/isar.dart';

part 'login_cache.g.dart';

/// Model for caching login credentials for offline authentication
@collection
class LoginCache {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String username;
  
  late String passwordHash; // Hashed password for security
  late String userData; // Serialized user data
  late DateTime lastLoginTime;
  
  LoginCache();
}
