part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeEvent extends HomeEvent {}

class GetIsFatherEvent extends HomeEvent {}

class ChangeLanguageEvent extends HomeEvent {
  final String language;

  ChangeLanguageEvent(this.language);
}

class GetLanguageEvent extends HomeEvent {}

class GetTeacherHomeEvent extends HomeEvent {
  final String token;

  GetTeacherHomeEvent({required this.token});
}

class GetFatherHomeEvent extends HomeEvent {
  final String token;

  GetFatherHomeEvent({required this.token});
}

class GetTokenEvent extends HomeEvent {}

class GetTeacherInfoEvent extends HomeEvent {
  final String token;

  GetTeacherInfoEvent({required this.token});
}

class GetFatherInfoEvent extends HomeEvent {
  final String token;

  GetFatherInfoEvent({required this.token});
}

class GetWeatherEvent extends HomeEvent {}

class SwitchAccountEvent extends HomeEvent {}

class GetStudentProfileInSchoolHouseEvent extends HomeEvent {
  final String studentId;

  GetStudentProfileInSchoolHouseEvent(this.studentId);
}

class OpenCameraGalleryBottomSheetEvent extends HomeEvent {
  final String classroomToSectionId;

  OpenCameraGalleryBottomSheetEvent({
    required this.classroomToSectionId,
  });
}

class SelectImageEvent extends HomeEvent {
  final ImageSource? source;
  final String id;

  SelectImageEvent({
    this.source,
    required this.id,
  });
}

class ClassSectionChangePhotoEvent extends HomeEvent {
  final XFile xFile;
  final String sectionId;

  ClassSectionChangePhotoEvent({
    required this.xFile,
    required this.sectionId,
  });
}

class GetTeacherOfflineDataEvent extends HomeEvent {
  GetTeacherOfflineDataEvent();
}
