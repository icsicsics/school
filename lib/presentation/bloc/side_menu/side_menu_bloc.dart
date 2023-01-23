import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/side_menu_repository.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_repository_imp.dart';
import 'package:schools/use_case/get_language_use_case.dart';

part 'side_menu_event.dart';

part 'side_menu_state.dart';

class SideMenuBloc extends Bloc<SideMenuEvent, SideMenuState> {
  final BaseSideMenuRepository _repository = SideMenuRepositoryImp();
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
   TeacherInfoResponse teacherInfoResponse = TeacherInfoResponse();
   FatherInfoResponse fatherInfoResponse = FatherInfoResponse();

  SideMenuBloc(this._getLanguageCodeUseCase) : super(SideMenuInitialState()) {
    on<GetSideMenuEvent>(_onGetSideMenuEvent);
    on<SideMenuHomeEvent>(_onSideMenuHomeEvent);
    on<SideMenuUserProfileEvent>(_onSideMenuUserProfileEvent);
    on<SideMenuContactUsEvent>(_onSideMenuContactUsEvent);
    on<SwitchAccountEvent>(_onSwitchAccountEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<SideMenuAboutAppEvent>(_onSideMenuAboutAppEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<GetTeacherInfoEvent>(_onGetTeacherInfoEvent);
    on<GetFatherInfoEvent>(_onGetFatherInfoEvent);
  }

  FutureOr<void> _onGetSideMenuEvent(
      GetSideMenuEvent event, Emitter<SideMenuState> emit) {}

  FutureOr<void> _onSideMenuHomeEvent(
      SideMenuHomeEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuHomeState());
  }

  FutureOr<void> _onSideMenuUserProfileEvent(
      SideMenuUserProfileEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuUserProfileState());
  }

  FutureOr<void> _onSideMenuContactUsEvent(
      SideMenuContactUsEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuContactUsState());
  }

  FutureOr<void> _onSideMenuAboutAppEvent(
      SideMenuAboutAppEvent event, Emitter<SideMenuState> emit) {
    emit(SideMenuAboutAppState());
  }

  FutureOr<void> _onSwitchAccountEvent(
      SwitchAccountEvent event, Emitter<SideMenuState> emit) {
    emit(SwitchAccountState());
  }

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<SideMenuState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<SideMenuState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onLogoutEvent(
      LogoutEvent event, Emitter<SideMenuState> emit) {
    emit(LogoutState());
  }

  FutureOr<void> _onGetTeacherInfoEvent(
      GetTeacherInfoEvent event, Emitter<SideMenuState> emit) async {
    if(teacherInfoResponse.data!=null){
      emit(GetTeacherResponseState(response: teacherInfoResponse));
    } else {
      emit(GetSideMenuLoadingState());
      SideMenuState state =
      (await _repository.getTeacherInfo(event.token)) as SideMenuState;
      if (state is GetTeacherInfoSuccessState) {
        teacherInfoResponse=state.response;
        emit(GetTeacherInfoSuccessState(response: state.response));
      } else if (state is GetTeacherInfoFillState) {
        emit(GetTeacherInfoFillState(error: state.error));
      }
    }
  }

  FutureOr<void> _onGetFatherInfoEvent(
      GetFatherInfoEvent event, Emitter<SideMenuState> emit) async {
    if(fatherInfoResponse.data!=null){
      emit(GetFatherResponseState(response: fatherInfoResponse));
    }else {
      emit(GetSideMenuLoadingState());
      SideMenuState state =
      (await _repository.getFatherInfo(event.token)) as SideMenuState;
      if (state is GetFatherInfoSuccessState) {
        fatherInfoResponse=state.response;
        emit(GetFatherInfoSuccessState(response: state.response));
      } else if (state is GetFatherInfoFillState) {
        emit(GetFatherInfoFillState(error: state.error));
      }
    }
  }
}
