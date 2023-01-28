part of 'splash_bloc.dart';

abstract class SplashEvent {}

 class SplashGetTokenEvent extends SplashEvent{}
 class SplashSaveTokenEvent extends SplashEvent{
 final String token;
 SplashSaveTokenEvent({required this.token});

 }
class GetIsFatherEvent extends SplashEvent {}
