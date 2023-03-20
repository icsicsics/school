part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ShowLoadingState extends LoginState {}

class HideLoadingState extends LoginState {}

class LoginClearButtonState extends LoginState {}

class LoginConfirmButtonState extends LoginState {}

class GetLoginLoadingState extends LoginState {}

class GetLoginSuccessState extends LoginState {}

class GetLoginFillState extends LoginState {}

class GetLoginErrorState extends LoginState {}

class LoginIsFatherState extends LoginState {
  final bool isFather;

  LoginIsFatherState({required this.isFather});
}

class GetLanguageSuccessState extends LoginState {
  final String language;

  GetLanguageSuccessState({required this.language});
}

class VerifyPhoneNumberSuccessState extends LoginState {
  final String phoneNumber;
  final List<String> roles;

  VerifyPhoneNumberSuccessState({
    required this.phoneNumber,
    required this.roles,
  });
}

class VerifyPhoneNumberErrorState extends LoginState {
  final String errorMessage;

  VerifyPhoneNumberErrorState({
    required this.errorMessage,
  });
}


class SelectCountryCodeState extends LoginState {
  final PhoneNumber phoneNumber;

  SelectCountryCodeState(this.phoneNumber);


}