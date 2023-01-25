import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/ui/my_children/widget/my_childreen_list_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/points_screen_widget.dart';

class MyChildrenBodyWidget extends StatefulWidget {
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  const MyChildrenBodyWidget(
      {Key? key, required this.teacherStudentProfileInSchoolHouseResponse})
      : super(key: key);

  @override
  State<MyChildrenBodyWidget> createState() => _MyChildrenBodyWidgetState();
}

class _MyChildrenBodyWidgetState extends State<MyChildrenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const MyChildrenWidget(),
            PointsScreenWidget(
                teacherStudentProfileInSchoolHouseResponse:
                    widget.teacherStudentProfileInSchoolHouseResponse),
          ],
        ),
      ),
    );
  }
}
