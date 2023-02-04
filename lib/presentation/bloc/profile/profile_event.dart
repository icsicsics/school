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

class SetProfileImageInShearedPrefranceEvent extends ProfileEvent {
  final String image;

  SetProfileImageInShearedPrefranceEvent({required this.image});
}

class GetProfileImageFromShearedPrefranceEvent extends ProfileEvent {}

class GetTokenEvent extends ProfileEvent {}

class GetLanguageEvent extends ProfileEvent {}

class UploadImageEvent extends ProfileEvent {
  final XFile xFile;
  final String token;
  UploadImageEvent({required this.xFile,required this.token});
}
