import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';

class SelectCountryTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String language;

  const SelectCountryTextFieldWidget(
      {Key? key, required this.controller, required this.language})
      : super(key: key);

  @override
  State<SelectCountryTextFieldWidget> createState() =>
      _SelectCountryTextFieldWidgetState();
}

class _SelectCountryTextFieldWidgetState
    extends State<SelectCountryTextFieldWidget> {
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: widget.language == "en" ? Alignment.topLeft : Alignment.topRight,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorsManager.whiteColor),
              color: ColorsManager.whiteColor,
              boxShadow: const [
                BoxShadow(blurRadius: 5, color: ColorsManager.grayColor),
              ]),
        ),
      ),
      Padding(
        padding: widget.language == "en"
            ? const EdgeInsets.only(left: 5)
            : const EdgeInsets.only(left: 5),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {},
          onInputValidated: (bool value) {},
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            showFlags: true,
            useEmoji: true,
          ),
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: widget.controller,
          formatInput: true,
          textAlign:  widget.language=="en"?TextAlign.left:TextAlign.right,
          spaceBetweenSelectorAndTextField: 2,
          inputDecoration: const InputDecoration(
              isDense: true,
              hintText: "- - - - - - - - -",
              border: InputBorder.none),
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputBorder: InputBorder.none,
          onSaved: (PhoneNumber number) {},
        ),
      ),
    ]);
  }
}
