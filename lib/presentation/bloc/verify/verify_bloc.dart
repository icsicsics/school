
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  VerifyBloc() : super(VerifyInitial()) {
    on<VerifyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
