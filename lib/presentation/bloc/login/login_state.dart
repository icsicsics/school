part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LoginInitialState extends LoginState {}

class ShowLoadingState extends LoginState {}

class HideLoadingState extends LoginState {}

class LoginClearButtonState extends LoginState {}

class LoginConfirmButtonState extends LoginState {}

class GetLoginLoadingState extends LoginState {}

class GetLoginSuccessState extends LoginState {}

class GetLoginFillState extends LoginState {}

class GetLoginErrorState extends LoginState {}

class GetLanguageSuccessState extends LoginState {
  final String language;

  GetLanguageSuccessState({required this.language});
}

class VerifyPhoneNumberSuccessState extends LoginState {
  final String phoneNumber;
  final List<String> roles;
  final String code;

  VerifyPhoneNumberSuccessState({
    required this.phoneNumber,
    required this.roles,
    required this.code,
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

class VerifyCodeSuccessState extends LoginState {}

class VerifyCodeErrorState extends LoginState {}

class SaveLanguageCodeFailedState extends LoginState {}

class ChangeLanguageSuccessState extends LoginState {}

class NavigateBackState extends LoginState {}