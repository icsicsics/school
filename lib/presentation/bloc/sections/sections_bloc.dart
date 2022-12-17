import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sections_event.dart';

part 'sections_state.dart';

class SectionsBloc extends Bloc<SectionsEvent, SectionsState> {
  SectionsBloc() : super(SectionsInitialState()) {
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToAddPointScreenEvent>(_onNavigateToAddPointScreenEvent);
    on<NavigateToHomeScreenEvent>(_onNavigateToHomeScreenEvent);
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<SectionsState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  FutureOr<void> _onNavigateToAddPointScreenEvent(
      NavigateToAddPointScreenEvent event, Emitter<SectionsState> emit) {
    emit(NavigateToAddPointScreenState());
  }

  FutureOr<void> _onNavigateToHomeScreenEvent(
      NavigateToHomeScreenEvent event, Emitter<SectionsState> emit) {
    emit(NavigateToHomeScreenState());
  }
}
