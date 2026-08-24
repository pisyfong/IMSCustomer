import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../main.dart';
import '../models/cart_item.dart';
import '../models/in_stock_uom.dart';
import '../services/auth_service.dart';
import '../services/cart_service.dart';
import '../services/qty.dart';
import '../services/scan_resolver.dart';
import '../services/scan_sounds.dart';
import '../services/scan_uom_pref.dart';
import '../services/user_app_settings_service.dart';
import '../theme/app_design.dart';
import '../widgets/number_pad.dart';
import 'cart_page.dart';

/// Where barcodes come from.
enum ScanSource {
  /// The device camera, through mobile_scanner.
  camera,

  /// A hardware barcode engine running in keyboard-wedge mode — the Honeywell
  /// EDA52's laser, and every gun-style scanner. It types the code as
  /// keystrokes and finishes with Enter, so there is nothing to "connect to":
  /// the newline IS the end-of-scan signal.
  wedge,
}

/// Counter-style scanning: the scanner stays armed and every scan adds a unit.
///
/// Deliberately NOT the catalogue with a scanner bolted on. There is no
/// search, no browsing and no per-item sheet, because the job here is the one
/// a checkout operator does — point, beep, next — and every screen that stops
/// to ask something breaks the rhythm. The list below is the real cart, not a
/// staging area: what is scanned is committed immediately, so backing out of
/// this page loses nothing.
class ScanModePage extends StatefulWidget {
  const ScanModePage({Key? key}) : super(key: key);

  @override
  State<ScanModePage> createState() => _ScanModePageState();
}

class _ScanModePageState extends State<ScanModePage> {
  /// Null whenever the camera is not the active source.
  ///
  /// NOT owned by this page. `MobileScanner.dispose()` calls
  /// `controller.dispose()` unconditionally — on the controller handed to it —
  /// and that closes the barcode StreamController for good ("you cannot use
  /// this controller object anymore"). So the widget owns whatever it is
  /// given, and this page must build a FRESH controller every time the
  /// viewfinder is mounted and never dispose one itself.
  MobileScannerController? _controller;

  /// Changes whenever a new controller is built, so the MobileScanner element
  /// is replaced rather than updated. Without a differing key Flutter reuses
  /// the old State, which is still holding the disposed controller.
  int _cameraGeneration = 0;

  final CartService _cart = CartService();
  final ScanSounds _sounds = ScanSounds();
  final _manualCtrl = TextEditingController();

  /// Receives hardware-scanner keystrokes when no text field has focus.
  final FocusNode _wedgeFocus = FocusNode(debugLabel: 'wedge');
  final StringBuffer _wedgeBuffer = StringBuffer();

  ScanSource _source = ScanSource.wedge;

  int _companyCode = 1;
  ScanResolver? _resolver;

  /// See [ScanUomPref]. Held here so the toggle can rebuild the resolver.
  bool _basicUom = ScanUomPref.defaultValue;

  /// `SI_Allow_Change_Price` for this user and company.
  ///
  /// The same permission the cart, the item sheet and the re-order sheet all
  /// check. This screen writes to the same cart they do, so a price that
  /// cannot be changed there must not be changeable here either — otherwise
  /// scan mode is simply the way around the rule.
  ///
  /// Starts false and is relaxed once the answer arrives: a permission that
  /// defaults open is one that grants itself whenever the lookup is slow.
  bool _canChangePrice = false;

  List<CartItem> _lines = [];
  double _total = 0;
  bool _loading = true;

  /// Cart lines in the order they were last scanned, most recent first, keyed
  /// `SKU|UOM`.
  ///
  /// Keyed on the pair and not on the SKU because that is the cart's OWN
  /// identity for a line — `addToCart` dedups on company + SKU + UOM — so one
  /// SKU legitimately has two lines when the same item is booked in two units.
  /// A SKU-keyed map silently drops one of them from the list while it still
  /// counts toward the total.
  ///
  /// Display order ONLY. The cart's own order becomes the quotation's line
  /// sequence at checkout, so re-sorting the stored rows on every scan would
  /// shuffle the document the operator has not even created yet. Keeping the
  /// recency here leaves the cart untouched and still puts the line that just
  /// beeped where the operator is looking.
  final List<String> _recent = [];

  static String _lineKey(int skuNo, String? uom) =>
      '$skuNo|${(uom ?? '').trim().toUpperCase()}';

  /// The cart line touched by the last scan (`SKU|UOM`), highlighted briefly
  /// so the operator can see WHICH line the beep belonged to without reading
  /// the whole list.
  String? _flashKey;
  Timer? _flashTimer;

