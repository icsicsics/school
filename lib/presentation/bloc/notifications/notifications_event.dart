part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class GetNotificationsEvent extends NotificationsEvent {}

class GetIsFatherEvent extends NotificationsEvent {}
class GetLanguageEvent extends NotificationsEvent {
  GetLanguageEvent();
}
class GetTokenEvent extends NotificationsEvent {}