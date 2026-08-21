import 'app_config.dart';

/// Where inventory photos come from.
///
/// The base URL lives in [AppConfig] with every other deployment setting. It
/// used to be a hardcoded per-company map here, pointing at our own host —
/// so a customer build kept pulling photos from our server unless someone
/// remembered this second file existed.
///
/// The per-company override map is kept for the rare site that serves
/// different companies from different hosts. It is empty by default, and
/// everything falls through to [AppConfig].
class CompanyImageConfig {
  /// Optional per-company overrides. Leave empty unless one deployment really
  /// does split images across hosts.
  static const Map<int, String> _companyImageBaseUrls = {};

  /// Get the image base URL for a specific company.
  static String? getImageBaseUrl(int companyCode) {
    final override = _companyImageBaseUrls[companyCode];
    if (override != null && override.isNotEmpty) return override;
    final configured = AppConfig.getImageBaseUrl();
    return configured.isEmpty ? null : configured;
  }

  /// Construct the full image URL for an inventory item
  /// Pattern: {companyBaseUrl}/{skuNo}_{uom}.jpg
  static String? constructImageUrl(int companyCode, int skuNo, String? uom) {
    final baseUrl = getImageBaseUrl(companyCode);
    if (baseUrl == null) {
      print('⚠️ No image base URL configured for company code: $companyCode');
      return null;
    }

    if (uom == null || uom.isEmpty) {
      print('⚠️ No UOM provided for SKU $skuNo in company $companyCode');
      return null;
    }

    // Format SKU number with leading zeros (6 digits)
    final formattedSku = skuNo.toString().padLeft(6, '0');
    
    // Construct the image URL: baseUrl/SKUXXXXXX_UOM.jpg
    final imageUrl = '$baseUrl/${formattedSku}_$uom.jpg';
    
    print('🖼️ Constructed image URL: $imageUrl');
    return imageUrl;
  }

  /// Get all configured company codes
  static List<int> getConfiguredCompanies() {
    return _companyImageBaseUrls.keys.toList();
  }

  /// Whether images can be resolved for this company.
  ///
  /// Must ask [getImageBaseUrl], not the override map. The map is empty by
  /// default now that the base URL lives in [AppConfig] — checking it directly
  /// reported "no images" for every company and silently disabled photos
  /// across the whole app.
  static bool hasImageConfig(int companyCode) =>
      getImageBaseUrl(companyCode) != null;

  /// Add or update a company's image base URL (for dynamic configuration)
  static void setImageBaseUrl(int companyCode, String baseUrl) {
    // Note: This would modify a static map, so in production you might want
    // to use a more sophisticated configuration system (database, remote config, etc.)
    print('📝 Setting image base URL for company $companyCode: $baseUrl');
    // For now, we'll just log it since we can't modify const maps at runtime
    // In a real implementation, you'd store this in a database or config file
  }

  /// Get configuration summary for debugging
  static Map<String, dynamic> getConfigSummary() {
    return {
      'configuredCompanies': _companyImageBaseUrls.length,
      'companyMappings': _companyImageBaseUrls,
      'lastUpdated': DateTime.now().toIso8601String(),
    };
  }

  /// Print configuration for debugging
  static void printConfig() {
    print('=== Company Image Configuration ===');
    print('Configured Companies: ${_companyImageBaseUrls.length}');
    _companyImageBaseUrls.forEach((companyCode, baseUrl) {
      print('Company $companyCode: $baseUrl');
    });
    print('===================================');
  }
}
