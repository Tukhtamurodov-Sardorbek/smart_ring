library entry_feature;

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:app_bloc/app_bloc.dart';

export 'package:entry_feature/entry_feature.gr.dart';
export 'package:entry_feature/splash/splash_page.dart';

@AutoRouterConfig()
class EntryFeatureAutoRouterModule extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];
}

@RoutePage()
class EntryPageWrapper extends AutoRouter implements AutoRouteWrapper {
  const EntryPageWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
