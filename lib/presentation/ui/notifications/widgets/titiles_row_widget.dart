import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class TitlesRowWidget extends StatefulWidget {
  final bool isFather;
  final Function() selectNotificationTab;
  final Function() selectInboxTab;
  final bool isNotificationSelected;
  final int notificationCount;
  final int inboxNotificationCount;
  const TitlesRowWidget({
    Key? key,
    required this.isFather,
    required this.selectNotificationTab,
    required this.selectInboxTab,
    required this.isNotificationSelected,
    required this.notificationCount,
    required this.inboxNotificationCount,
  }) : super(key: key);

  @override
  State<TitlesRowWidget> createState() => _TitlesRowWidgetState();
}

class _TitlesRowWidgetState extends State<TitlesRowWidget> {
  bool isSelectedNotification = true;
  bool isSelectedIndex = false;
  Color selectedColor = ColorsManager.secondaryColor;
  Color unselectedColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Row(
        children: [
          _indexAndNotificationItem(
            onTap:widget.selectNotificationTab,
            title: getTileTitle(S.of(context).notifications,widget.notificationCount),
            icon: Icons.notifications,
            color: widget.isNotificationSelected ? selectedColor : unselectedColor,
          ),
          _indexAndNotificationItem(
              onTap:widget.selectInboxTab,
              title:getTileTitle(S.of(context).inbox,widget.inboxNotificationCount),
              icon: Icons.mail_outline,
              color: !widget.isNotificationSelected ? selectedColor : unselectedColor),
        ],
      ),
    );
  }

  Widget _indexAndNotificationItem(
          {required Function() onTap,
          required String title,
          required IconData icon,
          required Color color}) =>
      Expanded(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: ColorsManager.secondaryColor,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: BoldTextWidget(
                            text: title,
                            fontSize: 15,
                            color: ColorsManager.blackColor),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: color,
                height: 3,
                width: MediaQuery.of(context).size.width / 2.5,
              )
            ],
          ),
        ),
      );

  String getTileTitle(String title, int value){
    if(value == 0){
      return title;
    } else {
      return "$title ($value)";
    }
  }
}
