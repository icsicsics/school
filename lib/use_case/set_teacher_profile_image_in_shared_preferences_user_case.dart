import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class SetTeacherImageProfileInSharedPreferencesUseCase {
  final SharedPreferencesManager sharedPreferenceManager;

  const SetTeacherImageProfileInSharedPreferencesUseCase(this.sharedPreferenceManager);

  Future<bool> call({required String profileImage}) async {
    return await sharedPreferenceManager.setTeacherProfileImage(profileImage);

  }
}
