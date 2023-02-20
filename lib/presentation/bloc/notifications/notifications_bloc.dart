import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/use_case/get_language_use_case.dart';
import 'package:schools/use_case/get_token_use_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final GetTokenUseCase _getTokenUseCase;
  NotificationsBloc(this._getLanguageCodeUseCase,this._getTokenUseCase)
      : super(NotificationsInitialState()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
  }

  FutureOr<void> _onGetNotificationsEvent(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) {}

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<NotificationsState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<NotificationsState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }
  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<NotificationsState> emit) async {
    emit(GetTokenSuccessState(token: await _getTokenUseCase() ?? ""));
  }

}
