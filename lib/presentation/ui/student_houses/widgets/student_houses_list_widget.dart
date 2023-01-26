import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_item_widget.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/data.dart';

class StudentHousesListWidget extends StatefulWidget {
  final GetStudentHousesResponse getStudentHousesResponse;
  final StudentHousesBloc studentHousesBloc;
  final String token;

  const StudentHousesListWidget(
      {Key? key,
      required this.studentHousesBloc,
      required this.getStudentHousesResponse,
      required this.token})
      : super(key: key);

  @override
  State<StudentHousesListWidget> createState() =>
      _StudentHousesListWidgetState();
}

class _StudentHousesListWidgetState extends State<StudentHousesListWidget> {
  Data valueFromAlert = Data();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5),
          itemCount: widget.getStudentHousesResponse.data!.students!.length,
          padding: const EdgeInsets.all(10),
          shrinkWrap: false,
          semanticChildCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AddPointItemWidget(
              childName: widget.getStudentHousesResponse.data!.students![index]
                      .studentName ??
                  "",
              onTapStar: () => _onTap(
                  studentId: widget
                      .getStudentHousesResponse.data!.students![index].studentId
                      .toString(),
                  childName: widget.getStudentHousesResponse.data!
                      .students![index].studentName
                      .toString(),
                  classroomId:
                      widget.getStudentHousesResponse.data!.classroomId!,
                  classroomSectionStudentsId: widget.getStudentHousesResponse
                      .data!.students![index].classroomToSectionId
                      .toString()),
              onTapChild: () => widget.studentHousesBloc.add(
                  NavigateToMyChildrenScreenEvent(
                      studentId:
                          "${widget.getStudentHousesResponse.data!.students![index].studentId}",
                      classroomToSectionId:
                          "${widget.getStudentHousesResponse.data!.students![index].classroomToSectionId}")),
              imagePath:
                  "${widget.getStudentHousesResponse.data!.students![index].getImage != null ? widget.getStudentHousesResponse.data!.students![index].getImage!.mediaUrl : ""}",
            );
          }),
    );
  }

  void _onTap(
          {required String childName,
          required String classroomId,
          required String classroomSectionStudentsId,
          required String studentId}) =>
      showAddPointFunction(
          context: context,
          childName: childName,
          token: widget.token,
          classroomId: classroomId,
          classroomSectionStudentsId: classroomSectionStudentsId,
          studentId: studentId);
}
