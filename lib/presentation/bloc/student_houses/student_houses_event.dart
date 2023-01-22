part of 'student_houses_bloc.dart';

@immutable
abstract class StudentHousesEvent {}

class GetStudentHousesEvent extends StudentHousesEvent {
  final String token;
  final String classroomToSectionId;
  final String houseId;

  GetStudentHousesEvent(
      {required this.token,
      required this.classroomToSectionId,
      required this.houseId});
}

class NavigateToNotificationScreenEvent extends StudentHousesEvent {}

class NavigateToMyChildrenScreenEvent extends StudentHousesEvent {}

class GetIsFatherEvent extends StudentHousesEvent {}
