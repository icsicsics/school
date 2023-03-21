part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class GetTokenState extends SplashState {
  final String token;

  GetTokenState({
    required this.token,
  });
}
