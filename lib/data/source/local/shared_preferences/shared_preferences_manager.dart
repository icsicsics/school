import 'package:schools/data/source/local/shared_preferences/shared_preferences_keys.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_utils.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _sharedPreference =
      SharedPreferencesManager._internal();

  factory SharedPreferencesManager() {
    return _sharedPreference;
  }

  SharedPreferencesManager._internal();

  Future<bool> setLanguageCode(String languageCode) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.appLanguage, languageCode);
  }

  Future<String?> getLanguageCode() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.appLanguage);
  }

  Future<String?> getNotificationToken() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.notificationToken);
  }

  static Future<bool> setNotificationToken(String? notificationToken) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.notificationToken, notificationToken!);
  }

  static Future<String?> getAppVersion() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.appVersion);
  }

  static Future<void> setAppVersion(String appVersion) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.appVersion, appVersion);
  }

  static Future<void> setDeviceToken(String deviceToken) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.deviceToken, deviceToken);
  }

  static Future<String?> getDeviceToken() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.deviceToken);
  }

  static Future<String?> getDevicePlatform() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.devicePlatform);
  }

  static Future<void> setDevicePlatform(String devicePlatform) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.devicePlatform, devicePlatform);
  }

  static Future<String?> getOsVersion() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.osVersion);
  }

  static Future<void> setOsVersion(String osVersion) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.osVersion, osVersion);
  }

  static Future<String?> getIpAddress() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.ipAddress);
  }

  static Future<void> setIpAddress(String ipAddress) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.ipAddress, ipAddress);
  }
  static Future<void> setDeviceInfoData(
      {String? ipAddress,
      String? osVersion,
      String? deviceToken,
      String? devicePlatform}) async {
    await setIpAddress(ipAddress!);
    await setOsVersion(osVersion!);
    await setDevicePlatform(devicePlatform!);
    await setDeviceToken(deviceToken!);
  }

  static Future<bool?> getIsFather() async {
    return await SharedPreferencesUtils.getBool(SharedPreferencesKeys.isFather);
  }

  static Future<void> setIsFather(bool isFather) async {
    await SharedPreferencesUtils.setBool(SharedPreferencesKeys.isFather,
        data: isFather);
  }

  Future<bool> setTeacherProfileImage(String data) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.profileTeacherImage, data);
  }

  Future<String?> getTeacherProfileImage() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.profileTeacherImage);
  }

  Future<bool> setToken(String token) async {
    return await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.token, token);
  }

  Future<String?> getToken() async {
    return await SharedPreferencesUtils.getString(SharedPreferencesKeys.token);
  }
}
