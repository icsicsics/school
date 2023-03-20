import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/show_ok_dialog.dart';
import 'package:schools/core/utils/show_ok_dialog_image.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:intl/intl.dart';

class NotificationsItemWidget extends StatelessWidget {
  final NotificationItem notificationItem;

  const NotificationsItemWidget({
    Key? key,
    required this.notificationItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showOkDialogImage(
          context: context,
          onTap: () {
            Navigator.pop(context);
            if (notificationItem.status == 1) {
              BlocProvider.of<NotificationsBloc>(context).add(
                UpdateNotificationEvent(
                  id: notificationItem.id ?? "",
                ),
              );
            }
          },
          dialogMessage: notificationItem.body ?? "",
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          color: notificationItem.status == 1
              ? Colors.white
              : Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.notifications,
                  color: ColorsManager.yellow,
                  size: 26,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldTextWidget(
                          text: notificationItem.title,
                          fontSize: 14,
                          color: ColorsManager.blackColor),
                      const SizedBox(
                        height: 4,
                      ),
                      BoldTextWidget(
                          text: DateFormat("dd/MM/yyyy  At  HH:MM", "en")
                              .format(DateTime.parse(
                                  notificationItem.creationDate ?? "")),
                          fontSize: 12,
                          color: ColorsManager.blackColor)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
