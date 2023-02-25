import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/change_photo/response/teacher_change_photo_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/profile_repository.dart';
import 'package:schools/presentation/bloc/profile/profile_repository_imp.dart';
import 'package:schools/use_case/get_language_use_case.dart';
import 'package:schools/use_case/get_profile_image_use_case.dart';
import 'package:schools/use_case/get_testcher_profile_image_from_shared_preferences_user_case.dart';
import 'package:schools/use_case/get_token_use_case.dart';
import 'package:schools/use_case/save_language_use_case.dart';
import 'package:schools/use_case/set_teacher_profile_image_in_shared_preferences_user_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final BaseProfileRepository _repository = ProfileRepositoryImp();
  final GetProfileImageUseCase _profileImageUseCase;
  final SetTeacherImageProfileInSharedPreferencesUseCase
      _setImageProfileInSharedPreferencesUseCase;
  final GetTeacherImageProfileFromSharedPreferencesUseCase
      _getImageProfileFromSharedPreferencesUseCase;
  final GetTokenUseCase _getTokenUseCase;
  final GetLanguageCodeUseCase _getLanguageCodeUseCase;
  final SaveLanguageCodeUseCase _saveLanguageCodeUseCase;

  ProfileBloc(
    this._profileImageUseCase,
    this._setImageProfileInSharedPreferencesUseCase,
    this._getImageProfileFromSharedPreferencesUseCase,
    this._getTokenUseCase,
    this._getLanguageCodeUseCase,
    this._saveLanguageCodeUseCase,
  ) : super(ProfileInitialState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<OpenCameraGalleryBottomSheetEvent>(_onOpenCameraGalleryBottomSheetEvent);
    on<SelectProfileImageEvent>(_onSelectProfileImageEvent);
    on<SetTeacherProfileImageInShearedPrefranceEvent>(
        _onSetProfileImageInShearedPrefranceEvent);
    on<GetTeacherProfileImageFromShearedPrefranceEvent>(
        _onGetProfileImageFromShearedPrefranceEvent);
    on<GetTokenEvent>(_onGetTokenEvent);
    on<GetTeacherInfoEvent>(_onGetTeacherInfoEvent);
    on<GetFatherInfoEvent>(_onGetFatherInfoEvent);
    on<GetLanguageEvent>(_onGetLanguageEvent);
    on<UploadTeacherImageEvent>(_onUploadImageEvent);
    on<ChangeLanguageEvent>(_onChangeLanguageEvent);
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfileEvent event, Emitter<ProfileState> emit) {}

  FutureOr<void> _onGetIsFatherEvent(
      GetIsFatherEvent event, Emitter<ProfileState> emit) async {
    final isFather = await SharedPreferencesManager.getIsFather();
    emit(GetIsFatherState(isFather: isFather!));
  }

  FutureOr<void> _onNavigateToNotificationScreenEvent(
      NavigateToNotificationScreenEvent event, Emitter<ProfileState> emit) {
    emit(NavigateToNotificationScreenState());
  }

  void _onOpenCameraGalleryBottomSheetEvent(
      OpenCameraGalleryBottomSheetEvent event, Emitter<ProfileState> emit) {
    emit(OpenCameraGalleryBottomSheetState());
  }

  Future<void> _onSelectProfileImageEvent(
      SelectProfileImageEvent event, Emitter<ProfileState> emit) async {
    XFile? image = await _profileImageUseCase.call(source: event.source!);
    if (image?.path.isEmpty ?? true) {
      emit(FailedSelectImageState());
    } else {
      emit(SuccessSelectImageState(image: image!));
    }
  }

  Future<void> _onSetProfileImageInShearedPrefranceEvent(
      SetTeacherProfileImageInShearedPrefranceEvent event,
      Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    await _setImageProfileInSharedPreferencesUseCase(profileImage: event.image);
    emit(SetTeacherProfileImageInShearedPrefranceSuccessState());
  }

  Future<void> _onGetProfileImageFromShearedPrefranceEvent(
      GetTeacherProfileImageFromShearedPrefranceEvent event,
      Emitter<ProfileState> emit) async {
    String? image = await _getImageProfileFromSharedPreferencesUseCase();
    emit(GetTeacherProfileImageFromShearedPrefranceSuccessState(
        image: image ?? ""));
  }

  FutureOr<void> _onGetTokenEvent(
      GetTokenEvent event, Emitter<ProfileState> emit) async {
    emit(GetTokenState(token: await _getTokenUseCase() ?? ""));
  }

  FutureOr<void> _onGetTeacherInfoEvent(
      GetTeacherInfoEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    ProfileState state =
        (await _repository.getTeacherInfo(event.token)) as ProfileState;
    if (state is GetTeacherInfoSuccessState) {
      emit(GetTeacherInfoSuccessState(response: state.response));
    } else if (state is GetTeacherInfoFillState) {
      emit(GetTeacherInfoFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetFatherInfoEvent(
      GetFatherInfoEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    ProfileState state =
        (await _repository.getFatherInfo(event.token)) as ProfileState;
    if (state is GetFatherInfoSuccessState) {
      emit(GetFatherInfoSuccessState(response: state.response));
    } else if (state is GetFatherInfoFillState) {
      emit(GetFatherInfoFillState(error: state.error));
    }
  }

  FutureOr<void> _onGetLanguageEvent(
      GetLanguageEvent event, Emitter<ProfileState> emit) async {
    emit(GetLanguageSuccessState(
        language: await _getLanguageCodeUseCase() ?? ''));
  }

  FutureOr<void> _onUploadImageEvent(
      UploadTeacherImageEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    ProfileState state = (await _repository.teacherChangePhoto(
        event.token, event.xFile)) as ProfileState;
    if (state is TeacherChangePhotoSuccessState) {
      emit(TeacherChangePhotoSuccessState(response: state.response));
    } else if (state is TeacherChangePhotoFillState) {
      emit(TeacherChangePhotoFillState(error: state.error));
    }
  }

  FutureOr<void> _onChangeLanguageEvent(ChangeLanguageEvent event, Emitter<ProfileState> emit) async {
    bool savedStatus = await _saveLanguageCodeUseCase(event.language);
    if (!savedStatus) {
      emit(SaveLanguageCodeFailedState());
    } else {
      emit(ChangeLanguageSuccessState());
    }
  }
}
