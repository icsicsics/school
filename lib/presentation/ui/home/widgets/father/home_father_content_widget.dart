import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_heder_widget.dart';

class HomeFatherContentWidget extends StatelessWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final HomeBloc homeBloc;

  const HomeFatherContentWidget(
      {Key? key, required this.parentHomeResponse, required this.homeBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        homeBloc.fatherInfoResponse.data != null
            ? FatherHeaderWidget(homeBloc: homeBloc)
            : Container(height: 350),
        parentHomeResponse.data != null
            ? FatherChildrenListWidget(parentHomeResponse: parentHomeResponse)
            : Container(),
      ],
    );
  }
}
