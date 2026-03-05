import 'package:core/core.dart';

abstract class BluetoothPermissionHandler {
  Future<void> execute({required Future<void> Function() startScan});
}

abstract class BluetoothScanHandler {
  Stream<ScanResult> get scanStream;

  void stop();
}
