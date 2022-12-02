import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class ActionsRowWidget extends StatelessWidget {
  const ActionsRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButtonWidget(
          onPressed: () {},
          buttonText: "Change Mobile Number",
          buttonTextSize: 12,
          buttonTextColor: ColorsManager.darkGrayColor,
          buttonColor: ColorsManager.whiteColor,
              borderColor:ColorsManager.darkGrayColor,
        )),
        SizedBox(width: 15,),
        Expanded(
            child: CustomButtonWidget(
          onPressed: () {},
          buttonText: "Next",
              buttonColor: ColorsManager.buttonColor,
              buttonTextColor: ColorsManager.whiteColor,
               borderColor: ColorsManager.buttonColor,
        )),
      ],
    );
  }
}
