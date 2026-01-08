import 'package:auto_route/auto_route.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

const List<PageRouteInfo> tabsRoutes = [
  OverviewRoute(),
  WalletRoute(),
  AnalysisRoute(),
  SettingRoute(),
];

enum RouteIdxTab {
  overview(0),
  wallet(1),
  analytics(2),
  settings(3);

  const RouteIdxTab(this.idx);

  final int idx;
}

extension RouteIdxTabExt on RouteIdxTab {
  bool get isOverviewTab => this == RouteIdxTab.overview;
  bool get isWalletTab => this == RouteIdxTab.wallet;
  bool get isAnalyticsTab => this == RouteIdxTab.analytics;
  bool get isSettingsTab => this == RouteIdxTab.settings;
}
