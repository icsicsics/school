part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginClearButtonState extends LoginState {}

class LoginConfirmButtonState extends LoginState {}

class GetLoginLoadingState extends LoginState {}

class GetLoginSuccessState extends LoginState {}

class GetLoginFillState extends LoginState {}

class GetLoginErrorState extends LoginState {}
