import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../config/company_image_config.dart';

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
    return path.join(_imageDirectory!.path, uniqueFileName);
  }

  // Check if image is cached locally
  Future<bool> isImageCached(String imagePath, int companyCode, int skuNo) async {
    if (_imageDirectory == null) await initialize();
    
    final localPath = _getLocalImagePath(imagePath, companyCode, skuNo);
    final file = File(localPath);
    return await file.exists();
  }

  // Get cached image path
  Future<String?> getCachedImagePath(String imagePath, int companyCode, int skuNo) async {
    if (await isImageCached(imagePath, companyCode, skuNo)) {
      return _getLocalImagePath(imagePath, companyCode, skuNo);
    }
    return null;
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

  // Batch download images for multiple inventory items
  Future<void> batchDownloadImages(int companyCode, List<Map<String, dynamic>> inventoryItems) async {
    print('📥 Starting batch download for Company $companyCode, ${inventoryItems.length} items...');
    
    final downloadTasks = <Future>[];
    
    for (final item in inventoryItems) {
      final skuNo = item['skuNo'] as int?;
      final uom = item['uom'] as String?;
      
      if (skuNo != null && uom != null) {
        final imageUrl = getImageUrl(companyCode, skuNo, uom);
        if (imageUrl != null) {
          downloadTasks.add(downloadAndCacheImage(imageUrl, companyCode, skuNo, uom));
        }
      }
    }
    
    await Future.wait(downloadTasks);
    print('✅ Batch download completed');
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

  // Get statistics about cached images
  Future<Map<String, dynamic>> getCacheStats() async {
    final size = await getCacheSize();
    final sizeFormatted = await getCacheSizeFormatted();
    
    // Count cached image files
    int totalCachedImages = 0;
    if (_imageDirectory != null && await _imageDirectory!.exists()) {
      final files = _imageDirectory!.listSync();
      totalCachedImages = files.where((file) => file is File).length;
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
