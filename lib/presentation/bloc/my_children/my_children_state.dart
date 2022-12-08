part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenState {}

class MyChildrenInitial extends MyChildrenState {}
class MyChildrenShowPointsState extends MyChildrenState {
  final bool isShowPoints;

  MyChildrenShowPointsState({required this.isShowPoints});
}
