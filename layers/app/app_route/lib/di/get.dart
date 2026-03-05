import 'package:app_route/src/route/main_routes.dart';
import 'package:core/core.dart' show PageRouteInfo, GetIt;
import 'package:app_route/app_route.dart';

class GetAppNavigator {
  const GetAppNavigator._();

  static AppRouter appRouter() {
    return GetIt.I.get<AppRouter>();
  }

  static MainNavigation mainNavigator() {
    return GetIt.I.get<MainNavigation>();
  }
}

class GetAppRoute {
  const GetAppRoute._();

  static PageRouteInfo get homeRouter {
    return GetIt.I.get<MainRoutes>().getHomeRouter();
  }
}
