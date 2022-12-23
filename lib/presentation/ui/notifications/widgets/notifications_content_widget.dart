import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_app_bar_widget.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_list_widget.dart';
import 'package:schools/presentation/ui/notifications/widgets/titiles_row_widget.dart';

class NotificationsContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;

  const  NotificationsContentWidget({Key? key, required this.globalKey,required this.isFather})
      : super(key: key);

  @override
  State<NotificationsContentWidget> createState() =>
      _NotificationsContentWidgetState();
}

class _NotificationsContentWidgetState
    extends State<NotificationsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationsAppBarWidget(
            onTapMenu: () => widget.globalKey.currentState!.openDrawer(), isFather: widget.isFather,),
         widget.isFather?TitlesRowWidget(isFather: widget.isFather):Container(),
        const NotificationsListWidget()
      ],
    );
  }
}
