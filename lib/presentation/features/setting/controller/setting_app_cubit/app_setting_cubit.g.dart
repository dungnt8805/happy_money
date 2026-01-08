// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppSettingStateCWProxy {
  AppSettingState themeMode(ThemeMode themeMode);

  AppSettingState appLocale(Locale appLocale);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AppSettingState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AppSettingState(...).copyWith(id: 12, name: "My name")
  /// ```
  AppSettingState call({ThemeMode themeMode, Locale appLocale});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAppSettingState.copyWith(...)` or call `instanceOfAppSettingState.copyWith.fieldName(value)` for a single field.
class _$AppSettingStateCWProxyImpl implements _$AppSettingStateCWProxy {
  const _$AppSettingStateCWProxyImpl(this._value);

  final AppSettingState _value;

  @override
  AppSettingState themeMode(ThemeMode themeMode) => call(themeMode: themeMode);

  @override
  AppSettingState appLocale(Locale appLocale) => call(appLocale: appLocale);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AppSettingState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AppSettingState(...).copyWith(id: 12, name: "My name")
  /// ```
  AppSettingState call({
    Object? themeMode = const $CopyWithPlaceholder(),
    Object? appLocale = const $CopyWithPlaceholder(),
  }) {
    return AppSettingState(
      themeMode: themeMode == const $CopyWithPlaceholder() || themeMode == null
          ? _value.themeMode
          // ignore: cast_nullable_to_non_nullable
          : themeMode as ThemeMode,
      appLocale: appLocale == const $CopyWithPlaceholder() || appLocale == null
          ? _value.appLocale
          // ignore: cast_nullable_to_non_nullable
          : appLocale as Locale,
    );
  }
}

extension $AppSettingStateCopyWith on AppSettingState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAppSettingState.copyWith(...)` or `instanceOfAppSettingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppSettingStateCWProxy get copyWith => _$AppSettingStateCWProxyImpl(this);
}
