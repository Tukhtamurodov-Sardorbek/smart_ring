abstract class AppSecureStorage {
  Future<String> get getFiller;

  Future<void> saveFiller(String value);

  // * CLEAR
  Future<void> clear();
}
