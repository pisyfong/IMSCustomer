import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show MissingPluginException;
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../main.dart';
import '../models/printer_settings.dart';
import 'escpos.dart';

/// Why a print job couldn't be sent. Callers map these to a message the picker
/// can act on — "turn Bluetooth on" is useful, "print failed" is not.
enum PrintFailure {
  none,
  noPrinter, // nothing configured in Settings
  noPermission, // Android 12+ nearby-devices permission refused
  bluetoothOff,
  connectFailed, // printer off, out of range, or paired to something else
  unreachable, // network printer not answering on its port
  writeFailed,
  unsupported, // platform with no transport for this printer
  needsRestart, // platform channels not registered in the running binary
}

class PrintResult {
  final bool ok;
  final PrintFailure failure;
  final String message;
  const PrintResult(this.ok, this.failure, this.message);

  static const PrintResult success = PrintResult(true, PrintFailure.none, 'Printed');
}

/// Talks to the configured receipt printer, over Bluetooth SPP or raw TCP.
///
/// The ESC/POS bytes are identical either way — only the pipe differs — so the
/// transport split lives here and nothing above this file knows which is in
/// use. Also owns the remembered printer, the Android 12+ permission dance,
/// and keeping the Bluetooth link alive between jobs so a second receipt
/// doesn't pay the pairing cost again.
class PrinterService {
  PrinterService._();
  static final PrinterService _i = PrinterService._();
  factory PrinterService() => _i;

  /// Serialises jobs. Two receipts written concurrently interleave on the wire
  /// and print as shredded garbage, so every job queues behind the last.
  Future<void> _queue = Future.value();

  PrinterSettings? _cached;

  // ─── Settings ────────────────────────────────────────────────────────────

  Future<PrinterSettings> settings({bool refresh = false}) async {
    if (!refresh && _cached != null) return _cached!;
    final s = await isar.printerSettings.get(PrinterSettings.singletonId);
    return _cached = s == null ? PrinterSettings() : await _repair(s);
  }

  /// Heals settings written before a field existed.
  ///
  /// Isar has no migration hook for adding a property to a collection: a record
  /// stored before the property existed deserialises it as int64 min, NOT as
  /// the Dart field initialiser — those only run when constructing a new
  /// object. `port` shipped after `macAddress` did, so any device that had
  /// already saved a printer read back `port = -9223372036854775808` and the
  /// network sweep probed a nonsense port.
  ///
  /// Every numeric setting is range-checked rather than just `port`, so the
  /// next field added here can't reintroduce the same bug. The repair is
  /// written back once so it doesn't have to run forever.
  Future<PrinterSettings> _repair(PrinterSettings s) async {
    var dirty = false;
    void fix(bool broken, void Function() reset) {
      if (broken) {
        reset();
        dirty = true;
      }
    }

    fix(s.port < 1 || s.port > 65535, () => s.port = 9100);
    fix(s.copies < 1 || s.copies > 5, () => s.copies = 1);
    fix(s.paperWidthMm != 58 && s.paperWidthMm != 80,
        () => s.paperWidthMm = 80);
    fix(s.feedLines < 0 || s.feedLines > 10, () => s.feedLines = 4);

    if (dirty) {
      await isar.writeTxn(() => isar.printerSettings.put(s));
    }
    return s;
  }

  Future<void> saveSettings(PrinterSettings s) async {
    s.id = PrinterSettings.singletonId;
    await isar.writeTxn(() => isar.printerSettings.put(s));
    _cached = s;
  }

  /// Forgets the configured printer (Settings → Remove).
  Future<void> clearPrinter() async {
    final s = await settings(refresh: true);
    s
      ..macAddress = ''
      ..host = ''
      ..name = '';
    await saveSettings(s);
    await _safe(() => PrintBluetoothThermal.disconnect, false);
  }

  // ─── Bluetooth discovery ─────────────────────────────────────────────────

  /// Android only surfaces printers that are already **paired** in system
  /// Bluetooth settings — thermal printers use classic SPP, which has no
  /// in-app pairing flow worth building. The picker sheet says so.
  Future<List<BluetoothInfo>> pairedPrinters() async {
    if (!_btSupported) return const [];
    if (!await ensurePermission()) return const [];
    if (!await _safe(() => PrintBluetoothThermal.bluetoothEnabled, false)) {
      return const [];
    }
    return _safe(() => PrintBluetoothThermal.pairedBluetooths, <BluetoothInfo>[]);
  }

  bool get _btSupported => Platform.isAndroid || Platform.isWindows;

  /// True when the printing platform channels aren't registered in the running
  /// binary. That means the app was hot-reloaded (or hot-restarted) over a
  /// build that predates these plugins — Dart code reloads, native plugin
  /// registration does not. Only a full stop-and-relaunch fixes it.
  bool get needsRestart => _needsRestart;
  bool _needsRestart = false;

  static const String restartMessage =
      'Restart the app to enable printing — hot reload can\'t load new plugins';

