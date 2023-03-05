part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitialState extends NotificationsState {}

class ShowLoadingState extends NotificationsState {}

class HideLoadingState extends NotificationsState {}

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

class GetNotificationsSuccessState extends NotificationsState {
  final NotificationsResponse notificationResponse;

  GetNotificationsSuccessState({
    required this.notificationResponse,
  });
}

class GetNotificationsFillState extends NotificationsState {
  final String errorMessage;

  GetNotificationsFillState({
    required this.errorMessage,
  });
}

class GetInboxNotificationsSuccessState extends NotificationsState {
  final NotificationsResponse notificationResponse;

  GetInboxNotificationsSuccessState({
    required this.notificationResponse,
  });
}

class GetInboxNotificationsFillState extends NotificationsState {
  final String errorMessage;

  GetInboxNotificationsFillState({
    required this.errorMessage,
  });
}
