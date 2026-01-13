import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:happy_money/app/analytics/firebase_analytics.dart';
import 'package:happy_money/app/app_responsive.dart';
import 'package:happy_money/app/const/constants.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/l10n/app_localizations.dart';
import 'package:happy_money/presentation/features/setting/controller/setting_app_cubit/app_setting_cubit.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          state.themeMode == ThemeMode.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        );
        return AppResponsive(
          child: MaterialApp.router(
            title: kAppName,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: state.themeMode,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(
              appRouter,
              navigatorObservers: () => [
                AutoRouteObserver(),
                FBAnalytics().observer,
              ],
            ),
            locale: state.appLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
