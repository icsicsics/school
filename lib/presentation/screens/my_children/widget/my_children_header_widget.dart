import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/screens/my_children/widget/points_widget.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/curve.dart';

class MyChildrenHeaderWidget extends StatefulWidget {
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  const MyChildrenHeaderWidget(
      {Key? key, required this.teacherStudentProfileInSchoolHouseResponse})
      : super(key: key);

  @override
  State<MyChildrenHeaderWidget> createState() => _MyChildrenHeaderWidgetState();
}

class _MyChildrenHeaderWidgetState extends State<MyChildrenHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(76, 193, 210, 1),
          Color.fromRGBO(53, 180, 167, 1)
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
              )),
          PointsScreenWidget(
              teacherStudentProfileInSchoolHouseResponse:
                  widget.teacherStudentProfileInSchoolHouseResponse),
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
                      child: image(widget
                                  .teacherStudentProfileInSchoolHouseResponse
                                  .data!
                                  .getImage !=
                              null
                          ? widget.teacherStudentProfileInSchoolHouseResponse
                              .data!.getImage!.mediaUrl
                          : ""))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BoldTextWidget(
                        text: widget.teacherStudentProfileInSchoolHouseResponse
                                .data!.studentName ??
                            "",
                        fontSize: 25,
                        color: ColorsManager.whiteColor),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(images) {
    return ClipOval(
      child: SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            images,
            fit: BoxFit.fitHeight,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                child: SvgPicture.asset(ImagesPath.avatar,
                    fit: BoxFit.fitHeight, height: double.infinity),
              ),
            ),
          )),
    );
  }
}
