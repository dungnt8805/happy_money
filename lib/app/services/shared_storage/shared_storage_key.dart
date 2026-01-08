part of shared_storage;

enum SharedStorageKey {
  appHasOpened('has_opened'),
  appLang('APP_LANG'),
  appThemeMode('APP_THEME_MODE'),
  locationPermanentlyDenied('LOCATION_PERMANENT_DENIED')
  ;

  const SharedStorageKey(this.key);

  final String key;
}

extension SharedStoreKeyExt on SharedStorageKey {
  Future<void> write(Object value) async {
    await SharedStorage.write(key, value);
  }

  T? read<T>() => SharedStorage.read<T>(key);

  T readOrDefault<T>(T defaultValue) =>
      SharedStorage.readOrDefault<T>(key, defaultValue);
}
