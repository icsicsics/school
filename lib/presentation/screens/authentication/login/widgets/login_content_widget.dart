import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/confirm_button_widget.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/select_country_text_field_widget.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/welcome_widget.dart';

class LoginContentWidget extends StatefulWidget {
  final TextEditingController countryController;
  final LoginBloc loginBloc;
  final String language;

  const LoginContentWidget({
    Key? key,
    required this.countryController,
    required this.loginBloc,
    required this.language,
  }) : super(key: key);

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeWidget(
              language: widget.language,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SelectCountryTextFieldWidget(
                  controller: widget.countryController,
                  language: widget.language,
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    ConfirmButtonWidget(
                        confirmAction: () => BlocProvider.of<LoginBloc>(context)
                            .add(LoginConfirmButtonEvent())),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImagesPath.values),
                    const SizedBox(
                      width: 5,
                    ),
                    MediumTextWidget(
                        text: S.of(context).values,
                        fontSize: 16,
                        color: ColorsManager.sameBlack),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(ImagesPath.behavior),
                    const SizedBox(
                      width: 5,
                    ),
                    MediumTextWidget(
                        text: S.of(context).behavior,
                        fontSize: 16,
                        color: ColorsManager.sameBlack),
                    const SizedBox(
                      width: 8,
                    ),
                    SvgPicture.asset(ImagesPath.skills),
                    const SizedBox(
                      width: 5,
                    ),
                    MediumTextWidget(
                        text: S.of(context).skills,
                        fontSize: 16,
                        color: ColorsManager.sameBlack)
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
