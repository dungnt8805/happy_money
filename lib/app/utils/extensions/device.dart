import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtil {
  static String _deviceId = '';

  static Future<String> getDeviceId() async {
    if (_deviceId.isNotEmpty) return _deviceId;

    if (Platform.isIOS) {
      final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      _deviceId = iosDeviceInfo.identifierForVendor ?? '';
    }

    if (Platform.isAndroid) {
      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      _deviceId = androidDeviceInfo.id;
    }

    return _deviceId;
  }

  static Future<bool> isAndroidBiggerThanSDK33() async {
    if (Platform.isAndroid) {
      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      return androidDeviceInfo.version.sdkInt >= 33;
    }
    return false;
  }
}
