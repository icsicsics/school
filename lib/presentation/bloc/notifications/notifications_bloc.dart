import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitialState()) {
    on<GetNotificationsEvent>(_onGetNotificationsEvent);
  }



  FutureOr<void> _onGetNotificationsEvent(GetNotificationsEvent event, Emitter<NotificationsState> emit) {

  }
}
