part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class GetIsFatherState extends SplashState {
  final bool isFather;

  GetIsFatherState({
    required this.isFather,
  });
}

class GetTokenState extends SplashState {
  final String token;

  GetTokenState({
    required this.token,
  });
}
