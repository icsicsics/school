import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class NotificationsAppBarWidget extends StatelessWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;

  const NotificationsAppBarWidget(
      {Key? key, required this.onTapMenu, required this.onTapNotifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsManager.backgroundColor),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            IconButton(
                onPressed: onTapMenu,
                icon: const Icon(
                  Icons.menu,
                  color: ColorsManager.secondaryColor,
                  size: 30,
                )),
            const Expanded(
              child: MediumTextWidget(
                  text: "Notifications",
                  fontSize: 18,
                  color: ColorsManager.secondaryColor),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: onTapNotifications,
                  icon: const Icon(
                    Icons.mail_lock,
                    color: ColorsManager.secondaryColor,
                    size: 25,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
