import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/notification/request/notification_request.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/data/source/remote/model/notification/response/update_notification_response.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final GetTokenUseCase _getTokenUseCase;

  NotificationsBloc(
    this._getLanguageCodeUseCase,
    this._getTokenUseCase,
  ) : super(NotificationsInitialState()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
    on<GetInboxNotificationsEvent>(_onGetInboxNotificationsEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
    on<UpdateNotificationEvent>(_onUpdateNotificationEvent);
  }

  FutureOr<void> _onGetNotificationsEvent(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) async {
    emit(ShowLoadingState());
    String token = await _getTokenUseCase() ?? "";
    Response response = await DioHelper.getNotifications(
      token,
      event.notificationRequest,
    );

    if (response.statusCode == 200) {
      try {
        NotificationsResponse notificationResponse =
            NotificationsResponse.fromJson(response.data);
        emit(GetNotificationsSuccessState(
            notificationResponse: notificationResponse));
      } catch (e) {
        emit(GetNotificationsFillState(errorMessage: e.toString()));
      }
    } else {
      emit(GetNotificationsFillState(errorMessage: "Try Again"));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onGetInboxNotificationsEvent(GetInboxNotificationsEvent event,
      Emitter<NotificationsState> emit) async {
    emit(ShowLoadingState());
    String token = await _getTokenUseCase() ?? "";
    Response response = await DioHelper.getInboxNotifications(
      token,
      event.notificationRequest,
    );

    if (response.statusCode == 200) {
      try {
        NotificationsResponse notificationResponse =
            NotificationsResponse.fromJson(response.data);
        emit(GetInboxNotificationsSuccessState(
            notificationResponse: notificationResponse));
      } catch (e) {
        emit(GetInboxNotificationsFillState(errorMessage: e.toString()));
      }
    } else {
      emit(GetInboxNotificationsFillState(errorMessage: "Try Again"));
    }

    emit(HideLoadingState());
  }

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

  FutureOr<void> _onUpdateNotificationEvent(
      UpdateNotificationEvent event, Emitter<NotificationsState> emit) async {
    emit(ShowLoadingState());
    String token = await _getTokenUseCase() ?? "";
    Response response = await DioHelper.updateNotification(
      token,
      event.id,
    );
    if (response.statusCode == 200) {
      try {
        UpdateNotificationResponse updateNotificationResponse =
            UpdateNotificationResponse.fromJson(response.data);
        if (updateNotificationResponse.errorCode == 200) {
          emit(UpdateNotificationSuccessState(
              message: updateNotificationResponse.data ?? ""));
        } else {
          emit(UpdateNotificationFailState(
              errorMessage: updateNotificationResponse.data ?? ""));
        }
      } catch (e) {
        emit(UpdateNotificationFailState(errorMessage: e.toString()));
      }
    } else {
      emit(UpdateNotificationFailState(errorMessage: "Try Again"));
    }

    emit(HideLoadingState());
  }
}
