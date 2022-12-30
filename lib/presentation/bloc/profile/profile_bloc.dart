import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/use_case/get_profile_image_from_shared_preferences_user_case.dart';
import 'package:schools/use_case/get_profile_image_use_case.dart';
import 'package:schools/use_case/set_profile_image_in_shared_preferences_user_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileImageUseCase profileImageUseCase;
  final SetImageProfileInSharedPreferencesUseCase
      setImageProfileInSharedPreferencesUseCase;
  final GetImageProfileFromSharedPreferencesUseCase
  getImageProfileFromSharedPreferencesUseCase;

  ProfileBloc(
      this.profileImageUseCase, this.setImageProfileInSharedPreferencesUseCase,this.getImageProfileFromSharedPreferencesUseCase)
      : super(ProfileInitialState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<GetIsFatherEvent>(_onGetIsFatherEvent);
    on<NavigateToNotificationScreenEvent>(_onNavigateToNotificationScreenEvent);
    on<OpenCameraGalleryBottomSheetEvent>(_onOpenCameraGalleryBottomSheetEvent);
    on<SelectProfileImageEvent>(_onSelectProfileImageEvent);
    on<UploadProfileImageEvent>(_onUploadProfileImageEvent);
    on<GetProfileImageEvent>(_onGetProfileImageEvent);
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
    XFile? image = await profileImageUseCase.call(source: event.source!);
    if (image?.path.isEmpty ?? true) {
      emit(FailedSelectImageState());
    } else {
      emit(SuccessSelectImageState(image: image!));
    }
  }

  Future<void> _onUploadProfileImageEvent(
      UploadProfileImageEvent event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoadingState());
    await setImageProfileInSharedPreferencesUseCase(
        profileImage: event.image.path);
    emit(SuccessUploadProfileImageState());
  }

  Future<void> _onGetProfileImageEvent(
      GetProfileImageEvent event, Emitter<ProfileState> emit) async {
    String? image = await getImageProfileFromSharedPreferencesUseCase();
    emit(SuccessGetProfileImageState(image: image ?? ""));
  }

}
