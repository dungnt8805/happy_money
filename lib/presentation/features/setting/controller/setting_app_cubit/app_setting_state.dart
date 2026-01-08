part of 'app_setting_cubit.dart';

@CopyWith()
class AppSettingState extends Equatable {
  const AppSettingState({
    this.themeMode = ThemeMode.system,
    this.appLocale = kLocale,
  });

  final ThemeMode themeMode;
  final Locale appLocale;

  @override
  List<Object?> get props => [themeMode, appLocale];
}

extension AppSettingStateExt on BuildContext {
  String get appLanguageCode =>
      read<AppSettingCubit>().state.appLocale.languageCode;
}
