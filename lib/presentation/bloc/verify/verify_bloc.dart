import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/data/source/remote/model/login/login_response.dart';
import 'package:schools/data/source/remote/model/update_device_token/update_device_token_response.dart';
import 'package:schools/domain/usecases/get_firebase_token_use_case.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';
import 'package:schools/domain/usecases/set_phone_number_use_case.dart';
import 'package:schools/domain/usecases/set_token_use_case.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final SetTokenUseCase _setTokenUseCase;
  final GetTokenUseCase _getTokenUseCase;
  final GetFirebaseTokenUseCase _getFirebaseTokenUseCase;
  final SetPhoneNumberUseCase _setPhoneNumberUseCase;

  VerifyBloc(
    this._getLanguageCodeUseCase,
    this._setTokenUseCase,
    this._getTokenUseCase,
    this._getFirebaseTokenUseCase,
    this._setPhoneNumberUseCase,
  ) : super(VerifyInitialState()) {
    on<GetVerifyEvent>(_onGetVerifyEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<VerifyCodeEvent>(_onVerifyCodeEvent);
    on<UpdateDeviceTokenEvent>(_onUpdateDeviceTokenEvent);
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumberEvent);
  }

  FutureOr<void> _onGetVerifyEvent(
      GetVerifyEvent event, Emitter<VerifyState> emit) {}

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<VerifyState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onVerifyCodeEvent(
      VerifyCodeEvent event, Emitter<VerifyState> emit) async {
    emit(ShowLoadingState());
    Response response =
        await DioHelper.getToken(event.phoneNumber, event.verifyCode);
    GetTokenResponse getTokenResponse =
        GetTokenResponse.fromJson(response.data);
    if (response.statusCode == 200) {
      if (getTokenResponse.data!.token!.accessToken == null) {
        emit(VerifyCodeErrorState());
        emit(HideLoadingState());

        return;
      }
      if (getTokenResponse.data!.token!.accessToken!.isNotEmpty) {
        await SharedPreferencesManager.setUserId(getTokenResponse.data?.userId ?? "");
        await _setTokenUseCase(
            token: getTokenResponse.data!.token!.accessToken!);
        await SharedPreferencesManager.setRefreshToken(
            getTokenResponse.data?.token?.refreshToken ?? "");

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

  FutureOr<void> _onUpdateDeviceTokenEvent(
      UpdateDeviceTokenEvent event, Emitter<VerifyState> emit) async {
    emit(ShowLoadingState());
    String token = await _getTokenUseCase() ?? "";
    String firebaseToken = await _getFirebaseTokenUseCase();
    Response response = await DioHelper.updateDeviceToken(token, firebaseToken);

    if (response.statusCode == 200) {
      try {
        UpdateDeviceResponse updateDeviceResponse =
            UpdateDeviceResponse.fromJson(response.data);
        emit(UpdateDeviceTokenSuccessState());
      } catch (e) {
        emit(UpdateDeviceTokenFailState(errorMessage: e.toString()));
      }
    } else {
      emit(UpdateDeviceTokenFailState(errorMessage: "Try Again"));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onVerifyPhoneNumberEvent(
      VerifyPhoneNumberEvent event, Emitter<VerifyState> emit) async {
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
}
