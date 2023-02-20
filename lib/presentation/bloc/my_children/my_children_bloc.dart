import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/data/source/remote/repository/my_children_repository.dart';
import 'package:schools/presentation/bloc/my_children/my_children_repository_imp.dart';
import 'package:schools/use_case/get_token_use_case.dart';

part 'my_children_event.dart';

part 'my_children_state.dart';

class MyChildrenBloc extends Bloc<MyChildrenEvent, MyChildrenState> {
  final BaseMyChildrenRepository _repository = MyChildrenRepositoryImp();
  final GetTokenUseCase _getTokenUseCase;

  MyChildrenBloc(this._getTokenUseCase) : super(MyChildrenInitialState()) {
    on<MyChildrenShowHousesEvent>(_onMyChildrenShowHousesEvent);
    on<GetMyChildrenEvent>(_onGetMyChildrenEvent);
    on<OpenAddPointAlertEvent>(_onOpenAddPointAlertEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
    on<GetTeacherStudentProfileInSchoolHouseEvent>(
        _onGetTeacherStudentProfileInSchoolHouseEvent);
    on<GetPrincipleByClassroomEvent>(_onGetPrincipleByClassroomEvent);
    on<MyChildrenFilterEvent>(_onMyChildrenFilterEvent);
  }

  FutureOr<void> _onMyChildrenShowHousesEvent(
      MyChildrenShowHousesEvent event, Emitter<MyChildrenState> emit) {
    emit(MyChildrenShowHousesState(isShowHouses: event.isShowHouses));
    emit(MyChildrenInitialState());
  }

  FutureOr<void> _onGetMyChildrenEvent(
      GetMyChildrenEvent event, Emitter<MyChildrenState> emit) {}

  FutureOr<void> _onOpenAddPointAlertEvent(
      OpenAddPointAlertEvent event, Emitter<MyChildrenState> emit) {
    emit(OpenAddPointAlertState());
    emit(MyChildrenInitialState());
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<MyChildrenState> emit) {
    emit(NavigateToNotificationScreenState());
    emit(MyChildrenInitialState());
  }

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<MyChildrenState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
    emit(MyChildrenInitialState());
  }

  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<MyChildrenState> emit) async {
    emit(GetTokenSuccessState(token: await _getTokenUseCase() ?? ""));
    emit(MyChildrenInitialState());
  }

  FutureOr<void> _onGetTeacherStudentProfileInSchoolHouseEvent(
      GetTeacherStudentProfileInSchoolHouseEvent event,
      Emitter<MyChildrenState> emit) async {
    emit(GetMyChildrenLoadingState());
    MyChildrenState state =
        (await _repository.getTeacherStudentProfileInSchoolHouse(
            event.token, event.studentId)) as MyChildrenState;
    if (state is GetTeacherStudentProfileInSchoolHouseSuccessState) {
      emit(GetTeacherStudentProfileInSchoolHouseSuccessState(
          response: state.response));
      emit(MyChildrenInitialState());
    } else if (state is GetTeacherStudentProfileInSchoolHouseFailState) {
      emit(GetTeacherStudentProfileInSchoolHouseFailState(error: state.error));
      emit(MyChildrenInitialState());
    }
  }

  FutureOr<void> _onGetPrincipleByClassroomEvent(
      GetPrincipleByClassroomEvent event, Emitter<MyChildrenState> emit) async {
    emit(GetMyChildrenLoadingState());
    MyChildrenState state = (await _repository.getTeacherPrincipleByClassroomId(
        event.token, event.classroomId)) as MyChildrenState;
    if (state is GetTeacherPrinciplByClassroomIdSuccessState) {
      emit(GetTeacherPrinciplByClassroomIdSuccessState(
          response: state.response));
      emit(MyChildrenInitialState());
    } else if (state is GetTeacherPrinciplByClassroomIdFillState) {
      emit(GetTeacherPrinciplByClassroomIdFillState(error: state.error));
      emit(MyChildrenInitialState());
    }
  }

  FutureOr<void> _onMyChildrenFilterEvent(MyChildrenFilterEvent event, Emitter<MyChildrenState> emit) {
    emit(MyChildrenFilterState(filter: event.filter));
    emit(MyChildrenInitialState());
  }
}
