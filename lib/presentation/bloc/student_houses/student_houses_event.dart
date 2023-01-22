part of 'student_houses_bloc.dart';

@immutable
abstract class StudentHousesEvent {}

class GetStudentHousesEvent extends StudentHousesEvent {}

class NavigateToNotificationScreenEvent extends StudentHousesEvent {}

class NavigateToMyChildrenScreenEvent extends StudentHousesEvent {}

class GetIsFatherEvent extends StudentHousesEvent {}
