library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_palette.dart';
part 'text_styles.dart';
part 'theme_extension.dart';
part 'app_colors_extension.dart';
part 'app_text_style_extension.dart';

class AppTheme {
  static final _defaultTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    fontFamilyFallback: ['Roboto'],
  );

  static final Color _splashColor = AppPalette.primary.withValues(alpha: 0.1);
  static final Color _highlightColor = AppPalette.primary.withValues(
    alpha: 0.2,
  );
  static final _inputDecorationTheme = InputDecorationTheme(
    fillColor: AppPalette.white.shade800,
  );
  static const _bottomSheetTheme = BottomSheetThemeData(
    clipBehavior: Clip.hardEdge,
    dragHandleSize: Size(64, 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
    ),
  );

  ///
  /// Light theme
  ///
  static ThemeData get light {
    return _defaultTheme.copyWith(
      brightness: Brightness.light,
      extensions: [_lightAppColors, _lightTextTheme],
      scaffoldBackgroundColor: _lightAppColors.background,
      unselectedWidgetColor: _lightAppColors.onBackground,
      inputDecorationTheme: _inputDecorationTheme,
      splashColor: _splashColor,
      highlightColor: _highlightColor,
      primaryColor: _lightAppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _lightAppColors.primary,
        primary: _lightAppColors.primary,
        onPrimary: _lightAppColors.onBackground,
        secondary: _lightAppColors.secondary,
        onSecondary: _lightAppColors.onBackground,
        error: _lightAppColors.error,
        surface: _lightAppColors.background,
        onSurface: _lightAppColors.onBackground,
      ),
      textTheme: _defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: _TextStyles.text14.copyWith(
          color: _lightAppColors.onBackground,
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: _lightAppColors.background,
        backgroundColor: _lightAppColors.background,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actionsIconTheme: IconThemeData(color: _lightAppColors.onBackground),
      ),
      iconTheme: IconThemeData(color: _lightAppColors.onBackground),
      tabBarTheme: TabBarThemeData(
        indicatorColor: _lightAppColors.primary,
        dividerColor: _lightAppColors.background2,
        labelColor: _lightAppColors.primary,
        unselectedLabelColor: _lightAppColors.onBackground,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppPalette.primary;
          return _lightAppColors.onBackground3;
        }),
      ),
      bottomSheetTheme: _bottomSheetTheme.copyWith(
        backgroundColor: _lightAppColors.background,
        dragHandleColor: _lightAppColors.onBackground3,
        modalBarrierColor: const Color(0x33000000),
      ),
    );
  }

  static final _lightAppColors = AppColorsExtension(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    error: AppPalette.red,
    warring: AppPalette.orange,
    success: AppPalette.green,
    notification: AppPalette.blue,
    background: AppPalette.bgrLight,
    background2: AppPalette.bgrLight2,
    onBackground: AppPalette.onBgrLight,
    onBackground2: AppPalette.onBgrLight2,
    onBackground3: AppPalette.onBgrLight3,
  );

  static final _lightTextTheme = AppTextStyleExtension(
    text10: _TextStyles.text10.copyWith(color: _lightAppColors.onBackground),
    text12: _TextStyles.text12.copyWith(color: _lightAppColors.onBackground),
    text14: _TextStyles.text14.copyWith(color: _lightAppColors.onBackground),
    title16: _TextStyles.title16.copyWith(color: _lightAppColors.onBackground),
    title18: _TextStyles.title18.copyWith(color: _lightAppColors.onBackground),
    h24: _TextStyles.h24.copyWith(color: _lightAppColors.onBackground),
    h30: _TextStyles.h30.copyWith(color: _lightAppColors.onBackground),
    h34: _TextStyles.h34.copyWith(color: _lightAppColors.onBackground),
  );

  ///
  /// Dark theme
  ///
  static ThemeData get dark {
    return _defaultTheme.copyWith(
      brightness: Brightness.dark,
      extensions: [_darkAppColors, _darkTextTheme],
      scaffoldBackgroundColor: _darkAppColors.background,
      unselectedWidgetColor: _darkAppColors.onBackground,
      inputDecorationTheme: _inputDecorationTheme,
      splashColor: _splashColor,
      highlightColor: _highlightColor,
      primaryColor: _darkAppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _darkAppColors.primary,
        brightness: Brightness.dark,
        primary: _darkAppColors.primary,
        onPrimary: _darkAppColors.onBackground,
        secondary: _darkAppColors.secondary,
        onSecondary: _darkAppColors.onBackground,
        error: _darkAppColors.error,
        surface: _darkAppColors.background,
        onSurface: _darkAppColors.onBackground,
      ),
      textTheme: _defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: _TextStyles.text14.copyWith(
          color: _darkAppColors.onBackground,
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: _darkAppColors.background,
        backgroundColor: _darkAppColors.background,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actionsIconTheme: IconThemeData(color: _darkAppColors.onBackground),
      ),
      iconTheme: IconThemeData(color: _darkAppColors.onBackground),
      tabBarTheme: TabBarThemeData(
        indicatorColor: _darkAppColors.primary,
        dividerColor: _lightAppColors.background2,
        labelColor: _darkAppColors.primary,
        unselectedLabelColor: _darkAppColors.onBackground,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppPalette.primary;
          return _darkAppColors.onBackground3;
        }),
      ),
      bottomSheetTheme: _bottomSheetTheme.copyWith(
        backgroundColor: _darkAppColors.background,
        dragHandleColor: _darkAppColors.onBackground3,
        modalBarrierColor: const Color(0x7A000000),
      ),
    );
  }

  static final _darkAppColors = AppColorsExtension(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    error: AppPalette.red,
    warring: AppPalette.orange,
    success: AppPalette.greenDark,
    notification: AppPalette.blue,
    background: AppPalette.bgrDark,
    background2: AppPalette.bgrDark2,
    onBackground: AppPalette.onBgrDark,
    onBackground2: AppPalette.onBgrDark2,
    onBackground3: AppPalette.onBgrDark3,
  );

  static final _darkTextTheme = AppTextStyleExtension(
    text10: _TextStyles.text10.copyWith(color: _darkAppColors.onBackground),
    text12: _TextStyles.text12.copyWith(color: _darkAppColors.onBackground),
    text14: _TextStyles.text14.copyWith(color: _darkAppColors.onBackground),
    title16: _TextStyles.title16.copyWith(color: _darkAppColors.onBackground),
    title18: _TextStyles.title18.copyWith(color: _darkAppColors.onBackground),
    h24: _TextStyles.h24.copyWith(color: _darkAppColors.onBackground),
    h30: _TextStyles.h30.copyWith(color: _darkAppColors.onBackground),
    h34: _TextStyles.h34.copyWith(color: _darkAppColors.onBackground),
  );
}
