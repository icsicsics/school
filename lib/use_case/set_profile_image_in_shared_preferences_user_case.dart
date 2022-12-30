import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetImageProfileInSharedPreferencesUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetImageProfileInSharedPreferencesUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String profileImage}) async {
    return await sharedPreferenceManager.setProfileImage(profileImage);
  }
}
