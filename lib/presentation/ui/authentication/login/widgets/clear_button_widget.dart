import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class ClearButtonWidget extends StatelessWidget {
  final Function() clearAction;

  const ClearButtonWidget({Key? key, required this.clearAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomButtonWidget(
      onPressed: clearAction,
      borderRadius: 20,
      buttonColor: ColorsManager.whiteColor,
      borderColor: ColorsManager.primaryColor,
      buttonTextSize: 14,
      buttonText: "Clear",
      buttonTextColor: ColorsManager.primaryColor,
      buttonHeight: 46,
    ));
  }
}
