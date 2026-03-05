import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' show GetIt;

class GetAppBloc {
  const GetAppBloc._();

  // static BluetoothStatusCubit bluetoothStatusCubit() =>
  //     GetIt.I.get<BluetoothStatusCubit>();
  //
  // static BluetoothPermissionCubit bluetoothPermissionCubit() =>
  //     GetIt.I.get<BluetoothPermissionCubit>();
  static BluetoothScanCubit bluetoothScanCubit() =>
      GetIt.I.get<BluetoothScanCubit>();
}
