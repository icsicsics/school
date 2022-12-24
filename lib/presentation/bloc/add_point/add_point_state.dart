part of 'add_point_bloc.dart';

@immutable
abstract class AddPointState {}

class AddPointInitialState extends AddPointState {}

class GetAddPointLoadingState extends AddPointState {}

class GetAddPointSuccessState extends AddPointState {}

class GetAddPointFillState extends AddPointState {}

class GetAddPointErrorState extends AddPointState {}

class NavigateToNotificationScreenState extends AddPointState {}

class NavigateToMyChildrenScreenState extends AddPointState {}

class GetIsFatherState extends AddPointState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}
