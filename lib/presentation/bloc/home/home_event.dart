part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeEvent extends HomeEvent {}

class GetIsFatherEvent extends HomeEvent {}

class ChangeLanguageEvent extends HomeEvent {
  final String language;
  ChangeLanguageEvent(this.language);
}
class GetLanguageEvent extends HomeEvent {
  GetLanguageEvent();
}