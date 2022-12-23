part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetHomeLoadingState extends HomeState {}

class GetHomeSuccessState extends HomeState {}

class GetHomeFillState extends HomeState {}

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
