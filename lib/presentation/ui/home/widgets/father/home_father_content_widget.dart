import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_heder_widget.dart';

class HomeFatherContentWidget extends StatelessWidget {
  final GetChildrenByParentResponse parentHomeResponse;

  const HomeFatherContentWidget({Key? key, required this.parentHomeResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FatherHeaderWidget(),
        parentHomeResponse.data != null
            ? FatherChildrenListWidget(parentHomeResponse: parentHomeResponse)
            : Container(),
      ],
    );
  }
}
