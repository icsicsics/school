part of 'localization.dart';

abstract class AppLocalizationEvent {}

class ChangeLanguageEvent extends AppLocalizationEvent {
  final String language;

  ChangeLanguageEvent({required this.language});
}
