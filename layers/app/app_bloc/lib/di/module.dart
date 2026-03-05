import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' show module;
import 'package:usecase/usecase.dart';

@module
abstract class AppBlocModule {
  BluetoothScanCubit injectBluetoothScanCubit(
    BluetoothPermissionHandler permissionHandler,
    BluetoothScanHandler scanHandler,
    FillerBoxHandler fillerBoxHandler,
  ) => BluetoothScanCubit(
    permissionHandler: permissionHandler,
    scanHandler: scanHandler,
    fillerBoxHandler: fillerBoxHandler,
  );
}
