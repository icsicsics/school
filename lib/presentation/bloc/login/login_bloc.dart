import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClearButtonEvent>(_onLoginClearButtonEvent);
    on<LoginConfirmButtonEvent>(_onLoginConfirmButtonEvent);
  }

  FutureOr<void> _onLoginClearButtonEvent(
      LoginEvent event, Emitter<LoginState> emit) {
    emit(LoginClearButtonState());
  }

  FutureOr<void> _onLoginConfirmButtonEvent(LoginConfirmButtonEvent event, Emitter<LoginState> emit) {
    emit(LoginConfirmButtonState());
  }
}
