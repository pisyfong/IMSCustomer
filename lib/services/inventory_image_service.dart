import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:isar/isar.dart';
import '../config/company_image_config.dart';
import '../models/in_stock_uom.dart';
import '../main.dart';

class InventoryImageService {
  static final InventoryImageService _instance = InventoryImageService._internal();
  factory InventoryImageService() => _instance;
  InventoryImageService._internal();
  
  Directory? _imageDirectory;
  final Set<String> _downloadingImages = {};

  // Initialize the image directory
  Future<void> initialize() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      _imageDirectory = Directory(path.join(appDir.path, 'inventory_images'));
      
      if (!await _imageDirectory!.exists()) {
        await _imageDirectory!.create(recursive: true);
        print('📁 Inventory image directory created: ${_imageDirectory!.path}');
      }
      
      print('✅ Inventory image service initialized');
    } catch (e) {
      print('❌ Failed to initialize inventory image service: $e');
    }
  }

  // Public: Find a working UOM for displaying an image (HTTP 200 on HEAD)
  Future<String?> findWorkingUomForImage(int companyCode, int skuNo) async {
    return await _findWorkingUomForSync(companyCode, skuNo);
  }

  // Public: Download image for a SKU using smart UOM detection and return local path
  Future<String?> downloadImageWithSmartUom(int companyCode, int skuNo) async {
    try {
      final workingUom = await _findWorkingUomForSync(companyCode, skuNo);
      if (workingUom == null) return null;

      final imageUrl = getImageUrl(companyCode, skuNo, workingUom);
      if (imageUrl == null) return null;

      return await downloadAndCacheImage(imageUrl, companyCode, skuNo, workingUom);
    } catch (e) {
      print('❌ Error in downloadImageWithSmartUom for SKU $skuNo: $e');
      return null;
    }
  }

  // Get image URL for an inventory item using company-specific configuration
  String? getImageUrl(int companyCode, int skuNo, String? uom) {
    return CompanyImageConfig.constructImageUrl(companyCode, skuNo, uom);
  }

  // Check if company has image configuration
  bool hasImageConfig(int companyCode) {
    return CompanyImageConfig.hasImageConfig(companyCode);
  }

  // Get local file path for an image with company code and SKU prefix to ensure uniqueness
  String _getLocalImagePath(String imagePath, int companyCode, int skuNo) {
    final fileName = path.basename(imagePath);
    final extension = path.extension(fileName);
    final nameWithoutExt = path.basenameWithoutExtension(fileName);
    
    // Create unique filename: COMPANY_SKU_originalname.ext
    final uniqueFileName = '${companyCode}_${skuNo}_${nameWithoutExt}$extension';
    final fullPath = path.join(_imageDirectory!.path, uniqueFileName);
    
    print('🔧 _getLocalImagePath:');
    print('   Input: $imagePath');
    print('   Company: $companyCode, SKU: $skuNo');
    print('   Filename: $fileName');
    print('   Unique: $uniqueFileName');
    print('   Full path: $fullPath');
    
    return fullPath;
  }

  // Check if image is cached locally
  Future<bool> isImageCached(String imagePath, int companyCode, int skuNo) async {
    if (_imageDirectory == null) await initialize();
    
    final localPath = _getLocalImagePath(imagePath, companyCode, skuNo);
    final file = File(localPath);
    final exists = await file.exists();
    
    print('🔍 isImageCached: $exists for $localPath');
    
    return exists;
  }

  // Get cached image path
  Future<String?> getCachedImagePath(String imagePath, int companyCode, int skuNo) async {
    if (await isImageCached(imagePath, companyCode, skuNo)) {
      return _getLocalImagePath(imagePath, companyCode, skuNo);
    }
    return null;
  }

  // Find any cached image for a SKU (offline-first approach)
  Future<String?> findAnyCachedImageForSku(int companyCode, int skuNo) async {
    if (_imageDirectory == null) await initialize();
    
    try {
      if (!await _imageDirectory!.exists()) return null;
      
      // Look for any cached image file that matches the pattern: COMPANY_SKU_*.jpg
      final files = _imageDirectory!.listSync();
      final pattern = '${companyCode}_${skuNo}_';
      
      for (final file in files) {
        if (file is File) {
          final fileName = path.basename(file.path);
          if (fileName.startsWith(pattern) && fileName.endsWith('.jpg')) {
            print('📷 OFFLINE: Found cached image for SKU $skuNo: $fileName');
            return file.path;
          }
        }
      }
      
      print('📷 OFFLINE: No cached image found for SKU $skuNo');
      return null;
    } catch (e) {
      print('❌ OFFLINE: Error checking cached images for SKU $skuNo: $e');
      return null;
    }
  }



  // Download and cache an image using the full image URL
  Future<String?> downloadAndCacheImage(String imageUrl, int companyCode, int skuNo, String? uom) async {
    if (_imageDirectory == null) await initialize();
    
    final imageKey = '${companyCode}_${skuNo}_$uom';
    
    // Prevent multiple downloads of the same image
    if (_downloadingImages.contains(imageKey)) {
      print('🔄 Already downloading image for Company $companyCode, SKU $skuNo, UOM $uom');
      return null;
    }
    
    // Check if already cached
    final cachedPath = await getCachedImagePath(imageUrl, companyCode, skuNo);
    if (cachedPath != null) {
      print('✅ Image already cached for Company $companyCode, SKU $skuNo, UOM $uom');
      return cachedPath;
    }
    
    _downloadingImages.add(imageKey);
    
    try {
      print('📥 Downloading image: $imageUrl');
      
      final response = await http.get(
        Uri.parse(imageUrl),
        headers: {
          'User-Agent': 'IMS Customer App',
        },
      ).timeout(const Duration(seconds: 30));
      
      if (response.statusCode == 200) {
        final localPath = _getLocalImagePath(imageUrl, companyCode, skuNo);
        final file = File(localPath);
        
        await file.writeAsBytes(response.bodyBytes);
        
        print('✅ Image cached successfully: ${path.basename(localPath)}');
        return localPath;
      } else {
        print('❌ Failed to download image: ${response.statusCode} for $imageUrl');
        return null;
      }
    } catch (e) {
      print('❌ Error downloading image: $e');
      return null;
    } finally {
      _downloadingImages.remove(imageKey);
    }
  }

  // Try all available UOMs for a SKU until one returns a successful image download
  Future<String?> _findWorkingUomForSync(int companyCode, int skuNo) async {
    try {
      final isar = Isar.getInstance();
      if (isar == null) {
        print('📷 SYNC: No Isar instance available for SKU $skuNo');
        return null;
      }

      final uomOptions = await isar.inStockUoms
        .filter()
        .companyCodeEqualTo(companyCode)
        .skuNoEqualTo(skuNo)
        .findAll();
      
      if (uomOptions.isEmpty) {
        print('📷 SYNC: No UOM options found for SKU $skuNo');
        return null;
      }
      
      print('📷 SYNC: Testing ${uomOptions.length} UOM options for SKU $skuNo...');
      
      // Try each UOM until we find one that works
      for (final uomOption in uomOptions) {
        final uom = uomOption.uom;
        if (uom == null || uom.trim().isEmpty) continue;
        
        // Check if image exists for this UOM
        final imageUrl = getImageUrl(companyCode, skuNo, uom);
        if (imageUrl == null) continue;
        
        try {
          print('📷 SYNC: Testing UOM "$uom" for SKU $skuNo - $imageUrl');
          
          // Quick HEAD request to check if image exists (don't download full image yet)
          final response = await http.head(Uri.parse(imageUrl));
          if (response.statusCode == 200) {
            print('📷 SYNC: ✅ Found working image for SKU $skuNo with UOM "$uom"');
            return uom;
          } else {
            print('📷 SYNC: ❌ SKU $skuNo UOM "$uom" returned ${response.statusCode}');
          }
        } catch (e) {
          print('📷 SYNC: ❌ SKU $skuNo UOM "$uom" failed: $e');
          continue;
        }
      }
      
      print('📷 SYNC: ⚠️ No working UOM found for SKU $skuNo');
      return null;
    } catch (e) {
      print('❌ SYNC: Error testing UOMs for SKU $skuNo: $e');
      return null;
    }
  }

  // Batch download images for multiple inventory items (with smart UOM detection)
  Future<void> batchDownloadImages(int companyCode, List<Map<String, dynamic>> inventoryItems) async {
    print('📥 Starting SMART batch download for Company $companyCode, ${inventoryItems.length} items...');
    
    final downloadTasks = <Future>[];
    
    for (final item in inventoryItems) {
      final skuNo = item['skuNo'] as int?;
      
      if (skuNo != null) {
        // Instead of using provided UOM, find a working UOM
        downloadTasks.add(_downloadImageWithSmartUom(companyCode, skuNo));
      }
    }
    
    await Future.wait(downloadTasks);
    print('✅ SMART batch download completed');
  }

  // Download image for a SKU using smart UOM detection
  Future<void> _downloadImageWithSmartUom(int companyCode, int skuNo) async {
    try {
      // Find a working UOM for this SKU
      final workingUom = await _findWorkingUomForSync(companyCode, skuNo);
      
      if (workingUom != null) {
        final imageUrl = getImageUrl(companyCode, skuNo, workingUom);
        if (imageUrl != null) {
          print('📷 SYNC: Downloading image for SKU $skuNo with working UOM "$workingUom"');
          await downloadAndCacheImage(imageUrl, companyCode, skuNo, workingUom);
        }
      } else {
        print('📷 SYNC: Skipping SKU $skuNo - no working UOM found');
      }
    } catch (e) {
      print('❌ SYNC: Error downloading image for SKU $skuNo: $e');
    }
  }

  // Clear all cached images
  Future<void> clearCache() async {
    if (_imageDirectory == null) await initialize();
    
    try {
      if (await _imageDirectory!.exists()) {
        await _imageDirectory!.delete(recursive: true);
        await _imageDirectory!.create(recursive: true);
        print('🗑️ Image cache cleared');
      }
    } catch (e) {
      print('❌ Error clearing cache: $e');
    }
  }

  // Get cache size in bytes
  Future<int> getCacheSize() async {
    if (_imageDirectory == null) await initialize();
    
    int totalSize = 0;
    try {
      if (await _imageDirectory!.exists()) {
        final files = _imageDirectory!.listSync();
        for (final file in files) {
          if (file is File) {
            final stat = await file.stat();
            totalSize += stat.size;
          }
        }
      }
    } catch (e) {
      print('❌ Error calculating cache size: $e');
    }
    
    return totalSize;
  }

  // Get human-readable cache size
  Future<String> getCacheSizeFormatted() async {
    final sizeBytes = await getCacheSize();
    if (sizeBytes < 1024) return '${sizeBytes}B';
    if (sizeBytes < 1024 * 1024) return '${(sizeBytes / 1024).toStringAsFixed(1)}KB';
    return '${(sizeBytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  }

  // Debug: List sample cached files
  Future<void> listSampleCachedFiles({int limit = 10}) async {
    if (_imageDirectory == null) await initialize();
    
    try {
      if (_imageDirectory != null && await _imageDirectory!.exists()) {
        print('📁 Cache directory: ${_imageDirectory!.path}');
        final files = _imageDirectory!.listSync();
        print('📁 Total items in directory: ${files.length}');
        
        final imageFiles = files.where((file) => file is File).toList();
        print('📁 Total files: ${imageFiles.length}');
        
        if (imageFiles.isEmpty) {
          print('⚠️ No files found in cache directory!');
          return;
        }
        
        print('📁 Sample cached files (first $limit):');
        for (var file in imageFiles.take(limit)) {
          final fileName = path.basename(file.path);
          final stat = await (file as File).stat();
          print('   ✓ $fileName (${(stat.size / 1024).toStringAsFixed(1)} KB)');
        }
      } else {
        print('❌ Cache directory does not exist!');
      }
    } catch (e) {
      print('❌ Error listing cached files: $e');
    }
  }
  
  // Get statistics about cached images
  Future<Map<String, dynamic>> getCacheStats() async {
    // Ensure directory is initialized
    if (_imageDirectory == null) {
      await initialize();
    }
    
    final size = await getCacheSize();
    final sizeFormatted = await getCacheSizeFormatted();
    
    // Count cached image files
    int totalCachedImages = 0;
    try {
      if (_imageDirectory != null && await _imageDirectory!.exists()) {
        final files = _imageDirectory!.listSync();
        totalCachedImages = files.where((file) => file is File).length;
        print('📊 Image Cache Stats: Found $totalCachedImages files in ${_imageDirectory!.path}');
        
        // List sample files for debugging
        await listSampleCachedFiles(limit: 5);
      } else {
        print('⚠️ Image Cache Stats: Directory does not exist or not initialized');
      }
    } catch (e) {
      print('❌ Image Cache Stats Error: $e');
    }
    
    return {
      'totalCachedImages': totalCachedImages,
      'totalSizeBytes': size,
      'totalSizeFormatted': sizeFormatted,
      'cacheDirectory': _imageDirectory?.path ?? 'Not initialized',
      'configuredCompanies': CompanyImageConfig.getConfiguredCompanies().length,
    };
  }
}
