import 'package:app_bloc/app_bloc.dart';
import 'package:app_route/src/configurations/paths.dart';
import 'package:core/core.dart';
import 'package:entry_feature/entry_feature.gr.dart';
import 'package:home_feature/feature_home.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen, Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRouteGuard> get guards => <AutoRouteGuard>[];

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      path: ScreenPath.entry.path,
      page: EntryRouteWrapper.page,
      children: [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
          path: ScreenPath.splash.path,
        ),
      ],
    ),
    AutoRoute(
      page: BaseRoute.page,
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: ScreenPath.home.path,
          children: [],
        ),
      ],
    ),
  ];
}
