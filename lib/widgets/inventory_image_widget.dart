import 'dart:io';
import 'package:flutter/material.dart';
import '../services/inventory_image_service.dart';
import '../config/app_config.dart';

class InventoryImageWidget extends StatefulWidget {
  final int companyCode;
  final int skuNo;
  final String? uom;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool showLoadingIndicator;

  const InventoryImageWidget({
    Key? key,
    required this.companyCode,
    required this.skuNo,
    required this.uom,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  @override
  State<InventoryImageWidget> createState() => _InventoryImageWidgetState();
}

class _InventoryImageWidgetState extends State<InventoryImageWidget> {
  final InventoryImageService _imageService = InventoryImageService();
  String? _cachedImagePath;
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(InventoryImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.skuNo != widget.skuNo) {
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _cachedImagePath = null;
    });

    try {
      // Initialize image service
      await _imageService.initialize();
      
      // Check if company has image configuration
      if (!_imageService.hasImageConfig(widget.companyCode)) {
        print('🖼️ No image configuration for Company ${widget.companyCode}');
        setState(() {
          _isLoading = false;
          _hasError = false; // Not an error, just no config available
        });
        return;
      }

      // Get the image URL for this inventory item
      final imageUrl = _imageService.getImageUrl(widget.companyCode, widget.skuNo, widget.uom);
      
      if (imageUrl == null) {
        // No image URL could be constructed - show placeholder
        print('🖼️ No image URL available for Company ${widget.companyCode}, SKU ${widget.skuNo}, UOM ${widget.uom}');
        setState(() {
          _isLoading = false;
          _hasError = false; // Not an error, just no image available
        });
        return;
      }

      // Check if image is cached
      print('🔍 Checking cache for: Company ${widget.companyCode}, SKU ${widget.skuNo}, UOM ${widget.uom}');
      print('🔍 Image URL: $imageUrl');
      
      final cachedPath = await _imageService.getCachedImagePath(imageUrl, widget.companyCode, widget.skuNo);
      
      if (cachedPath != null) {
        // Image is cached, use local file
        print('✅ Found cached image at: $cachedPath');
        final file = File(cachedPath);
        final exists = await file.exists();
        print('📁 File exists: $exists');
        
        setState(() {
          _cachedImagePath = cachedPath;
          _isLoading = false;
        });
      } else {
        // Image not cached, try to download it
        print('⬇️ Image not cached, attempting download...');
        final downloadedPath = await _imageService.downloadAndCacheImage(imageUrl, widget.companyCode, widget.skuNo, widget.uom);
        
        if (downloadedPath != null) {
          print('✅ Downloaded and cached image at: $downloadedPath');
          setState(() {
            _cachedImagePath = downloadedPath;
            _isLoading = false;
          });
        } else {
          // Download failed - show placeholder instead of error
          print('🖼️ Failed to download image for Company ${widget.companyCode}, SKU ${widget.skuNo}, UOM ${widget.uom}, showing placeholder');
          setState(() {
            _isLoading = false;
            _hasError = false; // Show placeholder instead of error state
          });
        }
      }
    } catch (e) {
      print('❌ Error loading image for Company ${widget.companyCode}, SKU ${widget.skuNo}, UOM ${widget.uom}: $e');
      // Always show placeholder instead of error state
      setState(() {
        _isLoading = false;
        _hasError = false; // Show placeholder instead of error state
      });
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: widget.borderRadius,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final iconSize = size.width > 0 ? size.width * 0.3 : 32.0;
          
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isLoading && widget.showLoadingIndicator) ...[
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
              ] else ...[
                Icon(
                  Icons.inventory_2_outlined,
                  size: iconSize.clamp(16.0, 48.0),
                  color: Colors.grey[500],
                ),
                const SizedBox(height: 4),
                Text(
                  'No Image',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: widget.borderRadius,
        border: Border.all(color: Colors.red[200]!),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;
          final iconSize = size.width > 0 ? size.width * 0.3 : 32.0;
          
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: iconSize.clamp(16.0, 48.0),
                color: Colors.red[400],
              ),
              const SizedBox(height: 4),
              Text(
                'No Image',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red[600],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCachedImage() {
    if (_cachedImagePath == null) {
      return _buildPlaceholder();
    }

    final imageFile = File(_cachedImagePath!);
    
    return Container(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: widget.borderRadius ?? BorderRadius.zero,
        child: Image.file(
          imageFile,
          fit: widget.fit,
          errorBuilder: (context, error, stackTrace) {
            print('❌ Error displaying cached image: $error');
            return _buildPlaceholder(); // Show placeholder instead of error
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If there's an error, show error widget
    if (_hasError) {
      return _buildErrorWidget();
    }

    // If loading, show placeholder with loading indicator
    if (_isLoading) {
      return _buildPlaceholder();
    }

    // Show cached image or placeholder
    return _buildCachedImage();
  }
}
