import 'package:repository/repository.dart' show AppStorageRepository;
import 'package:usecase/usecase.dart' show FillerBoxHandler;

final class FillerBoxHandlerImpl implements FillerBoxHandler {
  final AppStorageRepository _repository;

  FillerBoxHandlerImpl(this._repository);

  @override
  Future<String> get read => _repository.getFiller;

  @override
  Future<void> write(String value) => _repository.saveFiller(value);
}
