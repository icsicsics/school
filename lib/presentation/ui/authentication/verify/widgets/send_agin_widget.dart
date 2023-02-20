import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class SendAgainWidget extends StatelessWidget {
  final Function() onTap;

  const SendAgainWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        BoldTextWidget(
            text: S.of(context).dontReceiveCode,
            fontSize: 14,
            color: ColorsManager.sameBlack),
        InkWell(
          onTap: onTap,
          child: MediumTextWidget(
              text: S.of(context).resend,
              fontSize: 14,
              color: ColorsManager.secondaryColor),
        ),
      ],
    );
  }
}
