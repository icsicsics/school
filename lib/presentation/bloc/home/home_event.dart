part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeEvent extends HomeEvent {}

class GetIsFatherEvent extends HomeEvent {}

class ChangeLanguageEvent extends HomeEvent {
  final String language;

  ChangeLanguageEvent(this.language);
}

class GetLanguageEvent extends HomeEvent {}

class GetTeacherHomeEvent extends HomeEvent {
  final String token;

  GetTeacherHomeEvent({required this.token});
}

class GetFatherHomeEvent extends HomeEvent {
  final String token;

  GetFatherHomeEvent({required this.token});
}

class GetTokenEvent extends HomeEvent {}
