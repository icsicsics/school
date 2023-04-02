part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuEvent {}

class GetSideMenuEvent extends SideMenuEvent {}

class SideMenuHomeEvent extends SideMenuEvent {}

class SideMenuUserProfileEvent extends SideMenuEvent {}

class GetIsFatherEvent extends SideMenuEvent {}

class SwitchAccountEvent extends SideMenuEvent {}

class GetLanguageEvent extends SideMenuEvent {
  GetLanguageEvent();
}

class LogoutEvent extends SideMenuEvent {}

class ClearTokenEvent extends SideMenuEvent {}

class GetTeacherInfoEvent extends SideMenuEvent {
  final String token;

  GetTeacherInfoEvent({required this.token});
}

class GetFatherInfoEvent extends SideMenuEvent {
  final String token;

  GetFatherInfoEvent({required this.token});
}

class GetProfileImageFromShearedPrefranceEvent extends SideMenuEvent {}

class SetProfileImageInShearedPrefranceEvent extends SideMenuEvent {
  final String image;

  SetProfileImageInShearedPrefranceEvent({required this.image});
}
class OpenWebViewEvent extends SideMenuEvent {
  final String webViewContent;
  final String screenTitle;
  final bool isUrlContent;

  OpenWebViewEvent({
    required this.webViewContent,
    required this.screenTitle,
    required this.isUrlContent,
  });
}