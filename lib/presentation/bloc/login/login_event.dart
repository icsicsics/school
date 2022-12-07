part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginClearButtonEvent extends LoginEvent {}

class LoginConfirmButtonEvent extends LoginEvent {}
