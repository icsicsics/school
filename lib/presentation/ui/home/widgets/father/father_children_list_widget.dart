import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_item_widget.dart';

class FatherChildrenListWidget extends StatefulWidget {
  const FatherChildrenListWidget({Key? key}) : super(key: key);

  @override
  State<FatherChildrenListWidget> createState() => _FatherChildrenListWidgetState();
}

class _FatherChildrenListWidgetState extends State<FatherChildrenListWidget> {
  final TextEditingController _commentController = TextEditingController();

  List<String> list = [
    'Leen Fadi',
    'Salma Fadi'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5),
          itemCount: list.length,
          padding: const EdgeInsets.all(5),
          shrinkWrap: false,
          semanticChildCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return AddPointItemWidget(
              childName: list[index],
              onTapStar: () => _onTap(list[index]),
              onTapChild: (){
              },
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
