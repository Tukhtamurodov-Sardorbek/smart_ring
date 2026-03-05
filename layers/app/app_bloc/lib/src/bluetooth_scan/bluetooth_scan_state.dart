part of 'bluetooth_scan_cubit.dart';

class BluetoothScanState {
  final bool isScanning;
  final List<BlueInfo> devices;
  final String? error;

  const BluetoothScanState._(this.devices, this.isScanning, this.error);

  factory BluetoothScanState.init() => BluetoothScanState._([], false, null);

  BluetoothScanState scannning(bool isScanning) {
    return BluetoothScanState._(devices, isScanning, null);
  }

  BluetoothScanState devicesList(List<BlueInfo> devices) {
    return BluetoothScanState._(devices, false, null);
  }

  BluetoothScanState exception(String e) {
    return BluetoothScanState._([], false, e);
  }

  @override
  String toString() {
    return 'isScanning: $isScanning | devices: $devices | error: $error';
  }
}
