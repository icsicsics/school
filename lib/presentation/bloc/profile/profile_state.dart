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

class GetProfileErrorState extends ProfileState {}

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

class SuccessGetProfileImageState extends ProfileState {
  final String image;

  SuccessGetProfileImageState({required this.image});
}

class SuccessUploadProfileImageState extends ProfileState {}

class FailedUploadProfileImageState extends ProfileState {
  final String errorMessage;

  FailedUploadProfileImageState({required this.errorMessage});
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
