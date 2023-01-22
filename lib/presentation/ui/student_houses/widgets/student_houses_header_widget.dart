import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class StudentHousesHeaderWidget extends StatelessWidget {
  const StudentHousesHeaderWidget({Key? key}) : super(key: key);

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
        height: 350,
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
                  padding: const EdgeInsets.only(bottom: 30),
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
                      SizedBox(height: 2),
                      MediumTextWidget(
                          text: "20 Students",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: ColorsManager.whiteColor, width: 3),
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                              image: AssetImage(ImagesPath.schoolItem),
                              fit: BoxFit.fill)),
                    ),
                ),
              ),
            ),
          ],
        ));
  }
}
