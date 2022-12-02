import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/login/widgets/clear_button_widget.dart';
import 'package:schools/presentation/ui/login/widgets/confirm_button_widget.dart';
import 'package:schools/presentation/ui/login/widgets/header_widget.dart';
import 'package:schools/presentation/ui/login/widgets/select_country_text_field_widget.dart';
import 'package:schools/presentation/ui/login/widgets/welcome_text_widget.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({Key? key}) : super(key: key);

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         const  HeaderWidget(),
          WelcomeTextWidget(),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SelectCountryTextFieldWidget(
                  controller: countryController,
                ),
                const SizedBox(height: 100,),
                Row(
                  children: [
                    ClearButtonWidget(clearAction: () {}),
                    const SizedBox(
                      width: 25,
                    ),
                    ConfirmButtonWidget(
                      confirmAction: () {
                        print("confirm");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
