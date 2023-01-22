import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_item_widget.dart';

class StudentHousesListWidget extends StatefulWidget {
  final GetStudentHousesResponse getStudentHousesResponse;
  final StudentHousesBloc studentHousesBloc;
  const StudentHousesListWidget({Key? key,required this.studentHousesBloc,required this.getStudentHousesResponse}) : super(key: key);

  @override
  State<StudentHousesListWidget> createState() => _StudentHousesListWidgetState();
}

class _StudentHousesListWidgetState extends State<StudentHousesListWidget> {
  final TextEditingController _commentController = TextEditingController();

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
              onTapStar: () => _onTap(widget.getStudentHousesResponse.data!.students![index].studentName),
              onTapChild: ()=>widget.studentHousesBloc.add(NavigateToMyChildrenScreenEvent()),
            );
          }),
    );
  }

  void _onTap(childName) => showAddPointFunction(
      context: context,
      addAction: () {
        Navigator.pop(context);
      },
      childName: childName,
      commentController: _commentController);
}