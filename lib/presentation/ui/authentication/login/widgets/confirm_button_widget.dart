import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final Function() confirmAction;

  const ConfirmButtonWidget({Key? key, required this.confirmAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomButtonWidget(
      onPressed: confirmAction,
      borderRadius: 20,
      buttonColor: ColorsManager.primaryColor,
      borderColor: ColorsManager.primaryColor,
      buttonTextSize: 14,
      buttonText: S.of(context).sendOTP,
      buttonTextColor: ColorsManager.whiteColor,
      buttonHeight: 46,
    ));
  }
}
