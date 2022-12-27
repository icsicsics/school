import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class AddPointHeaderWidget extends StatelessWidget {
  const AddPointHeaderWidget({Key? key}) : super(key: key);

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
        height: MediaQuery.of(context).size.height / 2,
        child: Stack(
          children: [
            ClipPath(
                clipper: GeneralCurve(),
                child: Container(
                  height: 200,
                  color: ColorsManager.whiteColor,
                )
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      BoldTextWidget(
                          text: "Grade 2 , Section A",
                          fontSize: 18,
                          color: ColorsManager.whiteColor),
                      SizedBox(height: 6),
                      MediumTextWidget(
                          text: "Math Class",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      SizedBox(height: 6),
                      MediumTextWidget(
                          text: "20 Students",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 320,
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(60)),
                      child: Image.asset(ImagesPath.schoolItem,
                          fit: BoxFit.fitHeight)),
                ),
              ),
            ),
          ],
        ));
  }
}
