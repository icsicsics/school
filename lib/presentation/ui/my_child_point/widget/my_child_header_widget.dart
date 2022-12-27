import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/my_child_point/widget/my_child_points_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class MyChildHeaderWidget extends StatefulWidget {
  const MyChildHeaderWidget({Key? key}) : super(key: key);

  @override
  State<MyChildHeaderWidget> createState() => _MyChildHeaderWidgetState();
}

class _MyChildHeaderWidgetState extends State<MyChildHeaderWidget> {
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
      height: 370,
      child: Stack(
        children: [
          ClipPath(
              clipper: GeneralCurve(),
              child: Container(
                height: 200,
                color: ColorsManager.whiteColor,
              )
          ),
          const MyChildPointsWidget(),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    MediumTextWidget(
                        text: "Leen Eiz Deen",
                        fontSize: 20,
                        color: ColorsManager.whiteColor),
                    SizedBox(
                      height: 20,
                    ),
                    MediumTextWidget(
                        text: "Interactive Values School",
                        fontSize: 15,
                        color: ColorsManager.whiteColor),
                    MediumTextWidget(
                        text: "5th Grade - Section 4",
                        fontSize: 15,
                        color: ColorsManager.whiteColor),
                    MediumTextWidget(
                        text: "Collaboration Home",
                        fontSize: 15,
                        color: ColorsManager.whiteColor),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
