import 'package:flutter/widgets.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_item_widget.dart';

class NotificationsListWidget extends StatefulWidget {
  const NotificationsListWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsListWidget> createState() => _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
          padding: const EdgeInsets.only(top: 10),
          itemBuilder: (BuildContext context,int index){
        return const NotificationsItemWidget();
      }),
    );
  }
}
