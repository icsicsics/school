
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  VerifyBloc() : super(VerifyInitialState()) {
    on<GetVerifyEvent>(_onGetVerifyEvent);
  }

  FutureOr<void> _onGetVerifyEvent(GetVerifyEvent event, Emitter<VerifyState> emit) {

  }
}
