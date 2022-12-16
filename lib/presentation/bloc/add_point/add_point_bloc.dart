import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

part 'add_point_event.dart';

part 'add_point_state.dart';

class AddPointBloc extends Bloc<AddPointEvent, AddPointState> {
  AddPointBloc() : super(AddPointInitialState()) {
    on<GetAddPointEvent>(_onGetAddPointEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
  }

  FutureOr<void> _onGetAddPointEvent(
      GetAddPointEvent event, Emitter<AddPointState> emit) {}

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<AddPointState> emit) {
    emit(NavigateToNotificationScreenState());
  }
}
