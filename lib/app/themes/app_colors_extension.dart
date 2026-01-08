part of app_theme;

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.warring,
    required this.success,
    required this.notification,
    required this.background,
    required this.background2,
    required this.onBackground,
    required this.onBackground2,
    required this.onBackground3,
  });

  final Color primary;
  final Color secondary;
  final Color error;
  final Color warring;
  final Color success;
  final Color notification;
  final Color background;
  final Color background2;
  final Color onBackground;
  final Color onBackground2;
  final Color onBackground3;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? error,
    Color? warring,
    Color? success,
    Color? notification,
    Color? background,
    Color? background2,
    Color? onBackground,
    Color? onBackground2,
    Color? onBackground3,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      warring: warring ?? this.warring,
      success: success ?? this.success,
      notification: notification ?? this.notification,
      background: background ?? this.background,
      background2: background2 ?? this.background2,
      onBackground: onBackground ?? this.onBackground,
      onBackground2: onBackground2 ?? this.onBackground2,
      onBackground3: onBackground3 ?? this.onBackground3,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      warring: Color.lerp(warring, other.warring, t)!,
      success: Color.lerp(success, other.success, t)!,
      notification: Color.lerp(notification, other.notification, t)!,
      background: Color.lerp(background, other.background, t)!,
      background2: Color.lerp(background2, other.background2, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackground2: Color.lerp(onBackground2, other.onBackground2, t)!,
      onBackground3: Color.lerp(onBackground3, other.onBackground3, t)!,
    );
  }
}
