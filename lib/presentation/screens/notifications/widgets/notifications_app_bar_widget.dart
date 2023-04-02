import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class NotificationsAppBarWidget extends StatelessWidget {
  final Function() onTapMenu;
  final bool isFather;
  final bool isNotificationSelected;

  // final Function() onTapNotifications;

  const NotificationsAppBarWidget({
    Key? key,
    required this.onTapMenu,
    required this.isFather,
    required this.isNotificationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsManager.backgroundColor),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            InkWell(
                onTap: onTapMenu,
                child: SvgPicture.asset(ImagesPath.menu,
                    width: 25, height: 25, color: ColorsManager.primaryColor)),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: MediumTextWidget(
                  text: isFather
                      ? isNotificationSelected
                          ? S.of(context).notifications
                          : S.of(context).inbox
                      : S.of(context).inbox,
                  fontSize: 18,
                  color: ColorsManager.secondaryColor),
            ),
            // Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: IconButton(
            //       onPressed: onTapNotifications,
            //       icon: const Icon(
            //         Icons.mail_lock,
            //         color: ColorsManager.secondaryColor,
            //         size: 25,
            //       ),
            //     )),
          ],
        ),
      ),
    );
  }
}
