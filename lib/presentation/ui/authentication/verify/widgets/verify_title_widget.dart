import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
class VerifyTitleWidget extends StatelessWidget {
  const VerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BoldTextWidget(
            text: S.of(context).weHaveSendTheCodeVerificationToYourMobile,
            fontSize: 14,
            color: ColorsManager.sameBlack),
        const SizedBox(
          height: 5,
        ),
        BoldTextWidget(
            text: S.of(context).number,
            fontSize: 14,
            color: ColorsManager.sameBlack),
      ],
    );
  }
}
