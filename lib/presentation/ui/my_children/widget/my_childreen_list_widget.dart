import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class MyChildrenWidget extends StatefulWidget {
  const MyChildrenWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenWidget> createState() => _MyChildrenWidgetState();
}

class _MyChildrenWidgetState extends State<MyChildrenWidget> {
  final Color selectedColor = ColorsManager.secondaryColor;

  final Color unselectedColor = ColorsManager.mediumGrayColor;
  List<TestModel> list = [
    TestModel(id: 1, name: "All", isSelected: true),
    TestModel(id: 2, name: "Me", isSelected: false),
    TestModel(id: 3, name: "Energetic", isSelected: false),
    TestModel(id: 4, name: "Collaboration", isSelected: false),
    TestModel(id: 5, name: "Initiative", isSelected: false),
    TestModel(id: 6, name: "Collaboration", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => _selectItem(list[index].id),
                child: MediumTextWidget(
                    text: list[index].name,
                    fontSize: 15,
                    color: _getColor(list[index])),
              ),
            );
          }),
    );
  }

  Color _getColor(TestModel model) {
    if (model.isSelected) {
      return selectedColor;
    } else {
      return unselectedColor;
    }
  }

  void _selectItem(int id) {
    for (var element in list) {
      setState(() {
        if (id == element.id) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      });
    }
  }
}

class TestModel {
  int id;
  String name;
  bool isSelected;

  TestModel({required this.id, required this.name, required this.isSelected});
}
