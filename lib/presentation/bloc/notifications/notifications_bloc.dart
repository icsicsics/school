import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitialState()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
  }

  FutureOr<void> _onGetNotificationsEvent(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) {}

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<NotificationsState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }
}