  /// The pause after a camera scan, and ONLY after a camera scan.
  ///
  /// A camera fires continuously: without a pause, one barcode held in view
  /// adds a unit per frame and a rejected scan re-fires its buzz many times a
  /// second. A hardware scanner has no such problem — nothing is read until
  /// the operator pulls the trigger, so every read is already a deliberate
  /// act, and making them wait two seconds between items would cripple the
  /// exact workflow the wedge exists for.
  static const _cameraCooldown = Duration(seconds: 2);

  /// How long a result stays on screen when nothing is being gated. Long
  /// enough to read, short enough not to trail behind a fast operator.
  static const _wedgeBannerHold = Duration(milliseconds: 1200);

  DateTime _coolUntil = DateTime.fromMillisecondsSinceEpoch(0);
  Timer? _coolTimer;

  /// Only ever true in camera mode; the wedge is never gated.
  bool get _cooling =>
      _source == ScanSource.camera && DateTime.now().isBefore(_coolUntil);

  /// Guards the resolve-and-add path itself. Isar writes are async and neither
  /// the camera nor a wedge waits for them.
  bool _busy = false;

  String? _banner;
  bool _bannerBad = false;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  @override
  void dispose() {
    _flashTimer?.cancel();
    _coolTimer?.cancel();
    _manualCtrl.dispose();
    _wedgeFocus.dispose();
    // Deliberately not disposing _controller: if the viewfinder is on screen
    // the MobileScanner widget disposes it as it unmounts, and doing it twice
    // closes an already-closed stream.
    _sounds.dispose();
    super.dispose();
  }

