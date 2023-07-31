import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/teacher_principle_data.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/screens/school_houses/widgets/is_not_coming_from_home/item.dart';

class IsNotComingFromHomeBodyWidget extends StatefulWidget {
  final GetStudentHousesResponse getStudentHousesResponse;
  final String token;
  final SchoolHousesBloc schoolHousesBloc;

  const IsNotComingFromHomeBodyWidget(
      {Key? key,
      required this.token,
      required this.getStudentHousesResponse,
      required this.schoolHousesBloc})
      : super(key: key);

  @override
  State<IsNotComingFromHomeBodyWidget> createState() =>
      _IsNotComingFromHomeBodyWidgetState();
}

class _IsNotComingFromHomeBodyWidgetState
    extends State<IsNotComingFromHomeBodyWidget> {
  TeacherPrincipleData valueFromAlert = TeacherPrincipleData();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 5, mainAxisExtent: 170),
        itemCount: widget.getStudentHousesResponse.data!.students!.length,
        padding: const EdgeInsets.all(10),
        semanticChildCount: 10,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(
            childName: widget.getStudentHousesResponse.data!.students![index]
                    .studentName ??
                "",
            onTapStar: () => _onTap(
                studentId: widget
                    .getStudentHousesResponse.data!.students![index].studentId
                    .toString(),
                childName: widget
                    .getStudentHousesResponse.data!.students![index].studentName
                    .toString(),
                classroomId: widget.getStudentHousesResponse.data!.classroomId!,
                classroomSectionStudentsId: widget.getStudentHousesResponse
                    .data!.students![index].classroomToSectionStudentId
                    .toString()),
            onTapChild: () => widget.schoolHousesBloc.add(
                NavigateToMyChildrenScreenEvent(
                    studentId:
                        "${widget.getStudentHousesResponse.data!.students![index].studentId}",
                    classroomToSectionId:
                        "${widget.getStudentHousesResponse.data!.students![index].classroomToSectionStudentId}")),
            imagePath: widget.getStudentHousesResponse.data!.students![index]
                        .getImage ==
                    null
                ? ""
                : widget.getStudentHousesResponse.data!.students![index]
                    .getImage!.mediaUrl!,
          );
        });
  }

  void _onTap({
    required String childName,
    required String classroomId,
    required String classroomSectionStudentsId,
    required String studentId,
  }) {
    print(classroomSectionStudentsId);
    showAddPointFunction(
        context: context,
        childName: childName,
        token: widget.token,
        classroomId: classroomId,
        classroomSectionStudentsId: classroomSectionStudentsId,
        studentId: studentId,
        onCreatePointSuccess: () {});
  }
}
