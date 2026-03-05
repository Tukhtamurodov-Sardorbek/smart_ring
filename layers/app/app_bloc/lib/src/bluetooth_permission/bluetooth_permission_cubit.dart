// import 'dart:async';
//
// import 'package:app_bloc/app_bloc.dart';
// import 'package:core/core.dart';
// import 'package:flutter/foundation.dart' show debugPrint;
// import 'package:usecase/usecase.dart';
//
// class BluetoothPermissionCubit extends Cubit<bool> {
//   final BluetoothPermissionHandler _handler;
//   StreamSubscription<BluetoothPermissionStatus>? _permissionsStream;
//
//   BluetoothPermissionCubit(this._handler) : super(false) {
//     _listen();
//   }
//
//   Future<void> _listen() async {
//     final bluetoothPermissionsStream = await _handler.permissionStatusStream();
//
//     _permissionsStream = bluetoothPermissionsStream.listen((event) {
//       debugPrint('Received permission status: $event');
//
//       if (event != BluetoothPermissionStatus.granted) {
//         debugPrint('Bluetooth permissions denied or are unknown.');
//
//         emit(false);
//       } else {
//         debugPrint('Bluetooth permissions granted.');
//
//         emit(true);
//       }
//     });
//
//     await _handler.requestBluetoothPermissions();
//   }
//
//   @override
//   Future<void> close() {
//     _permissionsStream?.cancel();
//     return super.close();
//   }
// }
