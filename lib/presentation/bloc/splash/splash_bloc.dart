import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<GetTokenEvent>(_onGetTokenEvent);
    on<GetShowOnBoardingEvent>(_onGetShowOnBoardingEvent);
    on<NavigateToOnBoardingScreenEvent>(_onNavigateToOnBoardingScreenEvent);
    on<NavigateToChannelsScreenEvent>(_onNavigateToChannelsScreenEvent);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreenEvent);
  }

  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<SplashState> emit) async {
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    emit(GetTokenState(token: token));
  }

  FutureOr<void> _onGetShowOnBoardingEvent(
      GetShowOnBoardingEvent event, Emitter<SplashState> emit) async {
    bool isShowOnBoarding =
        await SharedPreferencesManager.getIsOnBoarding() ?? false;
    emit(GetShowOnBoardingState(isShowOnBoarding: isShowOnBoarding));
  }

  FutureOr<void> _onNavigateToOnBoardingScreenEvent(
      NavigateToOnBoardingScreenEvent event, Emitter<SplashState> emit) async {
    await _delay();
    emit(NavigateToOnBoardingScreenState());
  }

  FutureOr<void> _onNavigateToChannelsScreenEvent(
      NavigateToChannelsScreenEvent event, Emitter<SplashState> emit) async {
    await _delay();
    emit(NavigateToChannelsScreenState());
  }

  FutureOr<void> _onNavigateToHomeScreenEvent(
      NavigateToHomeScreenEvent event, Emitter<SplashState> emit) async {
    await _delay();
    emit(NavigateToHomeScreenState());
  }

  Future<void> _delay() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
