//@GeneratedMicroModule;RepositoryPackageModule;package:repository/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:database/database.dart' as _i252;
import 'package:injectable/injectable.dart' as _i526;
import 'package:repository/di/module.dart' as _i988;
import 'package:repository/repository.dart' as _i585;

class RepositoryPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final repositoryModule = _$RepositoryModule();
    await gh.singletonAsync<_i494.FlutterBlueElves>(
      () => repositoryModule.injectFlutterBlueElves(),
      preResolve: true,
    );
    gh.factory<_i585.BluetoothRepository>(() => repositoryModule
        .injectBluetoothRepository(gh<_i494.FlutterBlueElves>()));
    gh.lazySingleton<_i585.AppStorageRepository>(() => repositoryModule
        .injectAppStorageRepository(gh<_i252.AppSecureStorage>()));
  }
}

class _$RepositoryModule extends _i988.RepositoryModule {}
