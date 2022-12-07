part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuEvent {}

class SideMenuHomeEvent extends SideMenuEvent {}

class SideMenuSettingsEvent extends SideMenuEvent {}

class SideMenuContactUsEvent extends SideMenuEvent {}

class SideMenuAboutAppEvent extends SideMenuEvent {}
