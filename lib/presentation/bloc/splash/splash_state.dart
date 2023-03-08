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

class GetIsFatherState extends SplashState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class GetTokenState extends SplashState {
  final String token;

  GetTokenState({
    required this.token,
  });
}
