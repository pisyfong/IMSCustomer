import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../models/printer_settings.dart';
import '../services/printer_service.dart';
import '../theme/app_design.dart';

/// Receipt-printer setup: choose the transport (a paired Bluetooth printer or
/// a network printer's address), set the paper width and copies, and prove it
/// works with a test print before anyone relies on it.
class PrinterSetupSheet extends StatefulWidget {
  const PrinterSetupSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PrinterSetupSheet(),
    );
  }

  @override
  State<PrinterSetupSheet> createState() => _PrinterSetupSheetState();
}

class _PrinterSetupSheetState extends State<PrinterSetupSheet> {
  final _svc = PrinterService();

  PrinterSettings? _s;
  List<BluetoothInfo> _devices = [];
  bool _loading = true;
  bool _scanning = false;
  bool _testing = false;
  String? _note;

  // Network side
  final _hostCtrl = TextEditingController();
  final _portCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  List<String> _found = [];
  bool _sweeping = false;
  double _sweepProgress = 0;
  String? _netNote;

  @override
  void dispose() {
    for (final c in [_hostCtrl, _portCtrl, _nameCtrl]) {
      c.dispose();
    }
    super.dispose();
  }

  bool get _isNetwork => _s!.transport == PrinterTransport.network;

  /// The typed port, or 9100 when it's blank or out of range. Also what the
  /// "nothing answered" message quotes, so it can never name a port we didn't
  /// actually probe.
  int get _port {
    final v = int.tryParse(_portCtrl.text.trim());
    return (v == null || v < 1 || v > 65535) ? 9100 : v;
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final s = await _svc.settings(refresh: true);
    if (!mounted) return;
    _hostCtrl.text = s.host;
    _portCtrl.text = '${s.port}';
    _nameCtrl.text = s.name;
    setState(() {
      _s = s;
      _loading = false;
    });
    if (s.transport == PrinterTransport.bluetooth) _scan();
  }

  Future<void> _setTransport(PrinterTransport t) async {
    setState(() => _s!.transport = t);
    await _save();
    if (t == PrinterTransport.bluetooth && _devices.isEmpty) {
      _scan();
    } else {
      setState(() => _note = null);
    }
  }

  /// Commits the typed address. Kept explicit rather than saving on every
  /// keystroke — a half-typed IP is not a printer.
  Future<void> _applyNetwork() async {
    final s = _s!;
    setState(() {
      s
        ..host = _hostCtrl.text.trim()
        ..port = _port
        ..name = _nameCtrl.text.trim();
    });
    await _save();
  }

  Future<void> _sweep() async {
    setState(() {
      _sweeping = true;
      _sweepProgress = 0;
      _found = [];
      _netNote = null;
    });
    final port = _port;
    final subnet = await _svc.localSubnet();
    if (subnet == null) {
      if (!mounted) return;
      setState(() {
        _sweeping = false;
        _netNote =
            'No Wi-Fi connection — join the printer\'s network first.';
      });
      return;
    }
    final hits = await _svc.scanNetwork(
      port: port,
      onProgress: (p) {
        if (mounted) setState(() => _sweepProgress = p);
      },
    );
    if (!mounted) return;
    setState(() {
      _found = hits;
      _sweeping = false;
      _netNote = hits.isEmpty
          ? 'Nothing answered on port $port across ${subnet}0/24. Check the '
              'printer is on this Wi-Fi, or type its IP.'
          : null;
    });
  }

