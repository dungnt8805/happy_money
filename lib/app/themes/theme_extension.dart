part of app_theme;

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppTheme._lightAppColors;

  /// TextStyle Extension
  AppTextStyleExtension get appTextStyles =>
      Theme.of(this).extension<AppTextStyleExtension>() ??
      AppTheme._lightTextTheme;

  TextStyle get text10 => appTextStyles.text10;

  TextStyle get text12 => appTextStyles.text12;

  TextStyle get text14 => appTextStyles.text14;

  TextStyle get title16 => appTextStyles.title16;

  TextStyle get title18 => appTextStyles.title18;

  TextStyle get h24 => appTextStyles.h24;

  TextStyle get h30 => appTextStyles.h30;

  TextStyle get h34 => appTextStyles.h34;
}
