import 'package:flutter/material.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_item_widget.dart';

class AddPointListWidget extends StatefulWidget {
  final AddPointBloc addPointBloc;
  const AddPointListWidget({Key? key,required this.addPointBloc}) : super(key: key);

  @override
  State<AddPointListWidget> createState() => _AddPointListWidgetState();
}

class _AddPointListWidgetState extends State<AddPointListWidget> {
  final TextEditingController _commentController = TextEditingController();
  List<String> list = [
    'Leen Eiz Deen',
    'Salma Fadi',
    'Ghaith Fadi',
    'Farah Jehad',
    'Masa Samer',
    'Shaem Mohammad'
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
              onTapChild: ()=>widget.addPointBloc.add(NavigateToMyChildrenScreenEvent()),
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
