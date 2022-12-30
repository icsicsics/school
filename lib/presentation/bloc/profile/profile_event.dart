part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class GetIsFatherEvent extends ProfileEvent {}

class NavigateToNotificationScreenEvent extends ProfileEvent {}

class OpenCameraGalleryBottomSheetEvent extends ProfileEvent {}

class SelectProfileImageEvent extends ProfileEvent {
  final ImageSource? source;

  SelectProfileImageEvent({this.source});
}
class UploadProfileImageEvent extends ProfileEvent {
  final XFile image;

  UploadProfileImageEvent({required this.image});

}
class GetProfileImageEvent extends ProfileEvent {}