  Future<void> _boot() async {
    final company = await AuthService().getSelectedCompany();
    final raw = company?['companyCode'] ?? 1;
    _companyCode = raw is String ? int.tryParse(raw) ?? 1 : raw as int;
    _basicUom = await ScanUomPref.load();
    try {
      _canChangePrice = await UserAppSettingsService()
          .canChangePrice(companyCode: _companyCode);
    } catch (_) {
      // Closed on failure, deliberately. See the field.
      _canChangePrice = false;
    }
    print('SCAN MODE: company=$_companyCode basicUomFlag=$_basicUom');
    _resolver = ScanResolver(
        companyCode: _companyCode, preferBasicUom: _basicUom);
    await _sounds.load();
    await _refresh();
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _refresh() async {
    final items = await _cart.getCartItems(companyCode: _companyCode);
    if (!mounted) return;
    setState(() {
      _lines = _inScanOrder(items);
      _total = items.fold<double>(0, (sum, e) => sum + e.gstSubtotal);
    });
  }

  /// Most recently scanned first, whether the scan created the line or added
  /// to one that already existed.
  ///
  /// A counter operator looks at exactly one row — the one that just beeped —
  /// and it must never be the row below the fold. Re-scanning an item the
  /// customer handed over ten items ago is common, and leaving that line
  /// buried reads as the scan having done nothing.
  List<CartItem> _inScanOrder(List<CartItem> items) {
    final remaining = List<CartItem>.of(items);
    final out = <CartItem>[];
    for (final key in _recent) {
      final i =
          remaining.indexWhere((e) => _lineKey(e.skuNo, e.uom) == key);
      if (i >= 0) out.add(remaining.removeAt(i));
    }
    // Anything never scanned this session — added from Browse, or left in the
    // cart from earlier — keeps its own newest-first order underneath.
    out.addAll(remaining.reversed);
    return out;
  }

  /// Moves one cart line to the front of the recency list.
  void _touch(int skuNo, String uom) {
    final key = _lineKey(skuNo, uom);
    _recent.remove(key);
    _recent.insert(0, key);
  }

  // ── Source switching ─────────────────────────────────────────────────────

  Future<void> _setSource(ScanSource next) async {
    if (next == _source) return;
    _wedgeBuffer.clear();
    if (next == ScanSource.camera) {
      // A brand new controller every time, never a cached one. The previous
      // controller was disposed by the MobileScanner widget when the toggle
      // last unmounted it, and reusing it is what made the camera come back
      // dead on the second visit.
      //
      // Built on demand rather than at page load: constructing it opens the
      // camera, and a site that only ever uses the laser should never see a
      // permission prompt.
      setState(() {
        _controller = _newCameraController();
        _cameraGeneration++;
        _source = next;
      });
      // No start() here — MobileScanner starts the controller it is handed,
      // in its own initState. Starting it twice races the platform channel.
    } else {
      await _controller?.stop();
      setState(() {
        // Dropping the reference only. The widget that is about to unmount
        // still holds it and will dispose it.
        _controller = null;
        _source = next;
      });
      _wedgeFocus.requestFocus();
    }
  }

  /// Rebuilds the resolver rather than mutating it — the rule a scan was
  /// resolved under should never change underneath an in-flight scan.
  Future<void> _setBasicUom(bool value) async {
    print('SCAN MODE: basicUomFlag -> $value');
    setState(() {
      _basicUom = value;
      _resolver =
          ScanResolver(companyCode: _companyCode, preferBasicUom: value);
    });
    await ScanUomPref.save(value);
    // Lines already in the cart keep the unit they were booked at. Rewriting
    // them would silently restate quantities the operator has already checked.
  }

  MobileScannerController _newCameraController() => MobileScannerController(
        // Detect the same code repeatedly — re-scanning an item is how a
        // counter adds a second one. `noDuplicates` would silently swallow
        // that, which reads as the scanner having missed it. The cooldown,
        // not the decoder, is what stops runaway repeats.
        detectionSpeed: DetectionSpeed.normal,
        formats: const [
          BarcodeFormat.ean13,
          BarcodeFormat.ean8,
          BarcodeFormat.upcA,
          BarcodeFormat.upcE,
          BarcodeFormat.code39,
          BarcodeFormat.code93,
          BarcodeFormat.code128,
          BarcodeFormat.itf,
          BarcodeFormat.codabar,
          BarcodeFormat.qrCode,
          BarcodeFormat.dataMatrix,
        ],
      );

  // ── Input ────────────────────────────────────────────────────────────────

  void _onDetect(BarcodeCapture capture) {
    if (_source != ScanSource.camera) return;
    final codes = capture.barcodes;
    if (codes.isEmpty) return;
    final value =
        (codes.first.rawValue ?? codes.first.displayValue ?? '').trim();
    if (value.isEmpty) return;
    unawaited(_accept(value));
  }

  /// Assembles keystrokes from a hardware scanner into a barcode.
  ///
  /// A wedge types the code faster than any human and terminates it with
  /// Enter. Newline is therefore the only reliable end-of-code marker — the
  /// length varies by symbology and cannot be used.
  void _onKey(KeyEvent event) {
    if (_source != ScanSource.wedge) return;
    if (event is! KeyDownEvent) return;

    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.numpadEnter) {
      final code = _wedgeBuffer.toString().trim();
      _wedgeBuffer.clear();
      if (code.isNotEmpty) unawaited(_accept(code));
      setState(() {});
      return;
    }

    final ch = event.character;
    if (ch == null || ch.isEmpty) return;
    if (ch == '\n' || ch == '\r') {
      final code = _wedgeBuffer.toString().trim();
      _wedgeBuffer.clear();
      if (code.isNotEmpty) unawaited(_accept(code));
      setState(() {});
      return;
    }
    // Control characters never belong in a barcode.
    if (ch.codeUnitAt(0) < 32) return;
    _wedgeBuffer.write(ch);
    setState(() {});
  }

  Future<void> _manual() async {
    final code = _manualCtrl.text.trim();
    if (code.isEmpty) return;
    _manualCtrl.clear();
    await _accept(code, bypassCooldown: true);
    if (mounted) _wedgeFocus.requestFocus();
  }

  // ── The scan itself ──────────────────────────────────────────────────────

  /// [bypassCooldown] is for deliberate, typed entry. A person pressing Add
  /// twice means two; only the camera's machine-speed repeats need holding
  /// back, and [_cooling] is already false in wedge mode.
  Future<void> _accept(String code, {bool bypassCooldown = false}) async {
    if (_busy || _loading) return;
    if (!bypassCooldown && _cooling) return; // never true on the wedge
    _busy = true;
    try {
      final outcome = await _resolver!.resolve(code);
      if (!mounted) return;

      if (!outcome.ok) {
        // Heavy haptic AND the low tone: the operator is looking at the item,
        // not the screen, so a failure has to be felt and heard.
        HapticFeedback.heavyImpact();
        unawaited(_sounds.fail());
        _report(_reasonFor(code, outcome.failure!), bad: true);
        return;
      }

      final r = outcome.resolution!;
      await _cart.addToCart(
        companyCode: _companyCode,
        skuNo: r.skuNo,
        pluNo: r.pluNo,
        description: r.description,
        uom: r.uom,
        unitPrice: r.unitPrice,
        gstPrice: r.gstPrice,
        factor: r.factor,
        // One scan, one unit — the barcode identifies the item, not an amount.
        quantity: 1,
      );

      HapticFeedback.mediumImpact();
      unawaited(_sounds.ok());
      // Before the refresh, so the rebuilt list already has it on top.
      _touch(r.skuNo, r.uom);
      await _refresh();
      if (!mounted) return;
      _flash(_lineKey(r.skuNo, r.uom));
      _report('${r.description}  ·  ${r.uom}', bad: false);
    } catch (e) {
      if (mounted) {
        unawaited(_sounds.fail());
        _report('Could not add: $e', bad: true);
      }
    } finally {
      _busy = false;
    }
  }

