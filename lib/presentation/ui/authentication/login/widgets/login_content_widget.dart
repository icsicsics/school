import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/clear_button_widget.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/confirm_button_widget.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/header_widget.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/select_country_text_field_widget.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/welcome_text_widget.dart';

class LoginContentWidget extends StatefulWidget {
  final TextEditingController countryController;

  const LoginContentWidget({Key? key, required this.countryController})
      : super(key: key);

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LoginHeaderWidget(),
          const WelcomeTextWidget(),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SelectCountryTextFieldWidget(
                  controller: widget.countryController,
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    ClearButtonWidget(
                        clearAction: () => BlocProvider.of<LoginBloc>(context)
                            .add(LoginClearButtonEvent())),
                    const SizedBox(
                      width: 25,
                    ),
                    ConfirmButtonWidget(
                        confirmAction: () => BlocProvider.of<LoginBloc>(context)
                            .add(LoginClearButtonEvent())),
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
