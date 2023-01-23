part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesState {}

class SchoolHousesInitialState extends SchoolHousesState {}

class GetSchoolHousesLoadingState extends SchoolHousesState {}

class GetSchoolHousesSuccessState extends SchoolHousesState {
  final GetClassHousesResponse response;
  GetSchoolHousesSuccessState({required this.response});

}

class GetSchoolHousesFillState extends SchoolHousesState {
  final String error;
  GetSchoolHousesFillState({required this.error});
}

class GetSchoolHousesErrorState extends SchoolHousesState {}

class NavigateToNotificationScreenState extends SchoolHousesState {}

class NavigateToStudentHousesScreenState extends SchoolHousesState {
  final Data data;
  NavigateToStudentHousesScreenState({required this.data});
}
