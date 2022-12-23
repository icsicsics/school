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
      padding: language == "en"
          ? const EdgeInsets.only(right: 50)
          : const EdgeInsets.only(left: 50),
      child: PinCodeTextField(
        cursorColor: ColorsManager.primaryColor,
        keyboardType: TextInputType.number,
        textStyle: const TextStyle(color: ColorsManager.grayColor),
        appContext: context,
        length: 6,
        onChanged: onChanged,
        controller: pinController,
        pinTheme: PinTheme(
          activeColor: ColorsManager.secondaryColor,
          inactiveColor: ColorsManager.secondaryColor,
          activeFillColor: ColorsManager.secondaryColor,
        ),
      ),
    );
  }
}
