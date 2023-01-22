part of 'student_houses_bloc.dart';

@immutable
abstract class StudentHousesState {}

class StudentHousesInitialState extends StudentHousesState {}

class StudentHousesLoadingState extends StudentHousesState {}

class GetStudentHousesSuccessState extends StudentHousesState {}

class GetStudentHousesFillState extends StudentHousesState {}

class GetStudentHousesErrorState extends StudentHousesState {}

class NavigateToNotificationScreenState extends StudentHousesState {}

class NavigateToMyChildrenScreenState extends StudentHousesState {}

class GetIsFatherState extends StudentHousesState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}
