import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';


import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class DeviceInformation {
  var deviceData = <String, dynamic>{};
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<void> initDeviceInformation() async {
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        _saveAndroidInformation();
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        _saveIosInformation();
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
  }

  Future<void> initPackageInformation() async {
    PackageInfo packageInformation = await PackageInfo.fromPlatform();
    SharedPreferencesManager.setAppVersion(packageInformation.version);
  }

  Future<void> _saveIosInformation() async {
    await SharedPreferencesManager.setDeviceInfoData(
        ipAddress: "",
        devicePlatform: 'IOS',
        osVersion: deviceData['systemVersion'],
        deviceToken: deviceData['identifierForVendor']);
  }

  Future<void> _saveAndroidInformation() async {
    await SharedPreferencesManager.setDeviceInfoData(
        ipAddress: "",
        devicePlatform: 'Android',
        osVersion: deviceData['version.release'],
        deviceToken: deviceData['androidId']);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.release': build.version.release,
      'androidId': build.id,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'systemVersion': data.systemVersion,
      'identifierForVendor': data.identifierForVendor,
    };
  }
}
