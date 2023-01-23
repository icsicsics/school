import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/repository/home_repository.dart';
import 'package:schools/presentation/bloc/home/home_repository_imp.dart';
import 'package:schools/use_case/get_language_use_case.dart';
import 'package:schools/use_case/get_token_use_case.dart';
import 'package:schools/use_case/save_language_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  FatherInfoResponse fatherInfoResponse = FatherInfoResponse();

  final BaseHomeRepository _repository = HomeRepositoryImp();
  final SaveLanguageCodeUseCase _saveLanguageCodeUseCase;
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final GetTokenUseCase _getTokenUseCase;

  HomeBloc(this._saveLanguageCodeUseCase, this._getLanguageCodeUseCase,
      this._getTokenUseCase)
      : super(HomeInitialState()) {
    on<GetHomeEvent>(_onGetHomeEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<ChangeLanguageEvent>(_onChangeLanguageEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
    on<GetTeacherHomeEvent>(_onGetTeacherHomeEvent);
    on<GetFatherHomeEvent>(_onGetFatherHomeEvent);
  }

  FutureOr<void> _onGetHomeEvent(GetHomeEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<HomeState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }

  FutureOr<void> _onChangeLanguageEvent(
      ChangeLanguageEvent event, Emitter<HomeState> emit) async {
    bool savedStatus = await _saveLanguageCodeUseCase(event.language);
    if (!savedStatus) {
      emit(SaveLanguageCodeFailedState());
    } else {
      emit(ChangeLanguageSuccessState());
    }
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<HomeState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<HomeState> emit) async {
    emit(GetTokenSuccessState(token: await _getTokenUseCase() ?? ""));
  }

  FutureOr<void> _onGetTeacherHomeEvent(
      GetTeacherHomeEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    HomeState state =
        (await _repository.getTeacherHome(event.token)) as HomeState;
    if (state is GetTeacherHomeSuccessState) {
      emit(GetTeacherHomeSuccessState(response: state.response));
    } else if (state is GetTeacherHomeFillState) {
      emit(GetTeacherHomeFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetFatherHomeEvent(
      GetFatherHomeEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    HomeState state1 =
        (await _repository.getFatherInfo(event.token)) as HomeState;
    if (state1 is GetFatherInfoSuccessState) {
      fatherInfoResponse = state1.response;
    } else if (state1 is GetFatherInfoFillState) {
      emit(GetFatherInfoFillState(error: state1.error));
    }
    HomeState state =
        (await _repository.getParentHome(event.token)) as HomeState;
    if (state is GetParentHomeSuccessState) {
      emit(GetParentHomeSuccessState(response: state.response));
    } else if (state is GetTeacherHomeFillState) {
      emit(GetParentHomeFillState(error: state.error));
    }
  }
}
