import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/screens/school_houses/school_houses_screen.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class HomeTitleWidget extends StatelessWidget {
  final WeatherResponse weatherResponse;
  final String token;
  final String language;
  final HomeBloc bloc;
  final bool isFather;

  const HomeTitleWidget({
    Key? key,
    required this.weatherResponse,
    required this.token,
    required this.language,
    required this.bloc,
    required this.isFather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    String dateFormatter(DateTime date) {
      dynamic dayData =
          '{"1": "${S.of(context).monday}", "2": "${S.of(context).tuesday}", "3":"${S.of(context).wednesday}", "4": "${S.of(context).thursday}", "5": "${S.of(context).friday}", "6": "${S.of(context).saturday}", "7": "${S.of(context).sunday}"}';
      return json.decode(dayData)['${date.weekday}'];
    }

    String monthFormatter(int month) {
      dynamic monthData =
          '{ "1" : "${S.of(context).jan}", "2" : "${S.of(context).feb} ", "3" : "${S.of(context).mar}", "4" : "${S.of(context).apr}", "5" : "${S.of(context).may}", "6" : "${S.of(context).june}", "7" : "${S.of(context).jul}", "8" : "${S.of(context).aug}", "9" : "${S.of(context).sep}", "10" : "${S.of(context).oct}", "11" : "${S.of(context).nov}", "12" : "${S.of(context).dec}" }';
      return json.decode(monthData)['$month'];
    }

    var dayNumber = dateTime.day;
    var year = dateTime.year;

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ColorsManager.primaryColor,
            ColorsManager.secondaryColor,
          ],
          stops: [0.5, 0.8],
        )),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          text:
                              "$dayNumber ${S.of(context).thOf} ${monthFormatter(dateTime.month)} $year",
                          fontSize: 15,
                          color: ColorsManager.whiteColor),
                      if (isFather)
                        const SizedBox(
                        height: 10,
                      ),
                      if (isFather)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SchoolHousesScreen(
                                      branchId: "",
                                        teacherId: "",
                                        classroomToSectionId: "",
                                        classRoomId: bloc.branchId,
                                        isComingFromHome: false)));
                          },
                          child: MediumTextWidget(
                              text: S.of(context).viewHouses,
                              fontSize: 16,
                              color: ColorsManager.whiteColor),
                        ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          weatherResponse.weather != null
                              ? MediumTextWidget(
                                  text:
                                      "${(weatherResponse.main!.temp! - 273.15).round().toString()}\u2103 ${weatherResponse.weather![0].description.toString()}",
                                  fontSize: 15,
                                  color: ColorsManager.whiteColor)
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
