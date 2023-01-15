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
  final LoginBloc loginBloc;
  final bool isFather;
  final String language;

  const LoginContentWidget(
      {Key? key,
      required this.countryController,
      required this.loginBloc,
      required this.isFather,required this.language})
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
          // const LoginHeaderWidget(),
          const WelcomeTextWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              children: [
                SelectCountryTextFieldWidget(
                  controller: widget.countryController, language: widget.language,
                ),
                //Todo Hide Is Father For Now
                // Row(
                //   children: [
                //     Switch(
                //       value: widget.isFather,
                //       activeColor: ColorsManager.primaryColor,
                //       onChanged: (bool value) => widget.loginBloc
                //           .add(LoginIsFatherEvent(isFather: value)),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     MediumTextWidget(
                //         text: "Is Father",
                //         fontSize: 15,
                //         color: widget.isFather
                //             ? ColorsManager.secondaryColor
                //             : ColorsManager.blackColor)
                //   ],
                // ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    ConfirmButtonWidget(
                        confirmAction: () => BlocProvider.of<LoginBloc>(context)
                            .add(LoginConfirmButtonEvent())),
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
