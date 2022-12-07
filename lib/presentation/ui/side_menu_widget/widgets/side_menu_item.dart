import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const SideMenuItem(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorsManager.whiteColor, size: 30),
      title: MediumTextWidget(
          text: title, fontSize: 15, color: ColorsManager.whiteColor),
      onTap: onTap,
    );
  }
}
