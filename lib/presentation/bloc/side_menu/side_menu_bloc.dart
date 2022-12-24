import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/use_case/get_language_use_case.dart';

part 'side_menu_event.dart';

part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  SideMenuBloc(this._getLanguageCodeUseCase) : super(SideMenuInitialState()) {
    on<GetSideMenuEvent>(_onGetSideMenuEvent);
    on<SideMenuHomeEvent>(_onSideMenuHomeEvent);
    on<SideMenuUserProfileEvent>(_onSideMenuUserProfileEvent);
    on<SideMenuContactUsEvent>(_onSideMenuContactUsEvent);
    on<SideMenuAboutAppEvent>(_onSideMenuAboutAppEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
  }

  FutureOr<void> _onGetSideMenuEvent(
      GetSideMenuEvent event, Emitter<SideMenuState> emit) {}

  FutureOr<void> _onSideMenuHomeEvent(
      SideMenuHomeEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuHomeState());
  }

  FutureOr<void> _onSideMenuUserProfileEvent(
      SideMenuUserProfileEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuUserProfileState());
  }

  FutureOr<void> _onSideMenuContactUsEvent(
      SideMenuContactUsEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuContactUsState());
  }

  FutureOr<void> _onSideMenuAboutAppEvent(
      SideMenuAboutAppEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuAboutAppState());
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<SideMenuState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }
}
