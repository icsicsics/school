import 'package:schools/data/source/local/shared_preferences/shared_preferences_keys.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_utils.dart';

class SharedPreferencesManager {
  static Future<String?> getAppLanguage() async {
    return await SharedPreferencesUtils.getString(
        SharedPreferencesKeys.appLanguage);
  }

  static Future<void> setAppLanguage(String appLanguage) async {
    await SharedPreferencesUtils.setString(
        SharedPreferencesKeys.appLanguage, appLanguage);
  }
}
