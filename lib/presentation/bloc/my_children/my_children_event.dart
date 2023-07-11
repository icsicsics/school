part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenEvent {}

class MyChildrenShowHousesEvent extends MyChildrenEvent {
  final bool isShowHouses;

  MyChildrenShowHousesEvent({required this.isShowHouses});
}

class GetMyChildrenEvent extends MyChildrenEvent {}

class OpenAddPointAlertEvent extends MyChildrenEvent {}

class NavigateToNotificationScreenEvent extends MyChildrenEvent {
  final bool isNotificationSelected;

  NavigateToNotificationScreenEvent({
    required this.isNotificationSelected,
  });
}

class GetIsFatherEvent extends MyChildrenEvent {}

class GetTokenEvent extends MyChildrenEvent {}

class GetTeacherStudentProfileInSchoolHouseEvent extends MyChildrenEvent {
  final String token;
  final String studentId;

  GetTeacherStudentProfileInSchoolHouseEvent(
      {required this.token, required this.studentId});
}

class GetPrincipleByClassroomEvent extends MyChildrenEvent {
  final String token;
  final String classroomId;

  GetPrincipleByClassroomEvent(
      {required this.token, required this.classroomId});
}

class MyChildrenFilterEvent extends MyChildrenEvent {
  final List<Points> filter;

  MyChildrenFilterEvent({required this.filter});
}

class GetGuidesEvent extends MyChildrenEvent {
  final String branchId;

  GetGuidesEvent({
    required this.branchId,
  });
}



