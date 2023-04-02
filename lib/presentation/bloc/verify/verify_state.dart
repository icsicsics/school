part of 'verify_bloc.dart';

@immutable
abstract class VerifyState {}

class VerifyInitialState extends VerifyState {}

class ShowLoadingState extends VerifyState {}

class HideLoadingState extends VerifyState {}

class VerifyCodeSuccessState extends VerifyState {}

class VerifyCodeErrorState extends VerifyState {}

class GetVerifyErrorState extends VerifyState {}

class GetLanguageSuccessState extends VerifyState {
  final String language;

  GetLanguageSuccessState({required this.language});
}

class UpdateDeviceTokenSuccessState extends VerifyState {}

class UpdateDeviceTokenFailState extends VerifyState {
  final String errorMessage;

  UpdateDeviceTokenFailState({
    required this.errorMessage,
  });
}

class VerifyPhoneNumberSuccessState extends VerifyState {
  final String phoneNumber;
  final List<String> roles;
  final String code;

  VerifyPhoneNumberSuccessState({
    required this.phoneNumber,
    required this.roles,
    required this.code,
  });
}

class VerifyPhoneNumberErrorState extends VerifyState {
  final String errorMessage;

  VerifyPhoneNumberErrorState({
    required this.errorMessage,
  });
}