abstract class FillerBoxHandler {
  Future<String> get read;

  Future<void> write(String value);
}
