import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtil {
  ///Disable camera record
  static bool isIpad = true;

  static Future<void> checkIsIpad() async {
    if (!Platform.isIOS) return;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final IosDeviceInfo info = await deviceInfo.iosInfo;
    if (info.model.isEmpty) return;
    if (info.model.toLowerCase().contains('ipad')) {
      isIpad = true;
      return;
    }
    return;
  }
}
