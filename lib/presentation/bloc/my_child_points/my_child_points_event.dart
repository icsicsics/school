part of 'my_child_points_bloc.dart';

abstract class MyChildPointsEvent {}

class OpenPointScreenEvent extends MyChildPointsEvent {}

class NavigateToHomeScreenEvent extends MyChildPointsEvent {}

class NavigateToNotificationScreenEvent extends MyChildPointsEvent {}

class GetIsFatherEvent extends MyChildPointsEvent {}
