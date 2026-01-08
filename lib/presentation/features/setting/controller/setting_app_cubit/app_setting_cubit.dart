import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/const/constants.dart';
import 'package:happy_money/app/services/shared_storage/shared_storage.dart';
import 'package:happy_money/app/utils/utils.dart';
import 'package:happy_money/l10n/app_localizations.dart';

part 'app_setting_cubit.g.dart';
part 'app_setting_state.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(const AppSettingState()) {
    _init();
  }

  void _init() {
    setThemeMode(_getThemeMode());
    setLanguage(Locale(LocaleUtil.getAppLanguageCode()), isInit: true);
  }

  void setThemeMode(ThemeMode mode) {
    if (mode == state.themeMode) return;
    SharedStorageKey.appThemeMode.write(mode.name);
    emit(state.copyWith.themeMode(mode));
  }

  ThemeMode _getThemeMode() {
    final appThemeMode = SharedStorageKey.appThemeMode.read<String>();

    if (appThemeMode == null) return ThemeMode.light;

    return _getThemeModeFromString(appThemeMode);
  }

  ThemeMode _getThemeModeFromString(String mode) {
    if (mode == ThemeMode.light.name) return ThemeMode.light;

    if (mode == ThemeMode.dark.name) return ThemeMode.dark;

    return ThemeMode.system;
  }

  Future<void> setLanguage(Locale locale, {bool isInit = false}) async {
    try {
      if (locale.languageCode == state.appLocale.languageCode) return;

      if (!AppLocalizations.delegate.isSupported(locale)) {
        SharedStorageKey.appLang.write(kLangCode);
        return;
      }
      await AppLocalizations.delegate.load(locale);
      SharedStorageKey.appLang.write(locale.languageCode);

      emit(state.copyWith.appLocale(locale));

      if (isInit) return;
    } on Exception catch (e) {
      debugPrint('Failed to set language: $e');
    }
  }
}
