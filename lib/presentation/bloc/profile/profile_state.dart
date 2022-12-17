part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {}

class GetProfileFillState extends ProfileState {}

class GetProfileErrorState extends ProfileState {}
class GetIsFatherState extends ProfileState {
  final bool isFather;
  GetIsFatherState({required this.isFather});
}