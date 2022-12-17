part of 'sections_bloc.dart';

@immutable
abstract class SectionsEvent {}

class NavigateToNotificationScreenEvent extends SectionsEvent {}

class NavigateToAddPointScreenEvent extends SectionsEvent {}

class NavigateToHomeScreenEvent extends SectionsEvent {}
