import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      BoldTextWidget(
                          text: "Eiz el Deen Mahmoud",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      BoldTextWidget(
                          text: "Father & Guardian",
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
                    width: 160,
                    child: Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsManager.whiteColor, width: 3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                              child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                    image: AssetImage(ImagesPath.schoolItem),
                                    fit: BoxFit.fill)),
                          )),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: ColorsManager.whiteColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.camera_alt,
                                      color: ColorsManager.yellow, size: 27),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
