part of app_theme;

class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  const AppTextStyleExtension({
    required this.text10,
    required this.text12,
    required this.text14,
    required this.title16,
    required this.title18,
    required this.h24,
    required this.h30,
    required this.h34,
  });

  final TextStyle text10;
  final TextStyle text12;
  final TextStyle text14;

  final TextStyle title16;
  final TextStyle title18;

  final TextStyle h24;
  final TextStyle h30;
  final TextStyle h34;

  @override
  ThemeExtension<AppTextStyleExtension> copyWith({
    TextStyle? text10,
    TextStyle? text12,
    TextStyle? text14,
    TextStyle? title16,
    TextStyle? title18,
    TextStyle? h24,
    TextStyle? h30,
    TextStyle? h34,
  }) {
    return AppTextStyleExtension(
      text10: text10 ?? this.text10,
      text12: text12 ?? this.text12,
      text14: text14 ?? this.text14,
      title16: title16 ?? this.title16,
      title18: title18 ?? this.title18,
      h24: h24 ?? this.h24,
      h30: h30 ?? this.h30,
      h34: h34 ?? this.h34,
    );
  }

  @override
  ThemeExtension<AppTextStyleExtension> lerp(
    covariant ThemeExtension<AppTextStyleExtension>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtension) {
      return this;
    }

    return AppTextStyleExtension(
      text10: TextStyle.lerp(text10, other.text10, t)!,
      text12: TextStyle.lerp(text12, other.text12, t)!,
      text14: TextStyle.lerp(text14, other.text14, t)!,
      title16: TextStyle.lerp(title16, other.title16, t)!,
      title18: TextStyle.lerp(title18, other.title18, t)!,
      h24: TextStyle.lerp(h24, other.h24, t)!,
      h30: TextStyle.lerp(h30, other.h30, t)!,
      h34: TextStyle.lerp(h34, other.h34, t)!,
    );
  }
}
