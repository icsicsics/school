import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginClearButtonEvent>(_onLoginClearButtonEvent);
    on<LoginConfirmButtonEvent>(_onLoginConfirmButtonEvent);
    on<GetLoginEvent>(_onGetLoginEvent);
    on<LoginIsFatherEvent>(_onLoginIsFatherEvent);
  }

  FutureOr<void> _onLoginClearButtonEvent(
      LoginEvent event, Emitter<LoginState> emit) {
    emit(LoginClearButtonState());
  }

  FutureOr<void> _onLoginConfirmButtonEvent(
      LoginConfirmButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginConfirmButtonState());
  }

  FutureOr<void> _onGetLoginEvent(
      GetLoginEvent event, Emitter<LoginState> emit) {}

  FutureOr<void> _onLoginIsFatherEvent(LoginIsFatherEvent event, Emitter<LoginState> emit) {
    emit(LoginIsFatherState(isFather: event.isFather));
  }
}