  String _reasonFor(String code, ScanFailure why) {
    switch (why) {
      case ScanFailure.unknownBarcode:
        return 'Not found: $code';
      case ScanFailure.pluWithoutSku:
        return '$code has no item linked';
      case ScanFailure.noMasterRow:
        return '$code has no price — run a sync';
    }
  }

  /// Shows the result, and in camera mode closes scanning for as long as the
  /// banner is up — one act, because there they are one state.
  ///
  /// In wedge mode the banner is purely a message: the trigger stays live
  /// underneath it, so a fast operator can scan the next item before the
  /// previous result has finished being displayed.
  void _report(String message, {required bool bad}) {
    _coolTimer?.cancel();
    final gated = _source == ScanSource.camera;
    final hold = gated ? _cameraCooldown : _wedgeBannerHold;
    setState(() {
      _banner = message;
      _bannerBad = bad;
      if (gated) _coolUntil = DateTime.now().add(_cameraCooldown);
    });
    _coolTimer = Timer(hold, () {
      if (mounted) setState(() => _banner = null);
    });
  }

  void _flash(String key) {
    _flashTimer?.cancel();
    setState(() => _flashKey = key);
    _flashTimer = Timer(const Duration(milliseconds: 900), () {
      if (mounted) setState(() => _flashKey = null);
    });
  }

  // ── Line edits ───────────────────────────────────────────────────────────

  Future<void> _remove(CartItem line) async {
    _recent.remove(_lineKey(line.skuNo, line.uom));
    await _cart.removeFromCart(line.id);
    HapticFeedback.selectionClick();
    await _refresh();
  }

