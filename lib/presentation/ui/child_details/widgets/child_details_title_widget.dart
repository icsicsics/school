import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class ChildDetailsTitleWidget extends StatelessWidget {
  const ChildDetailsTitleWidget({Key? key}) : super(key: key);

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
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MediumTextWidget(
                      text: "Sunday",
                      fontSize: 16,
                      color: ColorsManager.whiteColor),
                  SizedBox(
                    height: 10,
                  ),
                  MediumTextWidget(
                      text: "17th of September 2018",
                      fontSize: 15,
                      color: ColorsManager.whiteColor),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MediumTextWidget(
                      text: "Weather",
                      fontSize: 16,
                      color: ColorsManager.whiteColor),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                              color: ColorsManager.whiteColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.all(1),
                            child: Icon(
                              Icons.sunny,
                              color: ColorsManager.yellow,
                              size: 15,
                            ),
                          )),
                      const SizedBox(
                        width: 2,
                      ),
                      const MediumTextWidget(
                          text: "33 Sunny Day",
                          fontSize: 15,
                          color: ColorsManager.whiteColor),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
