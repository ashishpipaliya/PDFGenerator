import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'package:pdf_gen/utils/logger.dart';

class DeviceUtil {
  factory DeviceUtil() {
    return _singleton;
  }
  static final DeviceUtil _singleton = DeviceUtil._internal();

  DeviceUtil._internal() {
    Logger().v("Instance created DeviceUtil");
  }

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  getDeviceId() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final _deviceId = androidInfo.androidId;
    return _deviceId;
  }

  getDeviceType() async {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final _deviceType = Platform.isIOS ? 'ios' : 'android';
    return _deviceType;
  }

  String currentLanguageCode = "en";
  String _deviceId = '';
  String get deviceId => _deviceId;

  String _version = '';
  String _buildNumber = '';
  bool isPhysicalDevice = false;
  String get versionName => '$_version ($_buildNumber)';
  String get deviceType => Platform.isIOS ? 'ios' : 'android';

  Future<void> updateDeviceInfo() async {
    // Getting Device Info
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _deviceId = androidInfo.androidId;
      isPhysicalDevice = androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _deviceId = iosInfo.identifierForVendor;
      isPhysicalDevice = iosInfo.isPhysicalDevice;
    }

    // Getting Device Info
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    //
  }
}
