import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  // Accept every symbology mobile_scanner supports, including QR. Passing
  // an explicit list forces the underlying zxing/MLKit decoder to enable
  // all of them (otherwise some builds default to only common 1D formats).
  final MobileScannerController _controller = MobileScannerController(
    formats: const [
      BarcodeFormat.qrCode,
      BarcodeFormat.dataMatrix,
      BarcodeFormat.pdf417,
      BarcodeFormat.aztec,
      BarcodeFormat.ean13,
      BarcodeFormat.ean8,
      BarcodeFormat.upcA,
      BarcodeFormat.upcE,
      BarcodeFormat.code39,
      BarcodeFormat.code93,
      BarcodeFormat.code128,
      BarcodeFormat.itf,
      BarcodeFormat.codabar,
    ],
  );
  bool _returned = false;
  String? _lastCode;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_returned) return;
    final codes = capture.barcodes;
    if (codes.isEmpty) return;
    final value = codes.first.rawValue ?? codes.first.displayValue;
    if (value == null || value.isEmpty) return;
    // Prevent duplicate pops
    if (value == _lastCode) return;
    _lastCode = value;
    _returned = true;
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Code'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => _controller.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => _controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.9), width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
