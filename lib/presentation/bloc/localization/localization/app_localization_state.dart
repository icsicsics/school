part of 'localization.dart';

abstract class AppLocalizationState {}

class ChangeLanguageInitialState extends AppLocalizationState {}

class ChangeLanguageSuccessState extends AppLocalizationState {
  final String language;

  ChangeLanguageSuccessState({required this.language});
}
