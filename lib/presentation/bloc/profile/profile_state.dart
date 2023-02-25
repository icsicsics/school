part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetTeacherInfoSuccessState extends ProfileState {
  final TeacherInfoResponse response;

  GetTeacherInfoSuccessState({required this.response});
}

class GetTeacherInfoFillState extends ProfileState {
  final String error;

  GetTeacherInfoFillState({required this.error});
}

class NavigateToNotificationScreenState extends ProfileState {}

class GetIsFatherState extends ProfileState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class OpenCameraGalleryBottomSheetState extends ProfileState {}

class FailedSelectImageState extends ProfileState {}

class SuccessSelectImageState extends ProfileState {
  final XFile image;

  SuccessSelectImageState({required this.image});
}

class GetTeacherProfileImageFromShearedPrefranceSuccessState extends ProfileState {
  final String image;
  GetTeacherProfileImageFromShearedPrefranceSuccessState({required this.image});
}

class SetTeacherProfileImageInShearedPrefranceSuccessState extends ProfileState {}

class FailedUploadTeacherProfileImageState extends ProfileState {
  final String errorMessage;

  FailedUploadTeacherProfileImageState({required this.errorMessage});
}

class GetTokenState extends ProfileState {
  final String token;

  GetTokenState({required this.token});
}

class GetFatherInfoSuccessState extends ProfileState {
  final FatherInfoResponse response;

  GetFatherInfoSuccessState({required this.response});
}

class GetFatherInfoFillState extends ProfileState {
  final String error;

  GetFatherInfoFillState({required this.error});
}
class GetLanguageSuccessState extends ProfileState {
  final String language;
  GetLanguageSuccessState({required this.language});
}
class TeacherChangePhotoSuccessState extends ProfileState {
  final TeacherChangePhotoResponse response;
  TeacherChangePhotoSuccessState({required this.response});
}
class TeacherChangePhotoFillState extends ProfileState {
  final String error;
  TeacherChangePhotoFillState({required this.error});
}

class SaveLanguageCodeFailedState extends ProfileState {}

class ChangeLanguageSuccessState extends ProfileState {}


