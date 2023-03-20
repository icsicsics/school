import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetFirebaseTokenUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetFirebaseTokenUseCase(this.sharedPreferenceManager);

  Future<String> call() async {
    return await sharedPreferenceManager.getNotificationToken() ?? "";
  }
}
