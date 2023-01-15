import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/semi_bold_text_widget.dart';

class CustomGradientButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final Function() onPressed;
  final double? buttonHeight;
  final double? buttonWidth;

  const CustomGradientButtonWidget({
    Key? key,
    this.buttonText = "",
    required this.onPressed,
    this.buttonHeight = 40,
    this.buttonWidth = double.infinity,
    this.buttonTextSize = 14,
    this.buttonTextColor = ColorsManager.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              ColorsManager.secondaryColor,
              ColorsManager.thredColor,
            ],
            stops: [0.5, 0.8],
          )),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: SemiBoldTextWidget(
            text: buttonText!,
            color: buttonTextColor!,
            fontSize: buttonTextSize!,
          ),
        ),
      ),
    );
  }
}
