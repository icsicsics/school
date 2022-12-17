import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_child_points_event.dart';

part 'my_child_points_state.dart';

class MyChildPointsBloc extends Bloc<MyChildPointsEvent, MyChildPointsState> {
  MyChildPointsBloc() : super(MyChildPointsInitialState()) {
    on<OpenPointScreenEvent>(_onOpenPointScreenEvent);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreenEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
  }

  FutureOr<void> _onOpenPointScreenEvent(
      OpenPointScreenEvent event, Emitter<MyChildPointsState> emit) {
    emit(OpenPointScreenState());
  }

  FutureOr<void> _onNavigateToHomeScreenEvent(
      NavigateToHomeScreenEvent event, Emitter<MyChildPointsState> emit) {
    emit(NavigateToHomeScreenState());
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event,
      Emitter<MyChildPointsState> emit) {
    emit(NavigateToNotificationScreenState());
  }
}
