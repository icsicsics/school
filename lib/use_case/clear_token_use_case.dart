import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class ClearTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const ClearTokenUseCase(this.sharedPreferenceManager);

  Future<bool> call() async {
    return await sharedPreferenceManager.clearToken() ?? false;
  }
}
