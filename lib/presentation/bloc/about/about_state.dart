part of 'about_bloc.dart';

@immutable
abstract class AboutState {}

class AboutInitialState extends AboutState {}

class GetAboutLoadingState extends AboutState {}

class GetAboutSuccessState extends AboutState {}

class GetAboutFillState extends AboutState {}

class GetAboutErrorState extends AboutState {}
