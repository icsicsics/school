import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    String dateFormatter(DateTime date) {
      dynamic dayData =
          '{"1": "${S.of(context).monday}", "2": "${S.of(context).tuesday}", "3":"${S.of(context).wednesday}", "4": "${S.of(context).thursday}", "5": "${S.of(context).friday}", "6": "${S.of(context).saturday}", "7": "${S.of(context).sunday}"}';
      return json.decode(dayData)['${date.weekday}'];
    }

    var dayNumber=dateTime.day;
    var year=dateTime.year;
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
                children: [
                  MediumTextWidget(
                      text: dateFormatter(dateTime),
                      fontSize: 16,
                      color: ColorsManager.whiteColor),
                  const SizedBox(
                    height: 10,
                  ),
                   MediumTextWidget(
                      text: "$dayNumber th of September $year",
                      fontSize: 15,
                      color: ColorsManager.whiteColor),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumTextWidget(
                      text: S.of(context).weather,
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
