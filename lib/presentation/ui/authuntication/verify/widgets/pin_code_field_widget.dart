import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class PinCodeFiledWidget extends StatelessWidget {
  final TextEditingController pinController;

  const PinCodeFiledWidget({
    Key? key,
    required this.pinController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      keyboardType: TextInputType.number,
      controller: pinController,
      length: 6,
      showCursor: false,
      textInputAction: TextInputAction.send,
      defaultPinTheme: PinTheme(
          textStyle:
          Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          height: 44,
          width: 66,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration:
          _pinDecoration(context, ColorsManager.primaryColor.withOpacity(.1))),
      submittedPinTheme: PinTheme(
          textStyle:
          Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
          height: 44,
          width: 66,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: _pinDecoration(context, ColorsManager.whiteColor)),
      followingPinTheme: PinTheme(
        textStyle:
        Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 14),
        height: 44,
        width: 66,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: _pinDecoration(
          context,
          ColorsManager.primaryColor.withOpacity(.1),
        ),
      ),
      onChanged: (value) { },
    );
  }

  BoxDecoration _pinDecoration(BuildContext context, Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
      border: Border.all(color: ColorsManager.primaryColor),
    );
  }
}
