part of 'verify_bloc.dart';

@immutable
abstract class VerifyState {}

class VerifyInitialState extends VerifyState {}

class GetVerifyLoadingState extends VerifyState {}

class GetVerifySuccessState extends VerifyState {}

class GetVerifyFillState extends VerifyState {}

class GetVerifyErrorState extends VerifyState {}

class GetLanguageSuccessState extends VerifyState {
  final String language;
  GetLanguageSuccessState({required this.language});
}
