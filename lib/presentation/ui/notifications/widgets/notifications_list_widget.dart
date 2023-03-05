import 'package:flutter/widgets.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_item_widget.dart';

class NotificationsListWidget extends StatefulWidget {
  final bool isNotificationSelected;

  final List<NotificationItem> notifications;
  final List<NotificationItem> inboxNotifications;

  const NotificationsListWidget({
    Key? key,
    required this.isNotificationSelected,
    required this.notifications,
    required this.inboxNotifications,
  }) : super(key: key);

  @override
  State<NotificationsListWidget> createState() =>
      _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.isNotificationSelected
              ? widget.notifications.length
              : widget.inboxNotifications.length,
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemBuilder: (BuildContext context, int index) {
            return NotificationsItemWidget(
              notificationItem: widget.isNotificationSelected
                  ? widget.notifications[index]
                  : widget.inboxNotifications[index],
            );
          }),
    );
  }
}
