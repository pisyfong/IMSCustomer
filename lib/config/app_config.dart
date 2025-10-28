/// Application configuration for backend endpoints
class AppConfig {
  // Environment settings
  static const bool _isDevelopment = true; // Set to false for production
  
  // Backend domains
  static const String _productionDomain = 'fungseng.dyndns.org';
  static const String _developmentDomain = '192.168.16.12';//'10.0.2.2'; // Android emulator localhost
 
  // Ports
  static const int _productionPort = 1194;
  static const int _developmentPort = 1194; // Change if your local server uses different port
  static const int _apiPort = 3001; // HTTP API server port (Node.js REST API)
  
  // Protocol
  static const String _protocol = 'http'; // Change to 'https' if needed
  
  // Debug settings
  static const bool _showDebugInfo = false; // Set to false to hide debug dialogs/info
  
  /// Get the current backend domain based on environment
  static String get domain => _isDevelopment ? _developmentDomain : _productionDomain;
  
  /// Get the current port based on environment
  static int get port => _isDevelopment ? _developmentPort : _productionPort;
  
  /// Get the full base URL for the backend
  static String get baseUrl => '$_protocol://$domain:$port';
  
  /// Get the API base URL (for HTTP REST API)
  static String get apiBaseUrl => '$_protocol://$domain:$_apiPort';
  
  /// Get SignalR Hub URL
  static String getSignalRHubUrl() {
    return '$baseUrl/synchub';
  }

  /// Get SignalR Hub URL (legacy property for backward compatibility)
  static String get signalRUrl => getSignalRHubUrl();

  // Image Base URL (for inventory images)
  static String getImageBaseUrl() {
    return baseUrl;
  }
  
  /// Whether to show debug information and dialogs
  static bool get showDebugInfo => _showDebugInfo;
  
  // Sync configuration
  static const int _periodicSyncMinutes = 1; // Set to 1 minute for testing, 5 for production
  static const int _databaseMonitorSeconds = 5; // Server-side database monitoring interval
  
  /// Get periodic sync interval in minutes
  static int get periodicSyncMinutes => _periodicSyncMinutes;
  
  /// Get periodic sync interval in milliseconds
  static int get periodicSyncMilliseconds => _periodicSyncMinutes * 60 * 1000;
  
  /// Get database monitor interval in seconds
  static int get databaseMonitorSeconds => _databaseMonitorSeconds;
  
  /// Get environment info for debugging
  static String get environment => _isDevelopment ? 'Development' : 'Production';
  
  /// Print current configuration (useful for debugging)
  static void printConfig() {
    print('=== App Configuration ===');
    print('Environment: $environment');
    print('Domain: $domain');
    print('Port: $port');
    print('Base URL: $baseUrl');
    print('SignalR URL: $signalRUrl');
    print('Image Base URL: ${getImageBaseUrl()}');
    print('========================');
  }
}