  /// Requests the Android 12+ nearby-devices permissions.
  ///
  /// This MUST succeed before any Bluetooth plugin call: on API 31+ the print
  /// plugin's method handler returns without completing the result when the
  /// permission is missing, which leaves the Dart future hanging forever.
  /// Everything below is also wrapped in a timeout for the same reason.
  Future<bool> ensurePermission() async {
    if (!Platform.isAndroid) return true;
    try {
      final statuses = await [
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ].request();
      _needsRestart = false;
      // On Android < 12 permission_handler reports these as granted already.
      return statuses[Permission.bluetoothConnect]?.isGranted ?? false;
    } on MissingPluginException {
      _needsRestart = true;
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<bool> get isConnected => _btSupported
      ? _safe(() => PrintBluetoothThermal.connectionStatus, false)
      : Future.value(false);

  // ─── Network discovery ───────────────────────────────────────────────────

  /// The handheld's own /24, e.g. `192.168.1.` — the only subnet worth
  /// sweeping for a printer. Null when there's no usable IPv4 interface.
  Future<String?> localSubnet() async {
    try {
      final ifaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
        includeLinkLocal: false,
      );
      for (final i in ifaces) {
        for (final a in i.addresses) {
          final parts = a.address.split('.');
          if (parts.length == 4) return '${parts[0]}.${parts[1]}.${parts[2]}.';
        }
      }
    } catch (_) {}
    return null;
  }

  /// Sweeps the local /24 for anything answering on [port].
  ///
  /// Typing an IP on a rugged handheld keypad is miserable, so this exists to
  /// avoid it. It's a plain TCP connect — nothing is sent — and it only runs
  /// when the operator asks. [onProgress] reports 0..1 so the sheet can show
  /// movement rather than freezing for a few seconds.
  Future<List<String>> scanNetwork({
    int port = 9100,
    Duration timeout = const Duration(milliseconds: 400),
    void Function(double progress)? onProgress,
  }) async {
    if (port < 1 || port > 65535) port = 9100;

    final base = await localSubnet();
    if (base == null) return const [];

    final found = <String>[];
    var done = 0;

    // 254 concurrent connects is fine for a LAN sweep and keeps it under a
    // second; batching it any smaller just makes the operator wait.
    await Future.wait([
      for (var host = 1; host <= 254; host++)
        () async {
          final ip = '$base$host';
          try {
            final s = await Socket.connect(ip, port, timeout: timeout);
            s.destroy();
            found.add(ip);
          } catch (_) {
            // Closed or unreachable — the normal case for 253 of 254.
          } finally {
            done++;
            onProgress?.call(done / 254);
          }
        }()
    ]);

    found.sort((a, b) => _ipKey(a).compareTo(_ipKey(b)));
    return found;
  }

  /// Sorts IPs numerically — `.9` before `.10`, which a string sort gets wrong.
  int _ipKey(String ip) {
    final p = ip.split('.');
    if (p.length != 4) return 0;
    return p.fold(0, (a, o) => (a << 8) | (int.tryParse(o) ?? 0));
  }

  /// Opens and closes a connection without printing, so setup can be verified
  /// before anyone trusts it with a document.
  Future<PrintResult> testConnection() async {
    final s = await settings(refresh: true);
    if (!s.isConfigured) {
      return const PrintResult(
          false, PrintFailure.noPrinter, 'No printer selected');
    }
    if (s.transport == PrinterTransport.network) {
      try {
        final sock = await Socket.connect(s.host.trim(), s.port,
            timeout: const Duration(seconds: 5));
        sock.destroy();
        return const PrintResult(true, PrintFailure.none, 'Printer reachable');
      } catch (e) {
        return PrintResult(false, PrintFailure.unreachable,
            'No answer from ${s.target} — check the IP, port and Wi-Fi');
      }
    }
    final gate = await _btGate(s);
    return gate ?? const PrintResult(true, PrintFailure.none, 'Printer connected');
  }

  // ─── Printing ────────────────────────────────────────────────────────────

  /// Sends [build] to the printer, once per configured copy.
  ///
  /// [build] receives the paper's column count so the caller lays the receipt
  /// out for the actual paper in the machine.
  Future<PrintResult> print(List<int> Function(int cols) build) {
    // Chain onto the queue so concurrent taps can't interleave on the wire.
    final done = Completer<PrintResult>();
    _queue = _queue.then((_) async {
      try {
        done.complete(await _print(build));
      } catch (e) {
        done.complete(PrintResult(false, PrintFailure.writeFailed, '$e'));
      }
    });
    return done.future;
  }

  Future<PrintResult> _print(List<int> Function(int cols) build) async {
    final s = await settings(refresh: true);
    if (!s.isConfigured) {
      return const PrintResult(false, PrintFailure.noPrinter,
          'No printer selected — set one up in Settings');
    }

    final payload = build(s.columns);
    final copies = s.copies.clamp(1, 5);

    return s.transport == PrinterTransport.network
        ? _sendNetwork(s, payload, copies)
        : _sendBluetooth(s, payload, copies);
  }

  // ── Bluetooth ──

  /// Everything that must hold before a Bluetooth write. Returns the failure,
  /// or null when the link is up.
  Future<PrintResult?> _btGate(PrinterSettings s) async {
    if (!_btSupported) {
      return const PrintResult(false, PrintFailure.unsupported,
          'Bluetooth printing is only available on the handheld');
    }
    if (!await ensurePermission()) {
      return _needsRestart
          ? const PrintResult(false, PrintFailure.needsRestart, restartMessage)
          : const PrintResult(false, PrintFailure.noPermission,
              'Allow "Nearby devices" so the app can reach the printer');
    }
    if (!await _safe(() => PrintBluetoothThermal.bluetoothEnabled, false)) {
      return const PrintResult(
          false, PrintFailure.bluetoothOff, 'Bluetooth is off — turn it on and retry');
    }
    if (!await _connectBt(s.macAddress)) {
      return PrintResult(false, PrintFailure.connectFailed,
          'Can\'t reach ${s.displayName} — check it\'s on and in range');
    }
    return null;
  }

  Future<PrintResult> _sendBluetooth(
      PrinterSettings s, List<int> payload, int copies) async {
    final gate = await _btGate(s);
    if (gate != null) return gate;

    for (var copy = 0; copy < copies; copy++) {
      final ok = await _safe(() => PrintBluetoothThermal.writeBytes(payload), false,
          timeout: const Duration(seconds: 20));
      if (!ok) {
        // A failed write usually means the link dropped; drop it properly so
        // the next attempt re-connects instead of writing into a dead socket.
        await _safe(() => PrintBluetoothThermal.disconnect, false);
        return const PrintResult(
            false, PrintFailure.writeFailed, 'Printer stopped responding mid-print');
      }
    }
    return PrintResult.success;
  }

  Future<bool> _connectBt(String mac) async {
    if (await _safe(() => PrintBluetoothThermal.connectionStatus, false)) return true;
    return _safe(() => PrintBluetoothThermal.connect(macPrinterAddress: mac), false,
        timeout: const Duration(seconds: 12));
  }

  // ── Network ──

  /// One socket per job, not one held open.
  ///
  /// Port 9100 printers routinely drop idle connections without telling us, so
  /// a cached socket fails on the *next* receipt — after the operator has
  /// walked away. Reconnecting costs milliseconds on a LAN and can't go stale.
  Future<PrintResult> _sendNetwork(
      PrinterSettings s, List<int> payload, int copies) async {
    final host = s.host.trim();
    Socket? sock;
    try {
      sock = await Socket.connect(host, s.port,
          timeout: const Duration(seconds: 8));
    } catch (_) {
      return PrintResult(false, PrintFailure.unreachable,
          'No answer from ${s.target} — check the printer is on and on Wi-Fi');
    }

    try {
      for (var copy = 0; copy < copies; copy++) {
        sock.add(payload);
      }
      // flush() resolves once the bytes are handed to the OS; without it,
      // destroy() can discard a buffered receipt.
      await sock.flush().timeout(const Duration(seconds: 20));
      return PrintResult.success;
    } catch (e) {
      return const PrintResult(
          false, PrintFailure.writeFailed, 'Connection dropped mid-print');
    } finally {
      sock.destroy();
    }
  }

  // ─── Test page ───────────────────────────────────────────────────────────

  /// Prints a short self-test so the operator can confirm the connection, the
  /// paper width and the character alignment before trusting a real receipt.
  Future<PrintResult> printTestPage() {
    return print((cols) {
      final e = EscPos(cols: cols)
        ..reset()
        ..align(1)
        ..bold(true)
        ..size(w: 2, h: 2)
        ..line('TEST PRINT')
        ..size()
        ..bold(false)
        ..align(0)
        ..rule('=')
        ..field('Paper', '${cols == 32 ? 58 : 80}mm ($cols columns)')
        ..rule('-');
      // A column ruler: if these two rows don't line up on the paper, the
      // configured width is wrong for the machine.
      e.line(List.generate(cols, (i) => '${(i + 1) % 10}').join());
      e.row2('LEFT', 'RIGHT');
      e
        ..rule('=')
        ..centre('If both edges are flush,')
        ..centre('the paper width is correct.')
        ..feed(3)
        ..cut();
      return e.bytes;
    });
  }

  /// Runs a plugin call with a hard timeout, falling back to [fallback].
  ///
  /// The plugin can leave a future uncompleted (see [ensurePermission]); a
  /// hung print button is worse than a failed one.
  Future<T> _safe<T>(Future<T> Function() op, T fallback,
      {Duration timeout = const Duration(seconds: 8)}) async {
    try {
      return await op().timeout(timeout, onTimeout: () => fallback);
    } on MissingPluginException {
      _needsRestart = true;
      return fallback;
    } catch (_) {
      return fallback;
    }
  }
}
