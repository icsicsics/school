import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/repository/school_houses_repository.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_repository_imp.dart';

part 'school_houses_event.dart';

part 'school_houses_state.dart';

class SchoolHousesBloc extends Bloc<SchoolHousesEvent, SchoolHousesState> {
  final BaseSchoolHousesRepository _repository = SchoolHousesRepositoryImp();

  SchoolHousesBloc() : super(SchoolHousesInitialState()) {
    on<GetSchoolHousesEvent>(_onGetSchoolHousesEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<NavigateToAddPointsScreenEvent>(_onNavigateToAddPointsScreenEvent);
  }

  FutureOr<void> _onGetSchoolHousesEvent(
      GetSchoolHousesEvent event, Emitter<SchoolHousesState> emit) async {
    emit(GetSchoolHousesLoadingState());
    SchoolHousesState state = await _repository.getClassHouses(
        event.token, event.classRoomId) as SchoolHousesState;
    if (state is GetSchoolHousesSuccessState) {
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
    emit(NavigateToAddPointsScreenState());
  }
}
