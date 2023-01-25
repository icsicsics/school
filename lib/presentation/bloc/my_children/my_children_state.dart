part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenState {}

class MyChildrenInitialState extends MyChildrenState {}

class MyChildrenShowHousesState extends MyChildrenState {
  final bool isShowHouses;

  MyChildrenShowHousesState({required this.isShowHouses});
}

class GetMyChildrenLoadingState extends MyChildrenState {}

class GetMyChildrenSuccessState extends MyChildrenState {}

class GetMyChildrenFillState extends MyChildrenState {}

class GetMyChildrenErrorState extends MyChildrenState {}

class OpenAddPointAlertState extends MyChildrenState {}

class NavigateToNotificationScreenState extends MyChildrenState {}

class GetIsFatherState extends MyChildrenState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class GetTokenSuccessState extends MyChildrenState {
  final String token;

  GetTokenSuccessState({required this.token});
}

class GetTeacherStudentProfileInSchoolHouseSuccessState
    extends MyChildrenState {
  final TeacherStudentProfileInSchoolHouseResponse response;

  GetTeacherStudentProfileInSchoolHouseSuccessState({required this.response});
}

class GetTeacherStudentProfileInSchoolHouseFailState extends MyChildrenState {
  final String error;

  GetTeacherStudentProfileInSchoolHouseFailState({required this.error});
}

class GetTeacherPrinciplByClassroomIdSuccessState extends MyChildrenState {
  final GetTeacherPrinciplByClassroomIdResponse response;

  GetTeacherPrinciplByClassroomIdSuccessState({required this.response});
}

class GetTeacherPrinciplByClassroomIdFillState extends MyChildrenState {
  final String error;

  GetTeacherPrinciplByClassroomIdFillState({required this.error});
}
