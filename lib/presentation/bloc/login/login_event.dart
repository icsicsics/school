part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginClearButtonEvent extends LoginEvent {}

class LoginConfirmButtonEvent extends LoginEvent {}

class GetLoginEvent extends LoginEvent {}

class LoginIsFatherEvent extends LoginEvent {
  final bool isFather;

  LoginIsFatherEvent({required this.isFather});
}
class GetLanguageEvent extends LoginEvent {
  GetLanguageEvent();
}
