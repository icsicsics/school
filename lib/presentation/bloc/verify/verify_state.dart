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
