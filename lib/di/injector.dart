import 'package:app_bloc/app_bloc.dart';
import 'package:remote/remote.dart';
import 'package:core/core.dart';
import 'package:core/di/micro_init.module.dart';
import 'package:database/database.dart';
import 'package:app_route/app_route.dart';
import 'package:smart_ring/di/injector.config.dart';
import 'package:repository/repository.dart';
import 'package:usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
  preferRelativeImports: true,
  externalPackageModulesBefore: [
    ExternalModule(CorePackageModule),
    ExternalModule(RemotePackageModule),
    ExternalModule(DatabasePackageModule),
    ExternalModule(RepositoryPackageModule),
    ExternalModule(UsecasePackageModule),
    ExternalModule(AppBlocPackageModule),
    ExternalModule(AppRoutePackageModule),
  ],
)
Future<GetIt> configureDependencies() => locator.init();
