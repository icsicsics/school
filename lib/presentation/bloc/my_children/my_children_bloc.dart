import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

part 'my_children_event.dart';

part 'my_children_state.dart';

class MyChildrenBloc extends Bloc<MyChildrenEvent, MyChildrenState> {
  MyChildrenBloc() : super(MyChildrenInitialState()) {
    on<MyChildrenShowHousesEvent>(_onMyChildrenShowHousesEvent);
    on<GetMyChildrenEvent>(_onGetMyChildrenEvent);
    on<OpenAddPointAlertEvent>(_onOpenAddPointAlertEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
  }

  FutureOr<void> _onMyChildrenShowHousesEvent(
      MyChildrenShowHousesEvent event, Emitter<MyChildrenState> emit) {
    emit(MyChildrenShowHousesState(isShowHouses: event.isShowHouses));
  }

  FutureOr<void> _onGetMyChildrenEvent(
      GetMyChildrenEvent event, Emitter<MyChildrenState> emit) {}

  FutureOr<void> _onOpenAddPointAlertEvent(
      OpenAddPointAlertEvent event, Emitter<MyChildrenState> emit) {
    emit(OpenAddPointAlertState());
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<MyChildrenState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<MyChildrenState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }
}
