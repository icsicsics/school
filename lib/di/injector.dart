import 'package:get_it/get_it.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/domain/usecases/get_firebase_token_use_case.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/get_phone_number_use_case.dart';
import 'package:schools/domain/usecases/get_profile_image_use_case.dart';
import 'package:schools/domain/usecases/get_testcher_profile_image_from_shared_preferences_user_case.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';
import 'package:schools/domain/usecases/save_language_use_case.dart';
import 'package:schools/domain/usecases/set_phone_number_use_case.dart';
import 'package:schools/domain/usecases/set_teacher_profile_image_in_shared_preferences_user_case.dart';
import 'package:schools/domain/usecases/set_token_use_case.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/bloc/channels/channels_bloc.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/bloc/localization/localization/app_localization_cubit.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/bloc/splash/splash_bloc.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);

  injector.registerLazySingleton(() => SharedPreferencesManager());

  //Use cases
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
  injector.registerFactory<SetTokenUseCase>(() => SetTokenUseCase(injector()));
  injector.registerFactory<GetTokenUseCase>(() => GetTokenUseCase(injector()));
  injector.registerFactory<GetFirebaseTokenUseCase>(
      () => GetFirebaseTokenUseCase(injector()));
  injector.registerFactory<GetPhoneNumberUseCase>(
      () => GetPhoneNumberUseCase(injector()));
  injector.registerFactory<SetPhoneNumberUseCase>(
      () => SetPhoneNumberUseCase(injector()));

  //Bloc
  injector.registerFactory<LocalizationCubit>(() => LocalizationCubit(
        injector(),
        injector(),
      ));
  injector.registerFactory<SplashBloc>(() => SplashBloc());
  injector.registerFactory<HomeBloc>(() => HomeBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<LoginBloc>(() => LoginBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<VerifyBloc>(() => VerifyBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<NotificationsBloc>(() => NotificationsBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<SideMenuBloc>(() => SideMenuBloc(
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<StudentHousesBloc>(() => StudentHousesBloc());
  injector.registerFactory<ProfileBloc>(() => ProfileBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<SchoolHousesBloc>(() => SchoolHousesBloc());
  injector.registerFactory<AboutBloc>(() => AboutBloc());
  injector.registerFactory<MyChildrenBloc>(() => MyChildrenBloc(
        injector(),
      ));
  injector.registerFactory<AddPointBloc>(() => AddPointBloc());

  injector.registerFactory<ChannelsBloc>(() => ChannelsBloc());
}
