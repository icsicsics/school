part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesEvent {}

class GetSchoolHousesEvent extends SchoolHousesEvent {}

class NavigateToNotificationScreenEvent extends SchoolHousesEvent {}

class NavigateToAddPointsScreenEvent extends SchoolHousesEvent {}
