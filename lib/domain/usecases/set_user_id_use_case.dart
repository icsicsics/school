import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetUserIdUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetUserIdUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String userId}) async {
    return await sharedPreferenceManager.setUserId(userId);
  }
}
