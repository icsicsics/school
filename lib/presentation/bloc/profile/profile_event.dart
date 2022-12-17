part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class GetIsFatherEvent extends ProfileEvent {}

class NavigateToNotificationScreenEvent extends ProfileEvent {}
