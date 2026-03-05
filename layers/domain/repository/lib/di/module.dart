import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/impl/app_storage_repository_impl.dart';
import 'package:repository/src/impl/bluetooth_repository_impl.dart';

@module
abstract class RepositoryModule {
  @preResolve
  @singleton
  Future<FlutterBlueElves> injectFlutterBlueElves() async {
    return FlutterBlueElves.instance;
  }

  BluetoothRepository injectBluetoothRepository(FlutterBlueElves bluetooth) {
    return BluetoothRepositoryImpl(bluetooth);
  }

  @lazySingleton
  AppStorageRepository injectAppStorageRepository(AppSecureStorage storage) {
    return AppStorageRepositoryImpl(storage);
  }
}
