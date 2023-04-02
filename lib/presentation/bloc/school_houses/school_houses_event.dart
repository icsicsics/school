part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesEvent {}

class GetSchoolHousesEvent extends SchoolHousesEvent {
  final String classRoomId;
  final String token;
  final bool isComingFromHome;
  final int search;

  GetSchoolHousesEvent({
    required this.token,
    required this.classRoomId,
    required this.isComingFromHome,
    required this.search,
  });
}

class NavigateToNotificationScreenEvent extends SchoolHousesEvent {}

class NavigateToAddPointsScreenEvent extends SchoolHousesEvent {
  final Data data;

  NavigateToAddPointsScreenEvent({required this.data});
}

class NavigateToMyChildrenScreenEvent extends SchoolHousesEvent {
  final String studentId;
  final String classroomToSectionId;

  NavigateToMyChildrenScreenEvent(
      {required this.studentId, required this.classroomToSectionId});
}

class GetStudentHousesEvent extends SchoolHousesEvent {
  final String token;
  final String classroomToSectionId;

  GetStudentHousesEvent(
      {required this.token, required this.classroomToSectionId});
}

class GetSearchValuesEvent extends SchoolHousesEvent {
  final String token;

  GetSearchValuesEvent({
    required this.token,
  });
}
