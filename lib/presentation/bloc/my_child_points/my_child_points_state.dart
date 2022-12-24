part of 'my_child_points_bloc.dart';

abstract class MyChildPointsState {}

class MyChildPointsInitialState extends MyChildPointsState {}

class OpenPointScreenState extends MyChildPointsState {}

class NavigateToHomeScreenState extends MyChildPointsState {}

class NavigateToNotificationScreenState extends MyChildPointsState {}

class GetIsFatherState extends MyChildPointsState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}