  /// Sets a line's quantity outright.
  ///
  /// Replaces the +/- steppers. Counting to twelve by tapping a 26px circle
  /// twelve times is slow and easy to overshoot, and there was no way to
  /// correct a mis-scan except by tapping back down.
  Future<void> _editQty(CartItem line) async {
    final result = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _NumberSheet(
        title: line.description ?? 'SKU ${line.skuNo}',
        subtitle: 'Quantity in ${line.uom ?? ''}',
        initial: line.quantity,
      ),
    );
    if (result == null || !mounted) return;
    if (result <= 0) {
      await _remove(line);
      return;
    }
    await _cart.updateQuantity(line.id, result);
    await _refresh();
  }

  /// Switches a line to another of the item's units.
  ///
  /// The price follows the unit, because it is per unit — leaving a carton
  /// line at the piece price is the silent undercharge this screen has to
  /// avoid.
  Future<void> _editUom(CartItem line) async {
    final units = await isar.inStockUoms
        .filter()
        .companyCodeEqualTo(_companyCode)
        .skuNoEqualTo(line.skuNo)
        .findAll();
    if (!mounted) return;
    if (units.length < 2) {
      _report('${line.description ?? 'SKU ${line.skuNo}'} has one unit only',
          bad: true);
      return;
    }
    final picked = await showModalBottomSheet<InStockUom>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _UomSheet(units: units, current: line.uom ?? ''),
    );
    if (picked == null || !mounted) return;
    final gst = picked.gstPrice ?? picked.price ?? 0;
    await _cart.updateUom(
      line.id,
      uom: (picked.uom ?? '').trim(),
      factor: picked.factor ?? 1,
      gstPrice: gst,
      unitPrice: picked.price ?? (gst > 0 ? gst / 1.06 : 0),
    );
    // The line's identity changed, so its place in the recency list must too,
    // or it drops to the bottom of a list it is still the newest entry in.
    _touch(line.skuNo, (picked.uom ?? '').trim());
    await _refresh();
  }

  /// Prices are negotiated at the counter, so the scanned price is a starting
  /// point rather than a verdict. Uses the in-app keypad, not the OS keyboard:
  /// iOS's number pad has no decimal point at all, so a price cannot be typed
  /// on it.
  Future<void> _editPrice(CartItem line) async {
    if (!_canChangePrice) {
      HapticFeedback.heavyImpact();
      _report('You do not have permission to edit prices', bad: true);
      return;
    }
    final result = await showModalBottomSheet<double>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _NumberSheet(
        title: line.description ?? 'SKU ${line.skuNo}',
        subtitle: 'Price per ${line.uom ?? ''}',
        initial: line.gstPrice ?? 0,
      ),
    );
    if (result == null || !mounted) return;
    await _cart.updatePrice(line.id, result);
    await _refresh();
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    // KeyboardListener, not a hidden TextField: a text field would raise the
    // soft keyboard over half the screen on every device that has one, and the
    // wedge does not need it.
    return KeyboardListener(
      focusNode: _wedgeFocus,
      autofocus: true,
      onKeyEvent: _onKey,
      child: Scaffold(
        backgroundColor: AppDesign.bg,
        appBar: AppBar(
          title: const Text('Scan mode',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppDesign.ink)),
          backgroundColor: AppDesign.surface,
          foregroundColor: AppDesign.ink,
          elevation: 0,
          scrolledUnderElevation: 0,
          shape: const Border(bottom: BorderSide(color: AppDesign.border)),
          actions: [
            _uomPill(),
            if (_source == ScanSource.camera) ...[
              IconButton(
                tooltip: 'Torch',
                icon: const Icon(Icons.flashlight_on_outlined, size: 20),
                onPressed: () => _controller?.toggleTorch(),
              ),
              IconButton(
                tooltip: 'Switch camera',
                icon: const Icon(Icons.cameraswitch_outlined, size: 20),
                onPressed: () => _controller?.switchCamera(),
              ),
            ],
          ],
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  _sourceToggle(),
                  if (_source == ScanSource.camera)
                    _viewfinder()
                  else
                    _wedgePanel(),
                  _manualRow(),
                  Expanded(child: _list()),
                ],
              ),
        bottomNavigationBar: _loading ? null : _footer(),
      ),
    );
  }

  /// The basic-UOM flag, as a pill in the app bar.
  ///
  /// A whole switch row was costing a fifth of the list's height on a
  /// handheld, to carry a setting that is chosen once and then left alone.
  /// The pill states which rule is live rather than offering an abstract
  /// on/off, so it reads correctly without a label beside it.
  Widget _uomPill() {
    final on = _basicUom;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: Tooltip(
        message: on
            ? "Booking in each item's basic UOM — tap to use the "
                "barcode's own unit"
            : "Booking in the barcode's own unit — tap to use each item's "
                'basic UOM',
        child: GestureDetector(
          onTap: () => _setBasicUom(!on),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
            decoration: BoxDecoration(
              color: on ? AppDesign.modOrdering : AppDesign.bg,
              borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              border: Border.all(
                  color: on ? AppDesign.modOrdering : AppDesign.borderStrong),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.straighten,
                    size: 12,
                    color: on ? Colors.white : AppDesign.inkMuted),
                const SizedBox(width: 4),
                Text(on ? 'BASIC UOM' : 'PLU UOM',
                    style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.3,
                        color: on ? Colors.white : AppDesign.inkMuted)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sourceToggle() {
    Widget half(ScanSource s, IconData icon, String label) {
      final on = s == _source;
      return Expanded(
        child: GestureDetector(
          onTap: () => _setSource(s),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: on ? AppDesign.modOrdering : AppDesign.surface,
              borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              border: Border.all(
                  color: on ? AppDesign.modOrdering : AppDesign.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    size: 12, color: on ? Colors.white : AppDesign.inkMuted),
                const SizedBox(width: 4),
                Text(label,
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        color: on ? Colors.white : AppDesign.inkMuted)),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      color: AppDesign.surface,
      child: Row(
        children: [
          half(ScanSource.wedge, Icons.barcode_reader, 'Scanner'),
          half(ScanSource.camera, Icons.photo_camera_outlined, 'Camera'),
        ],
      ),
    );
  }

  /// The wedge has no preview to show, so this shows the two things that are
  /// actually in doubt: that the page is listening, and what it has received
  /// so far.
  Widget _wedgePanel() {
    final buffered = _wedgeBuffer.toString();
    final armed = !_cooling;
    return Container(
      height: 132,
      width: double.infinity,
      color: AppDesign.ink,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(armed ? Icons.barcode_reader : Icons.hourglass_top,
                    size: 30,
                    color: armed ? Colors.white : Colors.white38),
                const SizedBox(height: 8),
                Text(
                  buffered.isNotEmpty
                      ? buffered
                      : armed
                          ? 'Ready — pull the trigger'
                          : 'Wait…',
                  style: TextStyle(
                      fontSize: buffered.isNotEmpty ? 15 : 12.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: buffered.isNotEmpty ? 1.2 : 0,
                      color: armed ? Colors.white : Colors.white38),
                ),
              ],
            ),
          ),
          if (_banner != null) _bannerBar(),
        ],
      ),
    );
  }

  /// Height of the preview strip. Named because the scan window is derived
  /// from it and the two must agree.
  static const double _viewfinderHeight = 200;

  Widget _viewfinder() {
    return SizedBox(
      height: _viewfinderHeight,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // ONE rectangle, used for both the cut-out that is drawn and the
          // scanWindow that is enforced. Computing them separately is how a
          // reticle ends up lying about where the scanner is actually looking.
          final width = constraints.maxWidth;
          final box = Rect.fromCenter(
            center: Offset(width / 2, _viewfinderHeight / 2),
            // Never wider than the strip, so a narrow handheld does not get a
            // window clipped by its own edges.
            width: width - 60 < 250 ? width - 60 : 250,
            height: 104,
          );

          return Stack(
            fit: StackFit.expand,
            children: [
              MobileScanner(
                key: ValueKey<int>(_cameraGeneration),
                controller: _controller!,
                onDetect: _onDetect,
                // Barcodes outside this rectangle are ignored by the decoder,
                // not merely by us. On a shelf of neighbouring products that is
                // the difference between scanning the item held up and scanning
                // whatever else drifted into frame.
                scanWindow: box,
                errorBuilder: (context, error, _) => Container(
                  color: AppDesign.ink,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Camera unavailable.\nSwitch to the barcode scanner, '
                    'or type the code below.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, color: Colors.white70, height: 1.5),
                  ),
                ),
              ),
              // Dimming everything outside the window is what makes the limit
              // legible. A bare outline reads as decoration, and the operator
              // keeps presenting items to the wrong part of the frame.
              IgnorePointer(
                child: CustomPaint(
                  painter: _ScanWindowPainter(box: box, armed: !_cooling),
                ),
              ),
              if (_banner != null) _bannerBar(),
            ],
          );
        },
      ),
    );
  }

  Widget _bannerBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        color: _bannerBad ? AppDesign.danger : AppDesign.success,
        child: Row(
          children: [
            Icon(_bannerBad ? Icons.error_outline : Icons.check_circle,
                size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(_banner!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  /// Every counter needs this. Barcodes are torn, frozen over, or printed on a
  /// curve, and without a way in by hand the operator has to abandon the mode.
  Widget _manualRow() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      color: AppDesign.surface,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _manualCtrl,
              keyboardType: const TextInputType.numberWithOptions(),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _manual(),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Type barcode',
                hintStyle:
                    const TextStyle(fontSize: 12, color: AppDesign.inkSubtle),
                prefixIcon: const Icon(Icons.keyboard_alt_outlined, size: 18),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: _manual,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modOrdering,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
              ),
              child: const Text('Add',
                  style:
                      TextStyle(fontSize: 12.5, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list() {
    if (_lines.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Nothing scanned yet.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.5, color: AppDesign.inkSubtle, height: 1.6),
          ),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(8, 4, 6, 8),
      itemCount: _lines.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: AppDesign.divider),
      itemBuilder: (context, i) => _row(_lines[i]),
    );
  }

  Widget _row(CartItem line) {
    final hot = _lineKey(line.skuNo, line.uom) == _flashKey;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.fromLTRB(8, 5, 4, 5),
      decoration: BoxDecoration(
        color: hot ? const Color(0xFFECFDF5) : Colors.transparent,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Line 1: what it is, wrapping to a second line on its own
                // when one is not enough.
                //
                // `Description` is a 50-character column and plenty of items
                // use all of it. They also front-load the code
                // ("HX-7290S/25M FLOOR COVERING SPONGE 1.1MMX183"), so a
                // clipped tail is frequently the half that tells two
                // neighbouring items apart — HW-6" and HW-8" SHARPENING STONE
                // differ only near the end. Two lines hold 50 characters
                // comfortably, so the ellipsis should never actually appear;
                // it stays as the backstop for a description longer than the
                // column is supposed to allow.
                Text(line.description ?? 'SKU ${line.skuNo}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 1.15,
                        color: AppDesign.ink)),
                const SizedBox(height: 1),
                // Line 2: the numbers, in the order they are read — what unit,
                // how many, at what each, worth what. Scaled down rather than
                // wrapped, so every row stays exactly two lines tall and the
                // list reads as a column.
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Unit, quantity and price are all set the same way —
                      // tap the value. Three different interaction models on
                      // one row (steppers here, a sheet there, a plain label
                      // elsewhere) is what makes an operator hunt.
                      _tappable(
                        onTap: () => _editUom(line),
                        child: Text(line.uom ?? '', style: _editable),
                      ),
                      _sep,
                      Text('Qty ', style: _meta),
                      _tappable(
                        onTap: () => _editQty(line),
                        child: Text(Qty.fmt(line.quantity),
                            style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w900,
                                color: AppDesign.accentInk,
                                decoration: TextDecoration.underline,
                                decorationColor: AppDesign.accentInk)),
                      ),
                      _sep,
                      // The unit price is a button and looks like one —
                      // underlined, in the accent. A tappable price that looks
                      // like a label is a price nobody discovers they can
                      // change.
                      // Underlined only when it can actually be changed. An
                      // affordance that is offered and then refused teaches
                      // the operator to distrust every other one on the row.
                      _tappable(
                        onTap: () => _editPrice(line),
                        child: Text(
                            'RM ${(line.gstPrice ?? 0).toStringAsFixed(2)}',
                            style: _canChangePrice
                                ? _editable
                                : _meta.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w800)),
                      ),
                      _sep,
                      Text('RM ${line.gstSubtotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w900,
                              color: AppDesign.success)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 26,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.close,
                  size: 15, color: AppDesign.inkSubtle),
              onPressed: () => _remove(line),
            ),
          ),
        ],
      ),
    );
  }

  /// Wraps an editable value so its whole area is tappable, not just the
  /// glyphs. An 11pt number is a small target on a handheld.
  Widget _tappable({required VoidCallback onTap, required Widget child}) =>
      GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
          child: child,
        ),
      );

  static const TextStyle _editable = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w800,
      color: AppDesign.accentInk,
      decoration: TextDecoration.underline,
      decorationColor: AppDesign.accentInk);

  static const TextStyle _meta = TextStyle(
      fontSize: 10.5, fontWeight: FontWeight.w600, color: AppDesign.inkMuted);

  /// The divider between metadata fields. One instance, so the spacing cannot
  /// drift between them.
  static const Widget _sep = Text('  |  ',
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w600, color: AppDesign.border));

  Widget _footer() {
    final count = _lines.length;
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: const BoxDecoration(
        color: AppDesign.surface,
        border: Border(top: BorderSide(color: AppDesign.border)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$count line${count == 1 ? '' : 's'}',
                      style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: AppDesign.inkMuted)),
                  Text('RM ${_total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.4,
                          color: AppDesign.success)),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: count == 0 ? null : _openCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDesign.modOrdering,
                disabledBackgroundColor: AppDesign.borderStrong,
                foregroundColor: Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.radius)),
              ),
              icon: const Icon(Icons.shopping_cart_checkout, size: 17),
              label: const Text('Review cart',
                  style:
                      TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openCart() async {
    // The camera is deliberately left running. Pushing a route does not
    // unmount the viewfinder, so MobileScanner keeps ownership and its own
    // lifecycle observer handles a real backgrounding. Stopping it here and
    // restarting on return was an extra start/stop cycle with nothing to gain
    // — the cart page has no camera of its own to conflict with.
    await Navigator.push(
        context, MaterialPageRoute(builder: (_) => const CartPage()));
    if (!mounted) return;
    if (_source == ScanSource.wedge) _wedgeFocus.requestFocus();
    await _refresh();
  }
}

