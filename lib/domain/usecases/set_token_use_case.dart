import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetTokenUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String token}) async {
    return await sharedPreferenceManager.setToken(token);
  }
}
