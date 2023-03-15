import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetPhoneNumberUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetPhoneNumberUseCase(this.sharedPreferenceManager);

  Future<String?> call() async {
    return await sharedPreferenceManager.getPhoneNumber();
  }
}