abstract class AppStorageRepository {
  Future<String> get getFiller;

  Future<void> saveFiller(String value);
}
