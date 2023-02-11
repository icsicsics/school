
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

class GetTeacherImageProfileFromSharedPreferencesUseCase {
  Future<String?> call() async {
    return await SharedPreferencesManager().getTeacherProfileImage();
  }
}
