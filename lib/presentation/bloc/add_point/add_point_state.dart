part of 'add_point_bloc.dart';

abstract class AddPointState {}

class AddPointInitialState extends AddPointState {}

class AddPointLoadingState extends AddPointState {}

class GetTeacherPrinciplByClassroomIdSuccessState extends AddPointState {
  final GetTeacherPrinciplByClassroomIdResponse response;

  GetTeacherPrinciplByClassroomIdSuccessState({required this.response});
}

class GetTeacherPrinciplByClassroomIdFillState extends AddPointState {
  final String error;

  GetTeacherPrinciplByClassroomIdFillState({required this.error});
}
class PostTeacherCreatePointSuccessState extends AddPointState {
  TeacherAddPointResponse response;

  PostTeacherCreatePointSuccessState({required this.response});
}
class PostTeacherCreatePointFailState extends AddPointState {
  final String error;

  PostTeacherCreatePointFailState({required this.error});
}


