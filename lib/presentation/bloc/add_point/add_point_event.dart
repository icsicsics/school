part of 'add_point_bloc.dart';

@immutable
abstract class AddPointEvent {}

class GetAddPointEvent extends AddPointEvent {}

class NavigateToNotificationScreenEvent extends AddPointEvent {}

class NavigateToMyChildrenScreenEvent extends AddPointEvent {}

class GetIsFatherEvent extends AddPointEvent {}
