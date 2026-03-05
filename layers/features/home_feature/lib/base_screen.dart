import 'package:app_route/app_route.dart' show GetAppRoute;
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

@RoutePage()
class BaseScreen extends AutoRouter implements AutoRouteWrapper {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          AutoTabsScaffold(
            homeIndex: 0,
            extendBody: true,
            routes: [GetAppRoute.homeRouter],
          ),
        ],
      ),
    );
  }
}
