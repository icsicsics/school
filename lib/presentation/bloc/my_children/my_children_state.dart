part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenState {}

class MyChildrenInitialState extends MyChildrenState {}

class MyChildrenShowPointsState extends MyChildrenState {
  final bool isShowPoints;

  MyChildrenShowPointsState({required this.isShowPoints});
}

class MyChildrenShowHousesState extends MyChildrenState {
  final bool isShowHouses;

  MyChildrenShowHousesState({required this.isShowHouses});
}

class GetMyChildrenLoadingState extends MyChildrenState {}

class GetMyChildrenSuccessState extends MyChildrenState {}

class GetMyChildrenFillState extends MyChildrenState {}

class GetMyChildrenErrorState extends MyChildrenState {}
