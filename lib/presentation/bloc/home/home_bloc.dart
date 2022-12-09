import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetHomeEvent>(_onGetHomeEvent);
  }

  FutureOr<void> _onGetHomeEvent(GetHomeEvent event, Emitter<HomeState> emit) {}
}
