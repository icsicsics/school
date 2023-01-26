part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitialState extends NotificationsState {}

class GetNotificationsLoadingState extends NotificationsState {}

class GetNotificationsSuccessState extends NotificationsState {}

class GetNotificationsFillState extends NotificationsState {}

class GetNotificationsErrorState extends NotificationsState {}

class GetIsFatherState extends NotificationsState {
  final bool isFather;

  GetIsFatherState({required this.isFather});
}

class GetLanguageSuccessState extends NotificationsState {
  final String language;

  GetLanguageSuccessState({required this.language});
}

class GetTokenSuccessState extends NotificationsState {
  final String token;

  GetTokenSuccessState({required this.token});
}
