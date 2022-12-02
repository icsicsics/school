import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class PrivacyAndPolicyWidget extends StatelessWidget {
  const PrivacyAndPolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            MediumTextWidget(text: "I have read and accept the", fontSize: 13, color: ColorsManager.grayColor),
            MediumTextWidget(text: "Privacy Policy", fontSize: 13, color: ColorsManager.buttonColor),
          ],
        ),
        Row(children: [
          MediumTextWidget(text: " and ", fontSize: 13, color: ColorsManager.grayColor),
          MediumTextWidget(text: "Term of Use", fontSize: 13, color: ColorsManager.buttonColor),
        ],)
      ],
    );
  }
}
