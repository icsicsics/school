import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetRefreshTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetRefreshTokenUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String refreshToken}) async {
    return await sharedPreferenceManager.setRefreshToken(refreshToken);
  }
}
