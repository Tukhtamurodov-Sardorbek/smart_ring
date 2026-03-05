import 'dart:async';
import 'dart:io' show Platform;

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/bluetooth_data.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:usecase/usecase.dart';

part 'bluetooth_scan_state.dart';

class BluetoothScanCubit extends Cubit<BluetoothScanState> {
  final BluetoothPermissionHandler _permissionHandler;
  final BluetoothScanHandler _scanHandler;
  final FillerBoxHandler _fillerBoxHandler;
  StreamSubscription<ScanResult>? _scanStream;
  final List<BlueInfo> _discoveredDevices = [];

  BluetoothScanCubit({
    required BluetoothPermissionHandler permissionHandler,
    required BluetoothScanHandler scanHandler,
    required FillerBoxHandler fillerBoxHandler,
  }) : _permissionHandler = permissionHandler,
       _scanHandler = scanHandler,
       _fillerBoxHandler = fillerBoxHandler,
       super(BluetoothScanState.init()) {
    scan();
  }

  Future<void> scan() {
    return _permissionHandler.execute(startScan: scan);
  }

  Future<void> _scan() async {
    emit(state.scannning(true));
    final filler = await _fillerBoxHandler.read;
    final Stream<ScanResult> stream = _scanHandler.scanStream;

    await _scanStream?.cancel();
    _discoveredDevices.clear();

    _scanStream = stream.listen(
      (ScanResult device) {
        debugPrint('Discovered BLE device: ${device.name}');
        String? name = Platform.isAndroid ? device.name : device.localName;
        String? mac = Platform.isAndroid ? device.macAddress : device.id;
        if (name == null) {
          return;
        }
        if (filler.isNotEmpty) {
          if (!name.contains(filler)) {
            return;
          }
        }
        bool flag = false;
        for (int i = 0; i < _discoveredDevices.length; i++) {
          if (_discoveredDevices[i].mac == mac) {
            flag = true;
            final info = _discoveredDevices[i].setNameRSSI(name, device.rssi);
            _discoveredDevices[i] = info;
            break;
          }
        }
        if (!flag) {
          final info = BlueInfo(
            name: name,
            rssi: device.rssi,
            mac: mac,
            result: device,
          );
          _discoveredDevices.add(info);
        }
        _discoveredDevices.sort(((a, b) => b.rssi!.compareTo(a.rssi!)));
        emit(state.devicesList(List.from(_discoveredDevices)));
      },
      onError: (dynamic error) {
        debugPrint('Bluetooth scan error: $error');

        emit(state.exception('Something went wrong, please try again later!'));
        return;
      },
      onDone: () {
        emit(state.scannning(false));
      },
      cancelOnError: false,
    );
  }

  void stop() {
    if (state.isScanning) {
      _scanHandler.stop();
      _scanStream?.cancel();

      emit(state.scannning(false));
    }
    // else {
    //   _discoveredDevices.clear();
    //   emit(state.devicesList([]));
    // }
  }

  @override
  Future<void> close() {
    _scanStream?.cancel();
    return super.close();
  }
}
