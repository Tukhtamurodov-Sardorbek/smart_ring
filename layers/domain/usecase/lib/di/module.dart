import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:usecase/src/impl/app_storage_usecase_impl.dart';
import 'package:usecase/src/impl/bluetooth_usecase_impl.dart';
import 'package:usecase/usecase.dart';

@module
abstract class UsecaseModule {
  BluetoothPermissionHandler injectBluetoothPermissionHandler(
    BluetoothRepository repository,
  ) {
    return BluetoothPermissionHandlerImpl(repository);
  }

  BluetoothScanHandler injectBluetoothScanHandler(
    BluetoothRepository repository,
  ) {
    return BluetoothScanHandlerImpl(repository);
  }

  FillerBoxHandler injectFillerBoxHandler(AppStorageRepository repository) {
    return FillerBoxHandlerImpl(repository);
  }
}
