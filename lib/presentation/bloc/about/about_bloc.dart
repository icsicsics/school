import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_event.dart';

part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitialState()) {
    on<GetAboutEvent>(_onGetAboutEvent);
  }

  FutureOr<void> _onGetAboutEvent(
      GetAboutEvent event, Emitter<AboutState> emit) {}
}
