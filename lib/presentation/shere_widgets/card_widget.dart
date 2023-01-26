import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
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
            image(imagePath),
            const SizedBox(
              height: 5,
            ),
            BoldTextWidget(
                text: grade,
                fontSize: 13,
                color: ColorsManager.welcomeGryColor),
            const SizedBox(height: 5),
            BoldTextWidget(
                text: section,
                fontSize: 13,
                color: ColorsManager.welcomeGryColor),
          ],
        ));
  }

  Widget image(images) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8), topLeft: Radius.circular(8)),
      child: Image.network(
        images,
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: double.infinity,
            height: 80,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
          child: Image.asset(ImagesPath.schoolItem, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
