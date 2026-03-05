import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:app_route/app_route.dart' show GetAppNavigator;
import 'package:core/core.dart' show RoutePage;

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBlue.shade500,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Center(
            child: DownToUp(
              delayFactor: 1,
              withPosition: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // AppAsset.icPillMindPng.displayImage(width: 200.w),
                  32.verticalSpace,
                  Text(
                    'Smart Ring',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColor.neutral.shade50,
                    ),
                  ),
                ],
              ),
              onFinish: () {
                Future.delayed(const Duration(milliseconds: 200), () {
                  GetAppNavigator.mainNavigator().navigateToMainPage(context);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
