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

class NavigateToNotificationScreenEvent extends ProfileEvent {
  final bool isNotificationSelected;

  NavigateToNotificationScreenEvent({required this.isNotificationSelected});
}

class OpenCameraGalleryBottomSheetEvent extends ProfileEvent {}

class SelectProfileImageEvent extends ProfileEvent {
  final ImageSource? source;

  SelectProfileImageEvent({this.source});
}

class SetTeacherProfileImageInShearedPrefranceEvent extends ProfileEvent {
  final String image;

  SetTeacherProfileImageInShearedPrefranceEvent({required this.image});
}

class GetTeacherProfileImageFromShearedPrefranceEvent extends ProfileEvent {}

class GetTokenEvent extends ProfileEvent {}

class GetLanguageEvent extends ProfileEvent {}

class ChangeLanguageEvent extends ProfileEvent {
  final String language;

  ChangeLanguageEvent(this.language);
}

class UploadTeacherImageEvent extends ProfileEvent {
  final XFile xFile;
  final String token;
  UploadTeacherImageEvent({required this.xFile,required this.token});
}
