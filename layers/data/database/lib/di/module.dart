import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:database/src/storage/impl/app_secure_storage_impl.dart';

@module
abstract class DatabaseModule {
  /// Storage
  @lazySingleton
  FlutterSecureStorage injectSecureStorage() {
    return FlutterSecureStorage(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  @lazySingleton
  AppSecureStorage injectAppSecureStorage(FlutterSecureStorage storage) {
    return AppSecureStorageImpl(storage);
  }
}
