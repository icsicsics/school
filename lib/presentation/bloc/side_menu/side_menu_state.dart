part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuState {}

class SideMenuInitialState extends SideMenuState {}

class GetSideMenuLoadingState extends SideMenuState {}

class GetSideMenuSuccessState extends SideMenuState {}

class GetSideMenuFillState extends SideMenuState {}

class GetSideMenuErrorState extends SideMenuState {}

class SideMenuHomeState extends SideMenuState {}

class SideMenuSettingsState extends SideMenuState {}

class SideMenuContactUsState extends SideMenuState {}

class SideMenuAboutAppState extends SideMenuState {}
