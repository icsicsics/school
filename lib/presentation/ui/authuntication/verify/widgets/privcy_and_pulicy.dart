import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class PrivacyAndPolicyWidget extends StatelessWidget {
  final Function() privacyPolicyAction;
  final Function() termOfUseAction;

  const PrivacyAndPolicyWidget(
      {Key? key,
      required this.privacyPolicyAction,
      required this.termOfUseAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const MediumTextWidget(
                text: "I have read and accept the",
                fontSize: 13,
                color: ColorsManager.grayColor),
            InkWell(
                onTap: privacyPolicyAction,
                child: const MediumTextWidget(
                    text: "Privacy Policy",
                    fontSize: 13,
                    color: ColorsManager.buttonColor)),
          ],
        ),
        Row(
          children: [
            const MediumTextWidget(
                text: " and ", fontSize: 13, color: ColorsManager.grayColor),
            InkWell(
                onTap: termOfUseAction,
                child: const MediumTextWidget(
                    text: "Term of Use",
                    fontSize: 13,
                    color: ColorsManager.buttonColor)),
          ],
        )
      ],
    );
  }
}
