import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class MyChildBodyWidget extends StatefulWidget {
  final MyChildPointsBloc bloc;

  const MyChildBodyWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MyChildBodyWidget> createState() => _MyChildBodyWidgetState();
}

class _MyChildBodyWidgetState extends State<MyChildBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => widget.bloc.add(OpenPointScreenEvent()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.rankingStar,
                color: ColorsManager.secondaryColor,
                size: 80,
              ),
              SizedBox(height: 15),
              MediumTextWidget(
                  text: "Points",
                  fontSize: 15,
                  color: ColorsManager.blackColor),
            ],
          ),
        ),
        InkWell(
          onTap: () => widget.bloc.add(NavigateToHomeScreenEvent()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.schoolFlag,
                color: ColorsManager.secondaryColor,
                size: 80,
              ),
              SizedBox(height: 15),
              MediumTextWidget(
                  text: " School Homes",
                  fontSize: 15,
                  color: ColorsManager.blackColor),
            ],
          ),
        ),
      ],
    );
  }
}
