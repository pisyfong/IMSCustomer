/// Application configuration for backend endpoints.
///
/// ─────────────────────────────────────────────────────────────────────────
///  EVERYTHING A DEPLOYMENT NEEDS TO CHANGE IS IN THE BLOCK BELOW.
///  Set `_isDevelopment` and fill in the matching host/port, then rebuild.
/// ─────────────────────────────────────────────────────────────────────────
///
/// `printConfig()` logs the resolved values at startup — check that line
/// before handing a device over. It is the only reliable answer to "which
/// server is this handheld actually talking to".
class AppConfig {
  // ═══ DEPLOYMENT SETTINGS ════════════════════════════════════════════════

  /// `false` for a customer build.
  static const bool _isDevelopment = false; 

  // ── Development ──
  static const String _developmentDomain = '192.168.16.75';
  static const int _developmentPort = 2007;

  // ── Production: MDS Medan ──
  // MUST be the customer's own server. This used to hold one of our own
  // dyndns hosts, which meant flipping `_isDevelopment` moved a device from
  // one of our servers to another instead of onto the customer's.
  //
  // HOST ONLY — no scheme, no port. `baseUrl` is built as
  // '$_protocol://$domain:$port', so a 'http://' here composes to
  // 'http://http://…:1194' and the app reaches nothing.
  static const String _productionDomain = 'fungseng.dyndns.org';
  static const int _productionPort = 1194;

  /// 'http' or 'https'.
  static const String _protocol = 'http';

  // ── Inventory photos ──
  // A SEPARATE web server from the API — the Node backend serves no images.
  // Split dev/prod like the domain above, because a customer without an image
  // server must not force us to blank the dev one too.
  //
  // Blank = no photos. The app shows its placeholder and skips the image
  // preload; nothing errors. That is the correct setting for a site that has
  // no image server, and is better than pointing at one that isn't there.
  static const String _developmentImageBaseUrl =
  'http://fungseng.dyndns.org:88/ItemMasterImages';
   //   'http://yeontak.dyndns.org:88/ItemMasterImages';
  //  'http://mdsmedan.getmyip.com:88/ItemMasterImages';

  /// MDS Medan serves item photos from port 88 on the same host as the API.
  /// Blank this if a site has no image server — the app then shows
  /// placeholders and skips the image preload entirely.
  static const String _productionImageBaseUrl =
      'http://fungseng.dyndns.org:88/ItemMasterImages';
      //'http://mdsmedan.getmyip.com:88/ItemMasterImages';

  /// Shared secret sent as `X-API-Key` on the endpoints that mutate stock
  /// documents. Must match `API_KEY` in the server's `.env`; blank on both
  /// sides disables the check.
  ///
  /// Perimeter control only — it ships inside the APK, so treat it as "keeps
  /// the warehouse LAN honest", not as something that makes those endpoints
  /// safe to expose publicly.
  // Matches API_KEY in the customer server's .env. Verified live: a request
  // without it gets 401, with it gets through.
  static const String _apiKey = 'piapi123';

  // ═══ BEHAVIOUR ══════════════════════════════════════════════════════════

  static const bool _showDebugInfo = false;
  static const bool _enableAutoSync = false;

  /// Phase 2 features: adding items that are NOT on a source document, and
  /// splitting a line's loose base units onto their own row.
  ///
  /// OFF for this release. The picking and packing sheets hide their "From
  /// Inventory" tab when this is false, so every line traces to an SQ, a pick
  /// or an invoice. Turning it on without the phase-2 work also turns on the
  /// loose split, which the SI conversion folds back into its pack sibling —
  /// do not flip it to ship a single feature.
  static const bool _enableLooseItems = true;
  // Only used when _enableAutoSync is true; 1 minute is a dev/testing value.
  static const int _periodicSyncMinutes = 5;
  static const int _databaseMonitorSeconds = 5;

  // ═══ DERIVED — nothing below needs editing ══════════════════════════════

  static String get domain => _isDevelopment ? _developmentDomain : _productionDomain;
  static int get port => _isDevelopment ? _developmentPort : _productionPort;

  /// Base URL for the backend (SignalR + REST share a host and port).
  static String get baseUrl => '$_protocol://$domain:$port';

  /// API base URL — same origin today; kept as its own getter so a future
  /// split deployment only has to change here.
  static String get apiBaseUrl => baseUrl;

  static String getSignalRHubUrl() => '$baseUrl/synchub';
  static String get signalRUrl => getSignalRHubUrl();

  /// Base URL for inventory images, or '' when none is configured.
  ///
  /// Deliberately does NOT fall back to the API host: the Node API serves no
  /// images (there is no express.static anywhere in server.js), so falling
  /// back would hand out URLs that always 404 and look like missing photos
  /// rather than missing configuration.
  static String getImageBaseUrl() =>
      _isDevelopment ? _developmentImageBaseUrl : _productionImageBaseUrl;

  /// Whether this build should attempt to load inventory photos at all.
  static bool get hasImages => getImageBaseUrl().isNotEmpty;

  static String get apiKey => _apiKey;

  /// Headers for a JSON call to our own API.
  static Map<String, String> get apiHeaders => {
        'Content-Type': 'application/json',
        if (_apiKey.isNotEmpty) 'X-API-Key': _apiKey,
      };

  static bool get showDebugInfo => _showDebugInfo;
  static bool get enableLooseItems => _enableLooseItems;
  static bool get enableAutoSync => _enableAutoSync;
  static int get periodicSyncMinutes => _periodicSyncMinutes;
  static int get periodicSyncMilliseconds => _periodicSyncMinutes * 60 * 1000;
  static int get databaseMonitorSeconds => _databaseMonitorSeconds;
  static String get environment => _isDevelopment ? 'Development' : 'Production';

  static void printConfig() {
    print('=== App Configuration ===');
    print('Environment: $environment');
    print('Base URL: $baseUrl');
    print('SignalR URL: $signalRUrl');
    print('Image Base URL: ${hasImages ? getImageBaseUrl() : "(none - photos disabled)"}');
    print(
        'API key: ${_apiKey.isEmpty ? "(not set — endpoints unauthenticated)" : "set"}');
    print('========================');
  }
}
