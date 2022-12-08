part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenEvent {}

class MyChildrenShowPointsEvent extends MyChildrenEvent {
  final bool isShowPoints;

  MyChildrenShowPointsEvent({required this.isShowPoints});
}