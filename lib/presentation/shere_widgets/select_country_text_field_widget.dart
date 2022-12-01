import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class SelectCountryTextFieldWidget extends StatefulWidget {
  const SelectCountryTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<SelectCountryTextFieldWidget> createState() =>
      _SelectCountryTextFieldWidgetState();
}

class _SelectCountryTextFieldWidgetState
    extends State<SelectCountryTextFieldWidget> {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(top: 5),
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorsManager.whiteColor),
                color: ColorsManager.whiteColor,
                boxShadow: const [
                  BoxShadow(blurRadius: 5, color: ColorsManager.grayColor),
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              if (kDebugMode) {
                print(number.phoneNumber);
              }
            },
            onInputValidated: (bool value) {
              if (kDebugMode) {
                print(value);
              }
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              showFlags: true,
              useEmoji: true,

            ),
            ignoreBlank: true,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: controller,
            formatInput: true,
            spaceBetweenSelectorAndTextField: 0,
            inputDecoration: const InputDecoration(
                isDense: true,
                hintText: "- - - - - - - - -",
                border: InputBorder.none),
            keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
            inputBorder: InputBorder.none,
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
        ),

      ]
    );
  }
}
