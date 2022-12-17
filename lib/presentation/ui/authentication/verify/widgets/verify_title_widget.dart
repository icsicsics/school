import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class VerifyTitleWidget extends StatelessWidget {
  const VerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 30,
        ),
        MediumTextWidget(
            text: "Verify your Number",
            fontSize: 27,
            color: ColorsManager.darkGrayColor),
        MediumTextWidget(
            text: "Please type verification code sent to your\nphone ",
            fontSize: 17,
            color: ColorsManager.welcomeGryColor),
      ],
    );
  }
}
