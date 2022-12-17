import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 25,
        ),
        MediumTextWidget(
            text: "Login", fontSize: 25, color: ColorsManager.welcomeGryColor),
        SizedBox(
          height: 25,
        ),
        MediumTextWidget(
            text: "Enter your Phone Number",
            fontSize: 15,
            color: ColorsManager.secondaryColor),
      ],
    );
  }
}
