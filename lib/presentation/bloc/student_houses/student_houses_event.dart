part of 'student_houses_bloc.dart';

@immutable
abstract class StudentHousesEvent {}

class GetStudentHousesEvent extends StudentHousesEvent {
  final String token;
  final String classroomToSectionId;

  GetStudentHousesEvent(
      {required this.token,
      required this.classroomToSectionId});
}

class NavigateToNotificationScreenEvent extends StudentHousesEvent {}

class NavigateToMyChildrenScreenEvent extends StudentHousesEvent {
  final String studentId;
  final String classroomToSectionId;
  NavigateToMyChildrenScreenEvent({required this.studentId,required this.classroomToSectionId});

}

class GetIsFatherEvent extends StudentHousesEvent {}
