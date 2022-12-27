import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/ui/my_children/widget/points_screen_widget.dart';

class MyChildrenBodyWidget extends StatefulWidget {
  const MyChildrenBodyWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenBodyWidget> createState() => _MyChildrenBodyWidgetState();
}

class _MyChildrenBodyWidgetState extends State<MyChildrenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.backgroundColor,
      child: const Padding(
        padding:  EdgeInsets.all(10),
        child: PointsScreenWidget(),
      ),
    );
  }
}
