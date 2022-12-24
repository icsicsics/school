import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class CurveRightWidget extends StatefulWidget {
  final Widget child;

  const CurveRightWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<CurveRightWidget> createState() => _CurveRightWidgetState();
}

class _CurveRightWidgetState extends State<CurveRightWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: RPSCustomPainterRight1(),
        child: Container(
            color: ColorsManager.yellow,
            child: ClipPath(
                clipper: RPSCustomPainterRight2(), child:Container(
    color: Colors.white,
    height: MediaQuery.of(context).size.height,
    child: widget.child))));
  }
}
