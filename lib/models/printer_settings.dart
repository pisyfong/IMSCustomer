import 'package:isar/isar.dart';

part 'printer_settings.g.dart';

/// How the app reaches the printer.
enum PrinterTransport {
  /// Classic Bluetooth SPP — the belt/trolley printers.
  bluetooth,

  /// Raw TCP on the printer's ESC/POS port (9100 by convention). This is what
  /// LAN and Wi-Fi models speak; the byte stream is identical to Bluetooth.
  network,
}

extension PrinterTransportLabel on PrinterTransport {
  String get label => switch (this) {
        PrinterTransport.bluetooth => 'Bluetooth',
        PrinterTransport.network => 'Network',
      };
}

/// The Bluetooth receipt printer this device prints to (Zywell / any ESC-POS
/// thermal printer paired with the handheld).
///
/// Device-scoped, not user-scoped: the printer belongs to the trolley/bench the
/// handheld lives on, so it survives a user switch. Singleton — one printer per
/// device, chosen once in Settings.
@collection
class PrinterSettings {
  static const int singletonId = 0;

  Id id = singletonId;

  @Enumerated(EnumType.name)
  PrinterTransport transport = PrinterTransport.bluetooth;

  /// Bluetooth MAC of the paired printer. Empty = no printer configured.
  String macAddress = '';

  /// Printer IP or hostname, for [PrinterTransport.network].
  String host = '';

  /// Raw ESC/POS port. 9100 is the near-universal default.
  int port = 9100;

  /// Friendly name — the pairing name, or whatever the operator typed for a
  /// network printer.
  String name = '';

  /// Paper width in mm — 58 or 80. Drives the character columns per line.
  int paperWidthMm = 80;

  /// Copies to send per print job.
  int copies = 1;

  /// Send the auto-cutter command after each receipt. Portable/belt printers
  /// have no cutter and simply ignore it, but it can emit stray bytes on a few
  /// clones, so it stays switchable.
  bool autoCut = true;

  /// Print the document number as a CODE128 barcode at the foot, so a finished
  /// pick/pack can be scanned straight back into the app.
  bool printBarcode = true;

  /// Blank lines fed after the receipt so the last line clears the tear bar.
  int feedLines = 4;

  /// Characters per line for the printer's Font A at this paper width.
  /// 58mm ≈ 32 columns, 80mm ≈ 48 columns.
  @ignore
  int get columns => paperWidthMm <= 58 ? 32 : 48;

  @ignore
  bool get isConfigured => transport == PrinterTransport.network
      ? host.trim().isNotEmpty
      : macAddress.isNotEmpty;

  /// What the printer is reached at, for status lines and error messages.
  @ignore
  String get target => transport == PrinterTransport.network
      ? '${host.trim()}:$port'
      : macAddress;

  /// Name if one is known, else the address — never blank when configured.
  @ignore
  String get displayName {
    final n = name.trim();
    return n.isNotEmpty ? n : target;
  }

  PrinterSettings();
}
