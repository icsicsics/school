import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'side_menu_event.dart';

part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  SideMenuBloc() : super(SideMenuInitial()) {
    on<SideMenuHomeEvent>(_onSideMenuHomeEvent);
    on<SideMenuSettingsEvent>(_onSideMenuSettingsEvent);
    on<SideMenuContactUsEvent>(_onSideMenuContactUsEvent);
    on<SideMenuAboutAppEvent>(_oSideMenuAboutAppEvent);
  }

  FutureOr<void> _onSideMenuHomeEvent(
      SideMenuHomeEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuHomeState());
  }

  FutureOr<void> _onSideMenuSettingsEvent(
      SideMenuSettingsEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuSettingsState());
  }

  FutureOr<void> _onSideMenuContactUsEvent(
      SideMenuContactUsEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuContactUsState());
  }

  FutureOr<void> _oSideMenuAboutAppEvent(
      SideMenuAboutAppEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuAboutAppState());
  }
}