/// Sets one number — a price or a quantity — on the in-app keypad.
///
/// One sheet for both because they are the same act: replace a value the
/// scanner guessed. The OS keyboard is not an option for either — on iOS
/// `TextInputType.number` renders a pad with no decimal point at all.
class _NumberSheet extends StatefulWidget {
  final String title;
  final String subtitle;
  final double initial;

  const _NumberSheet({
    required this.title,
    required this.subtitle,
    required this.initial,
  });

  @override
  State<_NumberSheet> createState() => _NumberSheetState();
}

class _NumberSheetState extends State<_NumberSheet> {
  late final TextEditingController _ctrl =
      TextEditingController(text: widget.initial.toStringAsFixed(2));
  late final NumberPadBuffer _buffer = NumberPadBuffer(_ctrl);

  @override
  void initState() {
    super.initState();
    // The first key REPLACES rather than appends: the operator is setting a
    // new price, not editing digits onto the old one.
    _buffer.select();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _done() {
    final v = double.tryParse(_ctrl.text.trim());
    Navigator.pop(context, v != null && v >= 0 ? v : null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppDesign.bg,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppDesign.radiusLg)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppDesign.borderStrong,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  Text(widget.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(widget.subtitle,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppDesign.inkMuted)),
                  const SizedBox(height: 10),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _ctrl,
                    builder: (_, v, __) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppDesign.surface,
                        borderRadius:
                            BorderRadius.circular(AppDesign.radiusSm),
                        border: Border.all(color: AppDesign.border),
                      ),
                      child: Text(
                        v.text.isEmpty ? '0' : v.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.6,
                            color: AppDesign.accentInk),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            NumberPad(
              accent: AppDesign.modOrdering,
              onDigit: _buffer.digit,
              onDecimal: _buffer.decimal,
              onBackspace: _buffer.backspace,
              onClear: _buffer.clear,
              onDone: _done,
            ),
          ],
        ),
      ),
    );
  }
}

