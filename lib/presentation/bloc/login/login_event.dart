part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginClearButtonEvent extends LoginEvent {}

class LoginConfirmButtonEvent extends LoginEvent {}

class VerifyPhoneNumberEvent extends LoginEvent {
  final String phoneNumber;

  VerifyPhoneNumberEvent({
    required this.phoneNumber,
  });
}

class GetLoginEvent extends LoginEvent {}

class LoginIsFatherEvent extends LoginEvent {
  final bool isFather;

  LoginIsFatherEvent({required this.isFather});
}

class GetLanguageEvent extends LoginEvent {
  GetLanguageEvent();
}

class SelectCountryCodeEvent extends LoginEvent {
  final PhoneNumber phoneNumber;

  SelectCountryCodeEvent(this.phoneNumber);
}