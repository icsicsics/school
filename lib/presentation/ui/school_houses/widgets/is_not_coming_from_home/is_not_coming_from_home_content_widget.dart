import 'package:flutter/cupertino.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/ui/school_houses/widgets/is_not_coming_from_home/is_not_coming_from_home_body_widget.dart';

class IsNotComingFromHomeContentWidget extends StatefulWidget {
  final GetStudentHousesResponse getStudentHousesResponse;
  final String token;
  final SchoolHousesBloc schoolHousesBloc;

  const IsNotComingFromHomeContentWidget(
      {Key? key,
      required this.token,
      required this.schoolHousesBloc,
      required this.getStudentHousesResponse})
      : super(key: key);

  @override
  State<IsNotComingFromHomeContentWidget> createState() =>
      _IsNotComingFromHomeContentWidgetState();
}

class _IsNotComingFromHomeContentWidgetState
    extends State<IsNotComingFromHomeContentWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.getStudentHousesResponse.data != null
        ? IsNotComingFromHomeBodyWidget(
            getStudentHousesResponse: widget.getStudentHousesResponse,
            token: widget.token,
            schoolHousesBloc: widget.schoolHousesBloc,
          )
        : Container();
  }
}
