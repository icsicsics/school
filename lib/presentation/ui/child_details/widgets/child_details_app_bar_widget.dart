import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class ChildDetailsAppBarWidget extends StatelessWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;

  const ChildDetailsAppBarWidget(
      {Key? key, required this.onTapMenu, required this.onTapNotifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          ColorsManager.primaryColor,
          ColorsManager.secondaryColor,
        ],
        stops: [0.5, 0.8],
      )),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            IconButton(
                onPressed: onTapMenu,
                icon: const Icon(
                  Icons.menu,
                  color: ColorsManager.whiteColor,
                  size: 30,
                )),
            const Expanded(
              child: MediumTextWidget(
                  text: "Interactive School Counselling",
                  fontSize: 18,
                  color: ColorsManager.whiteColor),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: onTapNotifications,
                  icon: const Icon(
                    Icons.mail_lock,
                    color: ColorsManager.whiteColor,
                    size: 25,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
