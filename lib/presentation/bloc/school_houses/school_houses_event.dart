part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesEvent {}

class GetSchoolHousesEvent extends SchoolHousesEvent {
  final String classRoomId;
  final String token;

  GetSchoolHousesEvent({required this.token, required this.classRoomId});
}

class NavigateToNotificationScreenEvent extends SchoolHousesEvent {}

class NavigateToAddPointsScreenEvent extends SchoolHousesEvent {}
