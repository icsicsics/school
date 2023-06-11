import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const SideMenuItem(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 6, left: 20, right: 20),
        child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(icon, color: ColorsManager.whiteColor, size: 30),
                    const SizedBox(width: 10),
                    MediumTextWidget(
                        text: title,
                        fontSize: 15,
                        color: ColorsManager.whiteColor)
                  ],
                ),
                const Divider(
                    color: ColorsManager.whiteColor,
                    endIndent: 140,
                    thickness: 2),
              ],
            )));
  }
}
