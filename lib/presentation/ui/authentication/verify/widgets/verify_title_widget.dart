import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class VerifyTitleWidget extends StatelessWidget {
  const VerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoldTextWidget(
            text: S.of(context).weHaveSendTheCodeVerificationToYourMobile,
            fontSize: 14,
            textAlign: TextAlign.start,
            color: ColorsManager.sameBlack,
          ),
        ],
      ),
    );
  }
}
