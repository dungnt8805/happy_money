part of utils;

/// Class providing all wakelock functionality using static members.
///
/// To enable the wakelock, you can use [WakelockUtil.enable] and to disable it,
/// you can call [WakelockUtil.disable].
/// You do not need to worry about making redundant calls, e.g. calling
/// [WakelockUtil.enable] when the wakelock is already enabled as the plugin handles
/// this for you, i.e. it checks the status to determine if the wakelock is
/// already enabled or disabled.
/// If you want the flexibility to pass a [bool] to control whether the wakelock
/// should be enabled or disabled, you can use [WakelockUtil.toggle].
///
/// The [WakelockUtil.enabled] getter allows you to retrieve the current wakelock
/// status of the device..
class WakelockUtil {
  /// Enables the wakelock.
  ///
  /// This can simply be called using `WakelockUtil.enable()` and does not return
  /// anything.
  /// You can await the [Future] to wait for the operation to complete.
  ///
  /// See also:
  /// * [toggle], which allows to enable or disable using a [bool] parameter.
  static Future<void> enable() => WakelockPlus.enable();

  /// Disables the wakelock.
  ///
  /// This can simply be called using `WakelockUtil.disable()` and does not return
  /// anything.
  /// You can await the [Future] to wait for the operation to complete.
  ///
  /// See also:
  /// * [toggle], which allows to enable or disable using a [bool] parameter.
  static Future<void> disable() => WakelockPlus.disable();

  /// Toggles the wakelock on or off.
  ///
  /// You can simply use this function to toggle the wakelock using a [bool]
  /// value (for the [enable] parameter).
  ///
  /// ```dart
  /// // This line keeps the screen on.
  /// WakelockUtil.toggle(enable: true);
  ///
  /// bool enableWakelock = false;
  /// // The following line disables the WakelockUtil.
  /// WakelockUtil.toggle(enable: enableWakelock);
  /// ```
  ///
  /// You can await the [Future] to wait for the operation to complete.
  static Future<void> toggle({required bool enable}) {
    return WakelockPlus.toggle(enable: enable);
  }

  /// Returns whether the wakelock is currently enabled or not.
  ///
  /// If you want to retrieve the current wakelock status, you will have to call
  /// [WakelockUtil.enabled] and await its result:
  ///
  /// ```dart
  /// bool wakelockEnabled = await WakelockUtil.enabled;
  /// ```
  static Future<bool> get enabled => WakelockPlus.enabled;
}
