import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class MyChildrenWidget extends StatefulWidget {
  const MyChildrenWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenWidget> createState() => _MyChildrenWidgetState();
}

class _MyChildrenWidgetState extends State<MyChildrenWidget> {
  final Color _selectedColor = ColorsManager.secondaryColor;

  final Color _unselectedColor = ColorsManager.mediumGrayColor;
  final List<_ChildIconsModel> _list = [
    _ChildIconsModel(id: 1, icon: Icons.add, isSelected: true, title: S.current.all),
    _ChildIconsModel(id: 2, icon: Icons.add, isSelected: false, title:  S.current.me),
    _ChildIconsModel(
        id: 3, icon: Icons.energy_savings_leaf, isSelected: false, title: ""),
    _ChildIconsModel(
        id: 4, icon: Icons.autorenew_rounded, isSelected: false, title: ""),
    _ChildIconsModel(
        id: 5,
        icon: Icons.lightbulb_outline_rounded,
        isSelected: false,
        title: ""),
    _ChildIconsModel(
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
              children: _list.map((e) => _checkIndexForLabel(e)).toList(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _list.map((e) => _checkIndexForIcon(e)).toList(),
            )
          ],
        ));
  }

  Widget _checkIndexForIcon(_ChildIconsModel model) {
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

  Widget _checkIndexForLabel(_ChildIconsModel model) {
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

  Color _getColor(_ChildIconsModel model) {
    if (model.isSelected) {
      return _selectedColor;
    } else {
      return _unselectedColor;
    }
  }

  void _selectItem(int id) {
    for (var element in _list) {
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

class _ChildIconsModel {
  int id;
  IconData icon;
  String title;
  bool isSelected;

  _ChildIconsModel(
      {required this.id,
      required this.icon,
      required this.isSelected,
      required this.title});
}
