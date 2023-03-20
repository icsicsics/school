
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetLanguageCodeUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const GetLanguageCodeUseCase(this.sharedPreferenceManager);

  Future<String?> call() async {
    return await sharedPreferenceManager.getLanguageCode();
  }
}
