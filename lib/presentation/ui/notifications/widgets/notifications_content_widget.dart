import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_app_bar_widget.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_list_widget.dart';
import 'package:schools/presentation/ui/notifications/widgets/titiles_row_widget.dart';

class NotificationsContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;
  final List<NotificationItem> notifications;
  final List<NotificationItem> inboxNotifications;

  const NotificationsContentWidget({
    Key? key,
    required this.globalKey,
    required this.isFather,
    required this.notifications,
    required this.inboxNotifications,
  }) : super(key: key);

  @override
  State<NotificationsContentWidget> createState() =>
      _NotificationsContentWidgetState();
}

class _NotificationsContentWidgetState
    extends State<NotificationsContentWidget> {
  bool isNotificationSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationsAppBarWidget(
          onTapMenu: () => widget.globalKey.currentState!.openDrawer(),
          isFather: widget.isFather,
        ),
        widget.isFather
            ? TitlesRowWidget(
                isFather: widget.isFather,
                isNotificationSelected: isNotificationSelected,
                notificationCount:totalUnreadMessages(widget.notifications),
                inboxNotificationCount:totalUnreadMessages(widget.inboxNotifications),
                selectNotificationTab: () {
                  setState(() {
                    isNotificationSelected = true;
                  });
                },
                selectInboxTab: () {
                  setState(() {
                    isNotificationSelected = false;
                  });
                },
              )
            : Container(),
        NotificationsListWidget(
          isFather:widget.isFather,
          isNotificationSelected: isNotificationSelected,
          notifications: widget.notifications,
          inboxNotifications: widget.inboxNotifications,
        )
      ],
    );
  }

  int totalUnreadMessages(List<NotificationItem> notifications){
    int total = 0;

    for(var item in notifications){
      if(item.status == 1){
        total++;
      }
    }
    return total;
  }
}
