import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/get_token/response/get_token_response.dart';
import 'package:schools/use_case/get_language_use_case.dart';
import 'package:schools/use_case/set_token_use_case.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final SetTokenUseCase _setTokenUseCase;

  VerifyBloc(
    this._getLanguageCodeUseCase,
    this._setTokenUseCase,
  ) : super(VerifyInitialState()) {
    on<GetVerifyEvent>(_onGetVerifyEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<VerifyCodeEvent>(_onVerifyCodeEvent);
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
      if (getTokenResponse.data!.token!.accessToken!.isNotEmpty) {
        await _setTokenUseCase(token: getTokenResponse.data!.token!.accessToken!);
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
