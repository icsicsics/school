import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';

class LoginHeader extends StatelessWidget {
  final String language;

  const LoginHeader({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // InkWell(
        //     child: const Icon(Icons.close),
        //     onTap: () {
        //       _navigateBack(context);
        //     }),
        if (language == "en") const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            _changeLanguage(context);
          },
          child: _languageImage(),
        ),
        if (language == "ar") const Expanded(child: SizedBox()),
      ],
    );
  }

  void _navigateBack(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(NavigateBackEvent());
  }

  void _changeLanguage(BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(ChangeLanguageEvent(language: language));
  }

  Widget _languageImage() {
    return language == "en"
        ? Image.asset(
            ImagesPath.ar,
            height: 35,
            width: 35,
            color: const Color(0xff3bbbac),
          )
        : Image.asset(
            ImagesPath.en,
            height: 35,
            width: 35,
            color: const Color(0xff3bbbac),
          );
  }
}
