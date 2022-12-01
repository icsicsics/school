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
      this.height = 160,
      this.width = 130,
      required this.grade,
      required this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsManager.whiteColor),
            color: ColorsManager.whiteColor,
            boxShadow: const [
              BoxShadow(blurRadius: 5, color: ColorsManager.grayColor),
            ]),
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                    child: Image.asset(imagePath, fit: BoxFit.cover))),
            Expanded(
              flex: 5,
              child:  Align(
                alignment: Alignment.center,
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldTextWidget(
                            text: grade,
                            fontSize: 15,
                            color: ColorsManager.blackColor),
                        BoldTextWidget(
                            text: section,
                            fontSize: 15,
                            color: ColorsManager.blackColor),
                      ],
                    ),
              )),
          ],
        ));
  }
}
