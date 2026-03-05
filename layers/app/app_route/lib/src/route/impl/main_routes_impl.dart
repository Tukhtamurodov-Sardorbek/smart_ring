import 'package:app_route/src/route/main_routes.dart';
import 'package:core/core.dart' show PageRouteInfo;
import 'package:home_feature/feature_home.gr.dart';

class MainRoutesImpl extends MainRoutes {
  @override
  PageRouteInfo getHomeRouter() => const HomeRoute();
}
