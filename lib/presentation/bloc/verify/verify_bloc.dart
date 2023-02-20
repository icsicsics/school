import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/use_case/get_language_use_case.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  VerifyBloc(this._getLanguageCodeUseCase) : super(VerifyInitialState()) {
    on<GetVerifyEvent>(_onGetVerifyEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
  }

  FutureOr<void> _onGetVerifyEvent(
      GetVerifyEvent event, Emitter<VerifyState> emit) {}


  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<VerifyState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }
}
