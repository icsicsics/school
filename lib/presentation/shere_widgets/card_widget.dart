import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String grade;
  final String section;
  final double height;
  final double width;

  const CardWidget(
      {Key? key,
      required this.imagePath,
      this.height = 200,
      this.width = 130,
      required this.grade,
      required this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: ColorsManager.grayColor),
          color: ColorsManager.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                child: Image.asset(imagePath, fit: BoxFit.cover)),
            SizedBox(height: 5,),
            BoldTextWidget(
                text: grade, fontSize: 13, color: ColorsManager.welcomeGryColor),
            BoldTextWidget(
                text: section, fontSize: 13, color: ColorsManager.welcomeGryColor),
          ],
        ));
  }
}
