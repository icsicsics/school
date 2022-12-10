import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'child_details_event.dart';

part 'child_details_state.dart';

class ChildDetailsBloc extends Bloc<ChildDetailsEvent, ChildDetailsState> {
  ChildDetailsBloc() : super(GetChildDetailsInitialState()) {
    on<GetChildDetailsEvent>(_onGetChildDetailsEvent);
  }

  FutureOr<void> _onGetChildDetailsEvent(
      GetChildDetailsEvent event, Emitter<ChildDetailsState> emit) {}
}
