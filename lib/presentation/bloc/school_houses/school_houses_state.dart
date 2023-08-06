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

class NavigateToNotificationScreenState extends SchoolHousesState {
  final bool isNotificationSelected;

  NavigateToNotificationScreenState({
    required this.isNotificationSelected,
});
}

class NavigateToStudentHousesScreenState extends SchoolHousesState {
  final ClassHousesData data;

  NavigateToStudentHousesScreenState({required this.data});
}

class NavigateToMyChildrenScreenState extends SchoolHousesState {
  final String studentId;
  final String classroomToSectionId;

  NavigateToMyChildrenScreenState(
      {required this.studentId, required this.classroomToSectionId});
}

class GetStudentHousesSuccessState extends SchoolHousesState {
  final GetStudentHousesResponse response;

  GetStudentHousesSuccessState({required this.response});
}

class GetStudentHousesFillState extends SchoolHousesState {
  final String error;

  GetStudentHousesFillState({required this.error});
}

class GetSearchValuesSuccessState extends SchoolHousesState {
  final List<SearchItem> values;

  GetSearchValuesSuccessState({
    required this.values,
  });
}

class GetSearchValuesFailState extends SchoolHousesState {
  final String error;

  GetSearchValuesFailState({
    required this.error,
  });
}

class GetGuidesSuccessState extends SchoolHousesState {
  final List<Guide> guides;

  GetGuidesSuccessState({
    required this.guides,
  });
}

class GetGuidesErrorState extends SchoolHousesState {
  final String errorMessage;

  GetGuidesErrorState({
    required this.errorMessage,
  });
}