import 'package:database/database.dart' show AppSecureStorage;
import 'package:repository/repository.dart' show AppStorageRepository;

final class AppStorageRepositoryImpl implements AppStorageRepository {
  final AppSecureStorage storage;

  AppStorageRepositoryImpl(this.storage);

  @override
  Future<String> get getFiller => storage.getFiller;

  @override
  Future<void> saveFiller(String value) => storage.saveFiller(value);
}
