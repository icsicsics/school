import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        MediumTextWidget(
            text: S.of(context).login,
            fontSize: 25,
            color: ColorsManager.welcomeGryColor),
        const SizedBox(
          height: 25,
        ),
        MediumTextWidget(
            text: S.of(context).enterYourPhoneNumber,
            fontSize: 15,
            color: ColorsManager.secondaryColor),
      ],
    );
  }
}
