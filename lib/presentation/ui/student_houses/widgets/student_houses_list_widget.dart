import 'dart:async';

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
  const StudentHousesListWidget({Key? key,required this.studentHousesBloc,required this.getStudentHousesResponse,required this.token}) : super(key: key);

  @override
  State<StudentHousesListWidget> createState() => _StudentHousesListWidgetState();
}

class _StudentHousesListWidgetState extends State<StudentHousesListWidget> {
  final TextEditingController _commentController = TextEditingController();
  Data valueFromAlert= Data();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5),
          itemCount: widget.getStudentHousesResponse.data!.students!.length,
          padding: const EdgeInsets.all(5),
          shrinkWrap: false,
          semanticChildCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AddPointItemWidget(
              childName: widget.getStudentHousesResponse.data!.students![index].studentName??"",
              onTapStar: () => _onTap(widget.getStudentHousesResponse.data!.students![index].studentName,widget.getStudentHousesResponse.data!.classroomId!),
              onTapChild: ()=>widget.studentHousesBloc.add(NavigateToMyChildrenScreenEvent()),
            );
          }),
    );
  }

  void _onTap(childName,classroomId) => showAddPointFunction(
      context: context,
      childName: childName,token: widget.token, classroomId:classroomId).then((value) => _returnValue(value));

  _returnValue(value) {
    valueFromAlert=value;
    print("value  ==============> ${valueFromAlert.name}");
  }




}
