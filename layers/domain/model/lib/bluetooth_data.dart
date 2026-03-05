import 'package:core/core.dart';

final class BlueInfo {
  final String? name;
  final int? rssi;
  final String? mac;
  final ScanResult? result;

  const BlueInfo({
    required this.name,
    required this.rssi,
    required this.mac,
    this.result,
  });

  BlueInfo setNameRSSI(String name, int rssi) {
    return BlueInfo(name: name, rssi: rssi, mac: mac);
  }
}
