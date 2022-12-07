part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuState {}

class SideMenuInitial extends SideMenuState {}

class SideMenuHomeState extends SideMenuState {}
class SideMenuSettingsState extends SideMenuState {}
class SideMenuContactUsState extends SideMenuState {}
class SideMenuAboutAppState extends SideMenuState {}

