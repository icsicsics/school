part of 'splash_bloc.dart';

abstract class SplashEvent {}

class GetTokenEvent extends SplashEvent {}

class GetShowOnBoardingEvent extends SplashEvent {}

class NavigateToChannelsScreenEvent extends SplashEvent {}

class NavigateToOnBoardingScreenEvent extends SplashEvent {}

class NavigateToHomeScreenEvent extends SplashEvent {}