import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/data/source/remote/repository/home_repository.dart';
import 'package:schools/presentation/bloc/home/home_repository_imp.dart';
import 'package:schools/domain/usecases/get_language_use_case.dart';
import 'package:schools/domain/usecases/get_profile_image_use_case.dart';
import 'package:schools/domain/usecases/get_token_use_case.dart';
import 'package:schools/domain/usecases/save_language_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  FatherInfoResponse fatherInfoResponse = FatherInfoResponse();
  TeacherInfoResponse teacherInfoResponse = TeacherInfoResponse();
  final BaseHomeRepository _repository = HomeRepositoryImp();
  final SaveLanguageCodeUseCase _saveLanguageCodeUseCase;
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final GetTokenUseCase _getTokenUseCase;
  final GetProfileImageUseCase _profileImageUseCase;

  String childName ="";
  String branchId ="";
  String schoolLogo ="";
  HomeBloc(
    this._saveLanguageCodeUseCase,
    this._getLanguageCodeUseCase,
    this._getTokenUseCase,
    this._profileImageUseCase,
  ) : super(HomeInitialState()) {
    on<GetHomeEvent>(_onGetHomeEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<ChangeLanguageEvent>(_onChangeLanguageEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
    on<GetTeacherHomeEvent>(_onGetTeacherHomeEvent);
    on<GetFatherHomeEvent>(_onGetFatherHomeEvent);
    on<GetFatherInfoEvent>(_onGetFatherInfoEvent);
    on<GetTeacherInfoEvent>(_onGetTeacherInfoEvent);
    on<GetWeatherEvent>(_onGetWeatherEvent);
    on<SwitchAccountEvent>(_onSwitchAccountEvent);
    on<GetStudentProfileInSchoolHouseEvent>(
        _onGetStudentProfileInSchoolHouseEvent);
    on<OpenCameraGalleryBottomSheetEvent>(_onOpenCameraGalleryBottomSheetEvent);
    on<SelectImageEvent>(_onSelectImageEvent);
    on<ClassSectionChangePhotoEvent>(_onClassSectionChangePhotoEvent);
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

  FutureOr<void> _onGetTeacherInfoEvent(
      GetTeacherInfoEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    HomeState state =
        (await _repository.getTeacherInfo(event.token)) as HomeState;
    if (state is GetTeacherInfoSuccessState) {
      emit(GetTeacherInfoSuccessState(response: state.response));
    } else if (state is GetTeacherInfoFillState) {
      emit(GetTeacherInfoFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetFatherInfoEvent(
      GetFatherInfoEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    HomeState state =
        (await _repository.getFatherInfo(event.token)) as HomeState;
    if (state is GetFatherInfoSuccessState) {
      emit(GetFatherInfoSuccessState(response: state.response));
    } else if (state is GetFatherInfoFillState) {
      emit(GetFatherInfoFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetWeatherEvent(
      GetWeatherEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    HomeState state =
        (await _repository.getWeather("32.332687", "35.751785", await _getLanguageCodeUseCase() ?? '')) as HomeState;
    if (state is GetWeatherSuccessState) {
      emit(GetWeatherSuccessState(weather: state.weather));
    } else if (state is GetWeatherFillState) {
      emit(GetWeatherFillState(error: state.error));
    }
  }

  FutureOr<void> _onSwitchAccountEvent(
      SwitchAccountEvent event, Emitter<HomeState> emit) {
    emit(SwitchAccountState());
  }

  FutureOr<void> _onGetStudentProfileInSchoolHouseEvent(
      GetStudentProfileInSchoolHouseEvent event,
      Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());
    Response response = await DioHelper.getTeacherStudentProfileInSchoolHouse(
        await _getTokenUseCase(), event.studentId);
    TeacherStudentProfileInSchoolHouseResponse
        teacherStudentProfileInSchoolHouseResponse =
        TeacherStudentProfileInSchoolHouseResponse.fromJson(response.data);

    if (response.data != null) {
      emit(GetTeacherStudentProfileInSchoolHouseSuccessState(
          response: teacherStudentProfileInSchoolHouseResponse));
    } else {
      emit(GetTeacherStudentProfileInSchoolHouseFailState(error: "Error"));
    }
  }

  FutureOr<void> _onOpenCameraGalleryBottomSheetEvent(
      OpenCameraGalleryBottomSheetEvent event, Emitter<HomeState> emit) {
    emit(OpenCameraGalleryBottomSheetState(id : event.classroomToSectionId));
  }

  FutureOr<void> _onSelectImageEvent(
      SelectImageEvent event, Emitter<HomeState> emit) async {
    XFile? image = await _profileImageUseCase.call(source: event.source!);
    if (image?.path.isEmpty ?? true) {
      emit(FailedSelectImageState());
    } else {
      emit(SuccessSelectImageState(image: image!,id:event.id));
    }
  }

  FutureOr<void> _onClassSectionChangePhotoEvent(
      ClassSectionChangePhotoEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeLoadingState());

    var formData = FormData.fromMap({
      "Image": await MultipartFile.fromFile(event.xFile.path),
    });
    Response response = await DioHelper.changeClassRoomSectionPhoto(
        await _getTokenUseCase(), formData,event.sectionId);
    if(response.statusCode == 200){
      emit(ClassSectionChangePhotoSuccessState());
    } else {
      emit(ClassSectionChangePhotoFailState(errorMessage: "Error"));
    }
  }
}
