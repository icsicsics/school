import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitialState()) {
    on<GetHomeEvent>(_onGetHomeEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
  }

  FutureOr<void> _onGetHomeEvent(GetHomeEvent event, Emitter<HomeState> emit) {

  }

  FutureOr<void> _onGetIsFatherEvent(GetIsFatherEvent event, Emitter<HomeState> emit) async{
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather:isFather!));

  }
}
