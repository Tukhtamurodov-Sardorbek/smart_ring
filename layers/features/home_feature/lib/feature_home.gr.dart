// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:home_feature/base_screen.dart' as _i1;
import 'package:home_feature/home_page/home_page.dart' as _i2;

/// generated route for
/// [_i1.BaseScreen]
class BaseRoute extends _i3.PageRouteInfo<void> {
  const BaseRoute({List<_i3.PageRouteInfo>? children})
    : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i1.BaseScreen());
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.HomePage());
    },
  );
}
