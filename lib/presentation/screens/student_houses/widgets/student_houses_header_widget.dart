import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/curve.dart';

class StudentHousesHeaderWidget extends StatelessWidget {
  final GetStudentHousesResponse getStudentHousesResponse;

  const StudentHousesHeaderWidget(
      {Key? key, required this.getStudentHousesResponse})
      : super(key: key);

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
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BoldTextWidget(
                          text:
                              "${getStudentHousesResponse.data!.sectionName ?? ""},  ${getStudentHousesResponse.data!.houseName ?? ""}",
                          fontSize: 18,
                          color: ColorsManager.whiteColor),
                      const SizedBox(height: 6),
                      const MediumTextWidget(
                          text: "Math Class",
                          fontSize: 16,
                          color: ColorsManager.whiteColor),
                      const SizedBox(height: 2),
                      MediumTextWidget(
                          text:
                              "${getStudentHousesResponse.data!.numberofStudentsHouse ?? ""} ${S.of(context).students}",
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
                            border: Border.all(
                                color: ColorsManager.blackColor, width: 1),
                            borderRadius: BorderRadius.circular(100)),
                        child: SvgPicture.asset(ImagesPath.avatar,
                            fit: BoxFit.fill))),
              ),
            ),
          ],
        ));
  }
}
