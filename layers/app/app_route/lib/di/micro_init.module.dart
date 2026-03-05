//@GeneratedMicroModule;AppRoutePackageModule;package:app_route/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:app_route/app_route.dart' as _i206;
import 'package:app_route/di/module.dart' as _i345;
import 'package:app_route/src/route/main_routes.dart' as _i511;
import 'package:injectable/injectable.dart' as _i526;

class AppRoutePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final appRouteModule = _$AppRouteModule();
    gh.singleton<_i206.AppRouter>(() => appRouteModule.injectAppRouter());
    gh.lazySingleton<_i511.MainRoutes>(() => appRouteModule.injectMainRoutes());
    gh.lazySingleton<_i206.MainNavigation>(
        () => appRouteModule.injectMainNavigation(gh<_i206.AppRouter>()));
  }
}

class _$AppRouteModule extends _i345.AppRouteModule {}
