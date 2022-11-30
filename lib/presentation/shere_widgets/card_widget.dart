import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  const CardWidget({Key? key,required this.child,this.height=150,this.width=130}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.whiteColor,
      elevation: 2,
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
