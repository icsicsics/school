import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/ui/school_houses/widgets/is_not_coming_from_home/is_not_coming_from_home_body_widget.dart';

class IsNotComingFromHomeContentWidget extends BaseStatefulWidget {
  final GetStudentHousesResponse getStudentHousesResponse;
  final String token;
  final SchoolHousesBloc schoolHousesBloc;
  const IsNotComingFromHomeContentWidget({super.key,required this.schoolHousesBloc,required this.getStudentHousesResponse,required this.token});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _IsNotComingFromHomeContentWidgetState();
}

class _IsNotComingFromHomeContentWidgetState
    extends BaseState<IsNotComingFromHomeContentWidget> {
  @override
  Widget baseBuild(BuildContext context) {
    return widget.getStudentHousesResponse.data!=null?
        IsNotComingFromHomeBodyWidget(
          getStudentHousesResponse: widget.getStudentHousesResponse,
          token: widget.token,
          schoolHousesBloc: widget.schoolHousesBloc,
    ):Container();
  }
}
