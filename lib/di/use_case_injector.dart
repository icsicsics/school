import 'package:schools/di/injector.dart';
import 'package:schools/domain/usecases/clear_token_use_case.dart';
import 'package:schools/domain/usecases/get_firebase_token_use_case.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/get_phone_number_use_case.dart';
import 'package:schools/domain/usecases/get_profile_image_use_case.dart';
import 'package:schools/domain/usecases/get_refresh_token_use_case.dart';
import 'package:schools/domain/usecases/get_testcher_profile_image_from_shared_preferences_user_case.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';
import 'package:schools/domain/usecases/save_language_use_case.dart';
import 'package:schools/domain/usecases/set_phone_number_use_case.dart';
import 'package:schools/domain/usecases/set_refresh_token_use_case.dart';
import 'package:schools/domain/usecases/set_teacher_profile_image_in_shared_preferences_user_case.dart';
import 'package:schools/domain/usecases/set_token_use_case.dart';
import 'package:schools/domain/usecases/set_user_id_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<GetLanguageCodeUseCase>(
      () => GetLanguageCodeUseCase(injector()));
  injector.registerFactory<SaveLanguageCodeUseCase>(
      () => SaveLanguageCodeUseCase(injector()));
  injector
      .registerFactory<GetProfileImageUseCase>(() => GetProfileImageUseCase());
  injector.registerFactory<GetTeacherImageProfileFromSharedPreferencesUseCase>(
      () => GetTeacherImageProfileFromSharedPreferencesUseCase());
  injector.registerFactory<SetTeacherImageProfileInSharedPreferencesUseCase>(
      () => SetTeacherImageProfileInSharedPreferencesUseCase(injector()));
  injector.registerFactory<SetTokenUseCase>(
          () => SetTokenUseCase(injector()));
  injector.registerFactory<GetTokenUseCase>(
          () => GetTokenUseCase(injector()));
  injector.registerFactory<GetFirebaseTokenUseCase>(
          () => GetFirebaseTokenUseCase(injector()));
  injector.registerFactory<ClearTokenUseCase>(
          () => ClearTokenUseCase(injector()));
  injector.registerFactory<GetRefreshTokenUseCase>(
          () => GetRefreshTokenUseCase(injector()));
  injector.registerFactory<SetRefreshTokenUseCase>(
          () => SetRefreshTokenUseCase(injector()));
  injector.registerFactory<GetPhoneNumberUseCase>(
          () => GetPhoneNumberUseCase(injector()));
  injector.registerFactory<SetPhoneNumberUseCase>(
          () => SetPhoneNumberUseCase(injector()));
  injector.registerFactory<SetUserIdUseCase>(
          () => SetUserIdUseCase(injector()));


}
