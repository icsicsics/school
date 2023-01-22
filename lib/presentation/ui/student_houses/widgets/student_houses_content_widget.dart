import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_header_widget.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_list_widget.dart';

class StudentHousesContentWidget extends StatefulWidget {
  final StudentHousesBloc studentHousesBloc;
  final GetStudentHousesResponse getStudentHousesResponse;

  const StudentHousesContentWidget({Key? key, required this.studentHousesBloc,required this.getStudentHousesResponse})
      : super(key: key);

  @override
  State<StudentHousesContentWidget> createState() =>
      _StudentHousesContentWidgetState();
}

class _StudentHousesContentWidgetState
    extends State<StudentHousesContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StudentHousesHeaderWidget(),
        StudentHousesBlocListWidget(
          addPointBloc: widget.studentHousesBloc,
        )
      ],
    );
  }
}
