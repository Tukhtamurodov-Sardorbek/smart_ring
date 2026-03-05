import 'package:app_route/src/route/impl/main_routes_impl.dart';
import 'package:app_route/src/route/main_routes.dart';
import 'package:core/core.dart';
import 'package:app_route/app_route.dart';
import 'package:app_route/src/navigation/impl/main_navigator.dart';

@module
abstract class AppRouteModule {
  @singleton
  AppRouter injectAppRouter() => AppRouter();

  @lazySingleton
  MainRoutes injectMainRoutes() => MainRoutesImpl();

  @lazySingleton
  MainNavigation injectMainNavigation(AppRouter appRouter) {
    return MainNavigator(appRouter);
  }
}