/// Dims the frame outside the scan window and marks its corners.
class _ScanWindowPainter extends CustomPainter {
  final Rect box;

  /// False during the post-scan cooldown, when nothing is being read.
  final bool armed;

  const _ScanWindowPainter({required this.box, required this.armed});

  @override
  void paint(Canvas canvas, Size size) {
    final rrect =
        RRect.fromRectAndRadius(box, const Radius.circular(AppDesign.radiusSm));

    // Punch the window out of a dim sheet covering the whole preview.
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Offset.zero & size),
        Path()..addRRect(rrect),
      ),
      Paint()..color = Colors.black.withOpacity(armed ? 0.55 : 0.72),
    );

    final edge = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = armed ? Colors.white.withOpacity(0.9) : Colors.white24;
    canvas.drawRRect(rrect, edge);

    if (!armed) return;

    // Corner ticks: they read as "aim here" in a way a plain rectangle does
    // not, and they survive being drawn over a busy image.
    final tick = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..color = AppDesign.success;
    const len = 18.0;
    void corner(Offset at, double dx, double dy) {
      canvas.drawLine(at, at.translate(dx * len, 0), tick);
      canvas.drawLine(at, at.translate(0, dy * len), tick);
    }

    corner(box.topLeft, 1, 1);
    corner(box.topRight, -1, 1);
    corner(box.bottomLeft, 1, -1);
    corner(box.bottomRight, -1, -1);
  }

  @override
  bool shouldRepaint(_ScanWindowPainter old) =>
      old.box != box || old.armed != armed;
}


