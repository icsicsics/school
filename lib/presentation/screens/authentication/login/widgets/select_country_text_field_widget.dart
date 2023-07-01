import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';

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
  PhoneNumber number =
      PhoneNumber(isoCode: 'JO', phoneNumber: "+962", dialCode: "+962");

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LoginBloc>(context).add(SelectCountryCodeEvent(number));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: ColorsManager.mediumGrayColor, width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: InternationalPhoneNumberInput(
          autoValidateMode: AutovalidateMode.disabled,
          keyboardType: TextInputType.number,
          initialValue: number,
          locale: widget.language,
          textFieldController: widget.controller,
          inputBorder: InputBorder.none,
          spaceBetweenSelectorAndTextField: 0,
          inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: S.of(context).phoneNumber,
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsManager.grayColor,
                    fontWeight: FontWeight.bold,
                  ),
              border: InputBorder.none,
              isDense: true,
              suffixIcon: InkWell(
                  onTap: () => widget.controller.clear(),
                  child: const Icon(
                    Icons.clear,
                    color: ColorsManager.mediumGrayColor,
                  )),
              icon: SizedBox(
                width: 30,
                child: Row(
                  children: [
                    RotatedBox(
                        quarterTurns: widget.language == "en" ? 3 : 1,
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: ColorsManager.sameBlack,
                        )),
                    const Expanded(child: SizedBox()),
                    Container(
                      height: 30,
                      color: ColorsManager.mediumGrayColor,
                      width: 1,
                    ),
                  ],
                ),
              )),
          selectorConfig: const SelectorConfig(
              leadingPadding: 0,
              trailingSpace: false,
              selectorType: PhoneInputSelectorType.DIALOG,
              showFlags: true),
          onInputChanged: (PhoneNumber number) {
            BlocProvider.of<LoginBloc>(context)
                .add(SelectCountryCodeEvent(number));
          },
        ),
      ),
    );
  }
}
