import 'package:schools/data/source/di/injector.dart';
import 'package:schools/use_case/get_language_use_case.dart';
import 'package:schools/use_case/save_language_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<GetLanguageCodeUseCase>(
          () => GetLanguageCodeUseCase(injector()));
  injector.registerFactory<SaveLanguageCodeUseCase>(
          () => SaveLanguageCodeUseCase(injector()));
}
