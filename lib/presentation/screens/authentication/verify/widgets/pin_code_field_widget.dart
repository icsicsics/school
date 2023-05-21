import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class PinCodeTextFiledWidget extends StatelessWidget {
  final TextEditingController pinController;
  final void Function(String value) onChanged;
  final String language;

  const PinCodeTextFiledWidget(
      {Key? key,
      required this.pinController,
      required this.onChanged,
      required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
          cursorColor: ColorsManager.secondaryColor,
          keyboardType: TextInputType.number,
          textStyle: const TextStyle(color: ColorsManager.sameBlack),
          appContext: context,
          length: 6,
          onChanged: onChanged,
          controller: pinController,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderWidth: 1,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 50,
              disabledColor: ColorsManager.secondaryColor,
              activeColor: ColorsManager.secondaryColor,
              inactiveColor: ColorsManager.mediumGrayColor,
              activeFillColor: ColorsManager.secondaryColor,
              inactiveFillColor: ColorsManager.secondaryColor,
              selectedFillColor: ColorsManager.secondaryColor,
              selectedColor: ColorsManager.secondaryColor),
        ),
      ),
    );
  }
}
