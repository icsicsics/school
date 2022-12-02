import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  final Function() onTapMenu;

  const HomeAppBarWidget({Key? key, required this.onTapMenu}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.mail_lock,
                color: ColorsManager.whiteColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
