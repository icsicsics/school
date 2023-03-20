import 'package:get_it/get_it.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/di/bloc_injector.dart';
import 'package:schools/di/use_case_injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);

  injector.registerLazySingleton(() => SharedPreferencesManager());
}