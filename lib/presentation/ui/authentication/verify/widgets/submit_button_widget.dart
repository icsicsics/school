import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_gradient_button_widget.dart';

class SubmitButtonWidget extends StatelessWidget {
  final Function() submitAction;

  const SubmitButtonWidget({Key? key, required this.submitAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomGradientButtonWidget(
          onPressed: submitAction,
          buttonTextSize: 18,
          buttonText: S.of(context).submit,
          buttonTextColor: ColorsManager.whiteColor,
          buttonHeight: 54,
        )),
      ],
    );
  }
}
