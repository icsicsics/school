part of 'side_menu_bloc.dart';

@immutable
abstract class SideMenuState {}

class SideMenuInitialState extends SideMenuState {}

class GetSideMenuLoadingState extends SideMenuState {}

class GetSideMenuSuccessState extends SideMenuState {}

class GetSideMenuFillState extends SideMenuState {}

class GetSideMenuErrorState extends SideMenuState {}

class SideMenuHomeState extends SideMenuState {}

class SideMenuUserProfileState extends SideMenuState {}

class SideMenuContactUsState extends SideMenuState {}

class SideMenuAboutAppState extends SideMenuState {}

class SwitchAccountState extends SideMenuState {}

class GetIsFatherState extends SideMenuState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class GetLanguageSuccessState extends SideMenuState {
  final String language;
  GetLanguageSuccessState({required this.language});
}


class LogoutState extends SideMenuState {}

class GetTeacherInfoSuccessState extends SideMenuState {
  final TeacherInfoResponse response;

  GetTeacherInfoSuccessState({required this.response});
}

class GetTeacherInfoFillState extends SideMenuState {
  final String error;

  GetTeacherInfoFillState({required this.error});
}
class GetFatherInfoSuccessState extends SideMenuState {
  final FatherInfoResponse response;

  GetFatherInfoSuccessState({required this.response});
}

class GetFatherInfoFillState extends SideMenuState {
  final String error;

  GetFatherInfoFillState({required this.error});
}

class GetTeacherResponseState extends SideMenuState {
  final TeacherInfoResponse response;

  GetTeacherResponseState({required this.response});
}
class GetFatherResponseState extends SideMenuState {
  final FatherInfoResponse response;
  GetFatherResponseState({required this.response});
}
class SuccessGetProfileImageState extends SideMenuState {
  final String image;

  SuccessGetProfileImageState({required this.image});
}