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
    return Card(
        color: ColorsManager.whiteColor,
        elevation: 1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                child: Image.asset(imagePath, fit: BoxFit.cover)),
            Expanded(
              child: BoldTextWidget(
                  text: grade, fontSize: 12, color: ColorsManager.blackColor),
            ),
            Expanded(
              child: BoldTextWidget(
                  text: section, fontSize: 12, color: ColorsManager.blackColor),
            ),
          ],
        ));
  }
}
