part of 'splash_bloc.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class GetTokenState extends SplashState {
  final String token;

  GetTokenState({
    required this.token,
  });
}

class GetShowOnBoardingState extends SplashState {
  final bool isShowOnBoarding;

  GetShowOnBoardingState({
    required this.isShowOnBoarding,
  });
}

class NavigateToChannelsScreenState extends SplashState {}

class NavigateToOnBoardingScreenState extends SplashState {}

class NavigateToHomeScreenState extends SplashState {}
