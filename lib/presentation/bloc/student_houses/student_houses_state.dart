part of 'student_houses_bloc.dart';

@immutable
abstract class StudentHousesState {}

class StudentHousesInitialState extends StudentHousesState {}

class StudentHousesLoadingState extends StudentHousesState {}

class GetStudentHousesSuccessState extends StudentHousesState {
  final  GetStudentHousesResponse response;
  GetStudentHousesSuccessState({required this.response});
}

class GetStudentHousesFillState extends StudentHousesState {
  final String error;
  GetStudentHousesFillState({required this.error});
}

class GetStudentHousesErrorState extends StudentHousesState {}

class NavigateToNotificationScreenState extends StudentHousesState {}

class NavigateToMyChildrenScreenState extends StudentHousesState {
  final String studentId;
  final String classroomToSectionId;
  NavigateToMyChildrenScreenState({required this.studentId,required this.classroomToSectionId});
}

class GetIsFatherState extends StudentHousesState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}
