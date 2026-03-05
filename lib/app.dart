import 'package:app_bloc/app_bloc.dart';
import 'package:app_route/app_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smart_ring/di/injector.dart';

class SmartRingApp extends StatelessWidget {
  const SmartRingApp({super.key});

  static Future<void> setup() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();

    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: DesignConstants.fontFamily,
          typography: Typography.material2021(),
          scaffoldBackgroundColor: AppColor.primaryBackground,
          appBarTheme: AppBarTheme(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColor.primaryBackground,
            iconTheme: IconThemeData(
              size: 24,
              color: AppColor.neutral.shade800,
            ),
          ),
        ),
        routeInformationParser: GetAppNavigator.appRouter()
            .defaultRouteParser(),
        routerDelegate: GetAppNavigator.appRouter().delegate(
          navigatorObservers: () => [AppRouteObserver()],
          placeholder: (_) => ColoredBox(color: AppColor.primaryBlue.shade500),
        ),
        // routerConfig: GetAppNavigator.appRouter().config(
        //   includePrefixMatches: true,
        //   navigatorObservers: () => [AppRouteObserver()],
        //   placeholder: (_) => ColoredBox(color: AppColor.primaryBlue.shade500),
        // ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                overscroll: false,
                physics: const BouncingScrollPhysics(),
              ),
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.transparent,
                ),
                child: child!,
              ),
            ),
          );
        },
      ),
    );
  }
}
