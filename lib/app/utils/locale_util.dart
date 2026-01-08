part of utils;

class LocaleUtil {
  static ({String languageCode, String countryCode}) getSystemLocale() {
    final component = Platform.localeName.split('_');

    return (languageCode: component.first, countryCode: component.last);
  }

  static String getAppLanguageCode() {
    return SharedStorageKey.appLang.read<String>() ??
        getSystemLocale().languageCode;
  }
}
