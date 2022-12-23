import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
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
        MediumTextWidget(
            text: S.of(context).ihaveReadAndAcceptThe,
            fontSize: 12,
            color: ColorsManager.welcomeGryColor),
        InkWell(
            onTap: privacyPolicyAction,
            child: MediumTextWidget(
                text: S.of(context).privacyPolicy,
                fontSize: 12,
                color: ColorsManager.buttonColor)),
        MediumTextWidget(
            text: S.of(context).and,
            fontSize: 12,
            color: ColorsManager.welcomeGryColor),
        Expanded(
          child: InkWell(
              onTap: termOfUseAction,
              child: MediumTextWidget(
                  text: S.of(context).termOfUse,
                  fontSize: 12,
                  color: ColorsManager.buttonColor)),
        ),
      ],

    );
  }
}
