import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/shere_widgets/regular_text_widget.dart';

class VerifyTitleWidget extends StatelessWidget {
  const VerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        RegularTextWidget(
            text: "We have send the code verification to Your Mobile",
            fontSize: 14,
            color: ColorsManager.sameBlack),
        SizedBox(
          height: 5,
        ),
        RegularTextWidget(
            text: "Number", fontSize: 14, color: ColorsManager.sameBlack),
      ],
    );
  }
}
