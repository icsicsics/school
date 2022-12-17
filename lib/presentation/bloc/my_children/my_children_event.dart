part of 'my_children_bloc.dart';

@immutable
abstract class MyChildrenEvent {}
class MyChildrenShowHousesEvent extends MyChildrenEvent {
  final bool isShowHouses;

  MyChildrenShowHousesEvent({required this.isShowHouses});
}
 class GetMyChildrenEvent extends MyChildrenEvent {}
