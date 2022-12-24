import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SaveLanguageCodeUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SaveLanguageCodeUseCase(this.sharedPreferenceManager);

  Future<bool> call(String languageCode) async {
    return await sharedPreferenceManager.setLanguageCode(languageCode);
  }
}
