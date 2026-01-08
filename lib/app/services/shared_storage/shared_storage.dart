///
/// SharedStorage wrapper library.
///

library shared_storage;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

part 'shared_storage_exception.dart';
part 'shared_storage_key.dart';

/// ///
/// [SharedStorage] is a service that supports simple data storage
/// ///
/// use it:
///
/// Please call ensureInitialized()  before calling runApp().
/// ```dart
///   void main() async {
///      await SharedStore.ensureInitialized();
///
///      runApp(App());
///   }
/// ```
///
/// ``` Write value:
///  SharedStore.write<String>("key", "sakura");
/// ```
///
/// ``` Read value:
///   final String? data = SharedStore.read<String>("key");
///   final String data = SharedStore.readOrDefault<String>("key", "defaultValue");
/// ```
///
/// Supported Type: String, int, double, bool,
///   List<String>, Map<String, dynamic>.
///

class SharedStorage {
  factory SharedStorage() => _instance ??= SharedStorage._();

  SharedStorage._();

  static SharedStorage? _instance;

  static late SharedPreferences _preferences;

  ///
  /// Returns an instance of the [SharedPreferences].
  ///
  /// If you need to use SharedStoreHelper.
  /// You need to call this method before calling runApp().
  ///
  static Future<void> ensureInitialized() async {
    try {
      _preferences = await SharedPreferences.getInstance();
    } catch (e) {
      throw SharedStorageException(e.toString());
    }
  }

  ///
  /// Write the value
  ///
  /// Saves a value to persistent storage in the background.
  ///
  static Future<void> write(String key, Object value) async {
    try {
      if (value is Map<String, dynamic>) {
        await _preferences.setString(key, jsonEncode(value));
        return;
      }

      switch (value.runtimeType) {
        case const (String):
          await _preferences.setString(key, value as String);

        case const (int):
          await _preferences.setInt(key, value as int);

        case const (double):
          await _preferences.setDouble(key, value as double);

        case const (bool):
          await _preferences.setBool(key, value as bool);

        case const (List<String>):
          await _preferences.setStringList(key, value as List<String>);

        default:
          throw SharedStorageException(
            'Unsupported value type (key: $key - value: $value)',
          );
      }
    } catch (e) {
      throw SharedStorageException(e.toString());
    }
  }

  ///
  /// Read the value
  ///
  /// Reads a value from persistent storage,
  /// throwing an exception if it's not a [T]
  ///
  ///
  static T? read<T>(String key) => _readByType(key);

  static T readOrDefault<T>(String key, T defaultValue) =>
      _readByType(key) ?? defaultValue;

  static T? _readByType<T>(String key) {
    try {
      switch (T) {
        case String:
          return _preferences.getString(key) as T?;

        case int:
          return _preferences.getInt(key) as T?;

        case double:
          return _preferences.getDouble(key) as T?;

        case bool:
          return _preferences.getBool(key) as T?;

        case const (List<String>):
          return _preferences.getStringList(key) as T?;

        case const (Map<String, dynamic>):
          final jsonData = _preferences.getString(key);
          if (jsonData == null) {
            return Map.of({}) as T?;
          } else {
            return jsonDecode(jsonData) as T?;
          }

        default:
          throw SharedStorageException('Unsupported value type (key: $key');
      }
    } catch (e) {
      throw SharedStorageException(e.toString());
    }
  }

  ///
  /// Deletes associated value for the given [key].
  ///
  static Future<bool> delete(String key) async {
    try {
      return await _preferences.remove(key);
    } catch (e) {
      throw SharedStorageException(e.toString());
    }
  }

  ///
  /// Completes with true once the user preferences
  /// for the app has been cleared.
  ///
  static Future<bool> deleteAll() async {
    try {
      return await _preferences.clear();
    } catch (e) {
      throw SharedStorageException(e.toString());
    }
  }

  ///
  /// Returns true if persistent storage the contains the given [key].
  ///
  static Future<bool> containsKey(String key) async {
    bool containsKey = false;
    try {
      containsKey = _preferences.containsKey(key);
    } catch (e) {
      throw SharedStorageException(e.toString());
    }

    return containsKey;
  }
}
