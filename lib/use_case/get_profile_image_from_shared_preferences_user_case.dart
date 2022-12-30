
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetImageProfileFromSharedPreferencesUseCase {
  Future<String?> call() async {
    return await SharedPreferencesManager().getProfileImage();
  }
}
