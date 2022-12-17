import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/semi_bold_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final Function() onPressed;
  final double? startMargin;
  final double? endMargin;
  final double? topMargin;
  final double? bottomMargin;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderRadius;

  const CustomButtonWidget({
    Key? key,
    this.buttonText = "",
    required this.onPressed,
    this.bottomMargin = 0,
    this.endMargin = 0,
    this.startMargin = 0,
    this.topMargin = 0,
    this.buttonHeight = 40,
    this.buttonWidth = double.infinity,
    this.buttonColor = ColorsManager.secondaryColor,
    this.borderColor = ColorsManager.secondaryColor,
    this.borderRadius = 16,
    this.buttonTextSize = 14,
    this.buttonTextColor = ColorsManager.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      margin: _buttonMargin(),
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle(),
        child: SemiBoldTextWidget(
          text: buttonText!,
          color: buttonTextColor!,
          fontSize: buttonTextSize!,
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                side: BorderSide(color: borderColor!))),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor!));
  }

  EdgeInsetsDirectional _buttonMargin() {
    return EdgeInsetsDirectional.only(
      start: startMargin!,
      end: endMargin!,
      top: topMargin!,
      bottom: bottomMargin!,
    );
  }
}
