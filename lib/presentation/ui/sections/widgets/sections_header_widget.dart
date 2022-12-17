import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class SectionsHeaderWidget extends StatelessWidget {
  const SectionsHeaderWidget({Key? key}) : super(key: key);

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
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: ColorsManager.whiteColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(200.0,20.0),
                      bottomLeft: Radius.elliptical(200.0,20.0))),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      BoldTextWidget(
                          text: "Grade 2 , Section A",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      BoldTextWidget(
                          text: "Math Class",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      BoldTextWidget(
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
