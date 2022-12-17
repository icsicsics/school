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
    return Row(
          children: [
            const MediumTextWidget(
                text: "I have read and accept the",
                fontSize: 12,
                color: ColorsManager.welcomeGryColor),
            InkWell(
                onTap: privacyPolicyAction,
                child: const MediumTextWidget(
                    text: " Privacy Policy",
                    fontSize: 12,
                    color: ColorsManager.buttonColor)),
            const MediumTextWidget(
                text: " and ", fontSize: 12, color: ColorsManager.welcomeGryColor),
            Expanded(
              child: InkWell(
                  onTap: termOfUseAction,
                  child: const MediumTextWidget(
                      text: "Term of Use",
                      fontSize: 12,
                      color: ColorsManager.buttonColor)),
            ),

          ],

    );
  }
}
