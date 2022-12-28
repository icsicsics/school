import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class PointsScreenWidget extends StatefulWidget {
  const PointsScreenWidget({Key? key}) : super(key: key);

  @override
  State<PointsScreenWidget> createState() => _PointsScreenWidgetState();
}

class _PointsScreenWidgetState extends State<PointsScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(top: 30,right: 25,left: 25),
            child: Row(
              children: [
                cardItem(label: S.of(context).allPoints, points: "175"),
                const  Expanded(
                  child:  SizedBox(
                  ),
                ),
                cardItem(label: S.of(context).thisWeek, points: "16"),
              ],
            )));
  }

  Widget cardItem({required String label, required String points}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(27)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            height: 35,
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediumTextWidget(
                    text: label,
                    fontSize: 13,
                    color: ColorsManager.primaryColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: ColorsManager.yellow,
                    ),
                    SizedBox(width: 5),
                    MediumTextWidget(
                        text: points,
                        fontSize: 14,
                        color: ColorsManager.blackColor),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
