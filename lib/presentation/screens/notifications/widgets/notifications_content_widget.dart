import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/screens/notifications/widgets/notifications_app_bar_widget.dart';
import 'package:schools/presentation/screens/notifications/widgets/notifications_list_widget.dart';
import 'package:schools/presentation/screens/notifications/widgets/titiles_row_widget.dart';

class NotificationsContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;
  final List<NotificationItem> notifications;
  final List<NotificationItem> inboxNotifications;
  final bool isNotificationSelected ;

  const NotificationsContentWidget({
    Key? key,
    required this.globalKey,
    required this.isFather,
    required this.notifications,
    required this.inboxNotifications,
    required this.isNotificationSelected,
  }) : super(key: key);

  @override
  State<NotificationsContentWidget> createState() =>
      _NotificationsContentWidgetState();
}

class _NotificationsContentWidgetState
    extends State<NotificationsContentWidget> {
  bool _isNotificationSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isNotificationSelected = widget.isNotificationSelected;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // NotificationsAppBarWidget(
        //   onTapMenu: (){
        //     Navigator.pop(context);
        //   },
        //   isFather: widget.isFather,
        //   isNotificationSelected: _isNotificationSelected,
        // ),
        widget.isFather
            ? TitlesRowWidget(
                isFather: widget.isFather,
                isNotificationSelected: _isNotificationSelected,
                notificationCount:totalUnreadMessages(widget.notifications),
                inboxNotificationCount:totalUnreadMessages(widget.inboxNotifications),
                selectNotificationTab: () {
                  setState(() {
                    _isNotificationSelected = true;
                  });
                },
                selectInboxTab: () {
                  setState(() {
                    _isNotificationSelected = false;
                  });
                },
              )
            : Container(),
        NotificationsListWidget(
          isFather:widget.isFather,
          isNotificationSelected: _isNotificationSelected,
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
