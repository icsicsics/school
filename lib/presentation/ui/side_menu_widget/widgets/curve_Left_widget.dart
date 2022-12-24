import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/curve.dart';

class CurveLeftWidget extends StatefulWidget {
  final Widget child;
  const CurveLeftWidget({Key? key,required this.child}) : super(key: key);

  @override
  State<CurveLeftWidget> createState() => _CurveLeftWidgetState();
}

class _CurveLeftWidgetState extends State<CurveLeftWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: RPSCustomPainterLeft1(),
    child: Container(
    color: ColorsManager.yellow,
    child: ClipPath(
    clipper: RPSCustomPainterLeft2(),
    child:Container(
    color: Colors.white,
    height: MediaQuery.of(context).size.height,
    child: widget.child))));
  }
}
