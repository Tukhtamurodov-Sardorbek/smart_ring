import 'package:database/src/storage/app_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'keys.dart';

class AppSecureStorageImpl implements AppSecureStorage {
  final FlutterSecureStorage _storage;

  const AppSecureStorageImpl(this._storage);

  @override
  Future<String> get getFiller async {
    final result = await _storage.read(key: _StorageKey.filler.key) ?? '';
    return result;
  }

  @override
  Future<void> saveFiller(String value) async {
    return _storage.write(key: _StorageKey.filler.key, value: value);
  }

  // * CLEAR
  @override
  Future<void> clear() {
    return _storage.deleteAll();
  }
}
