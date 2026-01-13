import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:happy_money/presentation/features/setting/setting_screen.dart';
import 'package:happy_money/presentation/features/overview/overview_screen.dart';
import 'package:happy_money/presentation/features/analysis/analysis_screen.dart';
import 'package:happy_money/presentation/features/wallet/wallet_screen.dart';
import 'package:happy_money/presentation/features/app_root/container/container_screen.dart';
import 'package:happy_money/presentation/features/start/splash/splash_screen.dart';
import 'package:happy_money/presentation/features/start/onboard/onboard_screen.dart';
import 'package:happy_money/presentation/features/add_transaction/add_transaction_screen.dart';
part 'app_router.gr.dart';

final appRouter = AppRoute._();

@AutoRouterConfig(replaceInRouteName: 'Screen|BottomSheet,Route')
class AppRoute extends RootStackRouter {
  AppRoute._();
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true, path: "/"),
    CustomRoute(
      page: ContainerRoute.page,
      path: "/container",
      children: [
        AutoRoute(page: OverviewRoute.page, path: "overview"),
        AutoRoute(page: WalletRoute.page, path: "wallet"),
        AutoRoute(page: AnalysisRoute.page, path: "analysis"),
        AutoRoute(page: SettingRoute.page, path: "setting"),
      ],
    ),
    AutoRoute(page: AddTransactionRoute.page, path: "/add-transaction"),
  ];
}
