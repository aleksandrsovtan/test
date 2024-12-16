import 'dart:math';
import 'package:test_task/assets/icons/icons.dart';

class IconsData {
  static const publicWifiList = [
    AppIcons.icNetworkWifi,
    AppIcons.icSignalWifi0Bar,
  ];
  static const lockedWifiList = [
    AppIcons.icSignalWifi1BarLock,
    AppIcons.icSignalWifi2BarLock,
  ];

  static String getRandomIcon(bool hasLock) {
    final random = Random();
    if (hasLock) {
      return lockedWifiList[random.nextInt(lockedWifiList.length)];
    } else {
      return publicWifiList[random.nextInt(publicWifiList.length)];
    }
  }
}
