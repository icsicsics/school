import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetTokenUseCase(this.sharedPreferenceManager);

  Future<String?> call() async {
    return await sharedPreferenceManager.getToken();
  }
}