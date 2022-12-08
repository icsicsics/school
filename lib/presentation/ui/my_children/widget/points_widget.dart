import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class PointsWidget extends StatefulWidget {
  const PointsWidget({Key? key}) : super(key: key);

  @override
  State<PointsWidget> createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.center,
        child: Padding(
        padding: const EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        cardItem(label: "All Points",points: "175"),
        const SizedBox(width: 20,),
        cardItem(label: 'This Week',points: "16"),
      ],
    )));
  }

  Widget cardItem({required String label,required  String points}){
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 0,
    child: Padding(
    padding: const EdgeInsets.all(2),
    child: SizedBox(
      height: 40,
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          MediumTextWidget(text: label, fontSize: 8, color: ColorsManager.primaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const  Icon(Icons.star,size: 15,color: ColorsManager.yellow,),
              MediumTextWidget(text: points, fontSize: 14, color: ColorsManager.blackColor),
            ],
          )
        ],
      ),
    ),));
  }
}
