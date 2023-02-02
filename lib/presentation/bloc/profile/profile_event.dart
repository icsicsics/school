part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class GetTeacherInfoEvent extends ProfileEvent {
  final String token;

  GetTeacherInfoEvent({required this.token});
}

class GetFatherInfoEvent extends ProfileEvent {
  final String token;

  GetFatherInfoEvent({required this.token});
}

class GetIsFatherEvent extends ProfileEvent {}

class NavigateToNotificationScreenEvent extends ProfileEvent {}

class OpenCameraGalleryBottomSheetEvent extends ProfileEvent {}

class SelectProfileImageEvent extends ProfileEvent {
  final ImageSource? source;

  SelectProfileImageEvent({this.source});
}

class UploadProfileImageEvent extends ProfileEvent {
  final String image;

  UploadProfileImageEvent({required this.image});
}

class GetProfileImageEvent extends ProfileEvent {}

class GetTokenEvent extends ProfileEvent {}

class GetLanguageEvent extends ProfileEvent {}

class UploadImageEvent extends ProfileEvent {
  final FormData formData;
  final String token;
  UploadImageEvent({required this.formData,required this.token});
}
