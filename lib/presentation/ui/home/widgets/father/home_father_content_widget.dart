import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_heder_widget.dart';

class HomeFatherContentWidget extends StatelessWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final HomeBloc homeBloc;
  final String token;
  final String language;

  const HomeFatherContentWidget(
      {Key? key,
      required this.parentHomeResponse,
      required this.homeBloc,
      required this.token,
      required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        homeBloc.fatherInfoResponse.data != null
            ? FatherHeaderWidget(homeBloc: homeBloc)
            : Container(height: 350),
        parentHomeResponse.data != null
            ? FatherChildrenListWidget(
                classroomId: "79a93948-fb97-4de3-9166-08dafa1996ad",
                classroomSectionStudentsId:
                    "f2894667-39a5-42b6-c7df-08dafd8025b3",
                parentHomeResponse: parentHomeResponse,
                token: token,
                language: language)
            : Container(),
      ],
    );
  }
}