  Future<void> _testConnection() async {
    await _applyNetwork();
    final r = await _svc.testConnection();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(r.message),
      backgroundColor: r.ok ? AppDesign.success : AppDesign.danger,
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> _scan() async {
    setState(() {
      _scanning = true;
      _note = null;
    });
    final list = await _svc.pairedPrinters();
    if (!mounted) return;
    setState(() {
      _devices = list;
      _scanning = false;
      // Distinguish "nothing paired" from "the plugin isn't loaded" — the
      // second one looks identical but is fixed by relaunching, not pairing.
      _note = list.isNotEmpty
          ? null
          : _svc.needsRestart
              ? PrinterService.restartMessage
              : 'No paired Bluetooth devices found. Pair the printer in Android '
                  'Settings › Bluetooth first, then tap Refresh.';
    });
  }

  Future<void> _save({bool close = false}) async {
    final s = _s;
    if (s == null) return;
    await _svc.saveSettings(s);
    if (close && mounted) Navigator.pop(context, true);
  }

  Future<void> _select(BluetoothInfo d) async {
    final s = _s!;
    setState(() {
      s
        ..macAddress = d.macAdress
        ..name = d.name;
    });
    await _save();
  }

  Future<void> _test() async {
    setState(() => _testing = true);
    final r = await _svc.printTestPage();
    if (!mounted) return;
    setState(() => _testing = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(r.ok ? 'Test page sent' : r.message),
      backgroundColor: r.ok ? AppDesign.success : AppDesign.danger,
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, controller) => Container(
        decoration: const BoxDecoration(
          color: AppDesign.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(height: 8),
                  Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  _bar(),
                  const Divider(height: 1, color: AppDesign.border),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 24),
                      children: [
                        _sectionLabel('CONNECTION'),
                        _transportSelector(),
                        const SizedBox(height: 14),
                        _sectionLabel('PRINTER'),
                        if (_s!.isConfigured) _currentPrinter(),
                        if (_isNetwork)
                          ..._networkSection()
                        else ...[
                          ..._devices.map(_deviceRow),
                          if (_note != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              child: Text(_note!, style: AppDesign.caption),
                            ),
                        ],
                        const SizedBox(height: 14),
                        _sectionLabel('PAPER'),
                        _paperWidth(),
                        const SizedBox(height: 14),
                        _sectionLabel('OPTIONS'),
                        _copies(),
                        _toggle(
                          'Print barcode',
                          'Adds a scannable CODE128 of the document number',
                          _s!.printBarcode,
                          (v) => setState(() => _s!.printBarcode = v),
                        ),
                        _toggle(
                          'Auto cut',
                          'Ignored by printers without a cutter',
                          _s!.autoCut,
                          (v) => setState(() => _s!.autoCut = v),
                        ),
                        const SizedBox(height: 18),
                        _testButton(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _bar() => Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
        child: Row(
          children: [
            const Icon(Icons.print_outlined, size: 18, color: AppDesign.ink),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('Receipt printer',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
            ),
            if (!_isNetwork)
              TextButton.icon(
                onPressed: _scanning ? null : _scan,
                icon: _scanning
                    ? const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.refresh, size: 15),
                label: const Text('Refresh',
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
              ),
            IconButton(
              tooltip: 'Done',
              icon: const Icon(Icons.close, size: 19),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
      );

  Widget _sectionLabel(String s) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(s, style: AppDesign.micro),
      );

  Widget _currentPrinter() => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          color: AppDesign.accentSoft,
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.accent.withOpacity(0.4)),
        ),
        child: Row(children: [
          const Icon(Icons.check_circle, size: 17, color: AppDesign.accent),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_s!.name.trim().isEmpty ? 'Printer' : _s!.name.trim(),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppDesign.accentInk)),
                Text('${_s!.transport.label} · ${_s!.target}',
                    style: AppDesign.caption),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              await _svc.clearPrinter();
              await _load();
            },
            child: const Text('Remove',
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppDesign.danger)),
          ),
        ]),
      );

  Widget _deviceRow(BluetoothInfo d) {
    final selected = d.macAdress == _s!.macAddress;
    if (selected) return const SizedBox.shrink(); // already shown above
    return InkWell(
      onTap: () => _select(d),
      borderRadius: BorderRadius.circular(AppDesign.radiusSm),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDesign.radiusSm),
          border: Border.all(color: AppDesign.border),
        ),
        child: Row(children: [
          const Icon(Icons.bluetooth, size: 17, color: AppDesign.inkSubtle),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(d.name,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700)),
                Text(d.macAdress, style: AppDesign.caption),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 17, color: AppDesign.inkSubtle),
        ]),
      ),
    );
  }

  /// Bluetooth vs network. Switching doesn't clear the other side's address,
  /// so a bench with both can flip back and forth without re-entering either.
  Widget _transportSelector() => Row(
        children: PrinterTransport.values.map((t) {
          final on = _s!.transport == t;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: t == PrinterTransport.bluetooth ? 6 : 0),
              child: InkWell(
                onTap: () => _setTransport(t),
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: on ? AppDesign.accentSoft : null,
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    border: Border.all(
                        color: on ? AppDesign.accent : AppDesign.border),
                  ),
                  child: Column(children: [
                    Icon(
                        t == PrinterTransport.bluetooth
                            ? Icons.bluetooth
                            : Icons.wifi,
                        size: 17,
                        color: on ? AppDesign.accent : AppDesign.inkSubtle),
                    const SizedBox(height: 2),
                    Text(t.label,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: on
                                ? AppDesign.accentInk
                                : AppDesign.inkMuted)),
                  ]),
                ),
              ),
            ),
          );
        }).toList(),
      );

  List<Widget> _networkSection() => [
        Row(children: [
          Expanded(
            flex: 3,
            // An IP needs dots, and iOS's plain number pad has none — the
            // address simply cannot be typed on it. The decimal pad is the
            // closest keyboard that offers one. Port stays digits-only.
            child: _field(_hostCtrl, 'IP address', '192.168.1.50',
                keyboard:
                    const TextInputType.numberWithOptions(decimal: true)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _field(_portCtrl, 'Port', '9100',
                keyboard: TextInputType.number),
          ),
        ]),
        const SizedBox(height: 8),
        _field(_nameCtrl, 'Name (optional)', 'Packing bench'),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _sweeping ? null : _sweep,
              icon: _sweeping
                  ? const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.travel_explore, size: 15),
              label: Text(
                  _sweeping
                      ? 'Scanning ${(_sweepProgress * 100).round()}%'
                      : 'Find printers',
                  style: const TextStyle(
                      fontSize: 11, fontWeight: FontWeight.w700)),
              style: OutlinedButton.styleFrom(minimumSize: const Size(0, 38)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _sweeping ? null : _testConnection,
              icon: const Icon(Icons.network_check, size: 15),
              label: const Text('Test link',
                  style:
                      TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
              style: OutlinedButton.styleFrom(minimumSize: const Size(0, 38)),
            ),
          ),
        ]),
        // Anything answering on the ESC/POS port. It's a bare TCP probe, so
        // this proves something is listening — not that it's a printer.
        ..._found.map((ip) => InkWell(
              onTap: () {
                _hostCtrl.text = ip;
                _applyNetwork();
              },
              borderRadius: BorderRadius.circular(AppDesign.radiusSm),
              child: Container(
                margin: const EdgeInsets.only(top: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                  border: Border.all(
                      color: ip == _s!.host.trim()
                          ? AppDesign.accent
                          : AppDesign.border),
                ),
                child: Row(children: [
                  const Icon(Icons.print_outlined,
                      size: 16, color: AppDesign.inkSubtle),
                  const SizedBox(width: 9),
                  Expanded(
                      child: Text(ip,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700))),
                  const Icon(Icons.chevron_right,
                      size: 16, color: AppDesign.inkSubtle),
                ]),
              ),
            )),
        if (_netNote != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(_netNote!, style: AppDesign.caption),
          ),
      ];

  Widget _field(TextEditingController c, String label, String hint,
          {TextInputType? keyboard}) =>
      TextField(
        controller: c,
        keyboardType: keyboard,
        onEditingComplete: _applyNetwork,
        onTapOutside: (_) => _applyNetwork(),
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 11),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
        ),
      );

  Widget _paperWidth() => Row(
        children: [58, 80].map((mm) {
          final on = _s!.paperWidthMm == mm;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: mm == 58 ? 6 : 0),
              child: InkWell(
                onTap: () {
                  setState(() => _s!.paperWidthMm = mm);
                  _save();
                },
                borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: on ? AppDesign.accentSoft : null,
                    borderRadius: BorderRadius.circular(AppDesign.radiusSm),
                    border: Border.all(
                        color: on ? AppDesign.accent : AppDesign.border),
                  ),
                  child: Column(children: [
                    Text('${mm}mm',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: on ? AppDesign.accentInk : AppDesign.ink)),
                    Text('${mm == 58 ? 32 : 48} columns',
                        style: AppDesign.caption),
                  ]),
                ),
              ),
            ),
          );
        }).toList(),
      );

  Widget _copies() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(children: [
          const Expanded(
            child: Text('Copies',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ),
          _step(Icons.remove, () {
            if (_s!.copies > 1) {
              setState(() => _s!.copies--);
              _save();
            }
          }),
          SizedBox(
            width: 34,
            child: Text('${_s!.copies}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w800)),
          ),
          _step(Icons.add, () {
            if (_s!.copies < 5) {
              setState(() => _s!.copies++);
              _save();
            }
          }),
        ]),
      );

  Widget _step(IconData i, VoidCallback onTap) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDesign.radiusSm),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDesign.radiusSm),
            border: Border.all(color: AppDesign.border),
          ),
          child: Icon(i, size: 15, color: AppDesign.ink),
        ),
      );

  Widget _toggle(
          String title, String sub, bool value, ValueChanged<bool> onChanged) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                Text(sub, style: AppDesign.caption),
              ],
            ),
          ),
          Switch(
            value: value,
            activeColor: AppDesign.accent,
            onChanged: (v) {
              onChanged(v);
              _save();
            },
          ),
        ]),
      );

  Widget _testButton() => SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: (!_s!.isConfigured || _testing) ? null : _test,
          icon: _testing
              ? const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.receipt_long, size: 16),
          label: Text(_testing ? 'Printing…' : 'Print test page',
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppDesign.accent,
            side: const BorderSide(color: AppDesign.accent),
            minimumSize: const Size(0, 42),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radiusSm)),
          ),
        ),
      );
}
