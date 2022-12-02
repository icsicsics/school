import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class PinCodeTextFiledWidget extends StatelessWidget {
  final TextEditingController pinController;

  const PinCodeTextFiledWidget({
    Key? key,
    required this.pinController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: PinCodeTextField(
        textStyle: const TextStyle(color: ColorsManager.grayColor),
        appContext: context,
        length: 6,
        onChanged: (value) {},
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
