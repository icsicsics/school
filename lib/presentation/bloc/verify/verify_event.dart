part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}

class GetVerifyEvent extends VerifyEvent {}

class GetLanguageEvent extends VerifyEvent {
  GetLanguageEvent();
}

class VerifyCodeEvent extends VerifyEvent {
  final String phoneNumber;
  final String verifyCode;

  VerifyCodeEvent({
    required this.phoneNumber,
    required this.verifyCode,
  });
}
