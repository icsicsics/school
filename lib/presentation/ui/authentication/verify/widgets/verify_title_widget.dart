import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class VerifyTitleWidget extends StatelessWidget {
  const VerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        MediumTextWidget(
            text: S.of(context).verifyYourNumber,
            fontSize: 27,
            color: ColorsManager.darkGrayColor),
        MediumTextWidget(
            text: S.of(context).pleaseTypeVerificationCodeSentToYourPhone,
            fontSize: 17,
            color: ColorsManager.welcomeGryColor),
      ],
    );
  }
}
