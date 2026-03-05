import 'package:core/core.dart';

abstract class BluetoothRepository {
  Future<void> initPermission({required Future<void> Function() startScan});

  Stream<ScanResult> get scanStream;

  void stopScan();
}
