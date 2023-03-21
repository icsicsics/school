import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetUserIdUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetUserIdUseCase(this.sharedPreferenceManager);

  Future<String> call() async {
    return await sharedPreferenceManager.getUserId() ?? "";
  }
}
