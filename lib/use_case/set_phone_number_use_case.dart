import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetPhoneNumberUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetPhoneNumberUseCase(this.sharedPreferenceManager);

  Future<bool> call(String phoneNumber) async {
    return await sharedPreferenceManager.setPhoneNumber(phoneNumber);
  }
}