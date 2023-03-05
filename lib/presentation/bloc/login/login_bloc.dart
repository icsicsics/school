import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/login/login_response.dart';
import 'package:schools/use_case/get_language_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;

  LoginBloc(this._getLanguageCodeUseCase) : super(LoginInitialState()) {
    on<LoginClearButtonEvent>(_onLoginClearButtonEvent);
    on<LoginConfirmButtonEvent>(_onLoginConfirmButtonEvent);
    on<GetLoginEvent>(_onGetLoginEvent);
    on<LoginIsFatherEvent>(_onLoginIsFatherEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumberEvent);
    on<SelectCountryCodeEvent>(_onSelectCountryCodeEvent);
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

  FutureOr<void> _onLoginIsFatherEvent(
      LoginIsFatherEvent event, Emitter<LoginState> emit) {
    emit(LoginIsFatherState(isFather: event.isFather));
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<LoginState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onVerifyPhoneNumberEvent(
      VerifyPhoneNumberEvent event, Emitter<LoginState> emit) async {
    emit(ShowLoadingState());
    var response =  await DioHelper.verifyPhone(event.phoneNumber);

    try {
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      emit(VerifyPhoneNumberSuccessState(phoneNumber: event.phoneNumber));
    } catch(e) {
      LoginErrorResponse errorResponse = LoginErrorResponse.fromJson(response.data);
      emit(VerifyPhoneNumberErrorState(errorMessage: errorResponse.data ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectCountryCodeEvent(SelectCountryCodeEvent event, Emitter<LoginState> emit) {
    emit(SelectCountryCodeState(event.phoneNumber));
  }
}
