/// Company-specific image configuration for inventory items
class CompanyImageConfig {
  // Company image base URL mappings
  static const Map<int, String> _companyImageBaseUrls = {
    1: 'http://fungseng.dyndns.org:88/ItemMasterImages', 
    // Add more companies as needed
    // 2: 'http://another-server.com/images',
    // 3: 'http://third-server.com/inventory',
  };

  /// Get the image base URL for a specific company
  static String? getImageBaseUrl(int companyCode) {
    return _companyImageBaseUrls[companyCode];
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

  /// Check if a company has image configuration
  static bool hasImageConfig(int companyCode) {
    return _companyImageBaseUrls.containsKey(companyCode);
  }

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