/// Picks which of an item's units a cart line is booked in.
///
/// Lists every unit the item actually has, with its pack size and its own
/// price, because the price is the consequence the operator is really
/// choosing — the same goods at CTN or EA differ by the factor, and picking
/// blind is how a carton goes out at a piece price.
class _UomSheet extends StatelessWidget {
  final List<InStockUom> units;
  final String current;

  const _UomSheet({required this.units, required this.current});

  @override
  Widget build(BuildContext context) {
    final sorted = List<InStockUom>.of(units)
      ..sort((a, b) => (a.factor ?? 1).compareTo(b.factor ?? 1));
    return Container(
      decoration: const BoxDecoration(
        color: AppDesign.bg,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(AppDesign.radiusLg)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppDesign.borderStrong,
                borderRadius: BorderRadius.circular(AppDesign.radiusPill),
              ),
            ),
            const Text('Unit of measure',
                style:
                    TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            for (final u in sorted) _row(context, u),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, InStockUom u) {
    final name = (u.uom ?? '').trim();
    final on = name.toUpperCase() == current.trim().toUpperCase();
    final factor = u.factor ?? 1;
    final price = u.gstPrice ?? u.price ?? 0;
    return InkWell(
      onTap: on ? null : () => Navigator.pop(context, u),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        color: on ? AppDesign.modOrderingBg : Colors.transparent,
        child: Row(
          children: [
            Icon(on ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 16,
                color: on ? AppDesign.modOrdering : AppDesign.inkSubtle),
            const SizedBox(width: 10),
            Expanded(
              child: Text(name,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: on ? AppDesign.modOrdering : AppDesign.ink)),
            ),
            if (factor != 1) ...[
              Text('x${Qty.fmt(factor)}',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppDesign.inkMuted)),
              const SizedBox(width: 10),
            ],
            Text('RM ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w900,
                    color: AppDesign.success)),
          ],
        ),
      ),
    );
  }
}
