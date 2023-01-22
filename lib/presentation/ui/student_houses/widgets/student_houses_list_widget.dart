import 'package:flutter/material.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/ui/student_houses/widgets/student_houses_item_widget.dart';

class StudentHousesBlocListWidget extends StatefulWidget {
  final StudentHousesBloc addPointBloc;
  const StudentHousesBlocListWidget({Key? key,required this.addPointBloc}) : super(key: key);

  @override
  State<StudentHousesBlocListWidget> createState() => _StudentHousesBlocListWidgetState();
}

class _StudentHousesBlocListWidgetState extends State<StudentHousesBlocListWidget> {
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
