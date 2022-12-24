part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}

class GetVerifyEvent extends VerifyEvent {}

class GetLanguageEvent extends VerifyEvent {
  GetLanguageEvent();
}
