import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';

part 'student_houses_event.dart';

part 'student_houses_state.dart';

class StudentHousesBloc extends Bloc<StudentHousesEvent, StudentHousesState> {
  StudentHousesBloc() : super(StudentHousesInitialState()) {
    on<GetStudentHousesEvent>(_onGetStudentHousesEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToMyChildrenScreenEvent>(_onNavigateToMyChildrenScreenEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
  }

  FutureOr<void> _onGetStudentHousesEvent(
      GetStudentHousesEvent event, Emitter<StudentHousesState> emit) {}

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<StudentHousesState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  FutureOr<void> _onNavigateToMyChildrenScreenEvent(
      NavigateToMyChildrenScreenEvent event, Emitter<StudentHousesState> emit) {
    emit(NavigateToMyChildrenScreenState());
  }

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<StudentHousesState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }
}
