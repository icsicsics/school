import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function() onTap;

  const ProfileItemWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MediumTextWidget(
          text: title, fontSize: 16, color: ColorsManager.secondaryColor),
      onTap: onTap,
      leading: Container(
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: ColorsManager.yellow),
        ),
      ),
      subtitle: MediumTextWidget(
          text: subTitle, fontSize: 13, color: ColorsManager.grayColor),
    );
  }
}
