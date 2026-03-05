import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home_feature/sample/scan_page.dart';

part 'components/app_bar.dart';

part 'components/body.dart';

part 'components/state_mixin.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => GetAppBloc.bluetoothScanCubit())],
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> with _StateMixin {
  @override
  Widget build(BuildContext context) {
    return ScanPage.page;
    // return SafeArea(
    //   child: Scaffold(
    //     body: BlocBuilder<BluetoothScanCubit, BluetoothScanState>(
    //       builder: (context, state) {
    //         print('>>>> $state');
    //         return CustomScrollView(
    //           slivers: [
    //             SliverList.separated(
    //               itemCount: state.devices.length,
    //               separatorBuilder: (context, index) {
    //                 return Divider();
    //               },
    //               itemBuilder: (context, index) {
    //                 return buildDeviceItem(state.devices[index]);
    //               },
    //             ),
    //           ],
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
