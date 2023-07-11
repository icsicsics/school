import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/screens/my_children/widget/my_children_body_widget.dart';
import 'package:schools/presentation/screens/my_children/widget/my_children_header_widget.dart';

class MyChildrenContentWidget extends StatefulWidget {
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;
  final GetTeacherPrinciplByClassroomIdResponse
      getTeacherPrinciplByClassroomIdResponse;
  final List<String> guides;
  final String studentId;
  final String teacherId;

  const MyChildrenContentWidget({
    Key? key,
    required this.teacherStudentProfileInSchoolHouseResponse,
    required this.getTeacherPrinciplByClassroomIdResponse,
    required this.guides,
    required this.studentId,
    required this.teacherId,
  }) : super(key: key);

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
            points:
                widget.teacherStudentProfileInSchoolHouseResponse.data!.points!,
            getTeacherPrinciplByClassroomIdResponse:
                widget.getTeacherPrinciplByClassroomIdResponse,
            guides: widget.guides,
            studentId: widget.studentId,
            teacherId: widget.teacherId,
          )
        ],
      ),
    );
  }
}
