import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';

class BluetoothPermissionHandlerImpl implements BluetoothPermissionHandler {
  final BluetoothRepository _repository;

  const BluetoothPermissionHandlerImpl(this._repository);

  @override
  Future<void> execute({required Future<void> Function() startScan}) =>
      _repository.initPermission(startScan: startScan);
}

class BluetoothScanHandlerImpl implements BluetoothScanHandler {
  final BluetoothRepository _repository;

  const BluetoothScanHandlerImpl(this._repository);

  @override
  Stream<ScanResult> get scanStream => _repository.scanStream;

  @override
  void stop() => _repository.stopScan();
}
