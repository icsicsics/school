part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class GetIsFatherEvent extends NotificationsEvent {}

class GetLanguageEvent extends NotificationsEvent {
  GetLanguageEvent();
}

class GetTokenEvent extends NotificationsEvent {}

class GetNotificationsEvent extends NotificationsEvent {
  final NotificationRequest notificationRequest;

  GetNotificationsEvent({
    required this.notificationRequest,
  });
}

class GetInboxNotificationsEvent extends NotificationsEvent {
  final NotificationRequest notificationRequest;

  GetInboxNotificationsEvent({
    required this.notificationRequest,
  });
}

class UpdateNotificationEvent extends NotificationsEvent {
  final String id;

  UpdateNotificationEvent({
    required this.id,
  });
}
