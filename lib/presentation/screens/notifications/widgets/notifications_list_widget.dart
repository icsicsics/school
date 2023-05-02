import 'package:flutter/widgets.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/screens/notifications/widgets/notifications_item_widget.dart';

class NotificationsListWidget extends StatefulWidget {
  final bool isNotificationSelected;
  final List<NotificationItem> notifications;
  final List<NotificationItem> inboxNotifications;
  final bool isFather;

  const NotificationsListWidget({
    Key? key,
    required this.isNotificationSelected,
    required this.notifications,
    required this.inboxNotifications,
    required this.isFather,
  }) : super(key: key);

  @override
  State<NotificationsListWidget> createState() =>
      _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildScreenContent();
  }


  _buildScreenContent() {
    if(widget.isFather){
      return Expanded(
        child: ListView.builder(
            itemCount: widget.isNotificationSelected
                ? widget.notifications.length
                : widget.inboxNotifications.length,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemBuilder: (BuildContext context, int index) {
              return NotificationsItemWidget(
                isNotificationSelected: widget.isNotificationSelected,
                notificationItem: widget.isNotificationSelected
                    ? widget.notifications[index]
                    : widget.inboxNotifications[index],
              );
            }),
      );
    } else {
      return Expanded(
        child: ListView.builder(
            itemCount: widget.inboxNotifications.length,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemBuilder: (BuildContext context, int index) {
              return NotificationsItemWidget(
                isNotificationSelected: false,
                notificationItem: widget.inboxNotifications[index],
              );
            }),
      );
    }
  }
}
