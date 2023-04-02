import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/remote/model/class_houses/data.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/search_item.dart';
import 'package:schools/data/source/remote/repository/school_houses_repository.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_repository_imp.dart';

part 'school_houses_event.dart';

part 'school_houses_state.dart';

class SchoolHousesBloc extends Bloc<SchoolHousesEvent, SchoolHousesState> {
  final BaseSchoolHousesRepository _repository = SchoolHousesRepositoryImp();
  GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();

  SchoolHousesBloc() : super(SchoolHousesInitialState()) {
    on<GetSchoolHousesEvent>(_onGetSchoolHousesEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToAddPointsScreenEvent>(_onNavigateToAddPointsScreenEvent);
    on<NavigateToMyChildrenScreenEvent>(_onNavigateToMyChildrenScreenEvent);
    on<GetStudentHousesEvent>(_onGetStudentHousesEvent);
    on<GetSearchValuesEvent>(_onGetSearchValuesEvent);
  }

  FutureOr<void> _onGetSchoolHousesEvent(
      GetSchoolHousesEvent event, Emitter<SchoolHousesState> emit) async {
    emit(GetSchoolHousesLoadingState());
    SchoolHousesState state = await _repository.getClassHouses(
            event.token, event.classRoomId, event.isComingFromHome,event.search)
        as SchoolHousesState;
    if (state is GetSchoolHousesSuccessState) {
      getClassHousesResponse = state.response;
      emit(GetSchoolHousesSuccessState(response: state.response));
    } else if (state is GetSchoolHousesFillState) {
      emit(GetSchoolHousesFillState(error: state.error));
    }
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event,
      Emitter<SchoolHousesState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  FutureOr<void> _onNavigateToAddPointsScreenEvent(
      NavigateToAddPointsScreenEvent event, Emitter<SchoolHousesState> emit) {
    emit(NavigateToStudentHousesScreenState(data: event.data));
  }

  FutureOr<void> _onNavigateToMyChildrenScreenEvent(
      NavigateToMyChildrenScreenEvent event, Emitter<SchoolHousesState> emit) {
    emit(NavigateToMyChildrenScreenState(
        studentId: event.studentId,
        classroomToSectionId: event.classroomToSectionId));
  }

  FutureOr<void> _onGetStudentHousesEvent(
      GetStudentHousesEvent event, Emitter<SchoolHousesState> emit) async {
    emit(GetSchoolHousesLoadingState());
    SchoolHousesState state = await _repository.getStudentHouses(
        event.token, event.classroomToSectionId) as SchoolHousesState;
    if (state is GetStudentHousesSuccessState) {
      emit(GetStudentHousesSuccessState(response: state.response));
    } else if (state is GetStudentHousesFillState) {
      emit(GetStudentHousesFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetSearchValuesEvent(GetSearchValuesEvent event, Emitter<SchoolHousesState> emit) async {
    emit(GetSchoolHousesLoadingState());
    SchoolHousesState state = await _repository.getSearchValues(
        event.token);
    print(state);
    if (state is GetSearchValuesSuccessState) {
      emit(GetSearchValuesSuccessState(values: state.values));
    } else if (state is GetStudentHousesFillState) {
      emit(GetStudentHousesFillState(error: state.error));
    }
  }
}
