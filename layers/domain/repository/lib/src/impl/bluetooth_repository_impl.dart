import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:repository/src/bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  final FlutterBlueElves bluetooth;

  BluetoothRepositoryImpl(this.bluetooth);

  bool locationEnable = false;
  bool bluetoothEnable = false;

  @override
  Stream<ScanResult> get scanStream {
    return FlutterBlueElves.instance.startScan(10000);
  }

  @override
  void stopScan() {
    return bluetooth.stopScan();
  }

  @override
  Future<void> initPermission({
    required Future<void> Function() startScan,
  }) async {
    if (Platform.isAndroid) {
      FlutterBlueElves.instance.androidApplyLocationPermission((isOk) async {
        if (!isOk) {
          PermissionStatus locationStatus = await Permission.location.status;
          if (locationStatus.isDenied) {
            final isGranted = await Permission.location.request().isGranted;
            if (isGranted) {
              _initBluetoothPermission(startScan);
            }
          }
        } else {
          _initBluetoothPermission(startScan);
        }
      });
    } else {
      final state = await FlutterBlueElves.instance.iosCheckBluetoothState();
      debugPrint('iosCheckBluetoothState: ${state.toString()}');

      if (state == IosBluetoothState.poweredOn) {
        startScan();
      }
    }
  }

  void _initBluetoothPermission(Future<void> Function() startScan) {
    FlutterBlueElves.instance.androidApplyBluetoothPermission((isOk) async {
      if (!isOk) {
        PermissionStatus bluetoothStatus = await Permission.bluetooth.status;
        PermissionStatus bluetoothConnectStatus =
            await Permission.bluetoothConnect.status;
        PermissionStatus bluetoothScanStatus =
            await Permission.bluetoothScan.status;
        if (bluetoothStatus.isDenied) {
          await Permission.bluetooth.request();
        }
        if (bluetoothConnectStatus.isDenied) {
          await Permission.bluetoothConnect.request();
        }
        if (bluetoothScanStatus.isDenied) {
          await Permission.bluetoothScan.request();
        }
      }
      _initBlueUtil(startScan);
    });
  }

  void _initBlueUtil(Future<void> Function() startScan) {
    FlutterBlueElves.instance.androidCheckBlueLackWhat().then((values) {
      if (values.contains(AndroidBluetoothLack.bluetoothPermission)) {
        debugPrint("no bluetooth permission");
        return;
      }
      if (values.contains(AndroidBluetoothLack.locationPermission)) {
        debugPrint("no location permission");
        return;
      }
      if (values.contains(AndroidBluetoothLack.locationFunction)) {
        FlutterBlueElves.instance.androidOpenLocationService((isOk) {
          if (isOk) {
            locationEnable = true;
          } else {
            locationEnable = false;
          }
        });
      } else {
        locationEnable = true;
      }
      if (values.contains(AndroidBluetoothLack.bluetoothFunction)) {
        FlutterBlueElves.instance.androidOpenBluetoothService((isOk) {
          if (isOk) {
            bluetoothEnable = true;
          } else {
            bluetoothEnable = false;
          }
        });
      } else {
        bluetoothEnable = true;
      }
      startScan();
    });
  }
}
