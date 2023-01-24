part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenEvent {}

class MyChildrenShowHousesEvent extends MyChildrenEvent {
  final bool isShowHouses;

  MyChildrenShowHousesEvent({required this.isShowHouses});
}

class GetMyChildrenEvent extends MyChildrenEvent {}

class OpenAddPointAlertEvent extends MyChildrenEvent {}

class NavigateToNotificationScreenEvent extends MyChildrenEvent {}

class GetIsFatherEvent extends MyChildrenEvent {}

class GetTokenEvent extends MyChildrenEvent {}
class GetTeacherStudentProfileInSchoolHouseEvent extends MyChildrenEvent {
  final String token;
  final String studentId;
  GetTeacherStudentProfileInSchoolHouseEvent({required this.token,required this.studentId});
}
