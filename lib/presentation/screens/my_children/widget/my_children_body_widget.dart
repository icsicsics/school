import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/presentation/screens/my_children/widget/my_childreen_list_widget.dart';
import 'package:schools/presentation/screens/my_children/widget/points_screen_widget.dart';

class MyChildrenBodyWidget extends StatefulWidget {
  final List<Points> points;
  final GetTeacherPrinciplByClassroomIdResponse
      getTeacherPrinciplByClassroomIdResponse;
  final List<String> guides;
  final String studentId;
  final String teacherId;

  const MyChildrenBodyWidget({
    Key? key,
    required this.points,
    required this.getTeacherPrinciplByClassroomIdResponse,
    required this.guides,
    required this.studentId,
    required this.teacherId,
  }) : super(key: key);

  @override
  State<MyChildrenBodyWidget> createState() => _MyChildrenBodyWidgetState();
}

class _MyChildrenBodyWidgetState extends State<MyChildrenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.getTeacherPrinciplByClassroomIdResponse.data != null
        ? Container(
            color: ColorsManager.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  MyChildrenWidget(
                    points: widget.points,
                    getTeacherPrinciplByClassroomIdResponse:
                        widget.getTeacherPrinciplByClassroomIdResponse,
                    guides: widget.guides,
                    studentId: widget.studentId,
                    teacherId: widget.teacherId,
                  ),
                  PointsScreenWidget(points: widget.points),
                ],
              ),
            ),
          )
        : Container();
  }
}
