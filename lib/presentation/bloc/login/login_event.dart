part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class LoginClearButtonEvent extends LoginEvent {}

class LoginConfirmButtonEvent extends LoginEvent {}

class VerifyPhoneNumberEvent extends LoginEvent {
  final String phoneNumber;

  VerifyPhoneNumberEvent({
    required this.phoneNumber,
  });
}

class GetLoginEvent extends LoginEvent {}

class GetLanguageEvent extends LoginEvent {
  GetLanguageEvent();
}

class SelectCountryCodeEvent extends LoginEvent {
  final PhoneNumber phoneNumber;

  SelectCountryCodeEvent(this.phoneNumber);
}

class VerifyCodeEvent extends LoginEvent {
  final String phoneNumber;
  final String verifyCode;

  VerifyCodeEvent({
    required this.phoneNumber,
    required this.verifyCode,
  });
}

class ChangeLanguageEvent extends LoginEvent {
  final String language;

  const ChangeLanguageEvent({
    required this.language,
  });
}

class NavigateBackEvent extends LoginEvent {}
