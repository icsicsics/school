part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesEvent {}

class GetSchoolHousesEvent extends SchoolHousesEvent {
  final String classRoomId;
  final String token;
  final bool isComingFromHome;

  GetSchoolHousesEvent({required this.token, required this.classRoomId,required this.isComingFromHome});
}

class NavigateToNotificationScreenEvent extends SchoolHousesEvent {}

class NavigateToAddPointsScreenEvent extends SchoolHousesEvent {
  final Data data;
  NavigateToAddPointsScreenEvent({required this.data});
}
