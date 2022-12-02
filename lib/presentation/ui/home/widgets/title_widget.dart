import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorsManager.primaryColor,
            ColorsManager.secondaryColor,
          ],
          stops: [0.5, 0.8],
        )),
        height: MediaQuery.of(context).size.height / 7,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MediumTextWidget(text: "Sunday", fontSize: 16, color: ColorsManager.whiteColor),
                  SizedBox(height: 10,),
                  MediumTextWidget(text: "17th of September 2018", fontSize: 15, color: ColorsManager.whiteColor),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  MediumTextWidget(text: "Weather", fontSize: 16, color: ColorsManager.whiteColor),
                  SizedBox(height: 10,),
                  MediumTextWidget(text: "Sunny Day", fontSize: 15, color: ColorsManager.whiteColor),
                ],
              ),
            ],
          ),
        ));
  }
}
