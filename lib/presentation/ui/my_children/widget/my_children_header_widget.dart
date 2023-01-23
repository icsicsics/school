import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/points_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class MyChildrenHeaderWidget extends StatefulWidget {
  const MyChildrenHeaderWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenHeaderWidget> createState() => _MyChildrenHeaderWidgetState();
}

class _MyChildrenHeaderWidgetState extends State<MyChildrenHeaderWidget> {
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
          const PointsScreenWidget(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: SizedBox(
                height: 150,
                width: 150,
                child:Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: ColorsManager.blackColor, width: 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset(ImagesPath.avatar,fit: BoxFit.fill))
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    BoldTextWidget(
                        text: "Leen Eiz Deen",
                        fontSize: 25,
                        color: ColorsManager.whiteColor),
                    SizedBox(
                      height: 15,
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
