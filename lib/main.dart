import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smart_ring/app.dart';

void main() {
  runZonedGuarded(
    () async {
      await Future.microtask(SmartRingApp.setup);
      runApp(
        ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(360, 690),
          builder: (context, child) {
            FlutterNativeSplash.remove();
            return SmartRingApp();
          },
        ),
      );
    },
    (error, stack) {
      debugPrintStack(label: error.toString(), stackTrace: stack);
    },
  );
}
