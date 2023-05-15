import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';

class WelcomeWidget extends StatefulWidget {
  final String language;

  const WelcomeWidget({
    Key? key,
    required this.language,
  }) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (widget.language == "en") Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      _changeLanguage();
                    },
                    child: _languageImage(),
                  ),
                if (widget.language == "ar") Expanded(child: SizedBox()),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          BoldTextWidget(
              text: S.of(context).login,
              fontSize: 25,
              color: ColorsManager.blackColor),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              ImagesPath.logo,
              height: 200,
            ),
          )
        ],
      ),
    );
  }

  void _changeLanguage() {
    if (widget.language == "en") {
      BlocProvider.of<LoginBloc>(context).add(ChangeLanguageEvent("ar"));
    } else {
      BlocProvider.of<LoginBloc>(context).add(ChangeLanguageEvent("en"));
    }
  }

  Widget _languageImage() => widget.language == "en"
      ? Image.asset(
          ImagesPath.ar,
          height: 35,
          width: 35,
          color: Color(0xff3bbbac),
        )
      : Image.asset(
          ImagesPath.en,
          height: 35,
          width: 35,
          color: Color(0xff3bbbac),
        );
}
