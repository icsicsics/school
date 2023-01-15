import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
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
       const  BoldTextWidget(
            text: "Dont Receive Code ? ",
            fontSize: 14,
            color: ColorsManager.sameBlack),
        InkWell(
          onTap: onTap,
          child:const  MediumTextWidget(
              text:"Resend",
              fontSize: 14,
              color: ColorsManager.secondaryColor),
        ),
      ],
    );
  }
}
