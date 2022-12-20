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
  List<ChildIconsModel> list = [
    ChildIconsModel(id: 1, icon: Icons.add, isSelected: true, title: "All"),
    ChildIconsModel(id: 2, icon: Icons.add, isSelected: false, title: "Me"),
    ChildIconsModel(
        id: 3, icon: Icons.energy_savings_leaf, isSelected: true, title: ""),
    ChildIconsModel(
        id: 4, icon: Icons.autorenew_rounded, isSelected: false, title: ""),
    ChildIconsModel(
        id: 5,
        icon: Icons.lightbulb_outline_rounded,
        isSelected: false,
        title: ""),
    ChildIconsModel(
        id: 6, icon: Icons.autorenew_rounded, isSelected: false, title: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.map((e) => _checkIndexForLabel(e)).toList(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.map((e) => _checkIndexForIcon(e)).toList(),
            )
          ],
        ));
  }

  Widget _checkIndexForIcon(ChildIconsModel model) {
    if (model.id == 1 || model.id == 2) {
      return const SizedBox();
    } else {
      return InkWell(
        onTap: () => _selectItem(model.id),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            model.icon,
            color: _getColor(model),
          ),
        ),
      );
    }
  }

  Widget _checkIndexForLabel(ChildIconsModel model) {
    if (model.id == 1 || model.id == 2) {
      return InkWell(
        onTap: () => _selectItem(model.id),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumTextWidget(
                text: model.title, fontSize: 15, color: _getColor(model))),
      );
    } else {
      return const SizedBox();
    }
  }

  Color _getColor(ChildIconsModel model) {
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

class ChildIconsModel {
  int id;
  IconData icon;
  String title;
  bool isSelected;

  ChildIconsModel(
      {required this.id,
      required this.icon,
      required this.isSelected,
      required this.title});
}
//ListView.builder(
//             itemCount: listOfIcons.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                     onTap: () => _selectItem(listOfIcons[index].id),
//                     child: Icon(
//                       listOfIcons[index].icon,
//                       color: _getColor(listOfIcons[index]),
//                     )),
//               );
//             }),
