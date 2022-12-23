import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/my_children/widget/my_childreen_list_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/points_screen_widget.dart';

class MyChildrenBodyWidget extends StatefulWidget {
  const MyChildrenBodyWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenBodyWidget> createState() => _MyChildrenBodyWidgetState();
}

class _MyChildrenBodyWidgetState extends State<MyChildrenBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MyChildrenWidget(),
          PointsScreenWidget(),
        ],
      ),
    );
  }
}
