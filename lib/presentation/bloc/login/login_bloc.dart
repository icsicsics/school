import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/data/source/remote/model/login/login_response.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/set_phone_number_use_case.dart';
import 'package:schools/domain/usecases/set_refresh_token_use_case.dart';
import 'package:schools/domain/usecases/set_token_use_case.dart';
import 'package:schools/domain/usecases/set_user_id_use_case.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final SetPhoneNumberUseCase _setPhoneNumberUseCase;
  final SetUserIdUseCase _setUserIdUseCase;
  final SetTokenUseCase _setTokenUseCase;
  final SetRefreshTokenUseCase _setRefreshTokenUseCase;

  LoginBloc(
    this._getLanguageCodeUseCase,
    this._setUserIdUseCase,
    this._setPhoneNumberUseCase,
    this._setRefreshTokenUseCase,
    this._setTokenUseCase,
  ) : super(LoginInitialState()) {
    on<LoginClearButtonEvent>(_onLoginClearButtonEvent);
    on<LoginConfirmButtonEvent>(_onLoginConfirmButtonEvent);
    on<GetLoginEvent>(_onGetLoginEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumberEvent);
    on<SelectCountryCodeEvent>(_onSelectCountryCodeEvent);
    on<VerifyCodeEvent>(_onVerifyCodeEvent);
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

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<LoginState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onVerifyPhoneNumberEvent(
      VerifyPhoneNumberEvent event, Emitter<LoginState> emit) async {
    emit(ShowLoadingState());
    var response = await DioHelper.verifyPhone(event.phoneNumber);

    try {
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      emit(VerifyPhoneNumberSuccessState(
        phoneNumber: event.phoneNumber,
        roles: loginResponse.data?.roles ?? [],
        code: loginResponse.data?.verifyCode ?? "",

      ));
    } catch (e) {
      LoginErrorResponse errorResponse =
          LoginErrorResponse.fromJson(response.data);
      emit(VerifyPhoneNumberErrorState(errorMessage: errorResponse.data ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectCountryCodeEvent(
      SelectCountryCodeEvent event, Emitter<LoginState> emit) {
    emit(SelectCountryCodeState(event.phoneNumber));
  }

  FutureOr<void> _onVerifyCodeEvent(
      VerifyCodeEvent event, Emitter<LoginState> emit) async {
    emit(ShowLoadingState());
    Response response =
        await DioHelper.getToken(event.phoneNumber, event.verifyCode);
    GetTokenResponse getTokenResponse =
        GetTokenResponse.fromJson(response.data);
    if (response.statusCode == 200) {
      if (getTokenResponse.data!.token!.accessToken!.isNotEmpty) {
        await _setUserIdUseCase(userId: getTokenResponse.data!.userId ?? "");
        await _setTokenUseCase(
            token: getTokenResponse.data!.token!.accessToken!);
        await _setRefreshTokenUseCase(
            refreshToken: getTokenResponse.data!.token!.refreshToken!);
        await _setPhoneNumberUseCase(event.phoneNumber);
        emit(VerifyCodeSuccessState());
      } else {
        emit(VerifyCodeErrorState());
      }
    } else {
      emit(VerifyCodeErrorState());
    }

    emit(HideLoadingState());
  }
}
