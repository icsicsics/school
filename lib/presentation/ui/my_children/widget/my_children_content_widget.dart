import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_body_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_header_widget.dart';

class MyChildrenContentWidget extends StatefulWidget {
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  const MyChildrenContentWidget(
      {Key? key, required this.teacherStudentProfileInSchoolHouseResponse})
      : super(key: key);

  @override
  State<MyChildrenContentWidget> createState() =>
      _MyChildrenContentWidgetState();
}

class _MyChildrenContentWidgetState extends State<MyChildrenContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyChildrenHeaderWidget(
              teacherStudentProfileInSchoolHouseResponse:
                  widget.teacherStudentProfileInSchoolHouseResponse),
          MyChildrenBodyWidget(
              teacherStudentProfileInSchoolHouseResponse:
                  widget.teacherStudentProfileInSchoolHouseResponse)
        ],
      ),
    );
  }
}
