import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_child_item_widget.dart';

class FatherChildrenListWidget extends StatefulWidget {
  final GetChildrenByParentResponse parentHomeResponse;

  const FatherChildrenListWidget({Key? key, required this.parentHomeResponse})
      : super(key: key);

  @override
  State<FatherChildrenListWidget> createState() =>
      _FatherChildrenListWidgetState();
}

class _FatherChildrenListWidgetState extends State<FatherChildrenListWidget> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5),
          itemCount: widget.parentHomeResponse.data!.length,
          padding: const EdgeInsets.all(5),
          shrinkWrap: false,
          semanticChildCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return FatherChildItemWidget(
              childName:
                  "${widget.parentHomeResponse.data![index].studentName}",
              onTapStar: () => _onTap(widget.parentHomeResponse.data![index]),
              onTapChild: () {},
              imageUrl:
                  '${widget.parentHomeResponse.data![index].getImage!.mediaUrl}',
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
