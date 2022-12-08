import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_children_event.dart';
part 'my_children_state.dart';

class MyChildrenBloc extends Bloc<MyChildrenEvent, MyChildrenState> {
  MyChildrenBloc() : super(MyChildrenInitial()) {
    on<MyChildrenShowPointsEvent>(_onMyChildrenShowPointsEvent);
    on<MyChildrenShowHousesEvent>(_onMyChildrenShowHousesEvent);
  }

  FutureOr<void> _onMyChildrenShowPointsEvent(MyChildrenShowPointsEvent event, Emitter<MyChildrenState> emit) {
    emit(MyChildrenShowPointsState(isShowPoints: event.isShowPoints));
  }

  FutureOr<void> _onMyChildrenShowHousesEvent(MyChildrenShowHousesEvent event, Emitter<MyChildrenState> emit) {
    emit(MyChildrenShowHousesState(isShowHouses: event.isShowHouses));
  }
}
