import 'package:get_it/get_it.dart';
import 'package:schools/data/source/di/use_case_injector.dart';
import 'package:schools/data/source/di/bloc_injector.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();

  injector.registerLazySingleton(() => SharedPreferencesManager());
}