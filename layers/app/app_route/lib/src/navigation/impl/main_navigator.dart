import 'package:app_route/app_route.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:home_feature/feature_home.gr.dart';

class MainNavigator extends MainNavigation {
  final AppRouter _appRouter;

  MainNavigator(this._appRouter);

  @override
  Future<void> navigateToMainPage(BuildContext context) {
    return context.router.replaceAll([const BaseRoute()]);
  }
}
