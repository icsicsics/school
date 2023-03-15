import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetRefreshTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetRefreshTokenUseCase(this.sharedPreferenceManager);

  Future<String?> call() async {
    return await sharedPreferenceManager.getRefreshToken();
  }
}