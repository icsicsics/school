import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class ActionsRowWidget extends StatelessWidget {
  final Function() changeMobileNumberAction;
  final Function() nextAction;

  const ActionsRowWidget(
      {Key? key,
      required this.changeMobileNumberAction,
      required this.nextAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButtonWidget(
          onPressed: changeMobileNumberAction,
          buttonText: "Change Mobile Number",
          buttonTextSize: 12,
          buttonTextColor: ColorsManager.primaryColor,
          buttonColor: ColorsManager.whiteColor,
          borderColor: ColorsManager.primaryColor,
        )),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: CustomButtonWidget(
          onPressed: nextAction,
          buttonText: "Next",
          buttonColor: ColorsManager.primaryColor,
          buttonTextColor: ColorsManager.whiteColor,
          borderColor: ColorsManager.primaryColor,
        )),
      ],
    );
  }
}
