import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/repository/student_houses_repository.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_repository_imp.dart';

part 'student_houses_event.dart';

part 'student_houses_state.dart';

class StudentHousesBloc extends Bloc<StudentHousesEvent, StudentHousesState> {
  final BaseStudentHousesRepository _repository = StudentHousesRepositoryImp();

  StudentHousesBloc() : super(StudentHousesInitialState()) {
    on<GetStudentHousesEvent>(_onGetStudentHousesEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToMyChildrenScreenEvent>(_onNavigateToMyChildrenScreenEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
  }

  FutureOr<void> _onGetStudentHousesEvent(
      GetStudentHousesEvent event, Emitter<StudentHousesState> emit) async {
    emit(StudentHousesLoadingState());
    StudentHousesState state = await _repository.getStudentHouses(
            event.token, event.classroomToSectionId) as StudentHousesState;
    if (state is GetStudentHousesSuccessState) {
      emit(GetStudentHousesSuccessState(response: state.response));
    } else if (state is GetStudentHousesFillState) {
      emit(GetStudentHousesFillState(error: state.error));
    }
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event,
      Emitter<StudentHousesState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  FutureOr<void> _onNavigateToMyChildrenScreenEvent(
      NavigateToMyChildrenScreenEvent event, Emitter<StudentHousesState> emit) {
    emit(NavigateToMyChildrenScreenState(studentId:event.studentId,classroomToSectionId:event.classroomToSectionId));
  }

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<StudentHousesState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }
}
