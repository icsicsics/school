part of 'child_details_bloc.dart';

@immutable
abstract class ChildDetailsState {}

class GetChildDetailsInitialState extends ChildDetailsState {}

class GetChildDetailsState extends ChildDetailsState {}

class GetChildDetailsSuccessState extends ChildDetailsState {}

class GetChildDetailsFillState extends ChildDetailsState {}

class GetChildDetailsErrorState extends ChildDetailsState {}
