part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashGetTokenSuccessState extends SplashState {
  final GetTokenResponse response;

  SplashGetTokenSuccessState({required this.response});
}

class SplashGetTokenErrorState extends SplashState {
  final String error;

  SplashGetTokenErrorState({required this.error});
}

class SplashSaveTokenSuccessState extends SplashState {}

class SplashSaveTokenFillState extends SplashState {}