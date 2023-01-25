part of 'add_point_bloc.dart';

abstract class AddPointEvent {}

class GetAddPointEvent extends AddPointEvent {
  final String token;
  final String classroomId;

  GetAddPointEvent({required this.token, required this.classroomId});
}

class PostTeacherAddPointEvent extends AddPointEvent {
  final String token;
  final TeacherAddPointRequest request;

  PostTeacherAddPointEvent({required this.token, required this.request});
}
