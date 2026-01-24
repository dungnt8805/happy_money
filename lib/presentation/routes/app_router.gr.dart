// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddCategoryScreen]
class AddCategoryRoute extends PageRouteInfo<void> {
  const AddCategoryRoute({List<PageRouteInfo>? children})
    : super(AddCategoryRoute.name, initialChildren: children);

  static const String name = 'AddCategoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddCategoryScreen();
    },
  );
}

/// generated route for
/// [AddTransactionScreen]
class AddTransactionRoute extends PageRouteInfo<void> {
  const AddTransactionRoute({List<PageRouteInfo>? children})
    : super(AddTransactionRoute.name, initialChildren: children);

  static const String name = 'AddTransactionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddTransactionScreen();
    },
  );
}

/// generated route for
/// [AnalysisScreen]
class AnalysisRoute extends PageRouteInfo<void> {
  const AnalysisRoute({List<PageRouteInfo>? children})
    : super(AnalysisRoute.name, initialChildren: children);

  static const String name = 'AnalysisRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AnalysisScreen();
    },
  );
}

/// generated route for
/// [CategoriesScreen]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoriesScreen();
    },
  );
}

/// generated route for
/// [ContainerScreen]
class ContainerRoute extends PageRouteInfo<void> {
  const ContainerRoute({List<PageRouteInfo>? children})
    : super(ContainerRoute.name, initialChildren: children);

  static const String name = 'ContainerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContainerScreen();
    },
  );
}

/// generated route for
/// [OnboardScreen]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardScreen();
    },
  );
}

/// generated route for
/// [OverviewScreen]
class OverviewRoute extends PageRouteInfo<void> {
  const OverviewRoute({List<PageRouteInfo>? children})
    : super(OverviewRoute.name, initialChildren: children);

  static const String name = 'OverviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OverviewScreen();
    },
  );
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Duration? delayInitialize,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(delayInitialize: delayInitialize, key: key),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return SplashScreen(delayInitialize: args.delayInitialize, key: args.key);
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({this.delayInitialize, this.key});

  final Duration? delayInitialize;

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{delayInitialize: $delayInitialize, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashRouteArgs) return false;
    return delayInitialize == other.delayInitialize && key == other.key;
  }

  @override
  int get hashCode => delayInitialize.hashCode ^ key.hashCode;
}

/// generated route for
/// [WalletScreen]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute({List<PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WalletScreen();
    },
  );
}
