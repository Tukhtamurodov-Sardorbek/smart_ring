// import 'dart:async';
//
// import 'package:app_bloc/app_bloc.dart';
// import 'package:core/core.dart';
// import 'package:flutter/foundation.dart' show debugPrint;
// import 'package:usecase/usecase.dart';
//
// class BluetoothStatusCubit extends Cubit<BluetoothStatus?> {
//   final BluetoothStatusChecker _statusChecker;
//   StreamSubscription<BluetoothStatus>? _statusStream;
//
//   BluetoothStatusCubit(this._statusChecker) : super(null);
//
//   Future<void> checkStatus() async {
//     try {
//       final bluetoothStatusStream = await _statusChecker.statusStream();
//
//       await _statusStream?.cancel();
//       _statusStream = bluetoothStatusStream.listen((BluetoothStatus status) {
//         emit(status);
//       });
//     } catch (e) {
//       debugPrint('Unable to get Bluetooth status with exception, $e');
//
//       emit(BluetoothStatus.notAvailable);
//     }
//   }
//
//   @override
//   Future<void> close() {
//     _statusStream?.cancel();
//     return super.close();
//   }
// }
