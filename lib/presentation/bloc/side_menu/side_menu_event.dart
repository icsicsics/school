part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuEvent {}

class GetSideMenuEvent extends SideMenuEvent {}

class SideMenuHomeEvent extends SideMenuEvent {}

class SideMenuUserProfileEvent extends SideMenuEvent {}

class SideMenuContactUsEvent extends SideMenuEvent {}

class SideMenuAboutAppEvent extends SideMenuEvent {}

class GetIsFatherEvent extends SideMenuEvent {}

class SwitchAccountEvent extends SideMenuEvent {}

class GetLanguageEvent extends SideMenuEvent {
  GetLanguageEvent();
}

class LogoutEvent extends SideMenuEvent {}

class GetTeacherInfoEvent extends SideMenuEvent {
  final String token;

  GetTeacherInfoEvent({required this.token});
}

class GetFatherInfoEvent extends SideMenuEvent {
  final String token;

  GetFatherInfoEvent({required this.token});
}
