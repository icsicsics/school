part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetHomeLoadingState extends HomeState {}

class GetTeacherHomeSuccessState extends HomeState {
  final GetTeacherHomeResponse response;

  GetTeacherHomeSuccessState({required this.response});
}

class GetTeacherHomeFillState extends HomeState {
  final String error;

  GetTeacherHomeFillState({required this.error});
}

class GetHomeErrorState extends HomeState {}

class GetIsFatherState extends HomeState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class SaveLanguageCodeFailedState extends HomeState {}

class ChangeLanguageSuccessState extends HomeState {}

class GetLanguageSuccessState extends HomeState {
  final String language;
  GetLanguageSuccessState({required this.language});
}

class GetTokenSuccessState extends HomeState {
  final String token;
  GetTokenSuccessState({required this.token});
}

class GetParentHomeSuccessState extends HomeState {
  final GetChildrenByParentResponse response;

  GetParentHomeSuccessState({required this.response});
}

class GetParentHomeFillState extends HomeState {
  final String error;

  GetParentHomeFillState({required this.error});
}


